// To parse this JSON data, do
//
//     final allBondListOfIpoByBondId = allBondListOfIpoByBondIdFromJson(jsonString);

import 'dart:convert';

AllBondListOfIpoByBondId allBondListOfIpoByBondIdFromJson(String str) => AllBondListOfIpoByBondId.fromJson(json.decode(str));

String allBondListOfIpoByBondIdToJson(AllBondListOfIpoByBondId data) => json.encode(data.toJson());

class AllBondListOfIpoByBondId {
  AllBondListOfIpoByBondId({
   required this.bondAboutThisIpo,
   required this.bondAllotmentDate,
   required this.bondAppNoSeries,
   required this.bondArrangerName,
   required this.bondAsbaAppNoSeries1,
   required this.bondAsbaAppNoSeries2,
   required this.bondAsbaDetails,
   required this.bondBrandTags,
   required this.bondBrokerageDetails,
   required this.bondBrokerageDetailsStatus,
   required this.bondBrokerageStructure,
   required this.bondCalcIntOnHolidays,
   required this.bondCallDetails,
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
   required this.bondDepository,
   required this.bondDisclaimer,
   required this.bondDmatBookCloserDate,
   required this.bondEFormIncentive,
   required this.bondEarlyBirdIncentive,
   required this.bondEffortBasis,
   required this.bondEligibleInvestors,
   required this.bondExchange,
   required this.bondFaceValue,
   required this.bondFinalIssueAmount,
   required this.bondGovtGuranatee,
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
   required this.bondIssueDocument,
   required this.bondIssuePrice,
   required this.bondIssueSize,
   required this.bondIssueStatus,
   required this.bondIssuerDetails,
   required this.bondIssuerName,
   required this.bondKeyHighlights,
   required this.bondListing,
   required this.bondListingCircle,
   required this.bondLogo,
   required this.bondMaturityAmount,
   required this.bondMaturityDate,
   required this.bondMinimumApplication,
   required this.bondName,
   required this.bondNatureOfInstrument,
   required this.bondNcdAvailable,
   required this.bondNcdSeries,
   required this.bondNcdStatus,
   required this.bondOpeningDate,
   required this.bondOtherIncentive,
   required this.bondOurStatus,
   required this.bondPricePerBond,
   required this.bondProcurementAmount,
   required this.bondProductNote,
   required this.bondPurchaseLimit,
   required this.bondPurchaseLimitMetric,
   required this.bondPutDetails,
   required this.bondRatingDetails,
   required this.bondRbiLoanCode,
   required this.bondRegistrar,
   required this.bondScriptId,
   required this.bondSecurityCode,
   required this.bondSecurityType,
   required this.bondSecurityTypeCode,
   required this.bondSeriesInstructions,
   required this.bondSt,
   required this.bondSubCategoryCode,
   required this.bondTermConditionLink,
   required this.bondTrustee,
   required this.bondType,
   required this.bondUpdatedAt,
   required this.bondUpiAppNoSeries1,
   required this.bondUpiAppNoSeries2,
   required this.bondsBannerContentImage,
   required this.bondsBannerContentSubTitle,
   required this.bondsBannerContentTitle,
   required this.bondsBannerRcbNoticeLink,
   required this.bondsNextInterestPaymentDate,
   required this.bondsPricePerGram,
   required this.bondsYeild,
   required this.exitOptionAvailable,
  });

  String bondAboutThisIpo;
  DateTime bondAllotmentDate;
  String bondAppNoSeries;
  dynamic bondArrangerName;
  String bondAsbaAppNoSeries1;
  String bondAsbaAppNoSeries2;
  String bondAsbaDetails;
  List<dynamic> bondBrandTags;
  List<BondBrokerageDetail> bondBrokerageDetails;
  int bondBrokerageDetailsStatus;
  String bondBrokerageStructure;
  int bondCalcIntOnHolidays;
  List<BondCallDetail> bondCallDetails;
  dynamic bondCategoryHni;
  dynamic bondCategoryInstitutional;
  String bondCategoryInstructions;
  dynamic bondCategoryNonInstitutional;
  dynamic bondCategoryRetail;
  DateTime bondCloserDate;
  DateTime bondClosingDate;
  dynamic bondCouponAmount;
  DateTime bondCouponDate;
  String bondCouponOn;
  String bondCouponRate;
  DateTime bondCreatedAt;
  dynamic bondDepository;
  String bondDisclaimer;
  DateTime bondDmatBookCloserDate;
  dynamic bondEFormIncentive;
  dynamic bondEarlyBirdIncentive;
  int bondEffortBasis;
  List<dynamic> bondEligibleInvestors;
  String bondExchange;
  dynamic bondFaceValue;
  String bondFinalIssueAmount;
  dynamic bondGovtGuranatee;
  int bondGreenShoe;
  String bondGreenShoeSize;
  int bondGst;
  String bondGuarantedBy;
  int bondId;
  dynamic bondIntOnAppMoney;
  int bondIntOnMaturity;
  dynamic bondIntOnRefundMoney;
  String bondInterestDays;
  String bondInterestFrequency;
  String bondInterestType;
  DateTime bondIpDate;
  int bondIpoSellWindowsDays;
  String bondIsinNumber;
  DateTime bondIssueDate;
  dynamic bondIssueDocument;
  dynamic bondIssuePrice;
  String bondIssueSize;
  int bondIssueStatus;
  List<BondIssuerDetail> bondIssuerDetails;
  String bondIssuerName;
  String bondKeyHighlights;
  int bondListing;
  String bondListingCircle;
  String bondLogo;
  dynamic bondMaturityAmount;
  DateTime bondMaturityDate;
  String bondMinimumApplication;
  dynamic bondName;
  int bondNatureOfInstrument;
  List<BondNcdAvailable> bondNcdAvailable;
  List<BondNcdSery> bondNcdSeries;
  int bondNcdStatus;
  DateTime bondOpeningDate;
  dynamic bondOtherIncentive;
  int bondOurStatus;
  dynamic bondPricePerBond;
  dynamic bondProcurementAmount;
  String bondProductNote;
  dynamic bondPurchaseLimit;
  dynamic bondPurchaseLimitMetric;
  List<BondPutDetail> bondPutDetails;
  List<BondRatingDetail> bondRatingDetails;
  String bondRbiLoanCode;
  dynamic bondRegistrar;
  String bondScriptId;
  String bondSecurityCode;
  int bondSecurityType;
  dynamic bondSecurityTypeCode;
  String bondSeriesInstructions;
  String bondSt;
  String bondSubCategoryCode;
  String bondTermConditionLink;
  dynamic bondTrustee;
  int bondType;
  DateTime bondUpdatedAt;
  String bondUpiAppNoSeries1;
  String bondUpiAppNoSeries2;
  dynamic bondsBannerContentImage;
  dynamic bondsBannerContentSubTitle;
  dynamic bondsBannerContentTitle;
  dynamic bondsBannerRcbNoticeLink;
  dynamic bondsNextInterestPaymentDate;
  dynamic bondsPricePerGram;
  dynamic bondsYeild;
  dynamic exitOptionAvailable;

