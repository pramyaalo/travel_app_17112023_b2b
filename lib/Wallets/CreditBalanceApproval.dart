import 'dart:convert';

import 'package:flutter/material.dart';

class CreditBalanceApproval extends StatefulWidget {
  const CreditBalanceApproval({Key? key}) : super(key: key);

  @override
  State<CreditBalanceApproval> createState() => _WalletStatementReportState();
}

class _WalletStatementReportState extends State<CreditBalanceApproval> {
/*  static Future<List<WalletReportModel>?> getLabels() async {
    List<WalletReportModel> labelData = [];
    Future<h/==ttp.Response>? futureLabels = ResponseHandler.performPost_OLD(
        "WalletStatementReport_Get",
        "CorporateId=1001&FromDate=&ToDate=&BookingType=ALL");

    return await futureLabels.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      try {
        Map<String, dynamic> map = json.decode(jsonResponse);
        List<dynamic> list = map["Table"];
        for (int i = 0; i < list.length; i++) {
          WalletReportModel lm = WalletReportModel.fromMap(list[i]);
          labelData.add(lm);
        }
      } catch (error) {
        Fluttertoast.showToast(msg: error.toString());
      }
      return labelData;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text(
                "CREDIT BALANCE APPROVAL",
                style: TextStyle(fontSize: 15, fontFamily: "Montserrat"),
              ),
              //title: Image.asset('assets/images/logo.png', width: 150, height: 30,),
              actions: [
                Image.asset(
                  'assets/images/logo.png',
                  width: 120,
                  height: 30,
                ),
                const SizedBox(
                  width: 10,
                )
              ],
              backgroundColor: Color(0xFF1d5e72) ,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xff9a9ce3),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Authorized By : Bank  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Type : Agency ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "16 November 2023",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                          "Approved",
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
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/tickiconpng.png'),
                                              color: Colors.blue,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(
                                              "Amount :800",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xff9a9ce3),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Type : Agency ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "16 November 2023",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                          "Approved",
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
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/tickiconpng.png'),
                                              color: Colors.blue,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(
                                              "Amount :800",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xff9a9ce3),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Type : Agency ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "16 November 2023",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                          "Approved",
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
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/tickiconpng.png'),
                                              color: Colors.blue,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(
                                              "Amount :800",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xff9a9ce3),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Type : Agency ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "16 November 2023",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                          "Approved",
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
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/tickiconpng.png'),
                                              color: Colors.blue,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(
                                              "Amount :800",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xff9a9ce3),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Type : Agency ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "16 November 2023",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                          "Approved",
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
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/tickiconpng.png'),
                                              color: Colors.blue,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(
                                              "Amount :800",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                    child: PhysicalModel(
                      color: Colors.white,
                      elevation: 8,
                      shadowColor: const Color(0xff9a9ce3),
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Delitax Travel  ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text("Type : Agency ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    /*  Text(
                                      " 14 January 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),*/
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 20),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
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
                                            padding: const EdgeInsets.only(
                                                bottom: 0),
                                            child: Text(
                                              "16 November 2023",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
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
                                          "Approved",
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
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Image(
                                              image: AssetImage(
                                                  'assets/images/tickiconpng.png'),
                                              color: Colors.blue,
                                              width: 16,
                                              height: 16,
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(
                                              "Amount :800",
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
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }
}
