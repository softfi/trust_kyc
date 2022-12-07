import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bank_screen/bank_details.dart';
import 'package:trust_money/screens/demat_screen/demat.dart';
import 'package:trust_money/screens/profile/personal_profile_detals.dart';
import 'package:trust_money/utils/sharedPreference.dart';
import '../../utils/styles.dart';
import '../animated_screens/complete_bank_detail_animation.dart';
import '../animated_screens/complete_profile_animation.dart';
import 'my_personal_details.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  TabController? tabController;
  int selectedIndex = 0;
  bool barLine = true;
  bool tabVisible = false;

  getKycStatus() async {
    var isKyc = await HelperFunctions.getUserKycCompleted();
    if (isKyc == true) {
      setState(() {
        tabVisible = true;
        barLine = false;
      });
    }
  }

  @override
  void initState() {
    getKycStatus();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80.0),
        child: Column(
          children: [
            Container(
              height: 80,
              color: const Color(0xff00C6D8),
              child: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Stack(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon:
                              const Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                        Text(
                          "Profile",
                          style: ConstStyle.quickStandSmall11,
                        ),
                        Container(
                          width: 50,
                        )
                      ],
                    ),
                    Positioned(
                      left: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 2,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: -1,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Material(
                          elevation: 0,
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: const BoxDecoration(
                              color: Color(0xff00C6D8),
                            ),
                            foregroundDecoration: const RotatedCornerDecoration(
                              color: Colors.redAccent,
                              geometry: BadgeGeometry(
                                  width: 20, height: 20, cornerRadius: 0),
                            ),
                            child: Container(),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RotatedBox(
                    quarterTurns: 1,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 30, height: 28, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: Material(
                      elevation: 0,
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: const BoxDecoration(
                          color: Colors.redAccent,
                        ),
                        foregroundDecoration: const RotatedCornerDecoration(
                          color: Colors.white,
                          geometry: BadgeGeometry(
                              width: 28, height: 30, cornerRadius: 0),
                        ),
                        child: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
              padding: const EdgeInsets.only(bottom: 35.0),
              child: barLine ? orderTimeLine() : tabWidget()),
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
            TabBar(
              onTap: (int index) {
                setState(() {
                  selectedIndex = index;
                  tabController?.animateTo(index);
                });
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
                        colors: selectedIndex == 0
                            ? [const Color(0xffFFFFFF), const Color(0xffFFFFFF)]
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
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                        colors: selectedIndex == 1
                            ? [const Color(0xffFFFFFF), const Color(0xffFFFFFF)]
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
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
                        colors: selectedIndex == 2
                            ? [const Color(0xffFFFFFF), const Color(0xffFFFFFF)]
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
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
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
            ),
            const SizedBox(
              height: 20,
            ),
            IndexedStack(
              index: selectedIndex,
              children: <Widget>[
                Visibility(
                  visible: selectedIndex == 0,
                  maintainState: false,
                  child: PersonalProfile(
                    onClick1: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileAnimation()));
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: selectedIndex == 1,
                  maintainState: false,
                  child: BankAccounts(
                    onClick: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BankAnimation()));
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                ),
                Visibility(
                    visible: selectedIndex == 2,
                    maintainState: false,
                    child: DematAccount()),
              ],
            ),
          ]),
        ));
  }

  Widget orderTimeLine() {
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
                      Container(
                        width: 121,
                        height: 04,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1 || selectedIndex == 2
                              ? const Color(0xffFF405A)
                              : const Color(0xffc8c7ce),
                          shape: BoxShape.rectangle,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: selectedIndex == 1 || selectedIndex == 2
                              ? const Color(0xffFF405A)
                              : const Color(0xffc8c7ce),
                          shape: BoxShape.circle,
                        ),
                        child: const Text(""),
                      ),
                      Container(
                        width: 121,
                        height: 04,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? const Color(0xffFF405A)
                              : const Color(0xffc8c7ce),
                          shape: BoxShape.rectangle,
                        ),
                        child: const Text(""),
                      ),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: selectedIndex == 2
                              ? const Color(0xffFF405A)
                              : const Color(0xffc8c7ce),
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
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            IndexedStack(
              index: selectedIndex,
              children: <Widget>[
                Visibility(
                  visible: selectedIndex == 0,
                  maintainState: false,
                  child: PersonalProfile(
                    onClick1: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ProfileAnimation()));
                      setState(() {
                        selectedIndex = 1;
                      });
                    },
                  ),
                ),
                Visibility(
                  visible: selectedIndex == 1,
                  maintainState: false,
                  child: BankAccounts(
                    onClick: () async {
                      await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BankAnimation()));
                      setState(() {
                        selectedIndex = 2;
                      });
                    },
                  ),
                ),
                Visibility(
                    visible: selectedIndex == 2,
                    maintainState: false,
                    child: DematAccount()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