  factory AllBondListOfIpoByBondId.fromJson(Map<String, dynamic> json) => AllBondListOfIpoByBondId(
    bondAboutThisIpo: json["bond_about_this_ipo"],
    bondAllotmentDate: DateTime.parse(json["bond_allotment_date"]),
    bondAppNoSeries: json["bond_app_no_series"],
    bondArrangerName: json["bond_arranger_name"],
    bondAsbaAppNoSeries1: json["bond_asba_app_no_series_1"],
    bondAsbaAppNoSeries2: json["bond_asba_app_no_series_2"],
    bondAsbaDetails: json["bond_asba_details"],
    bondBrandTags: List<dynamic>.from(json["bond_brand_tags"].map((x) => x)),
    bondBrokerageDetails: List<BondBrokerageDetail>.from(json["bond_brokerage_details"].map((x) => BondBrokerageDetail.fromJson(x))),
    bondBrokerageDetailsStatus: json["bond_brokerage_details_status"],
    bondBrokerageStructure: json["bond_brokerage_structure"],
    bondCalcIntOnHolidays: json["bond_calc_int_on_holidays"],
    bondCallDetails: List<BondCallDetail>.from(json["bond_call_details"].map((x) => BondCallDetail.fromJson(x))),
    bondCategoryHni: json["bond_category_hni"],
    bondCategoryInstitutional: json["bond_category_institutional"],
    bondCategoryInstructions: json["bond_category_instructions"],
    bondCategoryNonInstitutional: json["bond_category_non_institutional"],
    bondCategoryRetail: json["bond_category_retail"],
    bondCloserDate: DateTime.parse(json["bond_closer_date"]),
    bondClosingDate: DateTime.parse(json["bond_closing_date"]),
    bondCouponAmount: json["bond_coupon_amount"],
    bondCouponDate: DateTime.parse(json["bond_coupon_date"]),
    bondCouponOn: json["bond_coupon_on"],
    bondCouponRate: json["bond_coupon_rate"],
    bondCreatedAt: DateTime.parse(json["bond_created_at"]),
    bondDepository: json["bond_depository"],
    bondDisclaimer: json["bond_disclaimer"],
    bondDmatBookCloserDate: DateTime.parse(json["bond_dmat_book_closer_date"]),
    bondEFormIncentive: json["bond_e_form_incentive"],
    bondEarlyBirdIncentive: json["bond_early_bird_incentive"],
    bondEffortBasis: json["bond_effort_basis"],
    bondEligibleInvestors: List<dynamic>.from(json["bond_eligible_investors"].map((x) => x)),
    bondExchange: json["bond_exchange"],
    bondFaceValue: json["bond_face_value"],
    bondFinalIssueAmount: json["bond_final_issue_amount"],
    bondGovtGuranatee: json["bond_govt_guranatee"],
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
    bondIpDate: DateTime.parse(json["bond_ip_date"]),
    bondIpoSellWindowsDays: json["bond_ipo_sell_windows_days"],
    bondIsinNumber: json["bond_isin_number"],
    bondIssueDate: DateTime.parse(json["bond_issue_date"]),
    bondIssueDocument: json["bond_issue_document"],
    bondIssuePrice: json["bond_issue_price"],
    bondIssueSize: json["bond_issue_size"],
    bondIssueStatus: json["bond_issue_status"],
    bondIssuerDetails: List<BondIssuerDetail>.from(json["bond_issuer_details"].map((x) => BondIssuerDetail.fromJson(x))),
    bondIssuerName: json["bond_issuer_name"],
    bondKeyHighlights: json["bond_key_highlights"],
    bondListing: json["bond_listing"],
    bondListingCircle: json["bond_listing_circle"],
    bondLogo: json["bond_logo"],
    bondMaturityAmount: json["bond_maturity_amount"],
    bondMaturityDate: DateTime.parse(json["bond_maturity_date"]),
    bondMinimumApplication: json["bond_minimum_application"],
    bondName: json["bond_name"],
    bondNatureOfInstrument: json["bond_nature_of_instrument"],
    bondNcdAvailable: List<BondNcdAvailable>.from(json["bond_ncd_available"].map((x) => BondNcdAvailable.fromJson(x))),
    bondNcdSeries: List<BondNcdSery>.from(json["bond_ncd_series"].map((x) => BondNcdSery.fromJson(x))),
    bondNcdStatus: json["bond_ncd_status"],
    bondOpeningDate: DateTime.parse(json["bond_opening_date"]),
    bondOtherIncentive: json["bond_other_incentive"],
    bondOurStatus: json["bond_our_status"],
    bondPricePerBond: json["bond_price_per_bond"],
    bondProcurementAmount: json["bond_procurement_amount"],
    bondProductNote: json["bond_product_note"],
    bondPurchaseLimit: json["bond_purchase_limit"],
    bondPurchaseLimitMetric: json["bond_purchase_limit_metric"],
    bondPutDetails: List<BondPutDetail>.from(json["bond_put_details"].map((x) => BondPutDetail.fromJson(x))),
    bondRatingDetails: List<BondRatingDetail>.from(json["bond_rating_details"].map((x) => BondRatingDetail.fromJson(x))),
    bondRbiLoanCode: json["bond_rbi_loan_code"],
    bondRegistrar: json["bond_registrar"],
    bondScriptId: json["bond_script_id"],
    bondSecurityCode: json["bond_security_code"],
    bondSecurityType: json["bond_security_type"],
    bondSecurityTypeCode: json["bond_security_type_code"],
    bondSeriesInstructions: json["bond_series_instructions"],
    bondSt: json["bond_st"],
    bondSubCategoryCode: json["bond_sub_category_code"],
    bondTermConditionLink: json["bond_term_condition_link"],
    bondTrustee: json["bond_trustee"],
    bondType: json["bond_type"],
    bondUpdatedAt: DateTime.parse(json["bond_updated_at"]),
    bondUpiAppNoSeries1: json["bond_upi_app_no_series_1"],
    bondUpiAppNoSeries2: json["bond_upi_app_no_series_2"],
    bondsBannerContentImage: json["bonds_banner_content_image"],
    bondsBannerContentSubTitle: json["bonds_banner_content_sub_title"],
    bondsBannerContentTitle: json["bonds_banner_content_title"],
    bondsBannerRcbNoticeLink: json["bonds_banner_rcb_notice_link"],
    bondsNextInterestPaymentDate: json["bonds_next_interest_payment_date"],
    bondsPricePerGram: json["bonds_price_per_gram"],
    bondsYeild: json["bonds_yeild"],
    exitOptionAvailable: json["exit_option_available"],
  );

