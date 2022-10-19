import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/styles.dart';

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
            children: [Card_ui(), Tab_Bar_View()],
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


        Container(


          height: 220,
          alignment: Alignment(10, 98),
          decoration: BoxDecoration(image: DecorationImage(image: AssetImage( ConstantImage.collection_container_bg))),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    top: 40,
                    left: 15,
                    right: MediaQuery.of(context).size.width / 3),
                child: Text(
                  "Bonds curated based on our expert’s insights and your needs",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 15),
                child: Text(
                  "BOND, sirf aapake liye!",
                  style: GoogleFonts.quicksand(
                    textStyle: const TextStyle(
                        color: Color(0xff22263D),
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Image.asset(
        //   ConstantImage.collection_container_bg,
        //   height: 220,
        //   width: MediaQuery.of(context).size.width,
        // ),
      ]),
    );
  }

  Tab_Bar_View() {
    return DefaultTabController(
        length: 3, // length of tabs
        initialIndex: 0,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Card(
                child: Container(
                  height: 39,
                  margin: EdgeInsets.only(top: 2),
                  child: TabBar(
                    onTap: (int index) {
                      setState(() {
                        selectedIndex = index;
                        tabController?.animateTo(index);
                      });
                    },
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
                    indicatorWeight: 3.5,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorColor: Colors.blue,
                    labelColor: Colors.white,
                    unselectedLabelColor: Colors.grey,
                    automaticIndicatorColorAdjustment: true,
                    isScrollable: true,
                    indicator: BoxDecoration(color: Colors.black),
                    tabs: [
                      Tab(text: ' Trending '),
                      Tab(text: ' Popular '),
                      Tab(text: ' Entire Collection '),
                    ],
                  ),
                ),
              ),
              IndexedStack(
                children: <Widget>[
                  Visibility(
                    child: Container(
                      height: 800,
                      child: First_listView(),
                    ),
                    maintainState: true,
                    visible: selectedIndex == 0,
                  ),
                  Visibility(
                    child: Container(
                      height: 800,
                      child: Second_listView(),
                    ),
                    maintainState: true,
                    visible: selectedIndex == 1,
                  ),
                  Visibility(
                    child: Container(
                      height: 800,
                      child: Third_listView(),
                    ),
                    maintainState: true,
                    visible: selectedIndex == 2,
                  ),
                ],
                index: selectedIndex,
              ),
            ]));

    // DefaultTabController(
    //   initialIndex: 0,
    //   length: 3,
    //   child:Column(
    //     children: [
    //       Container(
    //         child: TabBar(
    //           onTap: (int index)
    //           {
    //             setState((){
    //               print(index);
    //               selectedIndex =index;
    //               print(selectedIndex);
    //               tabController?.animateTo(index);
    //             });
    //           },
    //           // isScrollable: true,
    //           indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
    //           indicatorWeight: 4,
    //           tabs: [
    //             Tab(text: "Trending",),
    //             Tab(text: "Popular",),
    //             Tab(text: "Entire Collection",)
    //           ],
    //         ),
    //       ),
    //       IndexedStack(
    //
    //         children: [
    //           Visibility(
    //             child: Container(
    //               height: 100,
    //               color: Colors.black,
    //             ),
    //             visible: selectedIndex==0,
    //           ),
    //
    //
    //
    //           Visibility(
    //             child: Container(
    //               height: 100,
    //               color: Colors.blue,
    //             ),
    //             visible: selectedIndex==1,
    //           ),
    //
    //
    //
    //           Visibility(
    //             child: Container(
    //               height: 100,
    //               color: Colors.yellow,
    //             ),
    //             visible: selectedIndex==2,
    //           ),
    //
    //
    //         ],
    //         index: selectedIndex,
    //       )
    //     ],
    //   ));
  }

  First_listView() {
    return ListView.builder(
      itemCount: first_list.length,
      itemBuilder: (context, int index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffEAF8FA), Color(0xffF9EEEE)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: ListTile(
              title: Text(first_list[index]),
              trailing: Icon(Icons.icecream_outlined),
            ),
          ),
        );
      },
    );
  }

  Second_listView() {
    return ListView.builder(
      itemCount: first_list.length,
      itemBuilder: (context, int index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffEAF8FA), Color(0xffF9EEEE)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: ListTile(
              title: Text(first_list[index]),
              trailing: Icon(Icons.icecream_outlined),
            ),
          ),
        );
      },
    );
  }

  Third_listView() {
    return ListView.builder(
      itemCount: first_list.length,
      itemBuilder: (context, int index) {
        return Card(
          child: Container(
            alignment: Alignment.center,
            height: 80,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xffEAF8FA), Color(0xffF9EEEE)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight)),
            child: ListTile(
              title: Text(first_list[index]),
              trailing: Icon(Icons.icecream_outlined),
            ),
          ),
        );
      },
    );
  }
}
