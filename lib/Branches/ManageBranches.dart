//branchlistapi branchid=0,

import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_17112023_b2b/Branches/ViewBranchDetail.dart';
import 'package:travel_app_17112023_b2b/Corporate/ViewCorporateDetails.dart';
import 'package:travel_app_17112023_b2b/Models/ApproveCorporateModel.dart';
import 'package:travel_app_17112023_b2b/Models/ApproveSubAgencyModel.dart';
import 'package:travel_app_17112023_b2b/Models/ManageBranchModel.dart';
import 'package:travel_app_17112023_b2b/Queues/InvoiceReceipt.dart';
import 'package:travel_app_17112023_b2b/SubAgency/ViewSubAgencyDetails.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';
import 'package:travel_app_17112023_b2b/utils/shared_preferences.dart';

class ManageBranch extends StatefulWidget {
  const ManageBranch({Key? key}) : super(key: key);

  @override
  State<ManageBranch> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<ManageBranch> {
  Future<List<ManageBranchModel>?> getFlightTicketOrderQueue() async {
    String SubAgencyId = '';
    List<ManageBranchModel> bookingCardData = [];
    Future<http.Response>? __futureLabels = ResponseHandler.performPost(
        "BranchList", "BranchId=0&Status=1&UserId=1107");

    return await __futureLabels?.then((value) async {
      String jsonResponse = ResponseHandler.parseData(value.body);
      //log(jsonResponse);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          ManageBranchModel lm = ManageBranchModel.fromJson(list[i]);
          bookingCardData.add(lm);
        }
      } catch (error) {
        // Fluttertoast.showToast(msg: error.toString());
      }
      return bookingCardData;
    });
  }

  Future<void> saveSubAgencyId(String subAgencyId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('subAgencyId', subAgencyId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              titleSpacing: 1,
              title: Row(
                children: [
                  IconButton(
                    icon: Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 27,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),

                  SizedBox(width: 1), // Set the desired width
                  Text(
                    "Manage Branch List",
                    style: TextStyle(fontFamily: "Montserrat", fontSize: 19),
                  ),
                ],
              ),
              actions: [
                Image.asset(
                  'assets/images/loginoho.jpg',
                  width: 70,
                  height: 50,
                ),
                SizedBox(
                  width: 10,
                )
              ],
              backgroundColor: Color(0xFF1d5e72),
            ),
            body: Center(
              child: FutureBuilder<List<ManageBranchModel>?>(
                  future: getFlightTicketOrderQueue(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData &&
                        snapshot.connectionState == ConnectionState.done) {
                      return ListView.builder(
                          itemCount: snapshot.data!.length,
                          itemBuilder: (context, index) {
                            return Container(
                                child: SingleChildScrollView(
                                    child: Container(
                                        margin: EdgeInsets.all(10),
                                        child: InkWell(
                                          child: PhysicalModel(
                                              color: Colors.white,
                                              elevation: 8,
                                              shadowColor: Color(0xff9a9ce3),
                                              borderRadius:
                                                  BorderRadius.circular(4),
                                              child: Container(
                                                padding: EdgeInsets.all(10.0),
                                                child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            snapshot
                                                                .data![index]
                                                                .AgencyBranchName,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    "Montserrat",
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 3,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              3),
                                                                  child: Text(
                                                                    "Customer Type:  " +
                                                                        snapshot
                                                                            .data![index]
                                                                            .UserTypename,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Spacer(), // Adds space between the two parts of the row
                                                          Row(
                                                            children: [
                                                              Image(
                                                                image: AssetImage(
                                                                    'assets/images/tickiconpng.png'),
                                                                width: 16,
                                                                height: 16,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            3),
                                                                child: Text(
                                                                  "City: " +
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .City,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Row(
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .only(
                                                                    left: 0),
                                                            child: Row(
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              0),
                                                                  child: Text(
                                                                    "Mobile: " +
                                                                        snapshot
                                                                            .data![index]
                                                                            .Mobile,
                                                                    style:
                                                                        TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500,
                                                                      fontSize:
                                                                          15,
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          Spacer(), // Adds space between the two parts of the row
                                                          Row(
                                                            children: [
                                                              Image(
                                                                image: AssetImage(
                                                                    'assets/images/tickiconpng.png'),
                                                                width: 16,
                                                                height: 16,
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        right:
                                                                            3),
                                                                child: Text(
                                                                  "State: " +
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .Country,
                                                                  style:
                                                                      TextStyle(
                                                                    fontFamily:
                                                                        "Montserrat",
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w500,
                                                                    fontSize:
                                                                        15,
                                                                    color: Colors
                                                                        .blue,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          SizedBox(
                                                            width: 320,
                                                            height: 1,
                                                            child: DecoratedBox(
                                                              decoration:
                                                                  const BoxDecoration(
                                                                      color: Color(
                                                                          0xffededed)),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Container(
                                                        height: 28,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 0),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .book_outlined,
                                                                    size: 14,
                                                                  ),
                                                                  Text(
                                                                    "BranchId: ",
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        fontSize:
                                                                            15),
                                                                  ),
                                                                  Text(
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .AgencyBranchCode,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight.bold),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                            GestureDetector(
                                                              onTap: () {
                                                                // Handle button press
                                                              },
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        top: 4),
                                                                child:
                                                                    Container(
                                                                  width: 59,
                                                                  height: 25,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Color(
                                                                        0xFF088F8F),
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(5),
                                                                    boxShadow: [
                                                                      BoxShadow(
                                                                        color: Colors
                                                                            .grey
                                                                            .withOpacity(0.8),
                                                                        spreadRadius:
                                                                            2,
                                                                        blurRadius:
                                                                            5,
                                                                        offset: Offset(
                                                                            0,
                                                                            3), // changes the position of the shadow
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  child: Center(
                                                                    child: Text(
                                                                      snapshot.data![index].Status ==
                                                                              "1"
                                                                          ? "Active"
                                                                          : "Inactive",
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      top: 4,
                                                                      left: 2),
                                                              child: Column(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator
                                                                          .push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                          builder: (context) =>
                                                                              ViewBranchDetail(),
                                                                        ),
                                                                      );
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      padding: EdgeInsets.fromLTRB(
                                                                          5.0,
                                                                          2.5,
                                                                          5,
                                                                          2.5),
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Colors
                                                                            .orange,
                                                                        border: Border.all(
                                                                            width:
                                                                                0.1,
                                                                            color:
                                                                                Colors.orange), //https://stackoverflow.com/a/67395539/16076689
                                                                        borderRadius: new BorderRadius
                                                                            .circular(
                                                                            5.0),
                                                                      ),
                                                                      child:
                                                                          Text(
                                                                        "View",
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                "Montserrat",
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                            color: Colors.white),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                    ]),
                                              )),
                                        ))));
                          });
                    } else {
                      return CircularProgressIndicator();
                    }
                  }),
            )));
  }
}