  Map<String, dynamic> toJson() => {
    "bond_about_this_ipo": bondAboutThisIpo,
    "bond_allotment_date": "${bondAllotmentDate.year.toString().padLeft(4, '0')}-${bondAllotmentDate.month.toString().padLeft(2, '0')}-${bondAllotmentDate.day.toString().padLeft(2, '0')}",
    "bond_app_no_series": bondAppNoSeries,
    "bond_arranger_name": bondArrangerName,
    "bond_asba_app_no_series_1": bondAsbaAppNoSeries1,
    "bond_asba_app_no_series_2": bondAsbaAppNoSeries2,
    "bond_asba_details": bondAsbaDetails,
    "bond_brand_tags": List<dynamic>.from(bondBrandTags.map((x) => x)),
    "bond_brokerage_details": List<dynamic>.from(bondBrokerageDetails.map((x) => x.toJson())),
    "bond_brokerage_details_status": bondBrokerageDetailsStatus,
    "bond_brokerage_structure": bondBrokerageStructure,
    "bond_calc_int_on_holidays": bondCalcIntOnHolidays,
    "bond_call_details": List<dynamic>.from(bondCallDetails.map((x) => x.toJson())),
    "bond_category_hni": bondCategoryHni,
    "bond_category_institutional": bondCategoryInstitutional,
    "bond_category_instructions": bondCategoryInstructions,
    "bond_category_non_institutional": bondCategoryNonInstitutional,
    "bond_category_retail": bondCategoryRetail,
    "bond_closer_date": "${bondCloserDate.year.toString().padLeft(4, '0')}-${bondCloserDate.month.toString().padLeft(2, '0')}-${bondCloserDate.day.toString().padLeft(2, '0')}",
    "bond_closing_date": "${bondClosingDate.year.toString().padLeft(4, '0')}-${bondClosingDate.month.toString().padLeft(2, '0')}-${bondClosingDate.day.toString().padLeft(2, '0')}",
    "bond_coupon_amount": bondCouponAmount,
    "bond_coupon_date": "${bondCouponDate.year.toString().padLeft(4, '0')}-${bondCouponDate.month.toString().padLeft(2, '0')}-${bondCouponDate.day.toString().padLeft(2, '0')}",
    "bond_coupon_on": bondCouponOn,
    "bond_coupon_rate": bondCouponRate,
    "bond_created_at": bondCreatedAt.toIso8601String(),
    "bond_depository": bondDepository,
    "bond_disclaimer": bondDisclaimer,
    "bond_dmat_book_closer_date": "${bondDmatBookCloserDate.year.toString().padLeft(4, '0')}-${bondDmatBookCloserDate.month.toString().padLeft(2, '0')}-${bondDmatBookCloserDate.day.toString().padLeft(2, '0')}",
    "bond_e_form_incentive": bondEFormIncentive,
    "bond_early_bird_incentive": bondEarlyBirdIncentive,
    "bond_effort_basis": bondEffortBasis,
    "bond_eligible_investors": List<dynamic>.from(bondEligibleInvestors.map((x) => x)),
    "bond_exchange": bondExchange,
    "bond_face_value": bondFaceValue,
    "bond_final_issue_amount": bondFinalIssueAmount,
    "bond_govt_guranatee": bondGovtGuranatee,
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
    "bond_ip_date": "${bondIpDate.year.toString().padLeft(4, '0')}-${bondIpDate.month.toString().padLeft(2, '0')}-${bondIpDate.day.toString().padLeft(2, '0')}",
    "bond_ipo_sell_windows_days": bondIpoSellWindowsDays,
    "bond_isin_number": bondIsinNumber,
    "bond_issue_date": "${bondIssueDate.year.toString().padLeft(4, '0')}-${bondIssueDate.month.toString().padLeft(2, '0')}-${bondIssueDate.day.toString().padLeft(2, '0')}",
    "bond_issue_document": bondIssueDocument,
    "bond_issue_price": bondIssuePrice,
    "bond_issue_size": bondIssueSize,
    "bond_issue_status": bondIssueStatus,
    "bond_issuer_details": List<dynamic>.from(bondIssuerDetails.map((x) => x.toJson())),
    "bond_issuer_name": bondIssuerName,
    "bond_key_highlights": bondKeyHighlights,
    "bond_listing": bondListing,
    "bond_listing_circle": bondListingCircle,
    "bond_logo": bondLogo,
    "bond_maturity_amount": bondMaturityAmount,
    "bond_maturity_date": "${bondMaturityDate.year.toString().padLeft(4, '0')}-${bondMaturityDate.month.toString().padLeft(2, '0')}-${bondMaturityDate.day.toString().padLeft(2, '0')}",
    "bond_minimum_application": bondMinimumApplication,
    "bond_name": bondName,
    "bond_nature_of_instrument": bondNatureOfInstrument,
    "bond_ncd_available": List<dynamic>.from(bondNcdAvailable.map((x) => x.toJson())),
    "bond_ncd_series": List<dynamic>.from(bondNcdSeries.map((x) => x.toJson())),
    "bond_ncd_status": bondNcdStatus,
    "bond_opening_date": "${bondOpeningDate.year.toString().padLeft(4, '0')}-${bondOpeningDate.month.toString().padLeft(2, '0')}-${bondOpeningDate.day.toString().padLeft(2, '0')}",
    "bond_other_incentive": bondOtherIncentive,
    "bond_our_status": bondOurStatus,
    "bond_price_per_bond": bondPricePerBond,
    "bond_procurement_amount": bondProcurementAmount,
    "bond_product_note": bondProductNote,
    "bond_purchase_limit": bondPurchaseLimit,
    "bond_purchase_limit_metric": bondPurchaseLimitMetric,
    "bond_put_details": List<dynamic>.from(bondPutDetails.map((x) => x.toJson())),
    "bond_rating_details": List<dynamic>.from(bondRatingDetails.map((x) => x.toJson())),
    "bond_rbi_loan_code": bondRbiLoanCode,
    "bond_registrar": bondRegistrar,
    "bond_script_id": bondScriptId,
    "bond_security_code": bondSecurityCode,
    "bond_security_type": bondSecurityType,
    "bond_security_type_code": bondSecurityTypeCode,
    "bond_series_instructions": bondSeriesInstructions,
    "bond_st": bondSt,
    "bond_sub_category_code": bondSubCategoryCode,
    "bond_term_condition_link": bondTermConditionLink,
    "bond_trustee": bondTrustee,
    "bond_type": bondType,
    "bond_updated_at": bondUpdatedAt.toIso8601String(),
    "bond_upi_app_no_series_1": bondUpiAppNoSeries1,
    "bond_upi_app_no_series_2": bondUpiAppNoSeries2,
    "bonds_banner_content_image": bondsBannerContentImage,
    "bonds_banner_content_sub_title": bondsBannerContentSubTitle,
    "bonds_banner_content_title": bondsBannerContentTitle,
    "bonds_banner_rcb_notice_link": bondsBannerRcbNoticeLink,
    "bonds_next_interest_payment_date": bondsNextInterestPaymentDate,
    "bonds_price_per_gram": bondsPricePerGram,
    "bonds_yeild": bondsYeild,
    "exit_option_available": exitOptionAvailable,
  };
}

