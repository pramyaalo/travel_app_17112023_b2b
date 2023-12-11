import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app_17112023_b2b/Booking/AllBookingList.dart';
import 'package:travel_app_17112023_b2b/Booking/BookingCard.dart';
import 'package:travel_app_17112023_b2b/Booking/BookingRefundsDue.dart';
import 'package:travel_app_17112023_b2b/Booking/CancelledBooking.dart';
import 'package:travel_app_17112023_b2b/Booking/NewBooking.dart';
import 'package:travel_app_17112023_b2b/Booking/OpenBooking.dart';
import 'package:travel_app_17112023_b2b/Booking/PartPayment.dart';
import 'package:travel_app_17112023_b2b/Booking/PendingPayment.dart';
import 'package:travel_app_17112023_b2b/Booking/ProductWiseBooking.dart';
import 'package:travel_app_17112023_b2b/Booking/ServiceRequest.dart';
import 'package:travel_app_17112023_b2b/Booking/UnConfirmedBooking.dart';
import 'package:travel_app_17112023_b2b/Branches/ChangePassword.dart';
import 'package:travel_app_17112023_b2b/Branches/ManageBranches.dart';
import 'package:travel_app_17112023_b2b/Branches/ViewBranchDetail.dart';
import 'package:travel_app_17112023_b2b/Corporate/ApproveCorporate.dart';
import 'package:travel_app_17112023_b2b/Corporate/ManageCorporate.dart';
import 'package:travel_app_17112023_b2b/Corporate/ViewCorporateDetails.dart';
import 'package:travel_app_17112023_b2b/Models/DashboardModel.dart';
import 'package:travel_app_17112023_b2b/Queues/ApprovePartPayment.dart';
import 'package:travel_app_17112023_b2b/Queues/CancelTicketQueue.dart';
import 'package:travel_app_17112023_b2b/Report/BookingCancellationReport.dart';
import 'package:travel_app_17112023_b2b/Report/ChangingRequestReport.dart';
import 'package:travel_app_17112023_b2b/Report/ClientInvoiceReport.dart';
import 'package:travel_app_17112023_b2b/Report/InvoiceReport.dart';
import 'package:travel_app_17112023_b2b/Report/LedgerStatementReport.dart';
import 'package:travel_app_17112023_b2b/Report/PaymentCollectionReport.dart';
import 'package:travel_app_17112023_b2b/Report/RequestCancellationReport.dart';
import 'package:travel_app_17112023_b2b/Report/TicketReport.dart';
import 'package:travel_app_17112023_b2b/Report/UnConfirmedBooking.dart';
import 'package:travel_app_17112023_b2b/Report/UnTicketReport.dart';
import 'package:travel_app_17112023_b2b/Report/sales_report.dart';
import 'package:travel_app_17112023_b2b/Staff/ActiveStaff.dart';
import 'package:travel_app_17112023_b2b/Staff/ApproveLeave.dart';
import 'package:travel_app_17112023_b2b/Staff/ApproveStaff.dart';
import 'package:travel_app_17112023_b2b/Staff/Block_UnBlocktStaff.dart';
import 'package:travel_app_17112023_b2b/Staff/DeductionTypeList.dart';
import 'package:travel_app_17112023_b2b/Staff/EarningTypeList.dart';
import 'package:travel_app_17112023_b2b/Staff/LeaveApproved.dart';
import 'package:travel_app_17112023_b2b/Staff/LeaveRejected.dart';
import 'package:travel_app_17112023_b2b/Staff/ManageStaff.dart';
import 'package:travel_app_17112023_b2b/Staff/SalaryStructure.dart';
import 'package:travel_app_17112023_b2b/Staff/StaffAttendance.dart';
import 'package:travel_app_17112023_b2b/Staff/StaffLeaveApply.dart';
import 'package:travel_app_17112023_b2b/SubAgency/ApproveSubAgency.dart';
import 'package:travel_app_17112023_b2b/SubAgency/ManageSubAgency.dart';
import 'package:travel_app_17112023_b2b/Travellers/ActiveTravellers.dart';
import 'package:travel_app_17112023_b2b/Travellers/ApproveTravellers.dart';
import 'package:travel_app_17112023_b2b/Travellers/ChangePasswordTravellers.dart';
import 'package:travel_app_17112023_b2b/Travellers/ManageTravellers.dart';
import 'package:travel_app_17112023_b2b/Travellers/UnBlockTravellers.dart';
import 'package:travel_app_17112023_b2b/Wallets/CreditBalanceApproval.dart';
import 'package:travel_app_17112023_b2b/Wallets/CreditRequestReceipt.dart';
import 'package:travel_app_17112023_b2b/Wallets/FundReceivedHistory.dart';
import 'package:travel_app_17112023_b2b/Wallets/FundTransferHistory.dart';
import 'package:travel_app_17112023_b2b/Wallets/DebitUserFund.dart';
import 'package:travel_app_17112023_b2b/Wallets/FundTransfer.dart';
import 'package:travel_app_17112023_b2b/Wallets/CreditRequestRejected.dart';
import 'package:travel_app_17112023_b2b/Wallets/CreditRequestApproved.dart';
import 'package:travel_app_17112023_b2b/Wallets/CreditBalanceRequest.dart';
import 'package:travel_app_17112023_b2b/utils/response_handler.dart';

