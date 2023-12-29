class UnBlockCorporateModel {
  String slNo;
  String corporateId;
  String accountId;
  String name;
  String username;
  String dateOfOperation;
  String createdDate;
  String currency;
  String isActive;
  String approveStatus;

  UnBlockCorporateModel({
    required this.slNo,
    required this.corporateId,
    required this.accountId,
    required this.name,
    required this.username,
    required this.dateOfOperation,
    required this.createdDate,
    required this.currency,
    required this.isActive,
    required this.approveStatus,
  });

  factory UnBlockCorporateModel.fromJson(Map<String, dynamic> json) {
    return UnBlockCorporateModel(
      slNo: json['SlNo'].toString(),
      corporateId: json['CorporateId'].toString(),
      accountId: json['AccountID'].toString(),
      name: json['Name'].toString(),
      username: json['Username'].toString(),
      dateOfOperation: json['DateofOperation'].toString(),
      createdDate: json['CreatedDate'].toString(),
      currency: json['Currency'].toString(),
      isActive: json['IsActive'].toString(),
      approveStatus: json['ApproveStatus'].toString(),
    );
  }
}