class BondBrokerageDetail {
  BondBrokerageDetail({
  required  this.bondBreakageSeriesNumber,
  required  this.bondBrokerageCategoryId,
  required  this.bondBrokerageDetailCreatedAt,
  required  this.bondBrokerageDetailId,
  required  this.bondBrokerageDetailUpdatedAt,
  required  this.bondBrokerageValue,
  required  this.bondId,
  required  this.bondNcdId,
  });

  dynamic bondBreakageSeriesNumber;
  int bondBrokerageCategoryId;
  DateTime bondBrokerageDetailCreatedAt;
  int bondBrokerageDetailId;
  dynamic bondBrokerageDetailUpdatedAt;
  String bondBrokerageValue;
  int bondId;
  dynamic bondNcdId;

  factory BondBrokerageDetail.fromJson(Map<String, dynamic> json) => BondBrokerageDetail(
    bondBreakageSeriesNumber: json["bond_breakage_series_number"],
    bondBrokerageCategoryId: json["bond_brokerage_category_id"],
    bondBrokerageDetailCreatedAt: DateTime.parse(json["bond_brokerage_detail_created_at"]),
    bondBrokerageDetailId: json["bond_brokerage_detail_id"],
    bondBrokerageDetailUpdatedAt: json["bond_brokerage_detail_updated_at"],
    bondBrokerageValue: json["bond_brokerage_value"],
    bondId: json["bond_id"],
    bondNcdId: json["bond_ncd_id"],
  );

