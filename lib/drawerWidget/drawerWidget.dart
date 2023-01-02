import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_money/screens/kyc/profile/my_profile.dart';
import 'package:trust_money/screens/kyc/profile/setting.dart';
import 'package:trust_money/screens/order/my_order.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';
import '../getx_controller/profile/personal_details_controller.dart';
import '../screens/auths/choose_screen.dart';
import '../screens/home/home_page.dart';
import '../utils/google_sign_in.dart';
import '../utils/images.dart';
import '../utils/sharedPreference.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  bool? userIsLoggedIn;
  String firstName = "";
  String lastName = "";
  String customerID = "";
  String userName = "";
  bool isKYCPending = true;

  PersonalDetailsController _personalDetailsController =
      Get.find<PersonalDetailsController>();

  getLoggedInState() async {
    await HelperFunctions.getuserLoggedInSharedPreference().then((value) {
      setState(() {
        userIsLoggedIn = value;
      });
    });
    firstName = await HelperFunctions.getFirstName();
    lastName = await HelperFunctions.getLastName();
    customerID = await HelperFunctions.getCustomerID();
    userName = '${firstName[0]}${lastName[0]}';
    var isKyc = await HelperFunctions.getUserKycCompleted();
    if (isKyc == true) {
      setState(() {
        isKYCPending = false;
      });
    }
  }

  void _exitAppBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(35),
          ),
        ),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        builder: (context) {
          return BottomSheet(
            builder: (BuildContext context) {
              return StatefulBuilder(
                  builder: (BuildContext context, StateSetter State) {
                return Wrap(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        color: AppColors.textColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(35),
                          topRight: Radius.circular(35),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 35,
                          ),
                          Image.asset(
                            ConstantImage.error,
                            width: 75,
                            height: 75,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Are you sure, \nyou want to Logout?",
                              textAlign: TextAlign.center,
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 23),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  height: 45,
                                  width:
                                      MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white)),
                                  child: Center(
                                    child: Text(
                                      "Cancel",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 15,
                              ),
                              InkWell(
                                onTap: () async {
                                  // Navigator.pop(context);

                                  await HelperFunctions
                                      .saveuserLoggedInSharedPreference(false);
                                  await HelperFunctions.saveuserkyccompleted(
                                      false);
                                  SharedPreferences preferences =
                                      await SharedPreferences.getInstance();
                                  await preferences.clear();

                                  GoogleSignInProvider().logout();
                                  //alokalokalokalokalokalok
                                  Get.offAll(HomePage());
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             const SignIn()));
                                },
                                child: Container(
                                  height: 45,
                                  width: MediaQuery.of(context).size.width / 2.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.white),
                                      color: Colors.white),
                                  child: Center(
                                    child: Text(
                                      "Yes",
                                      style: GoogleFonts.quicksand(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: AppColors.textColor),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              });
            },
            onClosing: () {},
          );
        });
  }

  @override
  void initState() {
    super.initState();
    getLoggedInState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.1,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 170,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xffF2A9B0),
                    Color(0xffD9F3F7),
                  ],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 27.0),
                      child: Container(
                        height: 70,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: const Color(0xff00C6D8)),
                        child: Center(
                            child: Text(
                          userName != "" ? userName : "",
                          style: GoogleFonts.quicksand(
                              textStyle: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 2)),
                        )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, top: 40),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.55,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("$firstName $lastName",
                                overflow: TextOverflow.ellipsis,
                                style: ConstStyle.quickMedium),
                            Text(
                              "Customer ID: $customerID",
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.quicksand(
                                  textStyle: const TextStyle(
                                      color: Color(0xff23263B),
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500)),
                            ),
                            const SizedBox(
                              height: 18,
                            ),
                            Obx(() {
                              return (_personalDetailsController.modaltest.value
                                                  ?.ekycApplicationStatus ??
                                              "") !=
                                          "1" ||
                                      isKYCPending != true
                                  ? InkWell(
                                      onTap: () {
                                        (_personalDetailsController
                                                        .modaltest
                                                        .value
                                                        ?.ekycApplicationStatus ??
                                                    "") !=
                                                "1"
                                            ? Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ChooseScreen()))
                                            : Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyProfile()));
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 190,
                                        decoration: BoxDecoration(
                                            boxShadow: const [
                                              BoxShadow(
                                                color: Color(0x29000000),
                                                blurRadius: 4.0,
                                              ),
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(2),
                                            color: Colors.white),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Text(
                                              "Profile",
                                              style: GoogleFonts.quicksand(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xff23263D),
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                            ),
                                            Text(
                                              Strings.pending,
                                              style: GoogleFonts.quicksand(
                                                  textStyle: const TextStyle(
                                                      color: Color(0xffFF405A),
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                            ),
                                          ],
                                        ),
                                      ))
                                  : Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MyProfile()));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Color(0x29000000)
                                                    .withOpacity(0.11),
                                                spreadRadius: 1,
                                                blurRadius: 11,
                                                offset: const Offset(0, 3),
                                              ),
                                            ], color: Colors.white),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  "Profile",
                                                  style: GoogleFonts.quicksand(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xff23263D),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        const ProfileSetting()));
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 35,
                                            decoration:
                                                BoxDecoration(boxShadow: [
                                              BoxShadow(
                                                color: Color(0x29000000)
                                                    .withOpacity(0.11),
                                                spreadRadius: 1,
                                                blurRadius: 11,
                                                offset: const Offset(0, 3),
                                              ),
                                            ], color: Colors.white),
                                            child: Center(
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 16.0),
                                                child: Text(
                                                  "Setting",
                                                  style: GoogleFonts.quicksand(
                                                      textStyle:
                                                          const TextStyle(
                                                              color: Color(
                                                                  0xff23263D),
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold)),
                                                ),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                            })
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 8.0, top: 20),
                        child: Align(
                            alignment: Alignment.topRight,
                            child: Icon(
                              Icons.clear,
                              size: 20,
                            )),
                      ),
                    )
                  ],
                ),
              ),
            ),
            _space,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Watchlist",
                style: ConstStyle.quickMedium,
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            ),
            _space,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Portfolio",
                style: ConstStyle.quickMedium,
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            ),
            _space,
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Order()));
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Orders",
                  style: ConstStyle.quickMedium,
                ),
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            ),
            _space,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Add Funds",
                style: ConstStyle.quickMedium,
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            ),
            _space,
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Transaction Report",
                style: ConstStyle.quickMedium,
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            ),
            _space,
            InkWell(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Text(
                  "Setting",
                  style: ConstStyle.quickMedium,
                ),
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            ),
            _space,
            InkWell(
              onTap: () {
                Navigator.pop(context);
                _exitAppBottomSheet(context);
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: Text(
                    "Log Out",
                    style: ConstStyle.quickMedium,
                  ),
                ),
              ),
            ),
            _space1,
            const Divider(
              thickness: .4,
              indent: 5,
              color: AppColors.primaryColor,
              endIndent: 5,
            )
          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 10);

  Widget get _space1 => const SizedBox(height: 8);
}