import 'Queues/CancelBookingQueue.dart';
import 'Queues/TicketOrderQueue.dart';
import 'Report/BookingReport.dart';
import 'home/bookings_chart.dart';
import 'home/events_chart.dart';
import 'home/passengers_chart.dart';

class Dashboard extends StatefulWidget {
  @override
  _CorDashboardState createState() => _CorDashboardState();
}

class _CorDashboardState extends State<Dashboard> {
  List<DashboardModel> table1Data = [];

  late List<dynamic> table0, table1, table2, table3, table4, table5, table6;
  Future<String?> getInvoiceReceiptJSON() async {
    Future<http.Response>? futureLabels =
        ResponseHandler.performPost("B2BAdminDashboard", "AgencyId=1107");
    return await futureLabels.then((value) {
      String jsonResponse = ResponseHandler.parseData(value.body);
      Map<String, dynamic> map = json.decode(jsonResponse);
      table0 = map["Table"];
      table1 = map["Table1"];
      table2 = map["Table2"];
      table3 = map["Table3"];
      table4 = map["Table4"];
      table5 = map["Table5"];
      table6 = map["Table6"];
      log('Response: $jsonResponse');
      return jsonResponse;
    });
  }

  Future<http.Response>? __futureLogin;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  bool isInvoiceSelected = false;
  late String Balance = "",
      Balance1 = '',
      affiliate = "",
      TotalEarnings = "",
      AvailableBalance = "",
      DirectIncome = "",
      LevelIncome = "",
      BinaryIncome = "",
      Notification = "",
      Kyc = "",
      UnusedEpins = "",
      UsedEpins = "",
      TransferedEpins = "",
      ReceivedEpins = "",
      TotalWithdrawals = "",
      FundTrasnfered = "",
      FundReceived = "",
      MessageSent = "",
      Inbox = "",
      TotalOrders = "",
      NewOrders = "",
      CompletedOrders = "",
      PersonalMember = "",
      TeamMember = "";
  String? UserId;
  String? Name;
  String imageUrl = '';
  String? UserName;
  bool ispremium = false;
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  bool showAvg = false;
  int currentIndex = 0;
  PageController pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Color(0xFF1d5e72),
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(0),
              child: IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                  size: 27,
                ),
                onPressed: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Admin',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '9300140867',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
            SizedBox(width: 100),
            Image.asset(
              'assets/images/loginoho.jpg',
              alignment: Alignment.center,
              width: 70,
              height: 50,
            ),
          ],
        ),
      ),
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Corp Admin",
                    style: TextStyle(fontFamily: "Montserrat")),
                accountEmail: Text("corpadmin@email.com",
                    style: TextStyle(fontFamily: "Montserrat")),
                decoration: BoxDecoration(color: Color(0xFF1d5e72)),
                currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child:
                        Text("CA", style: TextStyle(fontFamily: "Montserrat"))),
              ),
              ListTile(
                onTap: () {
                  setState(() {});
                  Navigator.pop(context);
                },
                leading: Icon(Icons.home),
                title: Text("Dashboard",
                    style: TextStyle(fontFamily: "Montserrat")),
              ),
              ExpansionTile(
                title:
                    Text("Booking", style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FlightsScreen()));*/
                    },
                    title: Text("Book Now",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BookingCard()));
                    },
                    title: Text("Booking Card",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  NewBookings()));
                    },
                    title: Text("New Booking",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  OpenBooking()));
                    },
                    title: Text("Open Booking",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PartPayment()));
                    },
                    title: Text("Part Payment",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PendingPayment()));
                    },
                    title: Text("Pending Payment",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ServiceRequest()));
                    },
                    title: Text("Service Request",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnconfirmedBooking()));
                    },
                    title: Text("UnConfirmed Booking",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CancelledBooking()));
                    },
                    title: Text("Cancelled Flight Booking",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BookingRefundsDue()));
                    },
                    title: Text("Booking Refunds Due",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AllBooking()));
                    },
                    title: Text("All Bookings List",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  AllProductWiseBooking()));
                    },
                    title: Text("Productwise Bookings",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ExpansionTile(
                title:
                    Text("Queues", style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TicketOrderQueue()));
                    },
                    title: Text("Ticket Order Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CancelBookingQueue()));
                    },
                    title: Text("Cancel Booking Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CancelTicketQueue()));
                    },
                    title: Text("Cancel Ticket Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApprovePartPayment()));
                    },
                    title: Text("Approve Part Payment",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/
                    },
                    title: Text("Approve Refund OnHold",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/
                    },
                    title: Text("Payment Pending Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/
                    },
                    title: Text("Fraud Check Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/
                    },
                    title: Text("Refunded Booking Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Travellers",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ManageTravellers()));
                    },
                    title: Text("Manage Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApproveTravellers()));
                    },
                    title: Text("Approve Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnBlockTravellers()));
                    },
                    title: Text("Block/UnBlock Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActiveTravellers()));
                    },
                    title: Text("Active Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangePasswordTravellers()));
                    },
                    title: Text("Change Password",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("SubAgency",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ManageSubAgency()));
                    },
                    title: Text("Manage SubAgency",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApproveSubAgency()));
                    },
                    title: Text("Approve SubAgency",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnBlockTravellers()));
                    },
                    title: Text("Block/UnBlock Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActiveTravellers()));
                    },
                    title: Text("Active Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangePasswordTravellers()));
                    },
                    title: Text("Change Password",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Branches",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ManageBranch()));
                    },
                    title: Text("Manage Branch",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ViewBranchDetail()));
                    },
                    title: Text("Approve Branch",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnBlockTravellers()));
                    },
                    title: Text("Block/UnBlock Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActiveTravellers()));
                    },
                    title: Text("Active Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangePasswordTravellers()));
                    },
                    title: Text("Change Password",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ExpansionTile(
                title: Text("Corporate",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ManageCorporate()));
                    },
                    title: Text("Manage Corporate",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ViewCorporateDetails()));
                    },
                    title: Text("Approve Corporate",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnBlockTravellers()));
                    },
                    title: Text("Block/UnBlock Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActiveTravellers()));
                    },
                    title: Text("Active Travellers",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangePasswordTravellers()));
                    },
                    title: Text("Change Password",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  setState(() {});
                  Navigator.pop(context);
                  /*    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => IssueVouchers()));*/
                },
                leading: Icon(Icons.home),
                title: Text("Issue Vouchers",
                    style: TextStyle(fontFamily: "Montserrat")),
              ),
              // ListTile(onTap: (){}, leading: Icon(Icons.book_online_outlined), title:  Text("Bookings", style: TextStyle(fontFamily: "Montserrat")),),

              ExpansionTile(
                title: Text("Invoices",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xee5e, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  InvoiceList()));*/
                    },
                    title: Text("Invoice List",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ClientInvoiceList()));*/
                    },
                    title: Text("Client Invoice List",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/
                    },
                    title: Text("Credit Note",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ListTile(
                onTap: () {
                  setState(() {});
                  Navigator.pop(context);

                  /*   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => EmailTicket()));*/
                },
                leading: Icon(Icons.home),
                title: Text("SMS/Email Ticket",
                    style: TextStyle(fontFamily: "Montserrat")),
              ),

              ExpansionTile(
                title:
                    Text("Staffs", style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xe4fb, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ManageStaff()));
                    },
                    title: Text("Manage Staff",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApproveStaff()));
                    },
                    title: Text("Approve Staff",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  InActiveStaff()));
                    },
                    title: Text("Active Staff",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  Block_UnBlocktStaff()));
                    },
                    title: Text("Block/UnBlock Staff",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StaffAttendance()));
                    },
                    title: Text("Staff Attendance",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  StaffLeaveApply()));
                    },
                    title: Text("Staff Leave Apply",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApproveLeave()));
                    },
                    title: Text("Approve Leave",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LeaveApproved()));
                    },
                    title: Text("Leave Approved",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LeaveRejected()));
                    },
                    title: Text("Leave Rejected",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SalaryStructure()));
                    },
                    title: Text("Salary Structure",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EarningTypeList()));
                    },
                    title: Text("Earning TypeList",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DeductionTypeList()));
                    },
                    title: Text("Deduction TypeList",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),

              ExpansionTile(
                title: Text("Recharges",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xe140, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MobilePrepaidRecharge()));*/
                    },
                    title: Text("Mobile Prepaid",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  MobilePostpaidRecharge()));*/
                    },
                    title: Text("Mobile Postpaid",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LandlineRecharge()));*/
                    },
                    title: Text("Landline Phone",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BroadbandPayment()));*/
                    },
                    title: Text("BroadBand",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DataCardRecharge()));*/
                    },
                    title: Text("Data Card",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DTHRecharge()));*/
                    },
                    title:
                        Text("DTH", style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ElectricityPayment()));*/
                    },
                    title: Text("Electricity",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  GasBillPaymets()));*/
                    },
                    title:
                        Text("Gas", style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LifeInsurancePayment()));*/
                    },
                    title: Text("Life Insurance",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*   Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  pendingRecharge()));*/
                    },
                    title: Text("Pending Recharge",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RechargeHistoryReport()));*/
                    },
                    title: Text("Recharge History",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CheckTransactionReport()));*/
                    },
                    title: Text("Check Transaction",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),

              ExpansionTile(
                title: Text("Reporting",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xe621, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BookingReport()));
                    },
                    title: Text("Booking Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BookingCancellationReport()));
                    },
                    title: Text("Booking Cancellation Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnConfirmedBooking()));
                    },
                    title: Text("UnConfirmed Booking",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  RequestCancellationReport()));
                    },
                    title: Text("Request Cancellation Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangingRequestReport()));
                    },
                    title: Text("Changing Request Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ClientInvoiceReport()));
                    },
                    title: Text("Client Invoice Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  InvoiceReport()));
                    },
                    title: Text("Invoice Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  LedgerSttementReport()));
                    },
                    title: Text("Ledger Statement Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  PaymentCollectionReport()));
                    },
                    title: Text("Payment Collection Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  SalesReport()));
                    },
                    title: Text("Sales Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TicketReport()));
                    },
                    title: Text("Ticket Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnTicketReport()));
                    },
                    title: Text("Unticket Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),

              ExpansionTile(
                title:
                    Text("Wallets", style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xe19a, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {},
                    title: Text("Credit Usage",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditBalanceRequest()));
                    },
                    title: Text("Credit Balance Request",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditBalanceApproval()));
                    },
                    title: Text("Credit Balance Approval",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditRequestApproved()));
                    },
                    title: Text("Credit Request Approved",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditRequestRejected()));
                    },
                    title: Text("Credit Request Rejected",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BalanceReceipt()));
                    },
                    title: Text("Credit Request Receipt",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FundTransfer()));
                    },
                    title: Text("Fund Transfer",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DebitUserFund()));
                    },
                    title: Text("Debit Users Fund",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FundTransferHistory()));
                    },
                    title: Text("Fund Transfer History",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FundReceivedHistory()));
                    },
                    title: Text("Fund Received History",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),

              ExpansionTile(
                title: Text("Help/Support",
                    style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xe2eb, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreateTicket()));*/
                    },
                    title: Text("Create Ticket",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /*    Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => OpenTicket()));*/
                    },
                    title: Text("Open Ticket",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ResolvedTickets()));*/
                    },
                    title: Text("Resolved Tickets",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Closed Tickets",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {},
                    title: Text("Archived Tickets",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: Center(
        child: FutureBuilder<String?>(
            future: getInvoiceReceiptJSON(),
            builder: (context, snapshot) {
              if (snapshot.hasData &&
                  snapshot.connectionState == ConnectionState.done) {
                try {
                  log('Datagfggg: :${snapshot.data}');
                  Table0 m0 = Table0.fromJson(table0[0]);
                  Table1 m1 = Table1.fromJson(table1[0]);
                  Table2 m2 = Table2.fromJson(table2[0]);

                  Table3 m3 = Table3.fromJson(table3[0]);
                  Table4 m4 = Table4.fromJson(table4[0]);
                  Table5 m5 = Table5.fromJson(table5[0]);
                  Table6 m6 = Table6.fromJson(table6[0]);
                  log('Datagrrwwfggg: :${m6}');
                  return SingleChildScrollView(
                      child: Container(
                          margin: EdgeInsets.all(0),
                          child: InkWell(
                              child: PhysicalModel(
                            color: Colors.white,
                            elevation: 8,
                            shadowColor: Color(0xff9a9ce3),
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              padding: EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            width: 150,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Color(0xff41d1d1),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Available Credit',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  m6.availableCredit,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            width: 150,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Color(0xff3050af),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Total Bookings',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  m0.totalBooking,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            width: 150,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Color(0xffeb8899),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Total Branches',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  m0.totalBranch,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        Material(
                                          elevation: 10,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          child: Container(
                                            width: 150,
                                            height: 100,
                                            decoration: BoxDecoration(
                                                color: Color(0xffe7a236),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  'Total Travellers',
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text(
                                                  m0.totalPeople,
                                                  style: TextStyle(
                                                      fontSize: 18,
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Material(
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 20, 0, 20),
                                                child: Text(
                                                  'Bookings',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )),
                                            Container(
                                              width: double.infinity,
                                              height: 300,
                                              child: BookingsChart(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Material(
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 20, 0, 20),
                                                child: Text(
                                                  'Passengers',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )),
                                            Container(
                                              width: double.infinity,
                                              height: 300,
                                              child: PassengersChart(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.all(20),
                                    child: Material(
                                      elevation: 5,
                                      borderRadius: BorderRadius.circular(20),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(20)),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20, vertical: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    0, 20, 0, 20),
                                                child: Text(
                                                  'Events',
                                                  style:
                                                      TextStyle(fontSize: 18),
                                                )),
                                            Container(
                                              width: double.infinity,
                                              height: 300,
                                              child: EventsChart(),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ))));
                } catch (error) {
                  print('Unexpected error: $error');
                  return Text('An unexpected error occurred.');
                }
              } else {
                return CircularProgressIndicator();
              }
            }),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Color(0xFF1d5e72), // Background color
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white,
        type: BottomNavigationBarType.fixed,

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Book Now",
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart), label: "My Bookings"),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: "Vouchers"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Wallets"),
        ],
        onTap: (int index) {
          setState(() {
            currentIndex = index;
            pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease,
            );
          });
        },
      ),
    );
  }
}
