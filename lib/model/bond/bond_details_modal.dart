// To parse this JSON data, do
//
//     final bondDetails = bondDetailsFromJson(jsonString);

import 'dart:convert';

BondDetails bondDetailsFromJson(String str) => BondDetails.fromJson(json.decode(str));

String bondDetailsToJson(BondDetails data) => json.encode(data.toJson());

class BondDetails {
  BondDetails({
    this.bondAboutThisIpo,
    this.bondAllotmentDate,
    this.bondAppNoSeries,
    this.bondArrangerName,
    this.bondAsbaAppNoSeries1,
    this.bondAsbaAppNoSeries2,
    this.bondAsbaDetails,
   required this.bondBrandTags,
   required this.bondBrokerageDetails,
    this.bondBrokerageDetailsStatus,
    this.bondBrokerageStructure,
    this.bondCalcIntOnHolidays,
    required this.bondCallDetails,
    this.bondCategoryHni,
    this.bondCategoryInstitutional,
    this.bondCategoryInstructions,
    this.bondCategoryNonInstitutional,
    this.bondCategoryRetail,
    required this.bondCloserDate,
    this.bondClosingDate,
   required this.bondCouponAmount,
   required this.bondCouponDate,
    this.bondCouponOn,
    this.bondCouponRate,
    required this.bondCreatedAt,
    this.bondDepository,
    this.bondDisclaimer,
    this.bondDmatBookCloserDate,
    this.bondEFormIncentive,
    this.bondEarlyBirdIncentive,
    this.bondEffortBasis,
  required  this.bondEligibleInvestors,
  required  this.bondExchange,
  required  this.bondFaceValue,
    this.bondFinalIssueAmount,
    this.bondGovtGuranatee,
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
    this.bondIssueDocument,
    required  this.bondIssuePrice,
    this.bondIssueSize,
    this.bondIssueStatus,
  required this.bondIssuerDetails,
  required this.bondIssuerName,
    this.bondKeyHighlights,
    this.bondListing,
    this.bondListingCircle,
    this.bondLogo,
   required this.bondMaturityAmount,
   required this.bondMaturityDate,
    this.bondMinimumApplication,
    this.bondName,
   required this.bondNatureOfInstrument,
   required this.bondNcdAvailable,
   required this.bondNcdSeries,
    this.bondNcdStatus,
    this.bondOpeningDate,
    this.bondOtherIncentive,
    this.bondOurStatus,
    this.bondPricePerBond,
    this.bondProcurementAmount,
    this.bondProductNote,
    this.bondPurchaseLimit,
    this.bondPurchaseLimitMetric,
  required  this.bondPutDetails,
  required  this.bondRatingDetails,
    this.bondRbiLoanCode,
    this.bondRegistrar,
    this.bondScriptId,
    this.bondSecurityCode,
    required  this.bondSecurityType,
    this.bondSecurityTypeCode,
    this.bondSeriesInstructions,
    this.bondSt,
    this.bondSubCategoryCode,
    this.bondTermConditionLink,
    this.bondTrustee,
    required  this.bondType,
    this.bondUpdatedAt,
    this.bondUpiAppNoSeries1,
    this.bondUpiAppNoSeries2,
    this.bondsBannerContentImage,
    this.bondsBannerContentSubTitle,
    this.bondsBannerContentTitle,
    this.bondsBannerRcbNoticeLink,
    this.bondsNextInterestPaymentDate,
    this.bondsPricePerGram,
    this.bondsYeild,
    this.exitOptionAvailable,
  });