  Map<String, dynamic> toJson() => {
    "bond_breakage_series_number": bondBreakageSeriesNumber,
    "bond_brokerage_category_id": bondBrokerageCategoryId,
    "bond_brokerage_detail_created_at": bondBrokerageDetailCreatedAt.toIso8601String(),
    "bond_brokerage_detail_id": bondBrokerageDetailId,
    "bond_brokerage_detail_updated_at": bondBrokerageDetailUpdatedAt,
    "bond_brokerage_value": bondBrokerageValue,
    "bond_id": bondId,
    "bond_ncd_id": bondNcdId,
  };
}

class BondCallDetail {
  BondCallDetail({
  required this.bondCallDetailAmount,
  required this.bondCallDetailCreatedAt,
  required this.bondCallDetailDatetime,
  required this.bondCallDetailId,
  required this.bondCallDetailUpdatedAt,
  required this.bondId,
  });

  String bondCallDetailAmount;
  DateTime bondCallDetailCreatedAt;
  DateTime bondCallDetailDatetime;
  int bondCallDetailId;
  dynamic bondCallDetailUpdatedAt;
  int bondId;

  factory BondCallDetail.fromJson(Map<String, dynamic> json) => BondCallDetail(
    bondCallDetailAmount: json["bond_call_detail_amount"],
    bondCallDetailCreatedAt: DateTime.parse(json["bond_call_detail_created_at"]),
    bondCallDetailDatetime: DateTime.parse(json["bond_call_detail_datetime"]),
    bondCallDetailId: json["bond_call_detail_id"],
    bondCallDetailUpdatedAt: json["bond_call_detail_updated_at"],
    bondId: json["bond_id"],
  );

  Map<String, dynamic> toJson() => {
    "bond_call_detail_amount": bondCallDetailAmount,
    "bond_call_detail_created_at": bondCallDetailCreatedAt.toIso8601String(),
    "bond_call_detail_datetime": "${bondCallDetailDatetime.year.toString().padLeft(4, '0')}-${bondCallDetailDatetime.month.toString().padLeft(2, '0')}-${bondCallDetailDatetime.day.toString().padLeft(2, '0')}",
    "bond_call_detail_id": bondCallDetailId,
    "bond_call_detail_updated_at": bondCallDetailUpdatedAt,
    "bond_id": bondId,
  };
}

class BondIssuerDetail {
  BondIssuerDetail({
  required  this.bondId,
  required  this.bondIssuerAbout,
  required  this.bondIssuerCouponType,
  required  this.bondIssuerCreatedAt,
  required  this.bondIssuerDocuments,
  required  this.bondIssuerEffectiveYield,
  required  this.bondIssuerFinanceDetails,
  required  this.bondIssuerFirstIpDate,
  required  this.bondIssuerFrequencyOfInterest,
  required  this.bondIssuerHeadOffice,
  required  this.bondIssuerId,
  required  this.bondIssuerIndustry,
  required  this.bondIssuerIpDates,
  required  this.bondIssuerIsinNumber,
  required  this.bondIssuerProfileLink,
  required  this.bondIssuerSeries,
  required  this.bondIssuerTenor,
  required  this.bondIssuerTotalAnnualRevenue,
  required  this.bondIssuerType,
  required  this.bondIssuerUpdatedAt,
  required  this.bondIssuerYearOfInception,
  required  this.bondTypeOfIssuer,
  });

  int bondId;
  String bondIssuerAbout;
  int bondIssuerCouponType;
  dynamic bondIssuerCreatedAt;
  String bondIssuerDocuments;
  String bondIssuerEffectiveYield;
  String bondIssuerFinanceDetails;
  DateTime bondIssuerFirstIpDate;
  int bondIssuerFrequencyOfInterest;
  String bondIssuerHeadOffice;
  int bondIssuerId;
  String bondIssuerIndustry;
  String bondIssuerIpDates;
  dynamic bondIssuerIsinNumber;
  String bondIssuerProfileLink;
  String bondIssuerSeries;
  int bondIssuerTenor;
  dynamic bondIssuerTotalAnnualRevenue;
  int bondIssuerType;
  dynamic bondIssuerUpdatedAt;
  int bondIssuerYearOfInception;
  int bondTypeOfIssuer;

