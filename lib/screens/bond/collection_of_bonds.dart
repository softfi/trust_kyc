import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/bond/read_bonds.dart';
import 'package:trust_money/utils/images.dart';

import '../../bottom_navigation/bottom_navigation.dart';
import '../../utils/app_bar.dart';
import '../../utils/colorsConstant.dart';

// late final TabController? _controller;
var first_list = [
  "Ultra Short Term Bonds",
  "Highly Safe Bonds",
  "Tax Free Bonds",
  "Bonds for Senior Citizen",
  "State Governmnet Guaranteed Bonds",
  "Public Sector Bank Bonds"
];

class CollectionOfBonds extends StatefulWidget {
  const CollectionOfBonds({Key? key}) : super(key: key);

  @override
  State<CollectionOfBonds> createState() => _CollectionOfBondsState();
}

class _CollectionOfBondsState extends State<CollectionOfBonds>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "COLLECTION OF BONDS",
          const Padding(
            padding: EdgeInsets.only(left: 8.0),
            child: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.notifications_none,
                color: Color(0xffffFFFFFF),
              ))),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Card_ui(),
              const SizedBox(
                height: 20,
              ),
              Tab_Bar_View()
            ],
          ),
        ),
      ),
    );
  }

  Card_ui() {
    return Card(
      elevation: 5,
      child: Stack(children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x29000000),
                      blurRadius: 1.0,
                    ),
                  ],
                  color: Colors.white),
              child: Image.asset(
                ConstantImage.collection_container_bg,
              ),
            ),
            Positioned(
              top: 0,
              right: -8,
              child: Image.asset(
                ConstantImage.leaf,
                color: Color(0xffFF405A).withOpacity(0.7),
                height: 350,
              ),
            ),
            Positioned(
              top: 38,
              left: 10,
              child: SizedBox(
                width: 200,
                child: Text(
                  "Bonds curated based on our expert’s insights and your needs",
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontSize: 14,
                          fontWeight: FontWeight.w500)),
                ),
              ),
            ),
            Positioned(
              bottom: 65,
              left: 10,
              child: Text(
                "BOND, sirf aapake liye!",
                softWrap: true,
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  Tab_Bar_View() {
    return DefaultTabController(
        length: 3,
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TabBar(
                onTap: (int index) {
                  setState(() {
                    selectedIndex = index;
                    tabController?.animateTo(index);
                  });
                },
                padding: EdgeInsets.zero,
                indicatorPadding: EdgeInsets.zero,
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.tab,
                indicatorColor: Colors.transparent,
                automaticIndicatorColorAdjustment: true,
                isScrollable: true,
                tabs: [
                  Tab(
                    child: Container(
                      height: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: selectedIndex == 0
                            ? Colors.white
                            : AppColors.textColor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Trending",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: selectedIndex == 0
                                        ? AppColors.textColor
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
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
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: selectedIndex == 1
                            ? Colors.white
                            : AppColors.textColor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Popular",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: selectedIndex == 1
                                        ? AppColors.textColor
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
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
                            color: Colors.grey.withOpacity(0.25),
                            spreadRadius: 2,
                            blurRadius: 11,
                            offset: const Offset(0, 3),
                          ),
                        ],
                        color: selectedIndex == 2
                            ? Colors.white
                            : AppColors.textColor,
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5.0),
                          child: Text(
                            "Entire Collection",
                            style: GoogleFonts.quicksand(
                                textStyle: TextStyle(
                                    color: selectedIndex == 2
                                        ? AppColors.textColor
                                        : Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold)),
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
                    maintainState: true,
                    visible: selectedIndex == 0,
                    child: First_listView(),
                  ),
                  Visibility(
                    child: Second_listView(),
                    maintainState: true,
                    visible: selectedIndex == 1,
                  ),
                  Visibility(
                    child: Third_listView(),
                    maintainState: true,
                    visible: selectedIndex == 2,
                  ),
                ],
              ),
            ]));
  }

  First_listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: first_list.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReadBonds()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: const LinearGradient(
                      colors: [Color(0xffEAF8FA), Color(0xffF9EEEE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ListTile(
                  title: Text(
                    first_list[index],
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                  trailing: Image.asset(
                    ConstantImage.aboutUs6,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Second_listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: first_list.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReadBonds()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                      colors: [Color(0xffEAF8FA), Color(0xffF9EEEE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ListTile(
                  title: Text(
                    first_list[index],
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                  trailing: Image.asset(
                    ConstantImage.aboutUs6,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Third_listView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: first_list.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ReadBonds()));
            },
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                      colors: [Color(0xffEAF8FA), Color(0xffF9EEEE)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ListTile(
                  title: Text(
                    first_list[index],
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 17,
                            fontWeight: FontWeight.bold)),
                  ),
                  trailing: Image.asset(
                    ConstantImage.aboutUs6,
                    height: 100,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
