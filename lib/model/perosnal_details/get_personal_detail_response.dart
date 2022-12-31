import 'dart:convert';

/// aadhar_name : "Parag Mahesh Bhansali"
/// aadhar_number : "xxxxxxxx6647"
/// address_city : "Mumbai Suburban"
/// address_line_1 : "NEAR KATYANI CHS, OFF MAHAKALI CAVES ROAD"
/// address_line_2 : "ANDHERI EAST"
/// address_line_3 : "Mumbai"
/// address_state : "Maharashtra"
/// address_state_code : ""
/// address_zip : "400093"
/// annual_income : 1
/// bank_account_count : 1
/// check_box_share_data_with_company : 1
/// check_box_share_data_with_govt : 1
/// city_sequence_no : ""
/// country_code : "+91"
/// customer_type : 1
/// dob : "1985-12-12"
/// ekyc_application_status : "1"
/// email_id : "shsys@shshs.com"
/// existing_demat_account_count : 1
/// filled_itr_last_2years : 0
/// firstname : "Ahahah"
/// fname : "Ahahah"
/// gender : 1
/// in_person_verification : 1
/// in_person_verification_remarks : "Lorem ipsum dolor sit amet consectetur adipisicing elit 1."
/// is_aadhar_verified : 1
/// is_email_verified : 1
/// is_mobile_verified : 1
/// is_pan_verified : 1
/// is_politically_exposed : 0
/// kra_status : "No"
/// lastname : "Fjfjjf"
/// lname : "Fjfjjf"
/// married_status : 1
/// mobile_number : "4444444444"
/// mothers_maiden_name : "Hhh"
/// new_demat_account_count : 0
/// occupation : "Professional"
/// pan_name : "CHETAN DILIP GHARMALKAR"
/// pan_number : "AAAPB2117A"
/// profile_image : ""
/// proof_back_image : null
/// proof_front_image : null
/// proof_type : null
/// trading_experience : 1
/// verification_video : "in_person_verification_video_a6caf45d-7f08-4a8b-b749-78e6dc953581.mp4}"
/// would_you_like_to_activate : 1

GetPersonalDetailModel getPersonalDetailModelFromJson(String str) =>
    GetPersonalDetailModel.fromJson(json.decode(str));

String getPersonalDetailModelToJson(GetPersonalDetailModel data) =>
    json.encode(data.toJson());

class GetPersonalDetailModel {
  GetPersonalDetailModel({
    String? aadharName,
    String? aadharNumber,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressLine3,
    String? addressState,
    String? addressStateCode,
    String? addressZip,
    num? annualIncome,
    num? bankAccountCount,
    num? checkBoxShareDataWithCompany,
    num? checkBoxShareDataWithGovt,
    String? citySequenceNo,
    String? countryCode,
    num? customerType,
    String? dob,
    String? ekycApplicationStatus,
    String? emailId,
    num? existingDematAccountCount,
    num? filledItrLast2years,
    String? firstname,
    String? fname,
    num? gender,
    num? inPersonVerification,
    String? inPersonVerificationRemarks,
    num? isAadharVerified,
    num? isEmailVerified,
    num? isMobileVerified,
    num? isPanVerified,
    num? isPoliticallyExposed,
    String? kraStatus,
    String? lastname,
    String? lname,
    num? marriedStatus,
    String? mobileNumber,
    String? mothersMaidenName,
    num? newDematAccountCount,
    String? occupation,
    String? panName,
    String? panNumber,
    String? profileImage,
    dynamic proofBackImage,
    dynamic proofFrontImage,
    dynamic proofType,
    num? tradingExperience,
    String? verificationVideo,
    num? wouldYouLikeToActivate,
  }) {
    _aadharName = aadharName;
    _aadharNumber = aadharNumber;
    _addressCity = addressCity;
    _addressLine1 = addressLine1;
    _addressLine2 = addressLine2;
    _addressLine3 = addressLine3;
    _addressState = addressState;
    _addressStateCode = addressStateCode;
    _addressZip = addressZip;
    _annualIncome = annualIncome;
    _bankAccountCount = bankAccountCount;
    _checkBoxShareDataWithCompany = checkBoxShareDataWithCompany;
    _checkBoxShareDataWithGovt = checkBoxShareDataWithGovt;
    _citySequenceNo = citySequenceNo;
    _countryCode = countryCode;
    _customerType = customerType;
    _dob = dob;
    _ekycApplicationStatus = ekycApplicationStatus;
    _emailId = emailId;
    _existingDematAccountCount = existingDematAccountCount;
    _filledItrLast2years = filledItrLast2years;
    _firstname = firstname;
    _fname = fname;
    _gender = gender;
    _inPersonVerification = inPersonVerification;
    _inPersonVerificationRemarks = inPersonVerificationRemarks;
    _isAadharVerified = isAadharVerified;
    _isEmailVerified = isEmailVerified;
    _isMobileVerified = isMobileVerified;
    _isPanVerified = isPanVerified;
    _isPoliticallyExposed = isPoliticallyExposed;
    _kraStatus = kraStatus;
    _lastname = lastname;
    _lname = lname;
    _marriedStatus = marriedStatus;
    _mobileNumber = mobileNumber;
    _mothersMaidenName = mothersMaidenName;
    _newDematAccountCount = newDematAccountCount;
    _occupation = occupation;
    _panName = panName;
    _panNumber = panNumber;
    _profileImage = profileImage;
    _proofBackImage = proofBackImage;
    _proofFrontImage = proofFrontImage;
    _proofType = proofType;
    _tradingExperience = tradingExperience;
    _verificationVideo = verificationVideo;
    _wouldYouLikeToActivate = wouldYouLikeToActivate;
  }