  factory BondIssuerDetail.fromJson(Map<String, dynamic> json) => BondIssuerDetail(
    bondId: json["bond_id"],
    bondIssuerAbout: json["bond_issuer_about"],
    bondIssuerCouponType: json["bond_issuer_coupon_type"],
    bondIssuerCreatedAt: json["bond_issuer_created_at"],
    bondIssuerDocuments: json["bond_issuer_documents"],
    bondIssuerEffectiveYield: json["bond_issuer_effective_yield"],
    bondIssuerFinanceDetails: json["bond_issuer_finance_details"],
    bondIssuerFirstIpDate: DateTime.parse(json["bond_issuer_first_ip_date"]),
    bondIssuerFrequencyOfInterest: json["bond_issuer_frequency_of_interest"],
    bondIssuerHeadOffice: json["bond_issuer_head_office"],
    bondIssuerId: json["bond_issuer_id"],
    bondIssuerIndustry: json["bond_issuer_industry"],
    bondIssuerIpDates: json["bond_issuer_ip_dates"],
    bondIssuerIsinNumber: json["bond_issuer_isin_number"],
    bondIssuerProfileLink: json["bond_issuer_profile_link"],
    bondIssuerSeries: json["bond_issuer_series"],
    bondIssuerTenor: json["bond_issuer_tenor"],
    bondIssuerTotalAnnualRevenue: json["bond_issuer_total_annual_revenue"],
    bondIssuerType: json["bond_issuer_type"],
    bondIssuerUpdatedAt: json["bond_issuer_updated_at"],
    bondIssuerYearOfInception: json["bond_issuer_year_of_inception"],
    bondTypeOfIssuer: json["bond_type_of_issuer"],
  );

  Map<String, dynamic> toJson() => {
    "bond_id": bondId,
    "bond_issuer_about": bondIssuerAbout,
    "bond_issuer_coupon_type": bondIssuerCouponType,
    "bond_issuer_created_at": bondIssuerCreatedAt,
    "bond_issuer_documents": bondIssuerDocuments,
    "bond_issuer_effective_yield": bondIssuerEffectiveYield,
    "bond_issuer_finance_details": bondIssuerFinanceDetails,
    "bond_issuer_first_ip_date": "${bondIssuerFirstIpDate.year.toString().padLeft(4, '0')}-${bondIssuerFirstIpDate.month.toString().padLeft(2, '0')}-${bondIssuerFirstIpDate.day.toString().padLeft(2, '0')}",
    "bond_issuer_frequency_of_interest": bondIssuerFrequencyOfInterest,
    "bond_issuer_head_office": bondIssuerHeadOffice,
    "bond_issuer_id": bondIssuerId,
    "bond_issuer_industry": bondIssuerIndustry,
    "bond_issuer_ip_dates": bondIssuerIpDates,
    "bond_issuer_isin_number": bondIssuerIsinNumber,
    "bond_issuer_profile_link": bondIssuerProfileLink,
    "bond_issuer_series": bondIssuerSeries,
    "bond_issuer_tenor": bondIssuerTenor,
    "bond_issuer_total_annual_revenue": bondIssuerTotalAnnualRevenue,
    "bond_issuer_type": bondIssuerType,
    "bond_issuer_updated_at": bondIssuerUpdatedAt,
    "bond_issuer_year_of_inception": bondIssuerYearOfInception,
    "bond_type_of_issuer": bondTypeOfIssuer,
  };
}

class BondNcdAvailable {
  BondNcdAvailable({
  required  this.bondId,
  required  this.bondNcdCoupon,
  required  this.bondNcdCreatedAt,
  required  this.bondNcdEffectiveYield,
  required  this.bondNcdFrequencyOfInterestPayment,
  required  this.bondNcdId,
  required  this.bondNcdInMultipleTermsOfThereafter,
  required  this.bondNcdIssuePriceOfNcd,
  required  this.bondNcdMinimumApplication,
  required  this.bondNcdModeOfInterestPayment,
  required  this.bondNcdPutAndOption,
  required  this.bondNcdRedemptionAmount,
  required  this.bondNcdTenor,
  });

  int bondId;
  int bondNcdCoupon;
  DateTime bondNcdCreatedAt;
  int bondNcdEffectiveYield;
  int bondNcdFrequencyOfInterestPayment;
  int bondNcdId;
  int bondNcdInMultipleTermsOfThereafter;
  int bondNcdIssuePriceOfNcd;
  int bondNcdMinimumApplication;
  int bondNcdModeOfInterestPayment;
  int bondNcdPutAndOption;
  int bondNcdRedemptionAmount;
  int bondNcdTenor;

