import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/screens/bank_screen/bank_details.dart';
import 'package:trust_money/screens/home/personal_details.dart';
import '../../utils/styles.dart';
import '../../utils/sharedPreference.dart';
import '../demat_screen/demat_details.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool barLine = true;
  bool personalDetails = true;
  bool dematDetails = false;
  bool bankDetails = false;
  bool tabVisible = false;
  bool tab1 = true;
  bool tab2 = false;
  bool tab3 = false;

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
              color: Color(0xff00C6D8),
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
        // actions: [],
        // elevation: 0.6,
        // backgroundColor: const Color(0xff00C6D8),
        // leading: IconButton(
        //   icon: const Icon(Icons.arrow_back, color: Colors.white),
        //   onPressed: () => Navigator.of(context).pop(),
        // ),
        // centerTitle: true,
        // title: Text(
        //   "Profile",
        //   style: ConstStyle.quickStandSmall11,
        // ),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 35.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Visibility(
                    visible: barLine,
                    child: Align(
                      alignment: Alignment.center,
                      child: OrderTimeLine(
                        bankDetails: bankDetails,
                        dematDetails: dematDetails,
                      ),
                    ),
                  ),
                  Visibility(visible: tabVisible, child: tabWidget()),
                  SizedBox(height: 8),
                  Visibility(
                      visible: personalDetails,
                      child: PersonalDetails(
                        onTap: () {},
                      )),
                  Visibility(
                      visible: dematDetails,
                      child: DematDetails(
                        addNewDematAccounts: true,
                      )),
                  Visibility(
                      visible: bankDetails,
                      child: BankDetails(
                        addBankView: false,
                        cardView: true,
                      )),
                ],
              ),
            ),
          ),
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

  /*Widget orderTimeLine() {

  }*/

  Widget tabWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              tab1 = true;
              tab2 = false;
              tab3 = false;
              personalDetails = true;
              dematDetails = false;
              bankDetails = false;
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.black54),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  tab3 == false
                      ? tab2 == true
                          ? Color.fromRGBO(188, 188, 188, 1)
                          : Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(188, 188, 188, 1),
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
        const SizedBox(
          width: 0.5,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              tab1 = false;
              tab2 = true;
              tab3 = false;
              personalDetails = false;
              dematDetails = false;
              bankDetails = true;
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.black54),
              gradient: LinearGradient(
                colors: [
                  const Color.fromRGBO(255, 255, 255, 1),
                  tab3 == false
                      ? tab1 == true
                          ? Color.fromRGBO(188, 188, 188, 1)
                          : Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(188, 188, 188, 1),
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
        const SizedBox(
          width: 0.5,
        ),
        GestureDetector(
          onTap: () {
            setState(() {
              tab1 = false;
              tab2 = false;
              tab3 = true;
              personalDetails = false;
              dematDetails = true;
              bankDetails = false;
            });
          },
          child: Container(
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(width: 0.1, color: Colors.black54),
              gradient: LinearGradient(
                colors: [
                  Color.fromRGBO(255, 255, 255, 1),
                  tab2 == false
                      ? tab1 == true
                          ? Color.fromRGBO(188, 188, 188, 1)
                          : Color.fromRGBO(255, 255, 255, 1)
                      : Color.fromRGBO(188, 188, 188, 1),
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
    );
  }
}

class OrderTimeLine extends StatelessWidget {
  final bool dematDetails;
  final bool bankDetails;

  const OrderTimeLine(
      {Key? key, required this.dematDetails, required this.bankDetails})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 80,
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
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
          SizedBox(
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
                      child: Text(""),
                    ),
                    Container(
                      width: 121,
                      height: 04,
                      decoration: BoxDecoration(
                        color:
                            bankDetails ? Color(0xffFF405A) : Color(0xffc8c7ce),
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
                        color:
                            bankDetails ? Color(0xffFF405A) : Color(0xffc8c7ce),
                        shape: BoxShape.circle,
                      ),
                      child: Text(""),
                    ),
                    Container(
                      width: 121,
                      height: 04,
                      decoration: BoxDecoration(
                        color: dematDetails
                            ? Color(0xffFF405A)
                            : Color(0xffc8c7ce),
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(""),
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
                        color: dematDetails
                            ? Color(0xffFF405A)
                            : Color(0xffc8c7ce),
                        shape: BoxShape.circle,
                      ),
                      child: Text(""),
                    ),
                    Container(
                      width: 3,
                      height: 20,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                        shape: BoxShape.rectangle,
                      ),
                      child: Text(""),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
