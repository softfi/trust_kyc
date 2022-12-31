// To parse this JSON data, do
//
//     final bondDetails = bondDetailsFromJson(jsonString);

import 'dart:convert';

BondDetails bondDetailsFromJson(String str) => BondDetails.fromJson(json.decode(str));

String bondDetailsToJson(BondDetails data) => json.encode(data.toJson());

class BondDetails {
  BondDetails({
   required this.message,
  });

  Message message;

  factory BondDetails.fromJson(Map<String, dynamic> json) => BondDetails(
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
  };
}

class Message {
  Message({
   required this.bondCallDetails,
   required this.bondCashflowDetails,
   required this.bondDetails,
   required this.bondIssuerDetails,
   required this.bondNcdsDetails,
   required this.bondPutDetails,
   required this.bondRatingDetails,
  });

  List<dynamic> bondCallDetails;
  List<BondCashflowDetail> bondCashflowDetails;
  BondDetailsClass bondDetails;
  BondIssuerDetailsClass bondIssuerDetails;
  List<dynamic> bondNcdsDetails;
  List<dynamic> bondPutDetails;
  BondIssuerDetailsClass bondRatingDetails;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    bondCallDetails: List<dynamic>.from(json["bond_call_details"].map((x) => x)),
    bondCashflowDetails: List<BondCashflowDetail>.from(json["bond_cashflow_details"].map((x) => BondCashflowDetail.fromJson(x))),
    bondDetails: BondDetailsClass.fromJson(json["bond_details"]),
    bondIssuerDetails: BondIssuerDetailsClass.fromJson(json["bond_issuer_details"]),
    bondNcdsDetails: List<dynamic>.from(json["bond_ncds_details"].map((x) => x)),
    bondPutDetails: List<dynamic>.from(json["bond_put_details"].map((x) => x)),
    bondRatingDetails: BondIssuerDetailsClass.fromJson(json["bond_rating_details"]),
  );

  Map<String, dynamic> toJson() => {
    "bond_call_details": List<dynamic>.from(bondCallDetails.map((x) => x)),
    "bond_cashflow_details": List<dynamic>.from(bondCashflowDetails.map((x) => x.toJson())),
    "bond_details": bondDetails.toJson(),
    "bond_issuer_details": bondIssuerDetails.toJson(),
    "bond_ncds_details": List<dynamic>.from(bondNcdsDetails.map((x) => x)),
    "bond_put_details": List<dynamic>.from(bondPutDetails.map((x) => x)),
    "bond_rating_details": bondRatingDetails.toJson(),
  };
}

class BondCashflowDetail {
  BondCashflowDetail({
   required this.bondCashflowAmount,
   required this.bondCashflowCreatedAt,
   required this.bondCashflowDate,
   required this.bondCashflowDays,
   required this.bondCashflowId,
   required this.bondCashflowType,
   required this.bondCashflowUpdatedAt,
  });

  String bondCashflowAmount;
  DateTime bondCashflowCreatedAt;
  DateTime bondCashflowDate;
  String bondCashflowDays;
  int bondCashflowId;
  BondCashflowType bondCashflowType;
  DateTime bondCashflowUpdatedAt;