  factory BondNcdAvailable.fromJson(Map<String, dynamic> json) => BondNcdAvailable(
    bondId: json["bond_id"],
    bondNcdCoupon: json["bond_ncd_coupon"],
    bondNcdCreatedAt: DateTime.parse(json["bond_ncd_created_at"]),
    bondNcdEffectiveYield: json["bond_ncd_effective_yield"],
    bondNcdFrequencyOfInterestPayment: json["bond_ncd_frequency_of_interest_payment"],
    bondNcdId: json["bond_ncd_id"],
    bondNcdInMultipleTermsOfThereafter: json["bond_ncd_in_multiple_terms_of_thereafter"],
    bondNcdIssuePriceOfNcd: json["bond_ncd_issue_price_of_ncd"],
    bondNcdMinimumApplication: json["bond_ncd_minimum_application"],
    bondNcdModeOfInterestPayment: json["bond_ncd_mode_of_interest_payment"],
    bondNcdPutAndOption: json["bond_ncd_put_and_option"],
    bondNcdRedemptionAmount: json["bond_ncd_redemption_amount"],
    bondNcdTenor: json["bond_ncd_tenor"],
  );

  Map<String, dynamic> toJson() => {
    "bond_id": bondId,
    "bond_ncd_coupon": bondNcdCoupon,
    "bond_ncd_created_at": bondNcdCreatedAt.toIso8601String(),
    "bond_ncd_effective_yield": bondNcdEffectiveYield,
    "bond_ncd_frequency_of_interest_payment": bondNcdFrequencyOfInterestPayment,
    "bond_ncd_id": bondNcdId,
    "bond_ncd_in_multiple_terms_of_thereafter": bondNcdInMultipleTermsOfThereafter,
    "bond_ncd_issue_price_of_ncd": bondNcdIssuePriceOfNcd,
    "bond_ncd_minimum_application": bondNcdMinimumApplication,
    "bond_ncd_mode_of_interest_payment": bondNcdModeOfInterestPayment,
    "bond_ncd_put_and_option": bondNcdPutAndOption,
    "bond_ncd_redemption_amount": bondNcdRedemptionAmount,
    "bond_ncd_tenor": bondNcdTenor,
  };
}

class BondNcdSery {
  BondNcdSery({
  required this.bondId,
  required this.bondNcdCoupon,
  required this.bondNcdEffectiveYield,
  required this.bondNcdFrequencyOfInterestPayment,
  required this.bondNcdInMultipleTermsOfThereafter,
  required this.bondNcdIssuePriceOfNcd,
  required this.bondNcdMinimumApplication,
  required this.bondNcdModeOfInterestPayment,
  required this.bondNcdPutAndOption,
  required this.bondNcdRedemptionAmount,
  required this.bondNcdSeriesCreatedAt,
  required this.bondNcdSeriesId,
  required this.bondNcdSeriesNumber,
  required this.bondNcdTenor,
  });

  int bondId;
  dynamic bondNcdCoupon;
  dynamic bondNcdEffectiveYield;
  dynamic bondNcdFrequencyOfInterestPayment;
  int bondNcdInMultipleTermsOfThereafter;
  String bondNcdIssuePriceOfNcd;
  int bondNcdMinimumApplication;
  String bondNcdModeOfInterestPayment;
  String bondNcdPutAndOption;
  dynamic bondNcdRedemptionAmount;
  dynamic bondNcdSeriesCreatedAt;
  int bondNcdSeriesId;
  int bondNcdSeriesNumber;
  int bondNcdTenor;

  factory BondNcdSery.fromJson(Map<String, dynamic> json) => BondNcdSery(
    bondId: json["bond_id"],
    bondNcdCoupon: json["bond_ncd_coupon"],
    bondNcdEffectiveYield: json["bond_ncd_effective_yield"],
    bondNcdFrequencyOfInterestPayment: json["bond_ncd_frequency_of_interest_payment"],
    bondNcdInMultipleTermsOfThereafter: json["bond_ncd_in_multiple_terms_of_thereafter"],
    bondNcdIssuePriceOfNcd: json["bond_ncd_issue_price_of_ncd"],
    bondNcdMinimumApplication: json["bond_ncd_minimum_application"],
    bondNcdModeOfInterestPayment: json["bond_ncd_mode_of_interest_payment"],
    bondNcdPutAndOption: json["bond_ncd_put_and_option"],
    bondNcdRedemptionAmount: json["bond_ncd_redemption_amount"],
    bondNcdSeriesCreatedAt: json["bond_ncd_series_created_at"],
    bondNcdSeriesId: json["bond_ncd_series_id"],
    bondNcdSeriesNumber: json["bond_ncd_series_number"],
    bondNcdTenor: json["bond_ncd_tenor"],
  );

  Map<String, dynamic> toJson() => {
    "bond_id": bondId,
    "bond_ncd_coupon": bondNcdCoupon,
    "bond_ncd_effective_yield": bondNcdEffectiveYield,
    "bond_ncd_frequency_of_interest_payment": bondNcdFrequencyOfInterestPayment,
    "bond_ncd_in_multiple_terms_of_thereafter": bondNcdInMultipleTermsOfThereafter,
    "bond_ncd_issue_price_of_ncd": bondNcdIssuePriceOfNcd,
    "bond_ncd_minimum_application": bondNcdMinimumApplication,
    "bond_ncd_mode_of_interest_payment": bondNcdModeOfInterestPayment,
    "bond_ncd_put_and_option": bondNcdPutAndOption,
    "bond_ncd_redemption_amount": bondNcdRedemptionAmount,
    "bond_ncd_series_created_at": bondNcdSeriesCreatedAt,
    "bond_ncd_series_id": bondNcdSeriesId,
    "bond_ncd_series_number": bondNcdSeriesNumber,
    "bond_ncd_tenor": bondNcdTenor,
  };
}