  dynamic bondAboutThisIpo;
  dynamic bondAllotmentDate;
  dynamic bondAppNoSeries;
  dynamic bondArrangerName;
  dynamic bondAsbaAppNoSeries1;
  dynamic bondAsbaAppNoSeries2;
  dynamic bondAsbaDetails;
  List<dynamic> bondBrandTags;
  List<BrokerageDetail> bondBrokerageDetails;
  dynamic bondBrokerageDetailsStatus;
  dynamic bondBrokerageStructure;
  dynamic bondCalcIntOnHolidays;
  List<dynamic> bondCallDetails;
  dynamic bondCategoryHni;
  dynamic bondCategoryInstitutional;
  dynamic bondCategoryInstructions;
  dynamic bondCategoryNonInstitutional;
  dynamic bondCategoryRetail;
  String bondCloserDate;
  dynamic bondClosingDate;
  String bondCouponAmount;
  String bondCouponDate;
  dynamic bondCouponOn;
  dynamic bondCouponRate;
  String bondCreatedAt;
  dynamic bondDepository;
  dynamic bondDisclaimer;
  dynamic bondDmatBookCloserDate;
  dynamic bondEFormIncentive;
  dynamic bondEarlyBirdIncentive;
  dynamic bondEffortBasis;
  List<dynamic> bondEligibleInvestors;
  String bondExchange;
  String bondFaceValue;
  dynamic bondFinalIssueAmount;
  dynamic bondGovtGuranatee;
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
  String bondIssueDate;
  dynamic bondIssueDocument;
  String bondIssuePrice;
  dynamic bondIssueSize;
  dynamic bondIssueStatus;
  List<dynamic> bondIssuerDetails;
  String bondIssuerName;
  dynamic bondKeyHighlights;
  dynamic bondListing;
  dynamic bondListingCircle;
  dynamic bondLogo;
  String bondMaturityAmount;
  String bondMaturityDate;
  dynamic bondMinimumApplication;
  dynamic bondName;
  int bondNatureOfInstrument;
  List<dynamic> bondNcdAvailable;
  List<dynamic> bondNcdSeries;
  dynamic bondNcdStatus;
  dynamic bondOpeningDate;
  dynamic bondOtherIncentive;
  dynamic bondOurStatus;
  dynamic bondPricePerBond;
  dynamic bondProcurementAmount;
  dynamic bondProductNote;
  dynamic bondPurchaseLimit;
  dynamic bondPurchaseLimitMetric;
  List<dynamic> bondPutDetails;
  List<dynamic> bondRatingDetails;
  dynamic bondRbiLoanCode;
  dynamic bondRegistrar;
  dynamic bondScriptId;
  dynamic bondSecurityCode;
  int bondSecurityType;
  dynamic bondSecurityTypeCode;
  dynamic bondSeriesInstructions;
  dynamic bondSt;
  dynamic bondSubCategoryCode;
  dynamic bondTermConditionLink;
  dynamic bondTrustee;
  int bondType;
  dynamic bondUpdatedAt;
  dynamic bondUpiAppNoSeries1;
  dynamic bondUpiAppNoSeries2;
  dynamic bondsBannerContentImage;
  dynamic bondsBannerContentSubTitle;
  dynamic bondsBannerContentTitle;
  dynamic bondsBannerRcbNoticeLink;
  dynamic bondsNextInterestPaymentDate;
  dynamic bondsPricePerGram;
  dynamic bondsYeild;
  dynamic exitOptionAvailable;

