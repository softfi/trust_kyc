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
      selectedItemColor: Colors.white.withOpacity(.60),
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
      unselectedItemColor: AppColors.primaryColor,
      onTap: (value) {
        setState(() => _currentIndex = value);
      },
      items: [
        BottomNavigationBarItem(
            label: 'Home',
            icon: Image.asset(
              ConstantImage.home,
              height: 30,
              width: 30,
              color: _currentIndex == 0
                  ? Colors.white.withOpacity(.60)
                  : AppColors.primaryColor,
            )),
        BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Image.asset(
              ConstantImage.dashboard,
              height: 30,
              width: 30,
              color: _currentIndex == 1
                  ? Colors.white.withOpacity(.60)
                  : AppColors.primaryColor,
            )),
        BottomNavigationBarItem(
            label: 'Portfolio',
            icon: Image.asset(
              ConstantImage.portfolio,
              height: 30,
              width: 30,
              color: _currentIndex == 2
                  ? Colors.white.withOpacity(.60)
                  : AppColors.primaryColor,
            )),
        BottomNavigationBarItem(
            label: 'Chat',
            icon: Image.asset(
              ConstantImage.chat,
              height: 30,
              width: 30,
              color: _currentIndex == 3
                  ? Colors.white.withOpacity(.60)
                  : AppColors.primaryColor,
            )),
        BottomNavigationBarItem(
            label: 'Account',
            icon: Image.asset(
              ConstantImage.account,
              height: 30,
              width: 30,
              color: _currentIndex == 4
                  ? Colors.white.withOpacity(.60)
                  : AppColors.primaryColor,
            )),
      ],
    );
  }
}