class BondPutDetail {
  BondPutDetail({
  required  this.bondId,
  required  this.bondPutDetailAmount,
  required  this.bondPutDetailCreatedAt,
  required  this.bondPutDetailDatetime,
  required  this.bondPutDetailId,
  required  this.bondPutDetailUpdatedAt,
  });

  int bondId;
  dynamic bondPutDetailAmount;
  DateTime bondPutDetailCreatedAt;
  DateTime bondPutDetailDatetime;
  int bondPutDetailId;
  dynamic bondPutDetailUpdatedAt;

  factory BondPutDetail.fromJson(Map<String, dynamic> json) => BondPutDetail(
    bondId: json["bond_id"],
    bondPutDetailAmount: json["bond_put_detail_amount"],
    bondPutDetailCreatedAt: DateTime.parse(json["bond_put_detail_created_at"]),
    bondPutDetailDatetime: DateTime.parse(json["bond_put_detail_datetime"]),
    bondPutDetailId: json["bond_put_detail_id"],
    bondPutDetailUpdatedAt: json["bond_put_detail_updated_at"],
  );

  Map<String, dynamic> toJson() => {
    "bond_id": bondId,
    "bond_put_detail_amount": bondPutDetailAmount,
    "bond_put_detail_created_at": bondPutDetailCreatedAt.toIso8601String(),
    "bond_put_detail_datetime": "${bondPutDetailDatetime.year.toString().padLeft(4, '0')}-${bondPutDetailDatetime.month.toString().padLeft(2, '0')}-${bondPutDetailDatetime.day.toString().padLeft(2, '0')}",
    "bond_put_detail_id": bondPutDetailId,
    "bond_put_detail_updated_at": bondPutDetailUpdatedAt,
  };
}

class BondRatingDetail {
  BondRatingDetail({
  required this.bondCareLongRating,
  required this.bondCareRatingAgency,
  required this.bondCareRatingCertificate,
  required this.bondCareRatingImage,
  required this.bondCareShortRating,
  required this.bondCrisilLongRating,
  required this.bondCrisilRatingAgency,
  required this.bondCrisilRatingCertificate,
  required this.bondCrisilRatingImage,
  required this.bondCrisilShortRating,
  required this.bondId,
  required this.bondRatingDetailsCreatedAt,
  required this.bondRatingDetailsUpdatedAt,
  required this.bondRatingId,
  });

  String bondCareLongRating;
  String bondCareRatingAgency;
  String bondCareRatingCertificate;
  String bondCareRatingImage;
  String bondCareShortRating;
  String bondCrisilLongRating;
  String bondCrisilRatingAgency;
  String bondCrisilRatingCertificate;
  String bondCrisilRatingImage;
  String bondCrisilShortRating;
  int bondId;
  DateTime bondRatingDetailsCreatedAt;
  dynamic bondRatingDetailsUpdatedAt;
  int bondRatingId;

  factory BondRatingDetail.fromJson(Map<String, dynamic> json) => BondRatingDetail(
    bondCareLongRating: json["bond_care_long_rating"],
    bondCareRatingAgency: json["bond_care_rating_agency"],
    bondCareRatingCertificate: json["bond_care_rating_certificate"],
    bondCareRatingImage: json["bond_care_rating_image"],
    bondCareShortRating: json["bond_care_short_rating"],
    bondCrisilLongRating: json["bond_crisil_long_rating"],
    bondCrisilRatingAgency: json["bond_crisil_rating_agency"],
    bondCrisilRatingCertificate: json["bond_crisil_rating_certificate"],
    bondCrisilRatingImage: json["bond_crisil_rating_image"],
    bondCrisilShortRating: json["bond_crisil_short_rating"],
    bondId: json["bond_id"],
    bondRatingDetailsCreatedAt: DateTime.parse(json["bond_rating_details_created_at"]),
    bondRatingDetailsUpdatedAt: json["bond_rating_details_updated_at"],
    bondRatingId: json["bond_rating_id"],
  );

  Map<String, dynamic> toJson() => {
    "bond_care_long_rating": bondCareLongRating,
    "bond_care_rating_agency": bondCareRatingAgency,
    "bond_care_rating_certificate": bondCareRatingCertificate,
    "bond_care_rating_image": bondCareRatingImage,
    "bond_care_short_rating": bondCareShortRating,
    "bond_crisil_long_rating": bondCrisilLongRating,
    "bond_crisil_rating_agency": bondCrisilRatingAgency,
    "bond_crisil_rating_certificate": bondCrisilRatingCertificate,
    "bond_crisil_rating_image": bondCrisilRatingImage,
    "bond_crisil_short_rating": bondCrisilShortRating,
    "bond_id": bondId,
    "bond_rating_details_created_at": bondRatingDetailsCreatedAt.toIso8601String(),
    "bond_rating_details_updated_at": bondRatingDetailsUpdatedAt,
    "bond_rating_id": bondRatingId,
  };
}
