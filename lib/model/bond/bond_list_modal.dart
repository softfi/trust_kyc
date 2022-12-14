// To parse this JSON data, do
//
//     final allBondList = allBondListFromJson(jsonString);

import 'dart:convert';

AllBondList allBondListFromJson(String str) => AllBondList.fromJson(json.decode(str));

String allBondListToJson(AllBondList data) => json.encode(data.toJson());

class AllBondList {
  AllBondList({
  required this.bondsList,
  required this.currentPage,
  required this.pageLimit,
  required this.total,
  });

  List<BondsList> bondsList;
  int currentPage;
  int pageLimit;
  int total;

  factory AllBondList.fromJson(Map<String, dynamic> json) => AllBondList(
    bondsList: List<BondsList>.from(json["bonds_list"].map((x) => BondsList.fromJson(x))),
    currentPage: json["current_page"],
    pageLimit: json["page_limit"],
    total: json["total"],
  );

  Map<String, dynamic> toJson() => {
    "bonds_list": List<dynamic>.from(bondsList.map((x) => x.toJson())),
    "current_page": currentPage,
    "page_limit": pageLimit,
    "total": total,
  };
}

class BondsList {
  BondsList({
  required  this.bondAboutThisIpo,
  required  this.bondAllotmentDate,
  required  this.bondAppNoSeries,
  required  this.bondArrangerName,
  required  this.bondAsbaAppNoSeries1,
  required  this.bondAsbaAppNoSeries2,
  required  this.bondAsbaDetails,
  required  this.bondBrokerageDetailsStatus,
  required  this.bondBrokerageStructure,
  required  this.bondCalcIntOnHolidays,
  required  this.bondCategoryHni,
  required  this.bondCategoryInstitutional,
  required  this.bondCategoryInstructions,
  required  this.bondCategoryNonInstitutional,
  required  this.bondCategoryRetail,
  required  this.bondCloserDate,
  required  this.bondClosingDate,
  required  this.bondCouponAmount,
  required  this.bondCouponDate,
  required  this.bondCouponOn,
  required  this.bondCouponRate,
  required  this.bondCreatedAt,
  required  this.bondDepository,
  required  this.bondDisclaimer,
  required  this.bondDmatBookCloserDate,
  required  this.bondEFormIncentive,
  required  this.bondEarlyBirdIncentive,
  required  this.bondEffortBasis,
  required  this.bondExchange,
  required  this.bondFaceValue,
  required  this.bondFinalIssueAmount,
  required  this.bondGovtGuranatee,
  required  this.bondGreenShoe,
  required  this.bondGreenShoeSize,
  required  this.bondGst,
  required  this.bondGuarantedBy,
  required  this.bondId,
  required  this.bondIntOnAppMoney,
  required  this.bondIntOnMaturity,
  required  this.bondIntOnRefundMoney,
  required  this.bondInterestDays,
  required  this.bondInterestFrequency,
  required  this.bondInterestType,
  required  this.bondIpDate,
  required  this.bondIpoSellWindowsDays,
  required  this.bondIsinNumber,
  required  this.bondIssueDate,
  required  this.bondIssueDocument,
  required  this.bondIssuePrice,
  required  this.bondIssueSize,
  required  this.bondIssueStatus,
  required  this.bondIssuerName,
  required  this.bondKeyHighlights,
  required  this.bondListing,
  required  this.bondListingCircle,
  required  this.bondLogo,
  required  this.bondMaturityAmount,
  required  this.bondMaturityDate,
  required  this.bondMinimumApplication,
  required  this.bondName,
  required  this.bondNatureOfInstrument,
  required  this.bondNcdStatus,
  required  this.bondOpeningDate,
  required  this.bondOtherIncentive,
  required  this.bondOurStatus,
  required  this.bondPricePerBond,
  required  this.bondProcurementAmount,
  required  this.bondProductNote,
  required  this.bondPurchaseLimit,
  required  this.bondPurchaseLimitMetric,
  required  this.bondRbiLoanCode,
  required  this.bondRegistrar,
  required  this.bondScriptId,
  required  this.bondSecurityCode,
  required  this.bondSecurityType,
  required  this.bondSecurityTypeCode,
  required  this.bondSeriesInstructions,
  required  this.bondSt,
  required  this.bondSubCategoryCode,
  required  this.bondTermConditionLink,
  required  this.bondTrustee,
  required  this.bondType,
  required  this.bondUpdatedAt,
  required  this.bondUpiAppNoSeries1,
  required  this.bondUpiAppNoSeries2,
  required  this.bondsBannerContentImage,
  required  this.bondsBannerContentSubTitle,
  required  this.bondsBannerContentTitle,
  required  this.bondsBannerRcbNoticeLink,
  required  this.bondsNextInterestPaymentDate,
  required  this.bondsPricePerGram,
  required  this.bondsYeild,
  required  this.exitOptionAvailable,
  });

