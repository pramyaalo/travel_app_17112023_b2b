import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_app_17112023_b2b/Models/DeductionTypeListModel.dart';
import 'package:travel_app_17112023_b2b/Models/EarningTypeListModel.dart';
import 'package:travel_app_17112023_b2b/Staff/AddNewStaff.dart';

import 'package:http/http.dart' as http;
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';

class DeductionTypeList extends StatefulWidget {
  const DeductionTypeList({Key? key}) : super(key: key);

  @override
  _BookingReportState createState() => _BookingReportState();
}

class _BookingReportState extends State<DeductionTypeList> {
  static Future<List<DeductionTypeListModel>?> getLabels() async {
    List<DeductionTypeListModel> labelData = [];
    Future<http.Response>? __futureLabels =
        ResponseHandler.performPost("StaffDeductionTypeGET", "AgentId=1107");

    return await __futureLabels?.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          DeductionTypeListModel lm = DeductionTypeListModel.fromJson(list[i]);
          labelData.add(lm);
        }
        Map<String, dynamic> table1Data = map["Table1"];
        List<dynamic> table1List = table1Data["Table1"];
        for (int i = 0; i < table1List.length; i++) {
          DeductionTypeListModel lm = DeductionTypeListModel.fromJson(list[i]);
          labelData.add(lm);
        }
      } catch (error) {}
      return labelData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                "Deduction Type List",
                style: TextStyle(fontFamily: "Montserrat"),
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
            /*  floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddNewStaff()));
        },
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),*/
            body: Center(
                child: FutureBuilder<List<DeductionTypeListModel>?>(
                    future: getLabels(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData &&
                          snapshot.connectionState == ConnectionState.done) {
                        return ListView.builder(
                            itemCount: snapshot.data!.length,
                            itemBuilder: (context, index) {
                              return Container(
                                  child: SingleChildScrollView(
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                    Column(children: [
                                      Card(
                                        margin: const EdgeInsets.only(
                                            right: 10, left: 10, top: 7),
                                        elevation: 5,
                                        color: Colors.white,
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  top: 8, left: 10, right: 4.1),
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                      snapshot.data![index]
                                                          .DeductionTitle,
                                                      maxLines: 1,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 16,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0,
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .only(
                                                                right: 0,
                                                                top: 5,
                                                                bottom: 5),
                                                        child: Text(
                                                          snapshot.data![index]
                                                              .StaffName,
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Spacer(),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 5, top: 0),
                                                  child: Text(
                                                    "Date: " +
                                                        snapshot.data![index]
                                                            .DeductionDate,
                                                    style: TextStyle(
                                                      fontFamily: "Montserrat",
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ), // Adds space between the two parts of the row
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    left: 10,
                                                  ),
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.fromLTRB(
                                                                10.0, 5, 10, 5),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              _getBackgroundColor(
                                                                  snapshot
                                                                      .data![
                                                                          index]
                                                                      .Status),
                                                          border: Border.all(
                                                              width: 0.1,
                                                              color:
                                                                  Colors.blue),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      5.0),
                                                        ),
                                                        child: Text(
                                                          snapshot.data![index]
                                                                      .Status ==
                                                                  "1"
                                                              ? 'Active'
                                                              : 'InActive',
                                                          style: TextStyle(
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                            color: Colors.white,
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  children: [
                                                    Image(
                                                      image: AssetImage(
                                                          'assets/images/tickiconpng.png'),
                                                      width: 16,
                                                      height: 16,
                                                      color: Colors.blue,
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                          .only(
                                                          right: 5,
                                                          bottom:
                                                              5), // Adjusted the bottom padding
                                                      child: Text(
                                                        "Currency: " +
                                                            snapshot
                                                                .data![index]
                                                                .Currency,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SizedBox(
                                                  width: 220,
                                                  height: 1,
                                                  child: DecoratedBox(
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: Color(
                                                                0xffededed)),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          right: 4),
                                                  child: Text(
                                                    "Deduction (Incl. Tax)",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                )
                                              ],
                                            ),
                                            Container(
                                              height: 35,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          Icons.book_outlined,
                                                          size: 14,
                                                        ),
                                                        Text(
                                                          "Deduction ID: ",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                              fontSize: 15),
                                                        ),
                                                        Text(
                                                          snapshot.data![index]
                                                              .DeductionTypeId,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 4),
                                                    child: Text(
                                                      snapshot.data![index]
                                                          .DeductionAmount,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              "Montserrat",
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ]),
                                  ])));
                            });
                      } else {
                        return CircularProgressIndicator();
                      }
                    }))));

    /*  child: Container(
              margin: EdgeInsets.all(10),
              child: PhysicalModel(
                color: Colors.white,
                elevation: 8,
                shadowColor: Color(0xff9a9ce3),
                borderRadius: BorderRadius.circular(4),
                child: Container(
                  padding: EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Passenger",
                                //snapshot.data![index].passenger,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Icon(
                                    const IconData(0xefc6,
                                        fontFamily: 'MaterialIcons'),
                                    size: 15,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Product: bookedProduct",
                                    //snapshot.data![index].bookedProduct}",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 12),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: new BoxDecoration(
                                  color: Colors.green,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: new BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Paid Status",
                                  //snapshot.data![index].paidStatus,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                  ),
                                  Text(
                                    "Journey Type",
                                    //snapshot.data![index].journeyType,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                children: [
                                  Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                  ),
                                  Text(
                                    "Oct 15 2023",
                                    //snapshot.data![index].tripDate,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.normal,
                                        fontSize: 13,
                                        color: Colors.green),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 250,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
                            ),
                          ),
                          Text(
                            "Price(Incl. Tax)",
                            style: TextStyle(
                                fontFamily: "Montserrat", fontSize: 12),
                          )
                        ],
                      ),
                      Container(
                        height: 35,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                  "Booking ID: ",
                                  style: TextStyle(
                                      fontFamily: "Montserrat", fontSize: 12),
                                ),
                                Text(
                                  "10000",
                                  //snapshot.data![index].bookingNumber,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "0.00",
                              //snapshot.data![index].totalAmount,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ))));*/
  }
}

