import 'dart:convert';

import 'package:flutter/material.dart';

import '../utils/response_handler.dart';
import 'package:http/http.dart' as http;

class SalesReport extends StatefulWidget {
  const SalesReport({Key? key}) : super(key: key);

  @override
  _SalesReportState createState() => _SalesReportState();
}

class _SalesReportState extends State<SalesReport> {
  /* static Future<List<SalesReportModel>?> getLabels() async {
    List<SalesReportModel> labelData = [];
    Future<http.Response>? futureLabels = ResponseHandler.performPost_OLD("SalesReport_Get", "CorporateId=1001&FromDate=&ToDate=&BookingType=ALL");

    return await futureLabels.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          SalesReportModel lm = SalesReportModel.fromMap(list[i]);
          labelData.add(lm);
        }
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
      return labelData;
    } );
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
                "Sales Report",
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
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(10),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: const Color(0xff9a9ce3),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passenger",
                              // snapshot.data![index].Passenger,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  IconData(0xefc6, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "JourneyType",
                                  //  snapshot.data![index].JourneyType,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
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
                                    "TripType".toUpperCase(),
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
                                      "BookedOnDt",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      "TicketCode",
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 1,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffededed)),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.book_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Product: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "BookedProduct",
                                    //snapshot.data![index].BookedProduct,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "SAR 11000.00",
                                //snapshot.data![index].TotalAmt,
                                style: const TextStyle(
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
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: const Color(0xff9a9ce3),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passenger",
                              // snapshot.data![index].Passenger,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  IconData(0xefc6, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "JourneyType",
                                  //  snapshot.data![index].JourneyType,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
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
                                    "TripType".toUpperCase(),
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
                                      "BookedOnDt",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      "TicketCode",
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 1,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffededed)),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.book_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Product: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "BookedProduct",
                                    //snapshot.data![index].BookedProduct,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "SAR 11000.00",
                                //snapshot.data![index].TotalAmt,
                                style: const TextStyle(
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
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: const Color(0xff9a9ce3),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passenger",
                              // snapshot.data![index].Passenger,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  IconData(0xefc6, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "JourneyType",
                                  //  snapshot.data![index].JourneyType,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
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
                                    "TripType".toUpperCase(),
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
                                      "BookedOnDt",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      "TicketCode",
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 1,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffededed)),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.book_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Product: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "BookedProduct",
                                    //snapshot.data![index].BookedProduct,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "SAR 11000.00",
                                //snapshot.data![index].TotalAmt,
                                style: const TextStyle(
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
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: const Color(0xff9a9ce3),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passenger",
                              // snapshot.data![index].Passenger,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  IconData(0xefc6, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "JourneyType",
                                  //  snapshot.data![index].JourneyType,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
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
                                    "TripType".toUpperCase(),
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
                                      "BookedOnDt",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      "TicketCode",
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 1,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffededed)),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.book_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Product: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "BookedProduct",
                                    //snapshot.data![index].BookedProduct,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "SAR 11000.00",
                                //snapshot.data![index].TotalAmt,
                                style: const TextStyle(
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
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: const Color(0xff9a9ce3),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passenger",
                              // snapshot.data![index].Passenger,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  IconData(0xefc6, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "JourneyType",
                                  //  snapshot.data![index].JourneyType,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
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
                                    "TripType".toUpperCase(),
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
                                      "BookedOnDt",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      "TicketCode",
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 1,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffededed)),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.book_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Product: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "BookedProduct",
                                    //snapshot.data![index].BookedProduct,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "SAR 11000.00",
                                //snapshot.data![index].TotalAmt,
                                style: const TextStyle(
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
              ),
              Container(
                margin: const EdgeInsets.all(10),
                child: PhysicalModel(
                  color: Colors.white,
                  elevation: 8,
                  shadowColor: const Color(0xff9a9ce3),
                  borderRadius: BorderRadius.circular(4),
                  child: Container(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Passenger",
                              // snapshot.data![index].Passenger,
                              style: const TextStyle(
                                  fontFamily: "Montserrat",
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  IconData(0xefc6, fontFamily: 'MaterialIcons'),
                                  size: 15,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "JourneyType",
                                  //  snapshot.data![index].JourneyType,
                                  style: const TextStyle(
                                      fontFamily: "Montserrat",
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                          ],
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
                                    "TripType".toUpperCase(),
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
                                      "BookedOnDt",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500,
                                          fontSize: 15,
                                          color: Colors.blue),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
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
                                      "TicketCode",
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
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 230,
                              height: 1,
                              child: DecoratedBox(
                                decoration:
                                    BoxDecoration(color: Color(0xffededed)),
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
                        SizedBox(
                          height: 35,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.book_outlined,
                                    size: 12,
                                  ),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text(
                                    "Product: ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontFamily: "Montserrat",
                                        fontSize: 15),
                                  ),
                                  Text(
                                    "BookedProduct",
                                    //snapshot.data![index].BookedProduct,
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Text(
                                "SAR 11000.00",
                                //snapshot.data![index].TotalAmt,
                                style: const TextStyle(
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
