import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class AllProductWiseBooking extends StatefulWidget {
  const AllProductWiseBooking({Key? key}) : super(key: key);

  @override
  State<AllProductWiseBooking> createState() =>
      _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<AllProductWiseBooking> {
  /*static Future<List<BookingReportModel>?> getBookingData() async {
    List<BookingReportModel> bookingCardData = [];
    Future<http.Response>? __futureLabels = ResponseHandler.performPost(
        "AllProductwiseBookingListGet", "SerUserTypeId=2&SerUserId=1035&UserId=1035&Product=flight");

    return await __futureLabels?.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      //log(jsonResponse);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          BookingReportModel lm = BookingReportModel.fromMap(list[i]);
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
              "ProductWise Booking",
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
                          Text(
                            "Passenger", //snapshot.data![index].BookingNumber ?? "",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                              "BookCardPassenger", //snapshot.data![index].BookCardDiscription,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe19f,
                                    fontFamily: 'MaterialIcons'),
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UserType", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "BookCardPassenger", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  color: ("Status".toLowerCase() == 'paid')
                                      ? Colors.green
                                      : Colors.orange,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Booking Type".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "BookingType",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "DateOfPayment",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
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
                        height: 30,
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
                                  "Payment ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  "CustPaymentId", //snapshot.data![index].TripId,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "SAR 1100.00", //snapshot.data![index].BookingAmount,
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
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookingCardMenu()
                    )
                );*/
              },
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
                          Text(
                            "Full Name", //snapshot.data![index].BookingNumber ?? "",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                              "BookCardPassenger", //snapshot.data![index].BookCardDiscription,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe19f,
                                    fontFamily: 'MaterialIcons'),
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UserType", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "BookCardPassenger", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  color: ("Status".toLowerCase() == 'paid')
                                      ? Colors.green
                                      : Colors.orange,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Booking Type".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "BookingType",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "DateOfPayment",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
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
                        height: 30,
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
                                  "Payment ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  "CustPaymentId", //snapshot.data![index].TripId,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "SAR 1100.00", //snapshot.data![index].BookingAmount,
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
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookingCardMenu()
                    )
                );*/
              },
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
                          Text(
                            "Full Name", //snapshot.data![index].BookingNumber ?? "",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                              "BookCardPassenger", //snapshot.data![index].BookCardDiscription,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe19f,
                                    fontFamily: 'MaterialIcons'),
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UserType", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "BookCardPassenger", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  color: ("Status".toLowerCase() == 'paid')
                                      ? Colors.green
                                      : Colors.orange,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Booking Type".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "BookingType",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "DateOfPayment",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
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
                        height: 30,
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
                                  "Payment ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  "CustPaymentId", //snapshot.data![index].TripId,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "SAR 1100.00", //snapshot.data![index].BookingAmount,
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
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookingCardMenu()
                    )
                );*/
              },
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
                          Text(
                            "Full Name", //snapshot.data![index].BookingNumber ?? "",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                              "BookCardPassenger", //snapshot.data![index].BookCardDiscription,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe19f,
                                    fontFamily: 'MaterialIcons'),
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UserType", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "BookCardPassenger", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  color: ("Status".toLowerCase() == 'paid')
                                      ? Colors.green
                                      : Colors.orange,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Booking Type".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "BookingType",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "DateOfPayment",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
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
                        height: 30,
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
                                  "Payment ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  "CustPaymentId", //snapshot.data![index].TripId,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "SAR 1100.00", //snapshot.data![index].BookingAmount,
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
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookingCardMenu()
                    )
                );*/
              },
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
                          Text(
                            "Full Name", //snapshot.data![index].BookingNumber ?? "",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                              "BookCardPassenger", //snapshot.data![index].BookCardDiscription,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe19f,
                                    fontFamily: 'MaterialIcons'),
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UserType", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "BookCardPassenger", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  color: ("Status".toLowerCase() == 'paid')
                                      ? Colors.green
                                      : Colors.orange,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Booking Type".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "BookingType",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "DateOfPayment",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
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
                        height: 30,
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
                                  "Payment ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  "CustPaymentId", //snapshot.data![index].TripId,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "SAR 1100.00", //snapshot.data![index].BookingAmount,
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
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookingCardMenu()
                    )
                );*/
              },
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
                          Text(
                            "Full Name", //snapshot.data![index].BookingNumber ?? "",
                            style: TextStyle(
                                fontFamily: "Montserrat",
                                fontSize: 17,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Flexible(
                            child: Text(
                              "BookCardPassenger", //snapshot.data![index].BookCardDiscription,
                              style: TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                const IconData(0xe19f,
                                    fontFamily: 'MaterialIcons'),
                                size: 15,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "UserType", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "BookCardPassenger", //snapshot.data![index].PayMode,
                                style: TextStyle(
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.fromLTRB(10.0, 5, 10, 5),
                                decoration: BoxDecoration(
                                  color: ("Status".toLowerCase() == 'paid')
                                      ? Colors.green
                                      : Colors.orange,
                                  border: Border.all(
                                      width: 0.1,
                                      color: Colors
                                          .blue), //https://stackoverflow.com/a/67395539/16076689
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "Booking Type".toUpperCase(),
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
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
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "BookingType",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  const Image(
                                    image: AssetImage(
                                        'assets/images/tickiconpng.png'),
                                    width: 16,
                                    height: 16,
                                    color: Colors.blue,
                                  ),
                                  Text(
                                    "DateOfPayment",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15,
                                        color: Colors.blue),
                                  ),
                                ],
                              ),
                            ],
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
                        height: 30,
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
                                  "Payment ID: ",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontFamily: "Montserrat",
                                      fontSize: 15),
                                ),
                                Text(
                                  "CustPaymentId", //snapshot.data![index].TripId,
                                  style: TextStyle(
                                      fontFamily: "Montserrat",
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Text(
                              "SAR 1100.00", //snapshot.data![index].BookingAmount,
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
              onTap: () {
                /* Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BookingCardMenu()
                    )
                );*/
              },
            ),
          ),
        ]),
      ),
    ));
  }
}
