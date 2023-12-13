import 'package:flutter/material.dart';
import 'package:travel_app_17112023_b2b/Booking/BookedItemDetail.dart';
import 'package:travel_app_17112023_b2b/Booking/CancellationRequestDetails.dart';
import 'package:travel_app_17112023_b2b/Booking/ChangingDetails.dart';
import 'package:travel_app_17112023_b2b/Booking/ContactDetaails.dart';
import 'package:travel_app_17112023_b2b/Booking/PaymentTransactions.dart';

class ViewBookingDetails extends StatefulWidget {
  const ViewBookingDetails({super.key});

  @override
  State<ViewBookingDetails> createState() =>
      _BookingCardsDetailsContainerState();
}

class _BookingCardsDetailsContainerState extends State<ViewBookingDetails>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 2, vsync: this);
  @override
  void initState() {
    //_tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int index = 0;

  var tabs = [
    BookedItemDetail(),
    ContactDetaails(),
    PaymentTransactions(),
    ChangingDetails(),
    CancellationRequestDetails()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF1d5e72),
        title: const Text(
          "Booking Details",
          style: TextStyle(
            fontFamily: "Montserrat",
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/loginoho.jpg',
            width: 70,
            height: 50,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  InkWell(
                      onTap: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFF1d5e72)),
                            borderRadius: BorderRadius.circular(10),
                            color:
                                index == 0 ? Color(0xFF1d5e72) : Colors.white),
                        height: 40,
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "General",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: index == 0 ? Colors.white : Colors.black),
                        )),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFF1d5e72)),
                            borderRadius: BorderRadius.circular(10),
                            color:
                                index == 1 ? Color(0xFF1d5e72) : Colors.white),
                        height: 40,
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Contact",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: index == 1 ? Colors.white : Colors.black),
                        )),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFF1d5e72)),
                            borderRadius: BorderRadius.circular(10),
                            color:
                                index == 2 ? Color(0xFF1d5e72) : Colors.white),
                        height: 40,
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Payment",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: index == 2 ? Colors.white : Colors.black),
                        )),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          index = 3;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFF1d5e72)),
                            borderRadius: BorderRadius.circular(10),
                            color:
                                index == 3 ? Color(0xFF1d5e72) : Colors.white),
                        height: 40,
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Changing",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: index == 3 ? Colors.white : Colors.black),
                        )),
                      )),
                  InkWell(
                      onTap: () {
                        setState(() {
                          index = 4;
                        });
                      },
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        decoration: BoxDecoration(
                            border:
                                Border.all(width: 1, color: Color(0xFF1d5e72)),
                            borderRadius: BorderRadius.circular(10),
                            color:
                                index == 4 ? Color(0xFF1d5e72) : Colors.white),
                        height: 40,
                        padding: EdgeInsets.all(5),
                        child: Center(
                            child: Text(
                          "Cancellation",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              color: index == 4 ? Colors.white : Colors.black),
                        )),
                      )),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(child: tabs[index]),
        ],
      ),
    );
  }
}
