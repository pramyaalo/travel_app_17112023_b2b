import 'dart:convert';

import 'package:flutter/material.dart';

class FundReceivedHistory extends StatefulWidget {
  const FundReceivedHistory({Key? key}) : super(key: key);

  @override
  State<FundReceivedHistory> createState() => _WalletStatementReportState();
}

class _WalletStatementReportState extends State<FundReceivedHistory> {
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
                "Fund Received History",
                style: TextStyle(fontFamily: "Montserrat"),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
                                    const Text("Amount  :   ",
                                        style: TextStyle(
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "BRL1500",
                                      style: const TextStyle(
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
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
                                    const Text("Received date    :   ",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold)),
                                    Text(
                                      "	28 November 2023",
                                      style: const TextStyle(
                                          fontSize: 15,
                                          fontFamily: "Montserrat",
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Message :   ",
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold)),
                                Expanded(
                                  child: Text(
                                    "	Admin credit balance request approved and transferred to Delitax Travel",
                                    style: const TextStyle(
                                        fontFamily: "Montserrat",
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500),
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
