import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/animated_screens/complete_bank_detail_animation.dart';
import 'package:trust_money/screens/kyc/bank_screen/bank_details.dart';
import 'package:trust_money/screens/kyc/demat_screen/demat.dart';
import 'package:trust_money/screens/kyc/profile/personal_detals/my_personal_details.dart';
import 'package:trust_money/utils/app_bar.dart';
import 'package:trust_money/utils/styles.dart';
import '../../../getx_controller/profile/personal_details_controller.dart';

// class MyProfile extends StatefulWidget {
//   const MyProfile({Key? key}) : super(key: key);
//   @override
//   State<MyProfile> createState() => _MyProfileState();
// }
//
// class _MyProfileState extends State<MyProfile> {
//   TabController? tabController;
//   int selectedIndex = 0;
//   bool barLine = false;
//   bool tabVisible = true;
//
//   getKycStatus() async {
//     var isKyc = await HelperFunctions.getUserKycCompleted();
//     if (isKyc == true) {
//       setState(() {
//         tabVisible = true;
//         barLine = false;
//       });
//     }
//   }
//
//   @override
//   void initState() {
//     getKycStatus();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppToolbar.appBar(
//           "Profile",
//           IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.of(context).pop(),
//           ),
//           IconButton(
//             icon: Container(
//                 padding: const EdgeInsets.all(1),
//                 decoration: const BoxDecoration(
//                     color: Colors.transparent, shape: BoxShape.circle),
//                 child: const Icon(Icons.person,
//                     size: 20, color: Colors.transparent)),
//             onPressed: () {},
//           )),
//       body: Stack(
//         fit: StackFit.expand,
//         children: [
//           Positioned(
//             left: 0,
//             bottom: 0,
//             child: RotatedBox(
//               quarterTurns: 2,
//               child: Material(
//                 elevation: 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   foregroundDecoration: const RotatedCornerDecoration(
//                     color: Colors.redAccent,
//                     geometry:
//                         BadgeGeometry(width: 22, height: 22, cornerRadius: 0),
//                   ),
//                   child: Container(),
//                 ),
//               ),
//             ),
//           ),
//           Positioned(
//             right: 0,
//             bottom: 0,
//             child: RotatedBox(
//               quarterTurns: 1,
//               child: Material(
//                 elevation: 0,
//                 child: Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: const BoxDecoration(
//                     color: Colors.white,
//                   ),
//                   foregroundDecoration: const RotatedCornerDecoration(
//                     color: Colors.redAccent,
//                     geometry:
//                         BadgeGeometry(width: 22, height: 22, cornerRadius: 0),
//                   ),
//                   child: Container(),
//                 ),
//               ),
//             ),
//           ),
//           Padding(
//               padding: const EdgeInsets.only(bottom: 35.0),
//               child: barLine ? orderTimeLine() : tabWidget()),
//         ],
//       ),
//     );
//   }
//
// }