  GetPersonalDetailModel.fromJson(dynamic json) {
    _aadharName = json['aadhar_name'];
    _aadharNumber = json['aadhar_number'];
    _addressCity = json['address_city'];
    _addressLine1 = json['address_line_1'];
    _addressLine2 = json['address_line_2'];
    _addressLine3 = json['address_line_3'];
    _addressState = json['address_state'];
    _addressStateCode = json['address_state_code'];
    _addressZip = json['address_zip'];
    _annualIncome = json['annual_income'];
    _bankAccountCount = json['bank_account_count'];
    _checkBoxShareDataWithCompany = json['check_box_share_data_with_company'];
    _checkBoxShareDataWithGovt = json['check_box_share_data_with_govt'];
    _citySequenceNo = json['city_sequence_no'];
    _countryCode = json['country_code'];
    _customerType = json['customer_type'];
    _dob = json['dob'];
    _ekycApplicationStatus = json['ekyc_application_status'];
    _emailId = json['email_id'];
    _existingDematAccountCount = json['existing_demat_account_count'];
    _filledItrLast2years = json['filled_itr_last_2years'];
    _firstname = json['firstname'];
    _fname = json['fname'];
    _gender = json['gender'];
    _inPersonVerification = json['in_person_verification'];
    _inPersonVerificationRemarks = json['in_person_verification_remarks'];
    _isAadharVerified = json['is_aadhar_verified'];
    _isEmailVerified = json['is_email_verified'];
    _isMobileVerified = json['is_mobile_verified'];
    _isPanVerified = json['is_pan_verified'];
    _isPoliticallyExposed = json['is_politically_exposed'];
    _kraStatus = json['kra_status'];
    _lastname = json['lastname'];
    _lname = json['lname'];
    _marriedStatus = json['married_status'];
    _mobileNumber = json['mobile_number'];
    _mothersMaidenName = json['mothers_maiden_name'];
    _newDematAccountCount = json['new_demat_account_count'];
    _occupation = json['occupation'];
    _panName = json['pan_name'];
    _panNumber = json['pan_number'];
    _profileImage = json['profile_image'];
    _proofBackImage = json['proof_back_image'];
    _proofFrontImage = json['proof_front_image'];
    _proofType = json['proof_type'];
    _tradingExperience = json['trading_experience'];
    _verificationVideo = json['verification_video'];
    _wouldYouLikeToActivate = json['would_you_like_to_activate'];
  }

  String? _aadharName;
  String? _aadharNumber;
  String? _addressCity;
  String? _addressLine1;
  String? _addressLine2;
  String? _addressLine3;
  String? _addressState;
  String? _addressStateCode;
  String? _addressZip;
  num? _annualIncome;
  num? _bankAccountCount;
  num? _checkBoxShareDataWithCompany;
  num? _checkBoxShareDataWithGovt;
  String? _citySequenceNo;
  String? _countryCode;
  num? _customerType;
  String? _dob;
  String? _ekycApplicationStatus;
  String? _emailId;
  num? _existingDematAccountCount;
  num? _filledItrLast2years;
  String? _firstname;
  String? _fname;
  num? _gender;
  num? _inPersonVerification;
  String? _inPersonVerificationRemarks;
  num? _isAadharVerified;
  num? _isEmailVerified;
  num? _isMobileVerified;
  num? _isPanVerified;
  num? _isPoliticallyExposed;
  String? _kraStatus;
  String? _lastname;
  String? _lname;
  num? _marriedStatus;
  String? _mobileNumber;
  String? _mothersMaidenName;
  num? _newDematAccountCount;
  String? _occupation;
  String? _panName;
  String? _panNumber;
  String? _profileImage;
  dynamic _proofBackImage;
  dynamic _proofFrontImage;
  dynamic _proofType;
  num? _tradingExperience;
  String? _verificationVideo;
  num? _wouldYouLikeToActivate;