  factory BondCashflowDetail.fromJson(Map<String, dynamic> json) => BondCashflowDetail(
    bondCashflowAmount: json["bond_cashflow_amount"],
    bondCashflowCreatedAt: DateTime.parse(json["bond_cashflow_created_at"]),
    bondCashflowDate: DateTime.parse(json["bond_cashflow_date"]),
    bondCashflowDays: json["bond_cashflow_days"] == null ? null : json["bond_cashflow_days"],
    bondCashflowId: json["bond_cashflow_id"],
    bondCashflowType: bondCashflowTypeValues.map[json["bond_cashflow_type"]]!,
    bondCashflowUpdatedAt: DateTime.parse(json["bond_cashflow_updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "bond_cashflow_amount": bondCashflowAmount,
    "bond_cashflow_created_at": bondCashflowCreatedAt.toIso8601String(),
    "bond_cashflow_date": "${bondCashflowDate.year.toString().padLeft(4, '0')}-${bondCashflowDate.month.toString().padLeft(2, '0')}-${bondCashflowDate.day.toString().padLeft(2, '0')}",
    "bond_cashflow_days": bondCashflowDays == null ? null : bondCashflowDays,
    "bond_cashflow_id": bondCashflowId,
    "bond_cashflow_type": bondCashflowTypeValues.reverse![bondCashflowType],
    "bond_cashflow_updated_at": bondCashflowUpdatedAt.toIso8601String(),
  };
}

enum BondCashflowType { INTEREST, CALL }

final bondCashflowTypeValues = EnumValues({
  "Call": BondCashflowType.CALL,
  "Interest": BondCashflowType.INTEREST
});

class BondDetailsClass {
  BondDetailsClass({
   required this.bondAboutThisIpo,
   required this.bondAllotmentDate,
   required this.bondAppNoSeries,
   required this.bondArrangerName,
   required this.bondAsbaAppNoSeries1,
   required this.bondAsbaAppNoSeries2,
   required this.bondBondsName,
   required this.bondBrokerageDetailsStatus,
   required this.bondBrokerageStructure,
   required this.bondCalcIntOnHolidays,
   required this.bondCategoryHni,
   required this.bondCategoryInstitutional,
   required this.bondCategoryInstructions,
   required this.bondCategoryNonInstitutional,
   required this.bondCategoryRetail,
   required this.bondCloserDate,
   required this.bondClosingDate,
   required this.bondCouponAmount,
   required this.bondCouponDate,
   required this.bondCouponOn,
   required this.bondCouponRate,
   required this.bondCreatedAt,
   required this.bondDeposit,
   required this.bondDisclaimer,
   required this.bondDmatBookCloserDate,
   required this.bondEFormIncentive,
   required this.bondEarlyBidIncentive,
   required this.bondEffortBasis,
   required this.bondExchange,
   required this.bondFaceValue,
   required this.bondFinalIssueAmount,
   required this.bondGreenShoe,
   required this.bondGreenShoeSize,
   required this.bondGst,
   required this.bondGuarantedBy,
   required this.bondId,
   required this.bondIntOnAppMoney,
   required this.bondIntOnMaturity,
   required this.bondIntOnRefundMoney,
   required this.bondInterestDays,
   required this.bondInterestFrequency,
   required this.bondInterestType,
   required this.bondIpDate,
   required this.bondIpoSellWindowsDays,
   required this.bondIsinNumber,
   required this.bondIssueDate,
   required this.bondIssuePrice,
   required this.bondIssueSize,
   required this.bondIssueStatus,
   required this.bondIssuerName,
   required this.bondKeyHighlights,
   required this.bondListing,
   required this.bondListingCircle,
   required this.bondLogo,
   required this.bondMaturityAmount,
   required this.bondMaturityDate,
   required this.bondMinimumApplication,
   required this.bondNatureOfInstrument,
   required this.bondOpeningDate,
   required this.bondOtherIncentive,
   required this.bondOurStatus,
   required this.bondPricePerBond,
   required this.bondProcurementAmount,
   required this.bondProductNote,
   required this.bondRbiLoanCode,
   required this.bondRegistrarName,
   required this.bondScriptId,
   required this.bondSecurityCode,
   required this.bondSecurityType,
   required this.bondSeriesInstructions,
   required this.bondSt,
   required this.bondSubCategoryCode,
   required this.bondTermConditionLink,
   required this.bondTrusteeName,
   required this.bondType,
   required this.bondUpdatedAt,
   required this.bondUpiAppNoSeries1,
   required this.bondUpiAppNoSeries2,
  });

  dynamic bondAboutThisIpo;
  dynamic bondAllotmentDate;
  dynamic bondAppNoSeries;
  dynamic bondArrangerName;
  dynamic bondAsbaAppNoSeries1;
  dynamic bondAsbaAppNoSeries2;
  String bondBondsName;
  dynamic bondBrokerageDetailsStatus;
  dynamic bondBrokerageStructure;
  dynamic bondCalcIntOnHolidays;
  dynamic bondCategoryHni;
  dynamic bondCategoryInstitutional;
  dynamic bondCategoryInstructions;
  dynamic bondCategoryNonInstitutional;
  dynamic bondCategoryRetail;
  dynamic bondCloserDate;
  dynamic bondClosingDate;
  String bondCouponAmount;
  DateTime bondCouponDate;
  dynamic bondCouponOn;
  dynamic bondCouponRate;
  DateTime bondCreatedAt;
  dynamic bondDeposit;
  dynamic bondDisclaimer;
  dynamic bondDmatBookCloserDate;
  dynamic bondEFormIncentive;
  dynamic bondEarlyBidIncentive;
  dynamic bondEffortBasis;
  dynamic bondExchange;
  String bondFaceValue;
  dynamic bondFinalIssueAmount;
  dynamic bondGreenShoe;
  dynamic bondGreenShoeSize;
  dynamic bondGst;
  dynamic bondGuarantedBy;
  int bondId;
  dynamic bondIntOnAppMoney;
  dynamic bondIntOnMaturity;
  dynamic bondIntOnRefundMoney;
  dynamic bondInterestDays;
  String bondInterestFrequency;
  dynamic bondInterestType;
  dynamic bondIpDate;
  dynamic bondIpoSellWindowsDays;
  String bondIsinNumber;
  DateTime bondIssueDate;
  String bondIssuePrice;
  dynamic bondIssueSize;
  dynamic bondIssueStatus;
  String bondIssuerName;
  dynamic bondKeyHighlights;
  dynamic bondListing;
  dynamic bondListingCircle;
  dynamic bondLogo;
  String bondMaturityAmount;
  DateTime bondMaturityDate;
  dynamic bondMinimumApplication;
  String bondNatureOfInstrument;
  dynamic bondOpeningDate;
  dynamic bondOtherIncentive;
  dynamic bondOurStatus;
  dynamic bondPricePerBond;
  dynamic bondProcurementAmount;
  dynamic bondProductNote;
  dynamic bondRbiLoanCode;
  dynamic bondRegistrarName;
  dynamic bondScriptId;
  dynamic bondSecurityCode;
  String bondSecurityType;
  dynamic bondSeriesInstructions;
  dynamic bondSt;
  dynamic bondSubCategoryCode;
  dynamic bondTermConditionLink;
  dynamic bondTrusteeName;
  int bondType;
  DateTime bondUpdatedAt;
  dynamic bondUpiAppNoSeries1;
  dynamic bondUpiAppNoSeries2;

  factory BondDetailsClass.fromJson(Map<String, dynamic> json) => BondDetailsClass(
    bondAboutThisIpo: json["bond_about_this_ipo"],
    bondAllotmentDate: json["bond_allotment_date"],
    bondAppNoSeries: json["bond_app_no_series"],
    bondArrangerName: json["bond_arranger_name"],
    bondAsbaAppNoSeries1: json["bond_asba_app_no_series_1"],
    bondAsbaAppNoSeries2: json["bond_asba_app_no_series_2"],
    bondBondsName: json["bond_bonds_name"],
    bondBrokerageDetailsStatus: json["bond_brokerage_details_status"],
    bondBrokerageStructure: json["bond_brokerage_structure"],
    bondCalcIntOnHolidays: json["bond_calc_int_on_holidays"],
    bondCategoryHni: json["bond_category_hni"],
    bondCategoryInstitutional: json["bond_category_institutional"],
    bondCategoryInstructions: json["bond_category_instructions"],
    bondCategoryNonInstitutional: json["bond_category_non_institutional"],
    bondCategoryRetail: json["bond_category_retail"],
    bondCloserDate: json["bond_closer_date"],
    bondClosingDate: json["bond_closing_date"],
    bondCouponAmount: json["bond_coupon_amount"],
    bondCouponDate: DateTime.parse(json["bond_coupon_date"]),
    bondCouponOn: json["bond_coupon_on"],
    bondCouponRate: json["bond_coupon_rate"],
    bondCreatedAt: DateTime.parse(json["bond_created_at"]),
    bondDeposit: json["bond_deposit"],
    bondDisclaimer: json["bond_disclaimer"],
    bondDmatBookCloserDate: json["bond_dmat_book_closer_date"],
    bondEFormIncentive: json["bond_e_form_incentive"],
    bondEarlyBidIncentive: json["bond_early_bid_incentive"],
    bondEffortBasis: json["bond_effort_basis"],
    bondExchange: json["bond_exchange"],
    bondFaceValue: json["bond_face_value"],
    bondFinalIssueAmount: json["bond_final_issue_amount"],
    bondGreenShoe: json["bond_green_shoe"],
    bondGreenShoeSize: json["bond_green_shoe_size"],
    bondGst: json["bond_gst"],
    bondGuarantedBy: json["bond_guaranted_by"],
    bondId: json["bond_id"],
    bondIntOnAppMoney: json["bond_int_on_app_money"],
    bondIntOnMaturity: json["bond_int_on_maturity"],
    bondIntOnRefundMoney: json["bond_int_on_refund_money"],
    bondInterestDays: json["bond_interest_days"],
    bondInterestFrequency: json["bond_interest_frequency"],
    bondInterestType: json["bond_interest_type"],
    bondIpDate: json["bond_ip_date"],
    bondIpoSellWindowsDays: json["bond_ipo_sell_windows_days"],
    bondIsinNumber: json["bond_isin_number"],
    bondIssueDate: DateTime.parse(json["bond_issue_date"]),
    bondIssuePrice: json["bond_issue_price"],
    bondIssueSize: json["bond_issue_size"],
    bondIssueStatus: json["bond_issue_status"],
    bondIssuerName: json["bond_issuer_name"],
    bondKeyHighlights: json["bond_key_highlights"],
    bondListing: json["bond_listing"],
    bondListingCircle: json["bond_listing_circle"],
    bondLogo: json["bond_logo"],
    bondMaturityAmount: json["bond_maturity_amount"],
    bondMaturityDate: DateTime.parse(json["bond_maturity_date"]),
    bondMinimumApplication: json["bond_minimum_application"],
    bondNatureOfInstrument: json["bond_nature_of_instrument"],
    bondOpeningDate: json["bond_opening_date"],
    bondOtherIncentive: json["bond_other_incentive"],
    bondOurStatus: json["bond_our_status"],
    bondPricePerBond: json["bond_price_per_bond"],
    bondProcurementAmount: json["bond_procurement_amount"],
    bondProductNote: json["bond_product_note"],
    bondRbiLoanCode: json["bond_rbi_loan_code"],
    bondRegistrarName: json["bond_registrar_name"],
    bondScriptId: json["bond_script_id"],
    bondSecurityCode: json["bond_security_code"],
    bondSecurityType: json["bond_security_type"],
    bondSeriesInstructions: json["bond_series_instructions"],
    bondSt: json["bond_st"],
    bondSubCategoryCode: json["bond_sub_category_code"],
    bondTermConditionLink: json["bond_term_condition_link"],
    bondTrusteeName: json["bond_trustee_name"],
    bondType: json["bond_type"],
    bondUpdatedAt: DateTime.parse(json["bond_updated_at"]),
    bondUpiAppNoSeries1: json["bond_upi_app_no_series_1"],
    bondUpiAppNoSeries2: json["bond_upi_app_no_series_2"],
  );

  Map<String, dynamic> toJson() => {
    "bond_about_this_ipo": bondAboutThisIpo,
    "bond_allotment_date": bondAllotmentDate,
    "bond_app_no_series": bondAppNoSeries,
    "bond_arranger_name": bondArrangerName,
    "bond_asba_app_no_series_1": bondAsbaAppNoSeries1,
    "bond_asba_app_no_series_2": bondAsbaAppNoSeries2,
    "bond_bonds_name": bondBondsName,
    "bond_brokerage_details_status": bondBrokerageDetailsStatus,
    "bond_brokerage_structure": bondBrokerageStructure,
    "bond_calc_int_on_holidays": bondCalcIntOnHolidays,
    "bond_category_hni": bondCategoryHni,
    "bond_category_institutional": bondCategoryInstitutional,
    "bond_category_instructions": bondCategoryInstructions,
    "bond_category_non_institutional": bondCategoryNonInstitutional,
    "bond_category_retail": bondCategoryRetail,
    "bond_closer_date": bondCloserDate,
    "bond_closing_date": bondClosingDate,
    "bond_coupon_amount": bondCouponAmount,
    "bond_coupon_date": "${bondCouponDate.year.toString().padLeft(4, '0')}-${bondCouponDate.month.toString().padLeft(2, '0')}-${bondCouponDate.day.toString().padLeft(2, '0')}",
    "bond_coupon_on": bondCouponOn,
    "bond_coupon_rate": bondCouponRate,
    "bond_created_at": bondCreatedAt.toIso8601String(),
    "bond_deposit": bondDeposit,
    "bond_disclaimer": bondDisclaimer,
    "bond_dmat_book_closer_date": bondDmatBookCloserDate,
    "bond_e_form_incentive": bondEFormIncentive,
    "bond_early_bid_incentive": bondEarlyBidIncentive,
    "bond_effort_basis": bondEffortBasis,
    "bond_exchange": bondExchange,
    "bond_face_value": bondFaceValue,
    "bond_final_issue_amount": bondFinalIssueAmount,
    "bond_green_shoe": bondGreenShoe,
    "bond_green_shoe_size": bondGreenShoeSize,
    "bond_gst": bondGst,
    "bond_guaranted_by": bondGuarantedBy,
    "bond_id": bondId,
    "bond_int_on_app_money": bondIntOnAppMoney,
    "bond_int_on_maturity": bondIntOnMaturity,
    "bond_int_on_refund_money": bondIntOnRefundMoney,
    "bond_interest_days": bondInterestDays,
    "bond_interest_frequency": bondInterestFrequency,
    "bond_interest_type": bondInterestType,
    "bond_ip_date": bondIpDate,
    "bond_ipo_sell_windows_days": bondIpoSellWindowsDays,
    "bond_isin_number": bondIsinNumber,
    "bond_issue_date": "${bondIssueDate.year.toString().padLeft(4, '0')}-${bondIssueDate.month.toString().padLeft(2, '0')}-${bondIssueDate.day.toString().padLeft(2, '0')}",
    "bond_issue_price": bondIssuePrice,
    "bond_issue_size": bondIssueSize,
    "bond_issue_status": bondIssueStatus,
    "bond_issuer_name": bondIssuerName,
    "bond_key_highlights": bondKeyHighlights,
    "bond_listing": bondListing,
    "bond_listing_circle": bondListingCircle,
    "bond_logo": bondLogo,
    "bond_maturity_amount": bondMaturityAmount,
    "bond_maturity_date": "${bondMaturityDate.year.toString().padLeft(4, '0')}-${bondMaturityDate.month.toString().padLeft(2, '0')}-${bondMaturityDate.day.toString().padLeft(2, '0')}",
    "bond_minimum_application": bondMinimumApplication,
    "bond_nature_of_instrument": bondNatureOfInstrument,
    "bond_opening_date": bondOpeningDate,
    "bond_other_incentive": bondOtherIncentive,
    "bond_our_status": bondOurStatus,
    "bond_price_per_bond": bondPricePerBond,
    "bond_procurement_amount": bondProcurementAmount,
    "bond_product_note": bondProductNote,
    "bond_rbi_loan_code": bondRbiLoanCode,
    "bond_registrar_name": bondRegistrarName,
    "bond_script_id": bondScriptId,
    "bond_security_code": bondSecurityCode,
    "bond_security_type": bondSecurityType,
    "bond_series_instructions": bondSeriesInstructions,
    "bond_st": bondSt,
    "bond_sub_category_code": bondSubCategoryCode,
    "bond_term_condition_link": bondTermConditionLink,
    "bond_trustee_name": bondTrusteeName,
    "bond_type": bondType,
    "bond_updated_at": bondUpdatedAt.toIso8601String(),
    "bond_upi_app_no_series_1": bondUpiAppNoSeries1,
    "bond_upi_app_no_series_2": bondUpiAppNoSeries2,
  };
}

class BondIssuerDetailsClass {
  BondIssuerDetailsClass();

  factory BondIssuerDetailsClass.fromJson(Map<String, dynamic> json) => BondIssuerDetailsClass(
  );

  Map<String, dynamic> toJson() => {
  };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
