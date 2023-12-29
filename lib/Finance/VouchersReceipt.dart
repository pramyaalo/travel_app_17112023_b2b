import 'package:flutter/material.dart';

class VouchersReceipt extends StatefulWidget {
  const VouchersReceipt({Key? key}) : super(key: key);

  @override
  State<VouchersReceipt> createState() => _BookingCardGeneralDetailsState();
}

class _BookingCardGeneralDetailsState extends State<VouchersReceipt> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Vouchers Receipt",
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
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('BOOKING VOUCHER',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold)),
                      Image.asset('assets/images/logolatest.png',
                          width: 150, height: 50),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date and Thank you message
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Date: 27 November 2023 ",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                          SizedBox(
                            height: 4,
                          ),
                          Text("Dear  Mr chandan mishra, ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15)), // Your date widget goes here
                          Text(
                              "Thank you for booking with Travel Demo.Our preferred partner would like to invite you to join a paid subscription service for access to discount offers.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                          SizedBox(
                            height: 4,
                          ),

                          Text("Reference number: KEB37P.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "Please print and take this booking confirmation with you to the airport. It may speed up your check-in experience.",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                          SizedBox(
                            height: 4,
                          ),
                          Text(
                              "For any concerns/queries related to this booking, please mention this reference number in all your future communications with us.You can contact us toll-free on: ",
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15)),
                          SizedBox(
                            height: 4,
                          ),

                          Text("Booking Status: Ticket Issued",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: Container(
                        height: 40,
                        color: Colors.black26,
                        alignment: Alignment.centerLeft,
                        child: Text('   Passenger(s)',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17)),
                      ),
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 15, top: 10),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('JamesWright',
                              style: TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w600)),
                          Text(
                            'Type : Adult',
                            style: (TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15)),
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
                          Text('Passenger ID : 30596403059640',
                              style: (TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15))),
                          Text('Age : 72',
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
                          Text('Phone : Air India',
                              style: (TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 15))),
                          Text(
                            '	Ticket No : 17-Nov-2022',
                            style: (TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15)),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 3,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: Container(
                        height: 40,
                        color: Colors.black26,
                        alignment: Alignment.centerLeft,
                        child: Text('   OnWard Airlines Information:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17)),
                      ),
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 15, top: 10),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Depart: Kolkata(CCU)',
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600)),
                                Text(
                                  'Arrival: Mumbai(BOM)',
                                  style: (TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 15, top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('	Depart Date:	29-Dec-2023',
                                    style: (TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15))),
                                Text('	Flight No: 6128',
                                    style: (TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15))),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 10, right: 15, top: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('	Arrival Date: 29-Dec-2023',
                                    style: (TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15))),
                                Text(
                                  '	Duration: 3h 5m',
                                  style: (TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15)),
                                ),
                              ],
                            ),
                          ),
                        ]),
                    Padding(
                      padding:
                          const EdgeInsets.only(right: 3, left: 3, top: 10),
                      child: Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: Container(
                        height: 40,
                        color: Colors.black26,
                        alignment: Alignment.centerLeft,
                        child: Text('Payment Information:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17)),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                      width: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Total Fare',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text('     :   	',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            ' BRL 6520.74',
                          ),
                        ),
                        // Add more rows for Tax, T Fee, IGST, and Total Price
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('Total Tax',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Text('       :    	',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            'BRL 2129.90',
                          ),
                        ),
                        // Add more rows for Tax, T Fee, IGST, and Total Price
                      ],
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text('NET PAYABLE  ',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18)),
                        Text('    :    	',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                        Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Text(
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 18),
                            'BRL 5986.00',
                          ),
                        ),
                        // Add more rows for Tax, T Fee, IGST, and Total Price
                      ],
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
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 0),
                            width: 280,
                            child: Text(
                              '* BAGGAGE DISCOUNTS MAY APPLY BASED ON FREQUENT FLYER STATUS/ONLINE CHECKIN/FORM OF PAYMENT/MILITARY/ETC.',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.only(left: 0),
                            width: 280,
                            child: Text(
                              '* REMAINGING PAYMENT HAS TO BE DONE WHEN PICKING BUS.',
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 10,
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
                    Padding(
                      padding: const EdgeInsets.only(right: 3, left: 3),
                      child: Container(
                        height: 40,
                        color: Colors.black26,
                        alignment: Alignment.centerLeft,
                        child: Text('Terms And Conditions:',
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 17)),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'This is a computer-generated Invoice and Digitally signed.',
                      style: TextStyle(fontSize: 12),
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