  GetPersonalDetailModel copyWith({
    String? aadharName,
    String? aadharNumber,
    String? addressCity,
    String? addressLine1,
    String? addressLine2,
    String? addressLine3,
    String? addressState,
    String? addressStateCode,
    String? addressZip,
    num? annualIncome,
    num? bankAccountCount,
    num? checkBoxShareDataWithCompany,
    num? checkBoxShareDataWithGovt,
    String? citySequenceNo,
    String? countryCode,
    num? customerType,
    String? dob,
    String? ekycApplicationStatus,
    String? emailId,
    num? existingDematAccountCount,
    num? filledItrLast2years,
    String? firstname,
    String? fname,
    num? gender,
    num? inPersonVerification,
    String? inPersonVerificationRemarks,
    num? isAadharVerified,
    num? isEmailVerified,
    num? isMobileVerified,
    num? isPanVerified,
    num? isPoliticallyExposed,
    String? kraStatus,
    String? lastname,
    String? lname,
    num? marriedStatus,
    String? mobileNumber,
    String? mothersMaidenName,
    num? newDematAccountCount,
    String? occupation,
    String? panName,
    String? panNumber,
    String? profileImage,
    dynamic proofBackImage,
    dynamic proofFrontImage,
    dynamic proofType,
    num? tradingExperience,
    String? verificationVideo,
    num? wouldYouLikeToActivate,
  }) =>
      GetPersonalDetailModel(
        aadharName: aadharName ?? _aadharName,
        aadharNumber: aadharNumber ?? _aadharNumber,
        addressCity: addressCity ?? _addressCity,
        addressLine1: addressLine1 ?? _addressLine1,
        addressLine2: addressLine2 ?? _addressLine2,
        addressLine3: addressLine3 ?? _addressLine3,
        addressState: addressState ?? _addressState,
        addressStateCode: addressStateCode ?? _addressStateCode,
        addressZip: addressZip ?? _addressZip,
        annualIncome: annualIncome ?? _annualIncome,
        bankAccountCount: bankAccountCount ?? _bankAccountCount,
        checkBoxShareDataWithCompany:
            checkBoxShareDataWithCompany ?? _checkBoxShareDataWithCompany,
        checkBoxShareDataWithGovt:
            checkBoxShareDataWithGovt ?? _checkBoxShareDataWithGovt,
        citySequenceNo: citySequenceNo ?? _citySequenceNo,
        countryCode: countryCode ?? _countryCode,
        customerType: customerType ?? _customerType,
        dob: dob ?? _dob,
        ekycApplicationStatus: ekycApplicationStatus ?? _ekycApplicationStatus,
        emailId: emailId ?? _emailId,
        existingDematAccountCount:
            existingDematAccountCount ?? _existingDematAccountCount,
        filledItrLast2years: filledItrLast2years ?? _filledItrLast2years,
        firstname: firstname ?? _firstname,
        fname: fname ?? _fname,
        gender: gender ?? _gender,
        inPersonVerification: inPersonVerification ?? _inPersonVerification,
        inPersonVerificationRemarks:
            inPersonVerificationRemarks ?? _inPersonVerificationRemarks,
        isAadharVerified: isAadharVerified ?? _isAadharVerified,
        isEmailVerified: isEmailVerified ?? _isEmailVerified,
        isMobileVerified: isMobileVerified ?? _isMobileVerified,
        isPanVerified: isPanVerified ?? _isPanVerified,
        isPoliticallyExposed: isPoliticallyExposed ?? _isPoliticallyExposed,
        kraStatus: kraStatus ?? _kraStatus,
        lastname: lastname ?? _lastname,
        lname: lname ?? _lname,
        marriedStatus: marriedStatus ?? _marriedStatus,
        mobileNumber: mobileNumber ?? _mobileNumber,
        mothersMaidenName: mothersMaidenName ?? _mothersMaidenName,
        newDematAccountCount: newDematAccountCount ?? _newDematAccountCount,
        occupation: occupation ?? _occupation,
        panName: panName ?? _panName,
        panNumber: panNumber ?? _panNumber,
        profileImage: profileImage ?? _profileImage,
        proofBackImage: proofBackImage ?? _proofBackImage,
        proofFrontImage: proofFrontImage ?? _proofFrontImage,
        proofType: proofType ?? _proofType,
        tradingExperience: tradingExperience ?? _tradingExperience,
        verificationVideo: verificationVideo ?? _verificationVideo,
        wouldYouLikeToActivate:
            wouldYouLikeToActivate ?? _wouldYouLikeToActivate,
      );

  String? get aadharName => _aadharName;

  String? get aadharNumber => _aadharNumber;

  String? get addressCity => _addressCity;

