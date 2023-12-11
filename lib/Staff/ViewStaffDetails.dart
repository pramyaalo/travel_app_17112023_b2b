import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_17112023_b2b/Corporate/CorporateInformationTable5.dart';
import 'package:travel_app_17112023_b2b/Corporate/CorporateTable1.dart';
import 'package:travel_app_17112023_b2b/Corporate/CorporateTable4.dart';
import 'package:travel_app_17112023_b2b/Corporate/DeiTaxModelTable0.dart';
import 'package:travel_app_17112023_b2b/Corporate/PaymentMethodTable7.dart';
import 'package:travel_app_17112023_b2b/Corporate/ProductAccessTble2.dart';
import 'package:travel_app_17112023_b2b/Models/ViewBranchDetailsModel.dart';
import 'package:travel_app_17112023_b2b/Models/ViewSubAgencyModel.dart';
import 'package:travel_app_17112023_b2b/Models/ViewTravellerModel.dart';
import 'package:travel_app_17112023_b2b/SubAgency/Tableee4.dart';
import 'package:travel_app_17112023_b2b/SubAgency/Tableee5.dart';
import 'package:travel_app_17112023_b2b/SubAgency/Tableee6.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewStaffDetails(),
    );
  }
}

class ViewStaffDetails extends StatefulWidget {
  @override
  _MyRechargePageState createState() => _MyRechargePageState();
}

class _MyRechargePageState extends State<ViewStaffDetails> {
  String checkboxStatus = "0";
  String checkboxStatus1 = "0";
  String productAccessBusName = "",
      productAccessCarName = "",
      productAccessFlightName = "",
      productAccessHolidayName = "",
      productAccessHotelName = "";
  List<ProductAccess> table1Data = [];
  List<CorporateLogo> table2Data = [];
  List<CorporateInformation> table3Data = [];
  List<PaymentMethod> table4Data = [];

  bool isIssueTicketChecked = false;
  bool isCancelBookingChecked = false;
  late List<dynamic> table0, table1, table2, table4, table6, table7;

  String datePart = '';
  String? subAgencyId;

  @override
  void initState() {
    super.initState();
    loadSubAgencyId();
  }

  Future<String?> getSubAgencyId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('subAgencyId');
  }

  Future<void> loadSubAgencyId() async {
    String? id = await getSubAgencyId();
    setState(() {
      subAgencyId = id;
      print('subid' + subAgencyId!);
    });
  }

  Future<String?> getInvoiceReceiptJSON() async {
    Future<http.Response>? futureLabels =
        ResponseHandler.performPost("BranchViewGet", "BranchID=1216");
    return await futureLabels.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      Map<String, dynamic> map = json.decode(jsonResponse);
      table0 = map["Table"];
      log('Response: $jsonResponse');
      return jsonResponse;
    });
  }

  late Tableee2 t1Data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View Staff Details",
          style: TextStyle(fontFamily: "Montserrat", fontSize: 17),
        ),
        //title: Image.asset('assets/images/logo.png', width: 150, height: 30,),
        actions: [
          Image.asset(
            'assets/images/logo.png',
            width: 120,
            height: 30,
          ),
          SizedBox(
            width: 10,
          )
        ],
        backgroundColor: Color(0xFF1d5e72) ,
      ),
      body: Center(
          child: FutureBuilder<String?>(
              future: getInvoiceReceiptJSON(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  try {
                    log('Datagfggg: :${snapshot.data}');
                    ViewBranchDetailsModel m0 =
                        ViewBranchDetailsModel.fromJson(table0[0]);
                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20)),
                          InkWell(
                            onTap: () {
                              print('Button Clicked');
                              //_showSelectionDialog(context);
                            },
                            child: Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                CircleAvatar(
                                  radius: 50,
                                  backgroundColor: Colors.transparent,
                                  // Adjust the size as needed
                                  child: ClipOval(
                                    /* child:  Image.network(
                                      'https://traveldemo.org/travelapp/Images/Traveller/nofile' +
                                          m0.agencyBranchLogo!,
                                      width: 100,
                                      height: 100,
                                    ),*/
                                    child: Image.asset(
                                      'assets/images/profile.png', // Replace with your placeholder image asset path
                                      width: 100,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                Icon(Icons.camera_alt),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Type        :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.customerType,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Name      :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.customerName,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Staff Name            :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.agencyBranchCode,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Staff Code           :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.agencyBranchName,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Nick Name            :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.agencyBranchHead,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),

                              /*  Row(
                                children: [
                                  Checkbox(
                                      value: checkboxStatus == "1",
                                      onChanged: (bool? newValue) {
                                        setState(() {
                                          checkboxStatus =
                                              newValue == true ? "1" : "0";
                                        });
                                        print('cjeckbosfstsyd:$checkboxStatus');
                                      }),
                                  Text('Distributor/GSA',
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500)),
                                ],
                              ),*/
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Address          :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.addressLine1,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "City          :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.addressLine2,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Pin Code          :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.addressLine3,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Country                            :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.city,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Joining Date                         :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.state,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Status                :",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 2),
                                      child: Text(
                                        m0.postCode,
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                            ],
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "User Credentials",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "UserName                :",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Text(
                                    m0.userName,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Password                 :",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Text(
                                    m0.password,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Contact Details",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(height: 4.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone No1                       :",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Text(
                                    m0.mobile,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone No2                        :",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Text(
                                    m0.phone,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                          Padding(
                            padding: const EdgeInsets.only(left: 15),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Email                            :",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 2),
                                  child: Text(
                                    m0.fax,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 8.0),
                        ],
                      ),
                    );
                  } catch (error) {
                    print('Unexpected error: $error');
                    return Text('An unexpected error occurred.');
                  }
                } else {
                  return CircularProgressIndicator();
                }
              })),
    );
  }
}

Widget buildCheckbox(String label, bool value, Function(bool?) onChanged) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 3.0), // Adjust the bottom padding
    child: Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
        ),
        Text(label),
      ],
    ),
  );
}
