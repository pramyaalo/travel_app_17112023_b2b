class ActiveBranchModel {
  String slNo;
  String agencyBranchId;
  String agencyBranchCode;
  String agencyBranchName;
  String addressLine1;
  String addressLine2;
  String city;
  String state;
  String postCode;
  String phone;
  String userTypeName;
  String email;
  String mobile;
  String country;
  String username;
  String password;
  String accountNo1;
  String bankName1;
  String bankCode1;
  String agencyBranchLogo;
  String createdDate;
  String status;
  String approveStatus;

  ActiveBranchModel({
    required this.slNo,
    required this.agencyBranchId,
    required this.agencyBranchCode,
    required this.agencyBranchName,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.postCode,
    required this.phone,
    required this.userTypeName,
    required this.email,
    required this.mobile,
    required this.country,
    required this.username,
    required this.password,
    required this.accountNo1,
    required this.bankName1,
    required this.bankCode1,
    required this.agencyBranchLogo,
    required this.createdDate,
    required this.status,
    required this.approveStatus,
  });

  factory ActiveBranchModel.fromJson(Map<String, dynamic> json) {
    return ActiveBranchModel(
      slNo: json['SlNo'].toString(),
      agencyBranchId: json['AgencyBranchId'].toString(),
      agencyBranchCode: json['AgencyBranchCode'].toString(),
      agencyBranchName: json['AgencyBranchName'].toString(),
      addressLine1: json['AddressLine1'].toString(),
      addressLine2: json['AddressLine2'].toString(),
      city: json['City'].toString(),
      state: json['State'].toString(),
      postCode: json['PostCode'].toString(),
      phone: json['Phone'].toString(),
      userTypeName: json['UserTypename'].toString(),
      email: json['Email'].toString(),
      mobile: json['Mobile'].toString(),
      country: json['Country'].toString(),
      username: json['Username'].toString(),
      password: json['Password'].toString(),
      accountNo1: json['AccountNo1'].toString(),
      bankName1: json['BankName1'].toString(),
      bankCode1: json['BankCode1'].toString(),
      agencyBranchLogo: json['AgencyBranchLogo'].toString(),
      createdDate: json['CreatedDate'].toString(),
      status: json['Status'].toString(),
      approveStatus: json['ApproveStatus'].toString(),
    );
  }
}
