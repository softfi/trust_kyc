import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/images.dart';

import '../../utils/colorsConstant.dart';

late final TabController? _controller;
var first_list = [
  "Ulta Short Bonds",
  "Highly Safe Bonds",
  "Tax Free Bonds",
  "Bonds for Senior Citizen",
  "Satae Governmnet Guaranteed Bonds",
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
    // TODO: implement initState
    _controller = TabController(length: 3, vsync: this, initialIndex: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Collection_ofBonds_AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
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

  Collection_ofBonds_AppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Color(0xffffFFFFFF)),
      backgroundColor: Color(0xff00C6D8),
      title: Text("COLLECTION OF BONDS",
          style: GoogleFonts.quicksand(
            textStyle: const TextStyle(
                color: Color(0xffffFFFFFF),
                fontWeight: FontWeight.w500,
                fontSize: 19),
          )),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.notifications_none,
              color: Color(0xffffFFFFFF),
            ))
      ],
    );
  }

  Card_ui() {
    return Card(
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
              bottom: 78,
              left: 10,
              child: Text(
                "BOND, sirf aapake liye!",
                softWrap: true,
                style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontSize: 18,
                        fontWeight: FontWeight.w500)),
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
                automaticIndicatorColorAdjustment: false,
                isScrollable: false,
                tabs: [
                  Tab(
                    child: Container(
                      height: 45,
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
                  Tab(
                    child: Container(
                      height: 45,
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
                  Tab(
                    child: Container(
                      height: 45,
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
                ],
              ),
              const SizedBox(height: 20,),
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
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffEAF8FA).withOpacity(0.4),
              Color(0xffF9EEEE).withOpacity(0.4)
            ], begin: Alignment.topCenter, end: Alignment.topRight)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                title: Text(
                  first_list[index],
                  style: GoogleFonts.quicksand(
                      textStyle: const TextStyle(
                          color: Color(0xff22263D),
                          fontSize: 17,
                          fontWeight: FontWeight.w500)),
                ),
                trailing: Image.asset(
                  ConstantImage.aboutUs6,
                  height: 100,
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
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xffEAF8FA).withOpacity(0.4),
              Color(0xffF9EEEE).withOpacity(0.4)
            ], begin: Alignment.topCenter, end: Alignment.topRight)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: ListTile(
                  title: Text(
                    first_list[index],
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ),
                  trailing: Image.asset(
                    ConstantImage.aboutUs6,
                    height: 100,
                  )),
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
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                Color(0xffEAF8FA).withOpacity(0.4),
                Color(0xffF9EEEE).withOpacity(0.4)
              ], begin: Alignment.topCenter, end: Alignment.topRight)),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                child: ListTile(
                  title: Text(
                    first_list[index],
                    style: GoogleFonts.quicksand(
                        textStyle: const TextStyle(
                            color: Color(0xff22263D),
                            fontSize: 17,
                            fontWeight: FontWeight.w500)),
                  ),
                  trailing: Image.asset(
                    ConstantImage.aboutUs6,
                    height: 100,
                  ),
                ),
              )),
        );
      },
    );
  }
}
