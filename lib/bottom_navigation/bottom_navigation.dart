import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/screens/home/home_page.dart';
import 'package:trust_money/screens/order/my_order.dart';
import '../screens/bond/learn_bonds/learn_bond.dart';
import '../screens/chat/chat_page.dart';
import '../utils/images.dart';

class CustomBottomNavigation extends StatefulWidget {
  CustomBottomNavigation({Key? key, required this.currentIndex})
      : super(key: key);
  int currentIndex = 0;

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  final PageController _pageController = PageController();
  int _pageIndex = 0;
  List<Widget> _screens = [];
  bool singleVendor = false;

  @override
  void initState() {
    super.initState();
    _screens = [
      const HomePage(),
      const LearnBond(),
      const Order(),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          _setPage(0);
          return false;
        } else {
          return true;
        }
      },
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white.withOpacity(0.65),
          showUnselectedLabels: true,
          currentIndex: _pageIndex,
          type: BottomNavigationBarType.fixed,
          items: _getBottomWidget(singleVendor),
          onTap: (int index) {
            _setPage(index);
            widget.currentIndex = index;
          },
          backgroundColor: const Color(0xffFF405A),
          selectedLabelStyle: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          unselectedLabelStyle: GoogleFonts.quicksand(
            textStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: _screens.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return _screens[index];
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _barItem(String icon, String label, int index) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        color:
            index == _pageIndex ? Colors.white : Colors.white.withOpacity(0.65),
        height: 25,
        width: 25,
      ),
      label: label,
    );
  }

  void _setPage(int pageIndex) {
    setState(() {
      if (pageIndex != 3) {
        _pageController.jumpToPage(pageIndex);
      } else {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => const Chat()));
      }
      _pageIndex = pageIndex;
    });
  }

  List<BottomNavigationBarItem> _getBottomWidget(bool isSingleVendor) {
    List<BottomNavigationBarItem> list = [];
    list.add(_barItem(
        widget.currentIndex == 0 ? ConstantImage.home1 : ConstantImage.home,
        'Home',
        0));
    list.add(_barItem(
        widget.currentIndex == 1
            ? ConstantImage.order1
            : ConstantImage.portfolio,
        'Portfolio',
        1));
    list.add(_barItem(
        widget.currentIndex == 2
            ? ConstantImage.cart1
            : ConstantImage.dashboard,
        'Orders',
        2));
    list.add(_barItem(
        widget.currentIndex == 3 ? ConstantImage.chat1 : ConstantImage.chat,
        'Chat',
        3));

    return list;
  }
}
