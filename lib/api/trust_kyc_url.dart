class TrustKycUrl {
  static const baseUrl = 'https://trust-api.trustmony.com/';

  //sign up
  static const signUpUrl = 'api/v1/send_otp_mobile';

  //otp verify
  static const verifyOtp = 'api/v1/verify_otp_mobile';

  //send email otp
  static const sentEmailOTP = 'api/v1/send_otp_email';

  //otp email verify
  static const verifyEmailOtp = 'api/v1/verify_otp_email';

  //verifyEmail
  static const verifyEmail = 'api/v1/oauth2_verify_email';

  //opt wit email
  static const login_mobile_otp_verify = 'api/v1/login_mobile_otp_verify';

  //personal detail
  static const personalDetail = 'api/v1/personal_details';
  static const getVideoVerificationCode = 'api/v1/in_person_video_verification_code';

  //DropDowns
  static const getState = 'api/v1/state';
  static const getCity = 'api/v1/city';
  static const profession = 'api/v1/profession_dropdown';
  static const addressProof = 'api/v1/proof_dropdown';
  static const relationship = 'api/v1/relationship_with_application';
  static const nomineeIdentity = 'api/v1/nominee_proof_dropdown';
  static const born = 'api/v1/where_you_born';
  static const wealth = 'api/v1/primary_source_of_wealth';

  //bank detail
  static const bankDetailWithCheck = 'api/v1/bank_details';
  static const bankDetail = 'api/v1/razorpay_bank_details';
  static const getIFSC = 'api/v1/ifsc_code';

  //demat detail
  static const dematDetail = 'api/v1/new_demat_account_details';
  static const getdematDetail = 'api/v1/new_demat_account_details';
  static const deleteDemat = 'api/v1/new_demat_account_details';
  static const deleteExixtingDemat = 'api/v1/existing_demat_account_details';
  static const existingDemat = 'api/v1/existing_demat_account_details';
  static const addNomineeDetail = 'api/v1/nominee_details';
  static const alldemat = 'api/v1/all_demat_account_get';
  static const eSign = 'api/v1/esign_pdf?platform=mobile';

  //upload images
  static const signatureUpload = 'api/v1/signature_image_upload';
  static const proofImage = 'api/v1/proof_image_upload';
      static const personVerification = 'api/v1/in_person_video_verification_video';

  //digilocker
  static const authenticateDigilocker = 'api/v1/authentication_digilocker';
  static const getDigiLocker = 'api/v1/digilocker_details';

  //bond
  static const updateBarStatus = '${baseUrl}api/v1/kyc_progressbar_status';
  //pan card
  static const getPANCard = 'api/v1/pan_verify';
  static const cvlKRA = 'api/v1/cvl_kra';

  //bond
 static const bondList="api/v1/bonds_list";
 static const specificBondsList="/api/v1/specific_bonds_list";
 static const inestmentCalculator="/api/v1/investment_calculator";
}
