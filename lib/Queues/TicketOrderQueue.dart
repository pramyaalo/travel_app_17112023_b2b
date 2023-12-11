import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class TicketOrderQueue extends StatefulWidget {
  const TicketOrderQueue({Key? key}) : super(key: key);

  @override
  State<TicketOrderQueue> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<TicketOrderQueue> {
  /* static Future<List<FlightTicketOrderQueueGet>?>
  getFlightTicketOrderQueue() async {
    List<FlightTicketOrderQueueGet> bookingCardData = [];
    Future<http.Response>? __futureLabels = ResponseHandler.performPost(
        "FlightTicketOrderQueueGet",
        "UserTypeId=2&UserId=1035&Bookingdt=&BookingNo=&BookingType=flight");

    return await __futureLabels?.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      //log(jsonResponse);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          FlightTicketOrderQueueGet lm =
          FlightTicketOrderQueueGet.fromMap(list[i]);
          bookingCardData.add(lm);
        }
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
      return bookingCardData;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Ticket Order Queue",
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
          backgroundColor: Color(0xFF1d5e72) ,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                /* snapshot.data![index].BookFlightId ??
                                    "",*/
                                "Srini l",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    // snapshot.data![index].PayMode,
                                    "Shanthini C",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Invoice",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                          /*Flexible(
                            child: Text(
                              // snapshot.data![index].BookCardPassenger,
                              "S.Date 21/09/2022 - 20/09/2022 \n 21/09/2022 - 21/09/2022\n22/09/2022 - 22/09/2022\n22/09/2022 - 22/09/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 15),
                            ),
                          )*/
                        ],
                      ),
                      /*    Row(
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
                                  "BookingType",
                                  // snapshot.data![index].BookingType
                                  // .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                    */ /* snapshot
                                        .data![index].BookFlightId,*/ /*
                                    "BookFlightId",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )),
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
                                    //snapshot.data![index].BookinDate,
                                    "BookinDate",
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
                                    */ /*  snapshot
                                        .data![index].BookingItemId,*/ /*
                                    "BookingItemId",
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
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        width: 0.1,
                                        color: Colors
                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    "Paid",
                                    //snapshot.data![index].paidStatus,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Oct 15 2023",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  //snapshot.data![index].BookingNumber,
                                  "11780",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "	EUR 392.80",
                              // snapshot.data![index].BookCardAmount,
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
          ),
          Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                /* snapshot.data![index].BookFlightId ??
                                    "",*/
                                "Srini l",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    // snapshot.data![index].PayMode,
                                    "Shanthini K",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Invoice",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                          /*Flexible(
                            child: Text(
                              // snapshot.data![index].BookCardPassenger,
                              "S.Date 21/09/2022 - 20/09/2022 \n 21/09/2022 - 21/09/2022\n22/09/2022 - 22/09/2022\n22/09/2022 - 22/09/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 15),
                            ),
                          )*/
                        ],
                      ),
                      /*    Row(
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
                                  "BookingType",
                                  // snapshot.data![index].BookingType
                                  // .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                    */ /* snapshot
                                        .data![index].BookFlightId,*/ /*
                                    "BookFlightId",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )),
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
                                    //snapshot.data![index].BookinDate,
                                    "BookinDate",
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
                                    */ /*  snapshot
                                        .data![index].BookingItemId,*/ /*
                                    "BookingItemId",
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
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        width: 0.1,
                                        color: Colors
                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    "Paid",
                                    //snapshot.data![index].paidStatus,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Oct 15 2023",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  //snapshot.data![index].BookingNumber,
                                  "11780",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "	EUR 392.80",
                              // snapshot.data![index].BookCardAmount,
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
          ),
          Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                /* snapshot.data![index].BookFlightId ??
                                    "",*/
                                "Srini l",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    // snapshot.data![index].PayMode,
                                    "Shanthini K",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Invoice",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                          /*Flexible(
                            child: Text(
                              // snapshot.data![index].BookCardPassenger,
                              "S.Date 21/09/2022 - 20/09/2022 \n 21/09/2022 - 21/09/2022\n22/09/2022 - 22/09/2022\n22/09/2022 - 22/09/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 15),
                            ),
                          )*/
                        ],
                      ),
                      /*    Row(
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
                                  "BookingType",
                                  // snapshot.data![index].BookingType
                                  // .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                    */ /* snapshot
                                        .data![index].BookFlightId,*/ /*
                                    "BookFlightId",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )),
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
                                    //snapshot.data![index].BookinDate,
                                    "BookinDate",
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
                                    */ /*  snapshot
                                        .data![index].BookingItemId,*/ /*
                                    "BookingItemId",
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
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        width: 0.1,
                                        color: Colors
                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    "Paid",
                                    //snapshot.data![index].paidStatus,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Oct 15 2023",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  //snapshot.data![index].BookingNumber,
                                  "11780",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "	EUR 392.80",
                              // snapshot.data![index].BookCardAmount,
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
          ),
          Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                /* snapshot.data![index].BookFlightId ??
                                    "",*/
                                "Srini l",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    // snapshot.data![index].PayMode,
                                    "Shanthini K",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Invoice",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                          /*Flexible(
                            child: Text(
                              // snapshot.data![index].BookCardPassenger,
                              "S.Date 21/09/2022 - 20/09/2022 \n 21/09/2022 - 21/09/2022\n22/09/2022 - 22/09/2022\n22/09/2022 - 22/09/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 15),
                            ),
                          )*/
                        ],
                      ),
                      /*    Row(
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
                                  "BookingType",
                                  // snapshot.data![index].BookingType
                                  // .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                    */ /* snapshot
                                        .data![index].BookFlightId,*/ /*
                                    "BookFlightId",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )),
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
                                    //snapshot.data![index].BookinDate,
                                    "BookinDate",
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
                                    */ /*  snapshot
                                        .data![index].BookingItemId,*/ /*
                                    "BookingItemId",
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
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        width: 0.1,
                                        color: Colors
                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    "Paid",
                                    //snapshot.data![index].paidStatus,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Oct 15 2023",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  //snapshot.data![index].BookingNumber,
                                  "11780",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "	EUR 392.80",
                              // snapshot.data![index].BookCardAmount,
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
          ),
          Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                /* snapshot.data![index].BookFlightId ??
                                    "",*/
                                "Srini l",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    // snapshot.data![index].PayMode,
                                    "Shanthini K",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Invoice",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                          /*Flexible(
                            child: Text(
                              // snapshot.data![index].BookCardPassenger,
                              "S.Date 21/09/2022 - 20/09/2022 \n 21/09/2022 - 21/09/2022\n22/09/2022 - 22/09/2022\n22/09/2022 - 22/09/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 15),
                            ),
                          )*/
                        ],
                      ),
                      /*    Row(
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
                                  "BookingType",
                                  // snapshot.data![index].BookingType
                                  // .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                    */ /* snapshot
                                        .data![index].BookFlightId,*/ /*
                                    "BookFlightId",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )),
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
                                    //snapshot.data![index].BookinDate,
                                    "BookinDate",
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
                                    */ /*  snapshot
                                        .data![index].BookingItemId,*/ /*
                                    "BookingItemId",
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
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        width: 0.1,
                                        color: Colors
                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    "Paid",
                                    //snapshot.data![index].paidStatus,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Oct 15 2023",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  //snapshot.data![index].BookingNumber,
                                  "11780",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "	EUR 392.80",
                              // snapshot.data![index].BookCardAmount,
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
          ),
          Container(
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
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                /* snapshot.data![index].BookFlightId ??
                                    "",*/
                                "Srini l",
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  Text(
                                    // snapshot.data![index].PayMode,
                                    "Shanthini K",
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 17),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.orange,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Invoice",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              /*Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Column(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                      decoration: BoxDecoration(
                                        color: Colors.teal,
                                        border: Border.all(
                                            width: 0.1,
                                            color: Colors
                                                .blue), //https://stackoverflow.com/a/67395539/16076689
                                        borderRadius:
                                            new BorderRadius.circular(5.0),
                                      ),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].paidStatus,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                              ),*/
                            ],
                          ),
                          /*Flexible(
                            child: Text(
                              // snapshot.data![index].BookCardPassenger,
                              "S.Date 21/09/2022 - 20/09/2022 \n 21/09/2022 - 21/09/2022\n22/09/2022 - 22/09/2022\n22/09/2022 - 22/09/2022",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontFamily: "Montserrat",
                                  fontSize: 15),
                            ),
                          )*/
                        ],
                      ),
                      /*    Row(
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
                                  "BookingType",
                                  // snapshot.data![index].BookingType
                                  // .toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 12,
                                      color: Colors.white),
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              SizedBox(
                                  width: 230,
                                  child: Text(
                                    */ /* snapshot
                                        .data![index].BookFlightId,*/ /*
                                    "BookFlightId",
                                    style: TextStyle(
                                        fontFamily: "Montserrat", fontSize: 12),
                                  )),
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
                                    //snapshot.data![index].BookinDate,
                                    "BookinDate",
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
                                    */ /*  snapshot
                                        .data![index].BookingItemId,*/ /*
                                    "BookingItemId",
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
                      ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    border: Border.all(
                                        width: 0.1,
                                        color: Colors
                                            .blue), //https://stackoverflow.com/a/67395539/16076689
                                    borderRadius:
                                        new BorderRadius.circular(5.0),
                                  ),
                                  child: Text(
                                    "Paid",
                                    //snapshot.data![index].paidStatus,
                                    style: TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Oct 15 2023",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 0),
                                      child: Image(
                                        image: AssetImage(
                                            'assets/images/tickiconpng.png'),
                                        color: Colors.blue,
                                        width: 16,
                                        height: 16,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(bottom: 4),
                                      child: Text(
                                        "Issue",
                                        //snapshot.data![index].tripDate,
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.w500,
                                            fontSize: 15,
                                            color: Colors.blue),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 230,
                            height: 1,
                            child: DecoratedBox(
                              decoration:
                                  const BoxDecoration(color: Color(0xffededed)),
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
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  //snapshot.data![index].BookingNumber,
                                  "11780",
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "	EUR 392.80",
                              // snapshot.data![index].BookCardAmount,
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
          ),
        ])),
      ),
    );
  }
}