/* child: FutureBuilder<List<BookingReportModel>?>(
          future: getLabels(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: PhysicalModel(
                        color: Colors.white,
                        elevation: 8,
                        shadowColor: Color(0xff9a9ce3),
                        borderRadius: BorderRadius.circular(4),
                        child: Container(
                          padding: EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        snapshot.data![index].passenger,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Icon(
                                            const IconData(0xefc6,
                                                fontFamily: 'MaterialIcons'),
                                            size: 15,
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "Product: ${snapshot.data![index].bookedProduct}",
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                        decoration: new BoxDecoration(
                                          color: Colors.green,
                                          border: Border.all(
                                              width: 0.1,
                                              color: Colors
                                                  .blue), //https://stackoverflow.com/a/67395539/16076689
                                          borderRadius:
                                              new BorderRadius.circular(5.0),
                                        ),
                                        child: Text(
                                          snapshot.data![index].paidStatus,
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 12,
                                              color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/images/tickiconpng.png'),
                                            width: 16,
                                            height: 16,
                                          ),
                                          Text(
                                            snapshot.data![index].journeyType,
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Row(
                                        children: [
                                          Image(
                                            image: AssetImage(
                                                'assets/images/tickiconpng.png'),
                                            width: 16,
                                            height: 16,
                                          ),
                                          Text(
                                            snapshot.data![index].tripDate,
                                            style: TextStyle(
                                                fontFamily: "Montserrat",
                                                fontWeight: FontWeight.normal,
                                                fontSize: 13,
                                                color: Colors.green),
                                          ),
                                        ],
                                      ),
                                    ],
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: 250,
                                    height: 1,
                                    child: DecoratedBox(
                                      decoration: const BoxDecoration(
                                          color: Color(0xffededed)),
                                    ),
                                  ),
                                  Text(
                                    "Price(Incl. Tax)",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )
                                ],
                              ),
                              Container(
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
                                          "Booking ID: ",
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 12),
                                        ),
                                        Text(
                                          snapshot.data![index].bookingNumber,
                                          style: TextStyle(
                                              fontFamily: "Montserrat",
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      snapshot.data![index].totalAmount,
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),*/
Color _getBackgroundColor(String bookingStatus) {
  if (bookingStatus == '1') {
    return Color(0xFF16D39A);
  } else if (bookingStatus == '0') {
    return Color(0xFFFF7588);
  } else {
    return Colors.black;
  }
}