class MyProfile extends StatelessWidget {
  MyProfile({Key? key}) : super(key: key);
  PersonalDetailsController _profileController =
      Get.put(PersonalDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "Profile",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.transparent, shape: BoxShape.circle),
                child: const Icon(Icons.person,
                    size: 20, color: Colors.transparent)),
            onPressed: () {},
          )),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 2,
              child: Material(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.redAccent,
                    geometry:
                        BadgeGeometry(width: 22, height: 22, cornerRadius: 0),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: RotatedBox(
              quarterTurns: 1,
              child: Material(
                elevation: 0,
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                  ),
                  foregroundDecoration: const RotatedCornerDecoration(
                    color: Colors.redAccent,
                    geometry:
                        BadgeGeometry(width: 22, height: 22, cornerRadius: 0),
                  ),
                  child: Container(),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: _profileController.barLine.value
                  ? orderTimeLine()
                  : tabWidget()),
        ],
      ),
    );
  }

  tabWidget() {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: <
                  Widget>[
            Obx(() => TabBar(
                  onTap: (int index) {
                    _profileController.selectedIndex.value = index;
                    _profileController.tabController.value!.animateTo(index);
                  },
                  padding: EdgeInsets.all(0),
                  indicatorPadding: EdgeInsets.all(0),
                  labelPadding: EdgeInsets.all(0),
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorColor: Colors.transparent,
                  automaticIndicatorColorAdjustment: true,
                  indicatorWeight: 1,
                  isScrollable: true,
                  tabs: [
                    Tab(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 11,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: _profileController.selectedIndex.value == 0
                                ? [
                                    const Color(0xffFFFFFF),
                                    const Color(0xffFFFFFF)
                                  ]
                                : [
                                    const Color(0xffFFFFFF).withOpacity(0.79),
                                    const Color(0xffBCBCBC).withOpacity(0.79)
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              "Personal Details",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 11,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: _profileController.selectedIndex.value == 1
                                ? [
                                    const Color(0xffFFFFFF),
                                    const Color(0xffFFFFFF)
                                  ]
                                : [
                                    const Color(0xffFFFFFF).withOpacity(0.79),
                                    const Color(0xffBCBCBC).withOpacity(0.79)
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              "Bank Details",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Tab(
                      child: Container(
                        height: 40,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.05),
                              spreadRadius: 1,
                              blurRadius: 11,
                              offset: const Offset(0, 3),
                            ),
                          ],
                          gradient: LinearGradient(
                            colors: _profileController.selectedIndex.value == 2
                                ? [
                                    const Color(0xffFFFFFF),
                                    const Color(0xffFFFFFF)
                                  ]
                                : [
                                    const Color(0xffFFFFFF).withOpacity(0.79),
                                    const Color(0xffBCBCBC).withOpacity(0.79)
                                  ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                        child: Center(
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 18.0),
                            child: Text(
                              "Demat Details",
                              style: GoogleFonts.quicksand(
                                textStyle: const TextStyle(
                                    color: Color(0xff22263D),
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            Obx(() => IndexedStack(
                  index: _profileController.selectedIndex.value,
                  children: <Widget>[
                    Visibility(
                      visible: _profileController.selectedIndex.value == 0,
                      maintainState: false,
                      child: MyPersonalDetails(),
                    ),
                    Visibility(
                      visible: _profileController.selectedIndex.value == 1,
                      maintainState: false,
                      child: BankAccounts(
                        onClick: () async {
                          Get.to(const BankAnimation());
                          _profileController.selectedIndex.value = 2;
                        },
                      ),
                    ),
                    Visibility(
                        visible: _profileController.selectedIndex.value == 2,
                        maintainState: false,
                        child: DematAccount()),
                  ],
                )),
          ]),
        ));
  }

  Widget orderTimeLine() {
    debugPrint("000000000000 ${_profileController.selectedIndex.value}");
    return Container(
      height: 80,
      decoration: const BoxDecoration(color: Colors.white),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 400,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 01", style: ConstStyle.quickStandMediumtime),
                      Text("Personal Details",
                          style: ConstStyle.quickStandMediumsubtile),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 02", style: ConstStyle.quickStandMediumtime),
                      Text("Bank Details",
                          style: ConstStyle.quickStandMediumsubtile),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Step 03", style: ConstStyle.quickStandMediumtime),
                      Text("Demat Details",
                          style: ConstStyle.quickStandMediumsubtile),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            SizedBox(
              width: 281,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: Color(0xffff405a),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(""),
                      ),
                      Obx(() => Container(
                            width: 121,
                            height: 04,
                            decoration: BoxDecoration(
                              color: _profileController.selectedIndex.value ==
                                          1 ||
                                      _profileController.selectedIndex.value ==
                                          2
                                  ? Color(0xffFF405A)
                                  : Color(0xffc8c7ce),
                              shape: BoxShape.rectangle,
                            ),
                          )),
                    ],
                  ),
                  Obx(() => Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: _profileController.selectedIndex.value ==
                                          1 ||
                                      _profileController.selectedIndex.value ==
                                          2
                                  ? const Color(0xffFF405A)
                                  : const Color(0xffc8c7ce),
                              // color: Color(0xffff405a),
                              shape: BoxShape.circle,
                            ),
                            child: const Text(""),
                          ),
                          Obx(() => Container(
                                width: 121,
                                height: 04,
                                decoration: BoxDecoration(
                                  color:
                                      _profileController.selectedIndex.value == 1 &&
                                              _profileController.selectedIndex.value == 2
                                          ? const Color(0xffFF405A)
                                          : const Color(0xffc8c7ce),
                                  // color: Color(0xffc8c7ce),
                                  shape: BoxShape.rectangle,
                                ),
                                child: const Text(""),
                              )),
                        ],
                      )),
                  Obx(() => Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: _profileController.selectedIndex.value == 2
                                  ? const Color(0xffFF405A)
                                  : const Color(0xffc8c7ce),
                              // color: Color(0xffc8c7ce),
                              shape: BoxShape.circle,
                            ),
                            child: const Text(""),
                          ),
                          Container(
                            width: 3,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Colors.transparent,
                              shape: BoxShape.rectangle,
                            ),
                            child: const Text(""),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(() => IndexedStack(
                  index: _profileController.selectedIndex.value,
                  children: <Widget>[
                    Visibility(
                      visible: _profileController.selectedIndex.value == 0,
                      maintainState: false,
                      child: MyPersonalDetails(),
                    ),
                    Visibility(
                      visible: _profileController.selectedIndex.value == 1,
                      maintainState: false,
                      child: BankAccounts(
                        onClick: () async {
                          Get.to(const BankAnimation());
                          _profileController.selectedIndex.value = 2;
                        },
                      ),
                    ),
                    Visibility(
                        visible: _profileController.selectedIndex.value == 2,
                        maintainState: false,
                        child: DematAccount()),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
