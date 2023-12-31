class ViewBranchDetailsModel {
  String agencyBranchId;
  String agencyBranchCode;
  String agencyBranchName;
  String agencyBranchHead;
  String addressLine1;
  String addressLine2;
  String addressLine3;
  String countryId;
  String agencyBranchLogo;
  String city;
  String state;
  String postCode;
  String mobile;
  String phone;
  String fax;
  String email;
  String sunday;
  String monday;
  String tuesday;
  String wednesday;
  String thursday;
  String friday;
  String saturday;
  String workingAM;
  String workingPM;
  String iataCode;
  String bankName1;
  String accountNo1;
  String bankCode1;
  String userName;
  String password;
  String userTypeId;
  String udUserName;
  String userId;
  String bankName2;
  String accountNo2;
  String bankCode2;
  String status;
  String createdDate;
  String country;
  String refreshPNR;
  String viewPNR;
  String seatMap;
  String backofficeFile;
  String importBooking;
  String salesReport;
  String issueTicket;
  String cancelBooking;
  String cancelTicket;
  String manageServices;
  String manageElement;
  String changeBooking;
  String downloadDocument;
  String bookingOptions;
  String viewTicket;
  String flightMarkup;
  String hotelMarkup;
  String carMarkup;
  String sightSeeingMarkup;
  String pccNumber;
  String currencyCode;
  String creditLimit;
  String customerType;
  String customerName;

  ViewBranchDetailsModel({
    required this.agencyBranchId,
    required this.agencyBranchCode,
    required this.agencyBranchName,
    required this.agencyBranchHead,
    required this.addressLine1,
    required this.addressLine2,
    required this.addressLine3,
    required this.countryId,
    required this.agencyBranchLogo,
    required this.city,
    required this.state,
    required this.postCode,
    required this.mobile,
    required this.phone,
    required this.fax,
    required this.email,
    required this.sunday,
    required this.monday,
    required this.tuesday,
    required this.wednesday,
    required this.thursday,
    required this.friday,
    required this.saturday,
    required this.workingAM,
    required this.workingPM,
    required this.iataCode,
    required this.bankName1,
    required this.accountNo1,
    required this.bankCode1,
    required this.userName,
    required this.password,
    required this.userTypeId,
    required this.udUserName,
    required this.userId,
    required this.bankName2,
    required this.accountNo2,
    required this.bankCode2,
    required this.status,
    required this.createdDate,
    required this.country,
    required this.refreshPNR,
    required this.viewPNR,
    required this.seatMap,
    required this.backofficeFile,
    required this.importBooking,
    required this.salesReport,
    required this.issueTicket,
    required this.cancelBooking,
    required this.cancelTicket,
    required this.manageServices,
    required this.manageElement,
    required this.changeBooking,
    required this.downloadDocument,
    required this.bookingOptions,
    required this.viewTicket,
    required this.flightMarkup,
    required this.hotelMarkup,
    required this.carMarkup,
    required this.sightSeeingMarkup,
    required this.pccNumber,
    required this.currencyCode,
    required this.creditLimit,
    required this.customerType,
    required this.customerName,
  });

  factory ViewBranchDetailsModel.fromJson(Map<String, dynamic> json) {
    return ViewBranchDetailsModel(
      agencyBranchId: json['AgencyBranchId'].toString(),
      agencyBranchCode: json['AgencyBranchCode'].toString(),
      agencyBranchName: json['AgencyBranchName'].toString(),
      agencyBranchHead: json['AgencyBranchHead'].toString(),
      addressLine1: json['AddressLine1'].toString(),
      addressLine2: json['AddressLine2'].toString(),
      addressLine3: json['AddressLine3'].toString(),
      countryId: json['CountryId'].toString(),
      agencyBranchLogo: json['AgencyBranchLogo'].toString(),
      city: json['City'].toString(),
      state: json['State'].toString(),
      postCode: json['PostCode'].toString(),
      mobile: json['Mobile'].toString(),
      phone: json['Phone'].toString(),
      fax: json['Fax'].toString(),
      email: json['Email'].toString(),
      sunday: json['Sunday'].toString(),
      monday: json['Monday'].toString(),
      tuesday: json['Tuesday'].toString(),
      wednesday: json['Wednesday'].toString(),
      thursday: json['Thursday'].toString(),
      friday: json['Friday'].toString(),
      saturday: json['Saturday'].toString(),
      workingAM: json['WorkingAM'].toString(),
      workingPM: json['WorkingPM'].toString(),
      iataCode: json['IATACode'].toString(),
      bankName1: json['BankName1'].toString(),
      accountNo1: json['AccountNo1'].toString(),
      bankCode1: json['BankCode1'].toString(),
      userName: json['UserName'].toString(),
      password: json['Password'].toString(),
      userTypeId: json['UserTypeId'].toString(),
      udUserName: json['UDUserName'].toString(),
      userId: json['UserId'].toString(),
      bankName2: json['BankName2'].toString(),
      accountNo2: json['AccountNo2'].toString(),
      bankCode2: json['BankCode2'].toString(),
      status: json['Status'].toString(),
      createdDate: json['CreatedDate'].toString(),
      country: json['Country'].toString(),
      refreshPNR: json['RefreshPNR'].toString(),
      viewPNR: json['ViewPNR'].toString(),
      seatMap: json['SeatMap'].toString(),
      backofficeFile: json['BackofficeFile'].toString(),
      importBooking: json['ImportBooking'].toString(),
      salesReport: json['SalesReport'].toString(),
      issueTicket: json['IssueTicket'].toString(),
      cancelBooking: json['CancelBooking'].toString(),
      cancelTicket: json['CancelTicket'].toString(),
      manageServices: json['ManageServices'].toString(),
      manageElement: json['ManageElement'].toString(),
      changeBooking: json['ChangeBooking'].toString(),
      downloadDocument: json['DownloadDocument'].toString(),
      bookingOptions: json['BookingOptions'].toString(),
      viewTicket: json['ViewTicket'].toString(),
      flightMarkup: json['FlightMarkup'].toString(),
      hotelMarkup: json['HotelMarkup'].toString(),
      carMarkup: json['CarMarkup'].toString(),
      sightSeeingMarkup: json['SightSeeingMarkup'].toString(),
      pccNumber: json['PCCNumber'].toString(),
      currencyCode: json['CurrencyCode'].toString(),
      creditLimit: json['CreditLimit'].toString(),
      customerType: json['CustomerType'].toString(),
      customerName: json['CustomerName'].toString(),
    );
  }
}