  factory BondDetails.fromJson(Map<String, dynamic> json) => BondDetails(
    bondAboutThisIpo: json["bond_about_this_ipo"],
    bondAllotmentDate: json["bond_allotment_date"],
    bondAppNoSeries: json["bond_app_no_series"],
    bondArrangerName: json["bond_arranger_name"],
    bondAsbaAppNoSeries1: json["bond_asba_app_no_series_1"],
    bondAsbaAppNoSeries2: json["bond_asba_app_no_series_2"],
    bondAsbaDetails: json["bond_asba_details"],
    bondBrandTags: List<dynamic>.from(json["bond_brand_tags"].map((x) => x)),
    bondBrokerageDetails: List<BrokerageDetail>.from(json["bond_brokerage_details"].map((x) => BrokerageDetail.fromJson(x))),
    bondBrokerageDetailsStatus: json["bond_brokerage_details_status"],
    bondBrokerageStructure: json["bond_brokerage_structure"],
    bondCalcIntOnHolidays: json["bond_calc_int_on_holidays"],
    bondCallDetails: List<dynamic>.from(json["bond_call_details"].map((x) => x)),
    bondCategoryHni: json["bond_category_hni"],
    bondCategoryInstitutional: json["bond_category_institutional"],
    bondCategoryInstructions: json["bond_category_instructions"],
    bondCategoryNonInstitutional: json["bond_category_non_institutional"],
    bondCategoryRetail: json["bond_category_retail"],
    bondCloserDate: json["bond_closer_date"],
    bondClosingDate: json["bond_closing_date"],
    bondCouponAmount: json["bond_coupon_amount"],
    bondCouponDate: json["bond_coupon_date"],
    bondCouponOn: json["bond_coupon_on"],
    bondCouponRate: json["bond_coupon_rate"],
    bondCreatedAt: json["bond_created_at"],
    bondDepository: json["bond_depository"],
    bondDisclaimer: json["bond_disclaimer"],
    bondDmatBookCloserDate: json["bond_dmat_book_closer_date"],
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
    bondIpDate: json["bond_ip_date"],
    bondIpoSellWindowsDays: json["bond_ipo_sell_windows_days"],
    bondIsinNumber: json["bond_isin_number"],
    bondIssueDate: json["bond_issue_date"],
    bondIssueDocument: json["bond_issue_document"],
    bondIssuePrice: json["bond_issue_price"],
    bondIssueSize: json["bond_issue_size"],
    bondIssueStatus: json["bond_issue_status"],
    bondIssuerDetails: List<dynamic>.from(json["bond_issuer_details"].map((x) => x)),
    bondIssuerName: json["bond_issuer_name"],
    bondKeyHighlights: json["bond_key_highlights"],
    bondListing: json["bond_listing"],
    bondListingCircle: json["bond_listing_circle"],
    bondLogo: json["bond_logo"],
    bondMaturityAmount: json["bond_maturity_amount"],
    bondMaturityDate: json["bond_maturity_date"],
    bondMinimumApplication: json["bond_minimum_application"],
    bondName: json["bond_name"],
    bondNatureOfInstrument: json["bond_nature_of_instrument"],
    bondNcdAvailable: List<dynamic>.from(json["bond_ncd_available"].map((x) => x)),
    bondNcdSeries: List<dynamic>.from(json["bond_ncd_series"].map((x) => x)),
    bondNcdStatus: json["bond_ncd_status"],
    bondOpeningDate: json["bond_opening_date"],
    bondOtherIncentive: json["bond_other_incentive"],
    bondOurStatus: json["bond_our_status"],
    bondPricePerBond: json["bond_price_per_bond"],
    bondProcurementAmount: json["bond_procurement_amount"],
    bondProductNote: json["bond_product_note"],
    bondPurchaseLimit: json["bond_purchase_limit"],
    bondPurchaseLimitMetric: json["bond_purchase_limit_metric"],
    bondPutDetails: List<dynamic>.from(json["bond_put_details"].map((x) => x)),
    bondRatingDetails: List<dynamic>.from(json["bond_rating_details"].map((x) => x)),
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
    bondUpdatedAt: json["bond_updated_at"],
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
    "bond_allotment_date": bondAllotmentDate,
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
    "bond_call_details": List<dynamic>.from(bondCallDetails.map((x) => x)),
    "bond_category_hni": bondCategoryHni,
    "bond_category_institutional": bondCategoryInstitutional,
    "bond_category_instructions": bondCategoryInstructions,
    "bond_category_non_institutional": bondCategoryNonInstitutional,
    "bond_category_retail": bondCategoryRetail,
    "bond_closer_date": bondCloserDate,
    "bond_closing_date": bondClosingDate,
    "bond_coupon_amount": bondCouponAmount,
    "bond_coupon_date": bondCouponDate,
    "bond_coupon_on": bondCouponOn,
    "bond_coupon_rate": bondCouponRate,
    "bond_created_at": bondCreatedAt,
    "bond_depository": bondDepository,
    "bond_disclaimer": bondDisclaimer,
    "bond_dmat_book_closer_date": bondDmatBookCloserDate,
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
    "bond_ip_date": bondIpDate,
    "bond_ipo_sell_windows_days": bondIpoSellWindowsDays,
    "bond_isin_number": bondIsinNumber,
    "bond_issue_date": bondIssueDate,
    "bond_issue_document": bondIssueDocument,
    "bond_issue_price": bondIssuePrice,
    "bond_issue_size": bondIssueSize,
    "bond_issue_status": bondIssueStatus,
    "bond_issuer_details": List<dynamic>.from(bondIssuerDetails.map((x) => x)),
    "bond_issuer_name": bondIssuerName,
    "bond_key_highlights": bondKeyHighlights,
    "bond_listing": bondListing,
    "bond_listing_circle": bondListingCircle,
    "bond_logo": bondLogo,
    "bond_maturity_amount": bondMaturityAmount,
    "bond_maturity_date": bondMaturityDate,
    "bond_minimum_application": bondMinimumApplication,
    "bond_name": bondName,
    "bond_nature_of_instrument": bondNatureOfInstrument,
    "bond_ncd_available": List<dynamic>.from(bondNcdAvailable.map((x) => x)),
    "bond_ncd_series": List<dynamic>.from(bondNcdSeries.map((x) => x)),
    "bond_ncd_status": bondNcdStatus,
    "bond_opening_date": bondOpeningDate,
    "bond_other_incentive": bondOtherIncentive,
    "bond_our_status": bondOurStatus,
    "bond_price_per_bond": bondPricePerBond,
    "bond_procurement_amount": bondProcurementAmount,
    "bond_product_note": bondProductNote,
    "bond_purchase_limit": bondPurchaseLimit,
    "bond_purchase_limit_metric": bondPurchaseLimitMetric,
    "bond_put_details": List<dynamic>.from(bondPutDetails.map((x) => x)),
    "bond_rating_details": List<dynamic>.from(bondRatingDetails.map((x) => x)),
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
    "bond_updated_at": bondUpdatedAt,
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

class BrokerageDetail {
  BrokerageDetail({
  required this.bondCashflowAmount,
  required this.bondCashflowCreatedAt,
  required this.bondCashflowDate,
  required this.bondCashflowDays,
  required this.bondCashflowId,
  required this.bondCashflowType,
    this.bondCashflowUpdatedAt,
    required this.bondId,
  });

  String bondCashflowAmount;
  String bondCashflowCreatedAt;
  String bondCashflowDate;
  String bondCashflowDays;
  int bondCashflowId;
  String bondCashflowType;
  dynamic bondCashflowUpdatedAt;
  int bondId;

  factory BrokerageDetail.fromJson(Map<String, dynamic> json) => BrokerageDetail(
    bondCashflowAmount: json["bond_cashflow_amount"],
    bondCashflowCreatedAt: json["bond_cashflow_created_at"],
    bondCashflowDate: json["bond_cashflow_date"],
    bondCashflowDays: json["bond_cashflow_days"],
    bondCashflowId: json["bond_cashflow_id"],
    bondCashflowType: json["bond_cashflow_type"],
    bondCashflowUpdatedAt: json["bond_cashflow_updated_at"],
    bondId: json["bond_id"],
  );

  Map<String, dynamic> toJson() => {
    "bond_cashflow_amount": bondCashflowAmount,
    "bond_cashflow_created_at": bondCashflowCreatedAt,
    "bond_cashflow_date": bondCashflowDate,
    "bond_cashflow_days": bondCashflowDays,
    "bond_cashflow_id": bondCashflowId,
    "bond_cashflow_type": bondCashflowType,
    "bond_cashflow_updated_at": bondCashflowUpdatedAt,
    "bond_id": bondId,
  };
}
