import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:travel_app_17112023_b2b/Models/ActiveTravellerModel.dart';
import 'package:travel_app_17112023_b2b/Queues/InvoiceReceipt.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';

class ActiveTravellers extends StatefulWidget {
  const ActiveTravellers({Key? key}) : super(key: key);

  @override
  State<ActiveTravellers> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<ActiveTravellers> {
  static Future<List<ActiveTravellerModel>?> getFlightTicketOrderQueue() async {
    List<ActiveTravellerModel> bookingCardData = [];
    Future<http.Response>? __futureLabels = ResponseHandler.performPost(
        "ActiveTravellerGet",
        "UserTypeId=2&UserId=1107&TravellerId=0&Status=1");

    return await __futureLabels?.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      //log(jsonResponse);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          ActiveTravellerModel lm = ActiveTravellerModel.fromJson(list[i]);
          bookingCardData.add(lm);
        }
      } catch (error) {
        // Fluttertoast.showToast(msg: error.toString());
      }
      return bookingCardData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              "ACTIVE TRAVELLER",
              style: TextStyle(fontFamily: "Montserrat", fontSize: 16),
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
            child: FutureBuilder<List<ActiveTravellerModel>?>(
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
                                                      CrossAxisAlignment.start,
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
                                                          snapshot.data![index]
                                                              .Name,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                        Text(
                                                          "Gender: " +
                                                              snapshot
                                                                  .data![index]
                                                                  .Gender,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3,
                                                    ),
                                                    Row(
                                                      children: [
                                                        Text(
                                                          // snapshot.data![index].PayMode,

                                                          snapshot.data![index]
                                                              .EmailID,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15),
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
                                                                          .data![
                                                                              index]
                                                                          .UDMobile_No,
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
                                                                      right: 3),
                                                              child: Text(
                                                                "State: " +
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .State,
                                                                style:
                                                                    TextStyle(
                                                                  fontFamily:
                                                                      "Montserrat",
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  fontSize: 15,
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
                                                                            3),
                                                                child: Text(
                                                                  "Date: " +
                                                                      snapshot
                                                                          .data![
                                                                              index]
                                                                          .createddate,
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
                                                                      right: 3),
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
                                                                  fontSize: 15,
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
                                                    /*Container(
                                        height: 35,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Icon(
                                                  Icons.book_outlined,
                                                  size: 12,
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Text(
                                                  "Traveller ID: ",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontFamily: "Montserrat",
                                                      fontSize: 15),
                                                ),
                                                Text(
                                                  snapshot
                                                      .data![index].TravellerId,
                                                  style: TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 2),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10.0, 5, 10, 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.green,
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color: Colors
                                                                  .blue), //https://stackoverflow.com/a/67395539/16076689
                                                          borderRadius:
                                                              new BorderRadius
                                                                  .circular(
                                                                  5.0),
                                                        ),
                                                        child: Text(
                                                          snapshot.data![index]
                                                                      .IsActive ==
                                                                  1
                                                              ? 'InActive'
                                                              : 'Active',
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )*/
                                                    Container(
                                                      height: 35,
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
                                                                  "Traveller ID: ",
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
                                                                      .UDEmployeeCode,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          "Montserrat",
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold),
                                                                ),
                                                              ],
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
                                                                Container(
                                                                  padding: EdgeInsets
                                                                      .fromLTRB(
                                                                          5.0,
                                                                          2.5,
                                                                          5,
                                                                          2.5),
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .green,
                                                                    border: Border.all(
                                                                        width:
                                                                            0.1,
                                                                        color: Colors
                                                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                                                    borderRadius:
                                                                        new BorderRadius
                                                                            .circular(
                                                                            5.0),
                                                                  ),
                                                                  child: Text(
                                                                    snapshot.data![index].IsActive ==
                                                                            1
                                                                        ? 'InActive'
                                                                        : 'Active',
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            "Montserrat",
                                                                        fontSize:
                                                                            15,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w500,
                                                                        color: Colors
                                                                            .white),
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
          )),
    );
  }
}
