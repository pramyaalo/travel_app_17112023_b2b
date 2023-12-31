import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:travel_app_17112023_b2b/Queues/InvoiceReceipt.dart';

import '../utils/response_handler.dart';
import 'UnBlockCorporateModel.dart';

class UnBlockCorporate extends StatefulWidget {
  const UnBlockCorporate({Key? key}) : super(key: key);

  @override
  State<UnBlockCorporate> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<UnBlockCorporate> {
  static Future<List<UnBlockCorporateModel>?>
      getFlightTicketOrderQueue() async {
    List<UnBlockCorporateModel> bookingCardData = [];
    Future<http.Response>? __futureLabels = ResponseHandler.performPost(
        "BlockCorporateGet", "UserTypeId=2&UserId=1107&CorporateId=0&Status=1");

    return await __futureLabels?.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      //log(jsonResponse);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          UnBlockCorporateModel lm = UnBlockCorporateModel.fromJson(list[i]);
          bookingCardData.add(lm);
        }
      } catch (error) {}
      return bookingCardData;
    });
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
                    "UnBlock Corporate",
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
              child: FutureBuilder<List<UnBlockCorporateModel>?>(
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
                                                                .username,
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
                                                                    snapshot
                                                                        .data![
                                                                            index]
                                                                        .dateOfOperation,
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
                                                          Spacer(),
                                                          // Adds space between the two parts of the row
                                                          Row(
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            0),
                                                                child: Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets
                                                                          .only(
                                                                          right:
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        "Currency: " +
                                                                            snapshot.data![index].currency,
                                                                        style:
                                                                            TextStyle(
                                                                          fontFamily:
                                                                              "Montserrat",
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                          fontSize:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 4,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {
                                                          // Handle button press
                                                        },
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(top: 4),
                                                          child: Container(
                                                            width: 50,
                                                            height: 25,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.8),
                                                                  spreadRadius:
                                                                      2,
                                                                  blurRadius: 5,
                                                                  offset: Offset(
                                                                      0,
                                                                      3), // changes the position of the shadow
                                                                ),
                                                              ],
                                                            ),
                                                            child: Center(
                                                              child: Text(
                                                                'Block',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ),
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
                                                                    "ID: ",
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
                                                                        .accountId,
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
                                                                          color:
                                                                              Colors.blue), //https://stackoverflow.com/a/67395539/16076689
                                                                      borderRadius: new BorderRadius
                                                                          .circular(
                                                                          5.0),
                                                                    ),
                                                                    child: Text(
                                                                      snapshot.data![index].isActive ==
                                                                              "0"
                                                                          ? 'InActive'
                                                                          : 'Active',
                                                                      style: TextStyle(
                                                                          fontFamily:
                                                                              "Montserrat",
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight: FontWeight
                                                                              .w500,
                                                                          color:
                                                                              Colors.white),
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
