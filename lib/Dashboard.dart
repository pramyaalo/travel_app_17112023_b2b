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
import 'package:travel_app_17112023_b2b/Branches/ActiveBranch.dart';
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

import 'Branches/ApproveBranches.dart';
import 'Corporate/UnBlockCorporate.dart';
import 'Finance/AssetEntry.dart';
import 'Finance/BalanceSheet.dart';
import 'Finance/ClientInvoices.dart';
import 'Finance/CreditNotes.dart';
import 'Finance/DebtorAgingReport.dart';
import 'Finance/FinancialBook.dart';
import 'Finance/InvoiceList.dart';
import 'Finance/JournalEntry.dart';
import 'Finance/ProfitandLoss.dart';
import 'Finance/TransactionReport.dart';
import 'Finance/TrialBalance.dart';
import 'Finance/Vouchers.dart';
import 'Queues/CancelBookingQueue.dart';
import 'Queues/TicketOrderQueue.dart';
import 'Report/BookingReport.dart';
import 'SubAgency/ActiveSubAgency.dart';
import 'SubAgency/UnBlockSubAgency.dart';
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
                    leading: Icon(Icons.align_vertical_bottom),
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
                    leading: Icon(Icons.ramp_right),
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
                    leading: Icon(Icons.contacts),
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
                    leading: Icon(Icons.payments_outlined),
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
                    leading: Icon(Icons.terminal_rounded),
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
                    leading: Icon(Icons.swipe_up),
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
                    leading: Icon(Icons.align_horizontal_left),
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
                    leading: Icon(Icons.shopping_cart_rounded),
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
                    leading: Icon(Icons.payment),
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
                    leading: Icon(Icons.account_tree_sharp),
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
                    leading: Icon(Icons.rotate_left_rounded),
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
                    leading: Icon(Icons.payments_sharp),
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
                    leading: Icon(Icons.threesixty_outlined),
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
                    leading: Icon(Icons.search),
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
                    leading: Icon(Icons.swipe_up_alt),
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
                    leading: Icon(Icons.lock_open_outlined),
                    title: Text("Approve Part Payment",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  /*   ListTile(
                    onTap: () {
                      */ /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/ /*
                    },
                    title: Text("Approve Refund OnHold",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),*/
                  /*  ListTile(
                    onTap: () {
                      */ /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/ /*
                    },
                    title: Text("Payment Pending Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),*/
                  /* ListTile(
                    onTap: () {
                      */ /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/ /*
                    },
                    title: Text("Fraud Check Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      */ /* Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));*/ /*
                    },
                    title: Text("Refunded Booking Queue",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),*/
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
                    leading: Icon(Icons.perm_identity_outlined),
                    title: Text("Travellers",
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
                    leading: Icon(Icons.handshake_outlined),
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
                    leading: Icon(Icons.threesixty_outlined),
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
                    leading: Icon(Icons.computer),
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
                    leading: Icon(Icons.password_rounded),
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
                    leading: Icon(Icons.align_vertical_bottom_outlined),
                    title: Text("SubAgency",
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
                    leading: Icon(Icons.approval_sharp),
                    title: Text("Approve SubAgency",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActiveSubAgency()));
                    },
                    leading: Icon(Icons.calendar_view_day_rounded),
                    title: Text("Active SubAgency",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnBlockSubAgency()));
                    },
                    leading: Icon(Icons.payments_outlined),
                    title: Text("Block SubAgency",
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
                    leading: Icon(Icons.password),
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
                    leading: Icon(Icons.computer_outlined),
                    title: Text("Branches",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApproveBranches()));
                    },
                    leading: Icon(Icons.pause_presentation_outlined),
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
                    leading: Icon(Icons.surround_sound),
                    title: Text("Block/UnBlock Branch",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ActiveBranch()));
                    },
                    leading: Icon(Icons.add_card),
                    title: Text("Active Branch",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ChangeBPassword()));
                    },
                    leading: Icon(Icons.password_outlined),
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
                    leading: Icon(Icons.person),
                    title: Text("Corporate",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ApproveCorporate()));
                    },
                    leading: Icon(Icons.computer),
                    title: Text("Approve Corporate",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  UnBlockCorporate()));
                    },
                    leading: Icon(Icons.person),
                    title: Text("Block/UnBlock Corporate",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
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
                    leading: Icon(Icons.people),
                    title: Text("Staff",
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
                    leading: Icon(Icons.approval),
                    title: Text("Approve Staff",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  /*    ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  InActiveStaff()));
                    },
                    leading: Icon(Icons.vertical_align_bottom_outlined),
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
                    leading: Icon(Icons.upcoming_outlined),
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
                    leading: Icon(Icons.power_settings_new_outlined),
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
                  ),*/
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  EarningTypeList()));
                    },
                    leading: Icon(Icons.phonelink_ring_outlined),
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
                    leading: Icon(Icons.phone_android_rounded),
                    title: Text("Deduction TypeList",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                ],
              ),
              ExpansionTile(
                title:
                    Text("Reports", style: TextStyle(fontFamily: "Montserrat")),
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
                    leading: Icon(Icons.computer),
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
                    leading: Icon(Icons.arrow_circle_left_outlined),
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
                    leading: Icon(Icons.adjust_rounded),
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
                    leading: Icon(Icons.volume_down_alt),
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
                    leading: Icon(Icons.minimize),
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
                    leading: Icon(Icons.attach_money_outlined),
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
                    leading: Icon(Icons.book_online_sharp),
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
                    leading: Icon(Icons.payments_sharp),
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
                    leading: Icon(Icons.payments_rounded),
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
                    leading: Icon(Icons.handshake),
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
                    leading: Icon(Icons.handshake_outlined),
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
                    leading: Icon(Icons.album_rounded),
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
                title:
                    Text("Finance", style: TextStyle(fontFamily: "Montserrat")),
                leading:
                    Icon(const IconData(0xe2eb, fontFamily: 'MaterialIcons')),
                children: [
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => AssetEntry()));
                    },
                    title: Text("Asset Entry",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => Vouchers()));
                    },
                    title: Text("Vouchers List",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  InvoiceList()));
                    },
                    title: Text("Invoice List",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CreditNoteInvoiceList()));
                    }, //
                    title: Text("Credit Notes",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ClientInvoiceList()));
                    }, //
                    title: Text("Client Invoices",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  JournalEntry()));
                    }, //JournalEntry
                    title: Text("Journal Entry",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  CheckTransactionReport()));
                    }, //CheckTransactionReport
                    title: Text("Transactions Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  FinancialBook()));
                    }, //FinancialBook
                    title: Text("Financial Book",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DebtorAgingReport()));
                    }, //DebtorAgingReport
                    title: Text("Debtor Aging Report",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProfitandLoss()));
                    }, //ProfitandLoss
                    title: Text("Profit and Loss",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  BalanceSheet()));
                    }, //BalanceSheet
                    title: Text("Balance Sheet",
                        style: TextStyle(fontFamily: "Montserrat")),
                  ),
                  ListTile(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  TrialBalance()));
                    }, //TrialBalance
                    title: Text("Trial Balance",
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
