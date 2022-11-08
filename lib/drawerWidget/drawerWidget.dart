import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trust_money/screens/auths/sign_up.dart';
import 'package:trust_money/screens/order/my_order.dart';
import 'package:trust_money/screens/profile/personal_profile_detals.dart';
import 'package:trust_money/screens/profile/setting.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';
import '../screens/profile/my_profile.dart';
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

  _exitApp(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Are you sure to logout?',
            style: GoogleFonts.quicksand(
              textStyle: const TextStyle(
                  color: Color(0xff22263D),
                  fontWeight: FontWeight.w600,
                  fontSize: 18),
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: Text('No',
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: AppColors.btnColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                // SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                setState(() async {
                  await HelperFunctions.saveuserLoggedInSharedPreference(false);
                  await HelperFunctions.saveuserkyccompleted(false);
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  await preferences.clear();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                });
              },
              child: Text('Yes',
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Colors.green,
                        fontWeight: FontWeight.w600,
                        fontSize: 17),
                  )),
            ),
          ],
        );
      },
    );
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
          children: <Widget>[
            Container(
              height: 190,
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
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
                        Padding(
                          padding: const EdgeInsets.only(left: 10, top: 72),
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
                                isKYCPending
                                    ? InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const MyProfile()));
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
                                                        color:
                                                            Color(0xff23263D),
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.bold)),
                                              ),
                                              Text(
                                                Strings.pending,
                                                style: GoogleFonts.quicksand(
                                                    textStyle: const TextStyle(
                                                        color:
                                                            Color(0xffFF405A),
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
                                                          const MyProfile()));
                                            },
                                            child: Container(
                                              height: 35,
                                              width: 100,
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
                                              height: 35,
                                              width: 100,
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
                                          )
                                        ],
                                      ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 10.0, top: 35),
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
                _exitApp(context);
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
