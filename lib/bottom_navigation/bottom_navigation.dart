import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trust_money/utils/colorsConstant.dart';
import '../utils/images.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      type: BottomNavigationBarType.fixed,
      backgroundColor: AppColors.btnColor,
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white.withOpacity(0.65),
      selectedLabelStyle: GoogleFonts.quicksand(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      unselectedLabelStyle: GoogleFonts.quicksand(
        textStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 14,
        ),
      ),
      onTap: (value) {
        setState(() => _currentIndex = value);
      },
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: InkWell(
              onTap: () {
                setState(() => _currentIndex = 0);
              },
              child: _currentIndex == 0
                  ? Image.asset(
                      ConstantImage.home1,
                      height: 25,
                      width: 25,
                      color: Colors.white,
                    )
                  : Image.asset(
                      ConstantImage.home,
                      height: 25,
                      width: 25,
                      color: Colors.white.withOpacity(0.65),
                    ),
            )),
        BottomNavigationBarItem(
            label: 'Portfolio',
            icon: InkWell(
              onTap: () {
                setState(() => _currentIndex = 1);
              },
              child: _currentIndex == 1
                  ? Image.asset(ConstantImage.order1,
                      height: 25, width: 25, color: Colors.white)
                  : Image.asset(
                      ConstantImage.portfolio,
                      height: 25,
                      width: 25,
                      color: Colors.white.withOpacity(0.65),
                    ),
            )),
        BottomNavigationBarItem(
            label: 'Orders',
            icon: InkWell(
              onTap: () {
                setState(() => _currentIndex = 2);
              },
              child: _currentIndex == 2
                  ? Image.asset(ConstantImage.cart1,
                      height: 25, width: 25, color: Colors.white)
                  : Image.asset(
                      ConstantImage.dashboard,
                      height: 25,
                      width: 25,
                      color: Colors.white.withOpacity(0.65),
                    ),
            )),
        BottomNavigationBarItem(
            label: 'Chat',
            icon: InkWell(
                onTap: () {
                  setState(() => _currentIndex = 3);
                },
                child: _currentIndex == 3
                    ? Image.asset(ConstantImage.chat1,
                        height: 25, width: 25, color: Colors.white)
                    : Image.asset(
                        ConstantImage.chat,
                        height: 25,
                        width: 25,
                        color: Colors.white.withOpacity(0.65),
                      ))),
      ],
    );
  }
}