  String? get addressLine1 => _addressLine1;

  String? get addressLine2 => _addressLine2;

  String? get addressLine3 => _addressLine3;

  String? get addressState => _addressState;

  String? get addressStateCode => _addressStateCode;

  String? get addressZip => _addressZip;

  num? get annualIncome => _annualIncome;

  num? get bankAccountCount => _bankAccountCount;

  num? get checkBoxShareDataWithCompany => _checkBoxShareDataWithCompany;

  num? get checkBoxShareDataWithGovt => _checkBoxShareDataWithGovt;

  String? get citySequenceNo => _citySequenceNo;

  String? get countryCode => _countryCode;

  num? get customerType => _customerType;

  String? get dob => _dob;

  String? get ekycApplicationStatus => _ekycApplicationStatus;

  String? get emailId => _emailId;

  num? get existingDematAccountCount => _existingDematAccountCount;

  num? get filledItrLast2years => _filledItrLast2years;

  String? get firstname => _firstname;

  String? get fname => _fname;

  num? get gender => _gender;

  num? get inPersonVerification => _inPersonVerification;

  String? get inPersonVerificationRemarks => _inPersonVerificationRemarks;

  num? get isAadharVerified => _isAadharVerified;

  num? get isEmailVerified => _isEmailVerified;

  num? get isMobileVerified => _isMobileVerified;

  num? get isPanVerified => _isPanVerified;

  num? get isPoliticallyExposed => _isPoliticallyExposed;

  String? get kraStatus => _kraStatus;

  String? get lastname => _lastname;

  String? get lname => _lname;

  num? get marriedStatus => _marriedStatus;

  String? get mobileNumber => _mobileNumber;

  String? get mothersMaidenName => _mothersMaidenName;

  num? get newDematAccountCount => _newDematAccountCount;

  String? get occupation => _occupation;

  String? get panName => _panName;

  String? get panNumber => _panNumber;

  String? get profileImage => _profileImage;

  dynamic get proofBackImage => _proofBackImage;

  dynamic get proofFrontImage => _proofFrontImage;

  dynamic get proofType => _proofType;

  num? get tradingExperience => _tradingExperience;

  String? get verificationVideo => _verificationVideo;

  num? get wouldYouLikeToActivate => _wouldYouLikeToActivate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['aadhar_name'] = _aadharName;
    map['aadhar_number'] = _aadharNumber;
    map['address_city'] = _addressCity;
    map['address_line_1'] = _addressLine1;
    map['address_line_2'] = _addressLine2;
    map['address_line_3'] = _addressLine3;
    map['address_state'] = _addressState;
    map['address_state_code'] = _addressStateCode;
    map['address_zip'] = _addressZip;
    map['annual_income'] = _annualIncome;
    map['bank_account_count'] = _bankAccountCount;
    map['check_box_share_data_with_company'] = _checkBoxShareDataWithCompany;
    map['check_box_share_data_with_govt'] = _checkBoxShareDataWithGovt;
    map['city_sequence_no'] = _citySequenceNo;
    map['country_code'] = _countryCode;
    map['customer_type'] = _customerType;
    map['dob'] = _dob;
    map['ekyc_application_status'] = _ekycApplicationStatus;
    map['email_id'] = _emailId;
    map['existing_demat_account_count'] = _existingDematAccountCount;
    map['filled_itr_last_2years'] = _filledItrLast2years;
    map['firstname'] = _firstname;
    map['fname'] = _fname;
    map['gender'] = _gender;
    map['in_person_verification'] = _inPersonVerification;
    map['in_person_verification_remarks'] = _inPersonVerificationRemarks;
    map['is_aadhar_verified'] = _isAadharVerified;
    map['is_email_verified'] = _isEmailVerified;
    map['is_mobile_verified'] = _isMobileVerified;
    map['is_pan_verified'] = _isPanVerified;
    map['is_politically_exposed'] = _isPoliticallyExposed;
    map['kra_status'] = _kraStatus;
    map['lastname'] = _lastname;
    map['lname'] = _lname;
    map['married_status'] = _marriedStatus;
    map['mobile_number'] = _mobileNumber;
    map['mothers_maiden_name'] = _mothersMaidenName;
    map['new_demat_account_count'] = _newDematAccountCount;
    map['occupation'] = _occupation;
    map['pan_name'] = _panName;
    map['pan_number'] = _panNumber;
    map['profile_image'] = _profileImage;
    map['proof_back_image'] = _proofBackImage;
    map['proof_front_image'] = _proofFrontImage;
    map['proof_type'] = _proofType;
    map['trading_experience'] = _tradingExperience;
    map['verification_video'] = _verificationVideo;
    map['would_you_like_to_activate'] = _wouldYouLikeToActivate;
    return map;
  }
}
