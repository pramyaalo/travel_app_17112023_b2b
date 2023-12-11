class CorporateTable1 {
  String corpFinId;
  String fdCorporateId;
  String fdCustomerType;
  String cbFDSetCreditLt;
  String fdCreditLimit;
  String fdCreditLimitAlert1;
  String fdCreditLimitAlert2;
  String fdCreditLimitAlert3;
  String fdCreditReminderEmail;
  String fdTicketGenerationLimit;
  String fdDayTicketLtValue;
  String fdTempCreditLt;
  String fdTempCreditLtStartDt;
  String fdTempCreditLtEndtDt;
  String fdDispatchProfeeType;
  String fdAgreementValidFrom;
  String fdAgreementValidTo;
  String fdApplyCCCharge;
  String fdApplyCCTransaction;
  String fdThresholdDomestic;
  String fdThresholdStringernational;
  String fdSettlementPeriod;
  String fdAgingPeriod;
  String fdFTTSeparately;
  String fdFTTMixer;
  String fdFTTTogether;
  String paApplyFinancialDoc;
  String settlementPeriod;

  CorporateTable1({
    required this.corpFinId,
    required this.fdCorporateId,
    required this.fdCustomerType,
    required this.cbFDSetCreditLt,
    required this.fdCreditLimit,
    required this.fdCreditLimitAlert1,
    required this.fdCreditLimitAlert2,
    required this.fdCreditLimitAlert3,
    required this.fdCreditReminderEmail,
    required this.fdTicketGenerationLimit,
    required this.fdDayTicketLtValue,
    required this.fdTempCreditLt,
    required this.fdTempCreditLtStartDt,
    required this.fdTempCreditLtEndtDt,
    required this.fdDispatchProfeeType,
    required this.fdAgreementValidFrom,
    required this.fdAgreementValidTo,
    required this.fdApplyCCCharge,
    required this.fdApplyCCTransaction,
    required this.fdThresholdDomestic,
    required this.fdThresholdStringernational,
    required this.fdSettlementPeriod,
    required this.fdAgingPeriod,
    required this.fdFTTSeparately,
    required this.fdFTTMixer,
    required this.fdFTTTogether,
    required this.paApplyFinancialDoc,
    required this.settlementPeriod,
  });

  factory CorporateTable1.fromJson(Map<String, dynamic> json) {
    return CorporateTable1(
      corpFinId: json['CorpFinID'].toString(),
      fdCorporateId: json['FDCorporateId'].toString(),
      fdCustomerType: json['FDCustomerType'].toString(),
      cbFDSetCreditLt: json['cbFDSetCreditLt'].toString(),
      fdCreditLimit: json['FDCreditLimit'].toString(),
      fdCreditLimitAlert1: json['FDCreditLimitAlert1'].toString(),
      fdCreditLimitAlert2: json['FDCreditLimitAlert2'].toString(),
      fdCreditLimitAlert3: json['FDCreditLimitAlert3'].toString(),
      fdCreditReminderEmail: json['FDCreditReminderEmail'].toString(),
      fdTicketGenerationLimit: json['FDTicketGenerationLimit'].toString(),
      fdDayTicketLtValue: json['FDDayTicketLtValue'].toString(),
      fdTempCreditLt: json['FDTempCreditLt'].toString(),
      fdTempCreditLtStartDt: json['FDTempCreditLtStartDt'].toString(),
      fdTempCreditLtEndtDt: json['FDTempCreditLtEndtDt'].toString(),
      fdDispatchProfeeType: json['FDDispatchProfeeType'].toString(),
      fdAgreementValidFrom: json['FDAgreementValidFrom'].toString(),
      fdAgreementValidTo: json['FDAgreementValidTo'].toString(),
      fdApplyCCCharge: json['FDApplyCCCharge'].toString(),
      fdApplyCCTransaction: json['FDApplyCCTransaction'].toString(),
      fdThresholdDomestic: json['FDThresholdDomestic'].toString(),
      fdThresholdStringernational:
          json['FDThresholdStringernational'].toString(),
      fdSettlementPeriod: json['FDSettlementPeriod'].toString(),
      fdAgingPeriod: json['FDAgingPeriod'].toString(),
      fdFTTSeparately: json['FD_FTT_Separately'].toString(),
      fdFTTMixer: json['FD_FTT_Mixer'].toString(),
      fdFTTTogether: json['FD_FTT_Together'].toString(),
      paApplyFinancialDoc: json['PA_ApplyFinancialDoc'].toString(),
      settlementPeriod: json['SettlementPeriod'].toString(),
    );
  }
}
