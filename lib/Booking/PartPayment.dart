import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:travel_app_17112023_b2b/Models/PartPaymentModel.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';

class PartPayment extends StatefulWidget {
  const PartPayment({Key? key}) : super(key: key);

  @override
  State<PartPayment> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<PartPayment> {
  static Future<List<PartPaymentModel>?> getPartPaymentData() async {
    List<PartPaymentModel> bookingCardData = [];
    Future<http.Response>? __futureLabels = ResponseHandler.performPost(
        "PartPaymentListGet", "UserId=1107&UserTypeId=2&BookingType=");

    return await __futureLabels?.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      log(jsonResponse);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          PartPaymentModel lm = PartPaymentModel.fromJson(list[i]);
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
              "Part Payment",
              style: TextStyle(
                  color: Colors.white, fontFamily: "Montserrat", fontSize: 19),
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
        child: FutureBuilder<List<PartPaymentModel>?>(
          future: getPartPaymentData(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.all(10),
                      child: InkWell(
                        child: PhysicalModel(
                          color: Colors.white,
                          elevation: 8,
                          shadowColor: Color(0xff9a9ce3),
                          borderRadius: BorderRadius.circular(4),
                          child: Container(
                            padding: EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,

                              // Add any other widgets on the right end of the second row

                              children: [
                                Text(
                                  snapshot.data![index].BookingId,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat",
                                    fontSize: 16.5,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${snapshot.data![index].UserType ?? ""}',
                                      style: TextStyle(
                                          fontFamily: "Montserrat",
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/images/tickiconpng.png'),
                                                      color: Colors.blue,
                                                      width: 16,
                                                      height: 16,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0),
                                                    child: Text(
                                                      "Due Date: " +
                                                          snapshot.data![index]
                                                              .DueDate,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ])),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(snapshot.data![index].FullName ?? "",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                        )),
                                    Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            children: [
                                              Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0),
                                                    child: Image(
                                                      image: AssetImage(
                                                          'assets/images/tickiconpng.png'),
                                                      color: Colors.blue,
                                                      width: 16,
                                                      height: 16,
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            bottom: 0),
                                                    child: Text(
                                                      "Booking Date: " +
                                                          snapshot.data![index]
                                                              .BookedOnDt,
                                                      style: TextStyle(
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        fontSize: 14,
                                                        color: Colors.blue,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ])),
                                  ],
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    "Trip Date: " +
                                            snapshot
                                                .data![index].DateOfPayment ??
                                        "",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15,
                                    )),
                                SizedBox(
                                  height: 0,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 230,
                                      height: 1,
                                      child: DecoratedBox(
                                        decoration: const BoxDecoration(
                                            color: Color(0xffededed)),
                                      ),
                                    ),
                                    Text(
                                      "Price(Incl. Tax)",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontFamily: "Montserrat",
                                          fontSize: 12),
                                    )
                                  ],
                                ),
                                Container(
                                  height: 30,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 5),
                                        child: Row(
                                          children: [
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  5.0, 2.5, 5, 2.5),
                                              decoration: BoxDecoration(
                                                color: Colors.orange,
                                                border: Border.all(
                                                    width: 0.1,
                                                    color: Colors.orange),
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              child: Text(
                                                snapshot
                                                    .data![index].BookingType,
                                                style: TextStyle(
                                                  fontFamily: "Montserrat",
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "${snapshot.data![index].Currency} ${snapshot.data![index].BookingAmount}",
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
                        onTap: () {},
                      ),
                    );
                  });
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    ));
  }
}