  String bondAboutThisIpo;
  String bondAllotmentDate;
  String bondAppNoSeries;
  int bondArrangerName;
  String bondAsbaAppNoSeries1;
  String bondAsbaAppNoSeries2;
  String bondAsbaDetails;
  int bondBrokerageDetailsStatus;
  String bondBrokerageStructure;
  int bondCalcIntOnHolidays;
  String bondCategoryHni;
  String bondCategoryInstitutional;
  String bondCategoryInstructions;
  String bondCategoryNonInstitutional;
  String bondCategoryRetail;
  String bondCloserDate;
  String bondClosingDate;
  String bondCouponAmount;
  String bondCouponDate;
  String bondCouponOn;
  String bondCouponRate;
  String bondCreatedAt;
  dynamic bondDepository;
  String bondDisclaimer;
  String bondDmatBookCloserDate;
  String bondEFormIncentive;
  dynamic bondEarlyBirdIncentive;
  int bondEffortBasis;
  String bondExchange;
  dynamic bondFaceValue;
  String bondFinalIssueAmount;
  dynamic bondGovtGuranatee;
  int bondGreenShoe;
  String bondGreenShoeSize;
  int bondGst;
  String bondGuarantedBy;
  int bondId;
  String bondIntOnAppMoney;
  int bondIntOnMaturity;
  String bondIntOnRefundMoney;
  String bondInterestDays;
  String bondInterestFrequency;
  String bondInterestType;
  String bondIpDate;
  int bondIpoSellWindowsDays;
  String bondIsinNumber;
  String bondIssueDate;
  dynamic bondIssueDocument;
  dynamic bondIssuePrice;
  String bondIssueSize;
  int bondIssueStatus;
  String bondIssuerName;
  String bondKeyHighlights;
  int bondListing;
  String bondListingCircle;
  String bondLogo;
  String bondMaturityAmount;
  String bondMaturityDate;
  String bondMinimumApplication;
  dynamic bondName;
  int bondNatureOfInstrument;
  int bondNcdStatus;
  String bondOpeningDate;
  String bondOtherIncentive;
  int bondOurStatus;
  String bondPricePerBond;
  String bondProcurementAmount;
  String bondProductNote;
  dynamic bondPurchaseLimit;
  dynamic bondPurchaseLimitMetric;
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
  String bondUpdatedAt;
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

  factory BondsList.fromJson(Map<String, dynamic> json) => BondsList(
    bondAboutThisIpo: json["bond_about_this_ipo"],
    bondAllotmentDate: json["bond_allotment_date"],
    bondAppNoSeries: json["bond_app_no_series"],
    bondArrangerName: json["bond_arranger_name"],
    bondAsbaAppNoSeries1: json["bond_asba_app_no_series_1"],
    bondAsbaAppNoSeries2: json["bond_asba_app_no_series_2"],
    bondAsbaDetails: json["bond_asba_details"],
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
    bondNcdStatus: json["bond_ncd_status"],
    bondOpeningDate: json["bond_opening_date"],
    bondOtherIncentive: json["bond_other_incentive"],
    bondOurStatus: json["bond_our_status"],
    bondPricePerBond: json["bond_price_per_bond"],
    bondProcurementAmount: json["bond_procurement_amount"],
    bondProductNote: json["bond_product_note"],
    bondPurchaseLimit: json["bond_purchase_limit"],
    bondPurchaseLimitMetric: json["bond_purchase_limit_metric"],
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
    "bond_ncd_status": bondNcdStatus,
    "bond_opening_date": bondOpeningDate,
    "bond_other_incentive": bondOtherIncentive,
    "bond_our_status": bondOurStatus,
    "bond_price_per_bond": bondPricePerBond,
    "bond_procurement_amount": bondProcurementAmount,
    "bond_product_note": bondProductNote,
    "bond_purchase_limit": bondPurchaseLimit,
    "bond_purchase_limit_metric": bondPurchaseLimitMetric,
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
