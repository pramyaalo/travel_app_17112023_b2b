import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/response_handler.dart';

class ProfitandLoss extends StatefulWidget {
  const ProfitandLoss({Key? key}) : super(key: key);

  @override
  State<ProfitandLoss> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<ProfitandLoss> {
  var selectedDate = DateTime.now().obs;
  TextEditingController dateController = TextEditingController();
  void chooseDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate.value,
      firstDate: DateTime(1800),
      lastDate: DateTime(2024),
      helpText: 'Select DOB',
      cancelText: 'Close',
      confirmText: 'Confirm',
      errorFormatText: 'Enter a valid date',
      errorInvalidText: 'Enter a valid date range',
      fieldLabelText: 'DOB',
      fieldHintText: 'Month/Date/Year',
    );
    if (pickedDate != null && pickedDate != selectedDate.value) {
      selectedDate.value = pickedDate;
      dateController.text = DateFormat('dd/MM/yyyy').format(pickedDate);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Profit and Loss",
            style: TextStyle(fontFamily: "Montserrat", fontSize: 16),
          ),
          //title: Image.asset('assets/images/loginoho.jpg', width: 150, height: 30,),
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
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
            ),
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 10, right: 5, top: 7),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            onTap: () {
                              chooseDate();
                            },
                            decoration: InputDecoration(
                              hintText: 'From date',
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  chooseDate();
                                },
                                child: Image.asset(
                                  'assets/images/calendar.png',
                                  cacheWidth: 25,
                                  cacheHeight: 25,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              contentPadding: EdgeInsets.only(bottom: 5),
                            ),
                            readOnly: true,
                            controller: dateController,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 5, right: 10, top: 7),
                        child: Container(
                          height: 35,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: TextField(
                            onTap: () {
                              chooseDate();
                            },
                            decoration: InputDecoration(
                              hintText: 'To date',
                              prefixIcon: GestureDetector(
                                onTap: () {
                                  chooseDate();
                                },
                                child: Image.asset(
                                  'assets/images/calendar.png',
                                  cacheWidth: 25,
                                  cacheHeight: 25,
                                ),
                              ),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                              contentPadding: EdgeInsets.only(bottom: 5),
                            ),
                            readOnly: true,
                            controller: dateController,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/logolatest.png',
                          width: 200, height: 50),
                    ],
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: 310,
                            child: Text(
                              '6th Street Lane, St.Joseph Colony, Perambur , Chennai, 600011, Tamilnadu,',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w500),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        children: [
                          Center(
                            child: Container(
                              width: 310,
                              child: Text(
                                  'Telephone: 9566756321, Email: info@traveldemo.org, Website: www.traveldemo.org',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: Divider(
                        color: Colors.black,
                        height: 2,
                        thickness: 1,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: Container(
                        height: 40,
                        color: Colors.black26,
                        alignment: Alignment.centerLeft,
                        child: Text('   PROFIT AND LOSS:',
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 17)),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Text('INCOME',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Particulars',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(
                            'Amount',
                            style: (TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Receivable',
                              style: (TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15))),
                          Text('BRL660.00',
                              style: (TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15))),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOTAL INCOME',
                              style: (TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16))),
                          Text(
                            'BRL660.00',
                            style: (TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 3, left: 3, top: 10),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 0,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Text('EXPENSE',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.bold)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Particulars',
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),
                          Text(
                            'Amount',
                            style: (TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Chargeable',
                              style: (TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15))),
                          Text('BRL660.00',
                              style: (TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15))),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('TOTAL EXPENSE',
                              style: (TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16))),
                          Text(
                            'BRL660.00',
                            style: (TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 3, left: 3, top: 10, bottom: 6),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('PROFIT & LOSS',
                              style: (TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 17))),
                          Text(
                            'BRL-760.00',
                            style: (TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
