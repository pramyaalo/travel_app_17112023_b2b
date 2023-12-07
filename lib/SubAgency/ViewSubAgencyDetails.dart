import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_17112023_b2b/Models/ViewSubAgencyModel.dart';
import 'package:travel_app_17112023_b2b/Models/ViewTravellerModel.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewSubAgencyDetails(),
    );
  }
}

class ViewSubAgencyDetails extends StatefulWidget {
  @override
  _MyRechargePageState createState() => _MyRechargePageState();
}

class _MyRechargePageState extends State<ViewSubAgencyDetails> {
  String checkboxStatus = "0";
  String checkboxStatus1 = "0";
  List<ViewSubAgentModel> table1Data = [];
  bool isIssueTicketChecked = false;
  bool isCancelBookingChecked = false;
  late List<dynamic> table0, table1, table2, table3, table4, table5, table6;

  String _userImage = '';
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
    Future<http.Response>? futureLabels = ResponseHandler.performPost(
        "SubAgencyViewGet", "SubAgencyID=${subAgencyId}");
    return await futureLabels.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      Map<String, dynamic> map = json.decode(jsonResponse);
      table0 = map["Table"];
      table1 = map["Table1"];
      table2 = map["Table2"];
      table3 = map["Table3"];
      table4 = map["Table4"];
      table5 = map["Table5"];
      table6 = map["Table6"];
      log('Response: $jsonResponse');
      return jsonResponse;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "View SubAgent Details",
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
        backgroundColor: Color(0xFF152238),
      ),
      body: Center(
          child: FutureBuilder<String?>(
              future: getInvoiceReceiptJSON(),
              builder: (context, snapshot) {
                if (snapshot.hasData &&
                    snapshot.connectionState == ConnectionState.done) {
                  try {
                    log('Datagfggg: :${snapshot.data}');
                    Tablee0 m0 = Tablee0.fromJson(table0[0]);
                    Tableee1 m1 = Tableee1.fromJson(table1[0]);
                    Tableee2 m2 = Tableee2.fromJson(table2[0]);

                    Tableee3 m3 = Tableee3.fromJson(table3[0]);
                    Tableee4 m4 = Tableee4.fromJson(table4[0]);
                    Tableee5 m5 = Tableee5.fromJson(table5[0]);
                    Tableee6 m6 = Tableee6.fromJson(table6[0]);

                    return SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(padding: EdgeInsets.only(top: 20)),
                          Text(
                            "PROFILE",
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "Montserrat",
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Customer Type",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: Text(
                                        "  :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.name,
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
                                      "Customer Name",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 71),
                                      child: Text(
                                        "  :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
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
                                      "Subagent Name",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.agentName,
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
                                      "Date of Operation",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 80),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.operationDate,
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
                                      "Email Address",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 45),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.emailAddress,
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
                                      "Choose: ",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
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
                                      "Sales Group",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 48),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.saleGroup,
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
                                      "Address Line1",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                                      "Address Line2",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 43),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                                      "Address Line3",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 63),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                                      "City",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                                      "State",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                                      "Post Code",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Country",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.country,
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
                                      "Telephone",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 60),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.telephone,
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
                                      "Mobile",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 80),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                                      "Fax",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
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
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Language",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.languages,
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
                                      "Business Currency",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.currency,
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
                                      "Office Space",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.officeSpace,
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
                                      "Business Type",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.businessType,
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
                                      "Designaton",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.designaton,
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
                                      "Contact Mobile",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.contactMobile,
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
                                      "Contact Email Address",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.contactEmail,
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
                                      "Website URL",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.websiteURL,
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
                                      "Longitude",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.longitude,
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
                                      "Latitude",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.latitude,
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
                                      "Referred by",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 65),
                                      child: Text(
                                        "   :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.generalRemarks,
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
                                      "General Remarks:",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 5.0),
                              /* Container(
                                height: 100,
                                margin: EdgeInsets.only(left: 10, right: 10),
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Text(
                                  m0.generalRemarks,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                              ),*/
                            ],
                          ),
                          /* SizedBox(height: 16.0),
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
                                  "UserName",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    ":",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
                                  child: Text(
                                    m0.username,
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
                                  "Password",
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 50),
                                  child: Text(
                                    " :",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 30),
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
                          SizedBox(height: 16.0),*/
                          /*   Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Sales Department Details",
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
                          Card(
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 7),
                            elevation: 5,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text(
                                        "Contact Name: " + m1.pdDocument,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Text(
                                              "Mobile: " + m1.pdPassportNo,
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Text(
                                              "Telephone: " +
                                                  datePart.toString(),
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        "Email Address: " + m1.pdDateOfExpirydt,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
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
                                  "Bank Details",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          Card(
                            margin: const EdgeInsets.only(
                                right: 10, left: 10, top: 7),
                            elevation: 5,
                            color: Colors.white,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 10, top: 10),
                                      child: Text(
                                        "Bank Name: " + m2.traVisaId,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Text(
                                              "Account No: " + m2.vdTypeOfVisa,
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 10),
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(right: 0),
                                            child: Text(
                                              "Swift Code: " +
                                                  m2.vdCountryOfVisa,
                                              style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        "Phone No: " + m2.vdDateOfExpiry,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        "Fax No: " + m2.vdDateOfExpiry,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 10,
                                      ),
                                      child: Text(
                                        "Bank Address: " + m2.vdDateOfExpiry,
                                        style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Spacer(), // Adds space between the two parts of the row
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 16.0),*/
                          /*    Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  "Licensing/Membership",
                                  style: const TextStyle(
                                      fontSize: 18,
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              Spacer()
                            ],
                          ),
                          SizedBox(height: 5.0),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "VAT Number",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 40),
                                      child: Text(
                                        "  :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.vatNumber,
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
                                      "ABTA Number",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 71),
                                      child: Text(
                                        "  :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        m0.abtaNumber,
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
                                      "IATA Number:",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 15),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.iataNumber,
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
                                      "IATA Member(since years)",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 80),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.iataMember,
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
                                      "ATOL Number",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 45),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.atolNumber,
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
                                      "TTA Number",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 48),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.ttaNumber,
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
                                      "Global Travel Group",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 11),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.globalTravelGroup,
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
                                      "License Number",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 43),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.licenseNumber,
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
                                      "Service Tax",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 63),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.serviceTax,
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
                                      "PAN No",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.panNo,
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
                                      "TAN No",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.tanNo,
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
                                      "NTN No",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 18),
                                      child: Text(
                                        " :",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.ntnNo,
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
                                      "CNPJ No",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        ":",
                                        style: const TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 30),
                                      child: Text(
                                        m0.cnpjNo,
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
                          ),*/
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
