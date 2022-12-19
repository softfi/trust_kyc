// To parse this JSON data, do
//
//     final allBondList = allBondListFromJson(jsonString);

import 'dart:convert';

AllBondList allBondListFromJson(String str) => AllBondList.fromJson(json.decode(str));

String allBondListToJson(AllBondList data) => json.encode(data.toJson());

class AllBondList {
  AllBondList({
   required this.message,
  });

  Message message;

  factory AllBondList.fromJson(Map<String, dynamic> json) => AllBondList(
    message: Message.fromJson(json["message"]),
  );

  Map<String, dynamic> toJson() => {
    "message": message.toJson(),
  };
}

class Message {
  Message({
   required this.currentPage,
   required this.output,
   required this.pageLimit,
   required this.total,
  });

  int currentPage;
  List<Output> output;
  int pageLimit;
  int total;

  factory Message.fromJson(Map<String, dynamic> json) => Message(
    currentPage: json["current_page"],
    output: List<Output>.from(json["output"].map((x) => Output.fromJson(x))),
    pageLimit: json["page_limit"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "current_page": currentPage,
    "output": List<dynamic>.from(output.map((x) => x.toJson())),
    "page_limit": pageLimit,
    "total": total,
  };
}

class Output {
  Output({
    this.bondAboutThisIpo,
    this.bondAllotmentDate,
    this.bondAppNoSeries,
    this.bondArrangerName,
    this.bondAsbaAppNoSeries1,
    this.bondAsbaAppNoSeries2,
   required this.bondBondsName,
    this.bondBrokerageDetailsStatus,
    this.bondBrokerageStructure,
    this.bondCalcIntOnHolidays,
    this.bondCategoryHni,
    this.bondCategoryInstitutional,
    this.bondCategoryInstructions,
    this.bondCategoryNonInstitutional,
    this.bondCategoryRetail,
    this.bondCloserDate,
    this.bondClosingDate,
   required this.bondCouponAmount,
   required this.bondCouponDate,
    this.bondCouponOn,
    this.bondCouponRate,
  required  this.bondCreatedAt,
    this.bondDeposit,
    this.bondDisclaimer,
    this.bondDmatBookCloserDate,
    this.bondEFormIncentive,
    this.bondEarlyBidIncentive,
    this.bondEffortBasis,
    this.bondExchange,
  required  this.bondFaceValue,
    this.bondFinalIssueAmount,
    this.bondGreenShoe,
    this.bondGreenShoeSize,
    this.bondGst,
    this.bondGuarantedBy,
   required this.bondId,
    this.bondIntOnAppMoney,
    this.bondIntOnMaturity,
    this.bondIntOnRefundMoney,
    this.bondInterestDays,
   required this.bondInterestFrequency,
    this.bondInterestType,
    this.bondIpDate,
    this.bondIpoSellWindowsDays,
   required this.bondIsinNumber,
   required this.bondIssueDate,
   required this.bondIssuePrice,
    this.bondIssueSize,
    this.bondIssueStatus,
    required this.bondIssuerName,
    this.bondKeyHighlights,
    this.bondListing,
    this.bondListingCircle,
    this.bondLogo,
   required this.bondMaturityAmount,
   required this.bondMaturityDate,
    this.bondMinimumApplication,
  required  this.bondNatureOfInstrument,
    this.bondOpeningDate,
    this.bondOtherIncentive,
    this.bondOurStatus,
    this.bondPricePerBond,
    this.bondProcurementAmount,
    this.bondProductNote,
    this.bondRbiLoanCode,
    this.bondRegistrarName,
    this.bondScriptId,
    this.bondSecurityCode,
  required  this.bondSecurityType,
    this.bondSeriesInstructions,
    this.bondSt,
    this.bondSubCategoryCode,
    this.bondTermConditionLink,
    this.bondTrusteeName,
   required this.bondType,
   required this.bondUpdatedAt,
    this.bondUpiAppNoSeries1,
    this.bondUpiAppNoSeries2,
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

  factory Output.fromJson(Map<String, dynamic> json) => Output(
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
