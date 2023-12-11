class Tableee5 {
  final String paid;
  final String subAgentId;
  final String productAccessId;
  final String productAccessName;
  final String b2BInterface;
  final String b2B2CWebsite;
  final String otherDetails;
//<editor-fold desc="Data Methods">

  Tableee5({
    required this.paid,
    required this.subAgentId,
    required this.productAccessId,
    required this.productAccessName,
    required this.b2BInterface,
    required this.b2B2CWebsite,
    required this.otherDetails,
  });

  factory Tableee5.fromJson(Map<String, dynamic> json) {
    return Tableee5(
      paid: json['PAID'].toString(),
      subAgentId: json['SubAgentId'].toString(),
      productAccessId: json['ProductAccessId'].toString(),
      productAccessName: json['ProductAccessname'].toString(),
      b2BInterface: json['B2BInterface'].toString(),
      b2B2CWebsite: json['B2B2CWebsite'].toString(),
      otherDetails: json['OtherDetails'].toString(),
    );
  }

//</editor-fold>
}
