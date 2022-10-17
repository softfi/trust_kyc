import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';

class HelperFunctions {
  static String sharedPreferenceUserLoggedInKey = 'LOGGEDIN';
  static String SaveDate = "1";
  static String saveUserKYCDone = 'kycdone';
  static String firstName = "firstName";
  static String lastName = "lastName";
  static String panName = "panName";
  static String dob = "dob";
  static String customerID = "customerID";
  static String mobno = "phone";
  static String hashkey = "hash_key";
  static String stoken = "token";
  static String profileImage = "profileImage";
  static String frontImage = "frontImage";
  static String backImage = "backImage";
  static String SignatureImage = "backImage";

  /* static String srefreshtoken = "refreshtoken";*/
  static String emailid = "emailid";

  static Future saveFirstName(String fname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(firstName, fname);
  }

  static Future saveLastName(String lname) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(lastName, lname);
  }

  static Future savePanName(String pName) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(panName, pName);
  }

  static Future saveDOB(String dateOfBirth) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(dob, dateOfBirth);
  }

  static Future saveCustomerID(String id) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(customerID, id);
  }

  static Future savePhoneNumber(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(mobno, number);
  }

  static Future savehashkey(String number) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(hashkey, number);
  }

  static Future savetoken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(stoken, token);
  }

  static Future saveProfileImage(String pImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(profileImage, pImage);
  }

  static Future saveFrontImage(String fImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(frontImage, fImage);
  }

  static Future saveSignatureImage(String SImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(SignatureImage, SImage);
  }

  static Future saveBackImage(String bImage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(backImage, bImage);
  }

  static Future saveEmail(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(emailid, email);
  }

  static Future<bool> saveuserLoggedInSharedPreference(
      bool isuserLoggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(sharedPreferenceUserLoggedInKey, isuserLoggedIn);
  }

  static Future<bool> saveuserkyccompleted(bool isuserkycdone) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setBool(saveUserKYCDone, isuserkycdone);
  }

  static Future<bool?> getUserKycCompleted() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(saveUserKYCDone);
  }

  static Future<bool?> getuserLoggedInSharedPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getBool(sharedPreferenceUserLoggedInKey);
  }

  static Future getFirstName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(firstName);
  }

  static Future getLastName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(lastName);
  }

  static Future getPanName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(panName);
  }

  static Future getCustomerID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(customerID);
  }

  static Future getDOB() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(dob);
  }

  static Future getPhoneNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(mobno);
  }

  static Future getHashKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(hashkey);
  }

  static Future<String> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(stoken) ?? "";
  }

  static Future<String> getProfileImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(profileImage) ?? "";
  }

  static Future<String> getSignatureImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(SignatureImage) ?? "";
  }

  static Future<String> getFrontImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(frontImage) ?? "";
  }

  static Future<String> getBackImage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(backImage) ?? "";
  }

/*static Future<String> getRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(srefreshtoken)??"";
  }*/
  static Future getEmailId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(emailid);
  }

  static Future getDate() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.getString(SaveDate);
  }
}
