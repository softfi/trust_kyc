import 'package:flutter/material.dart';
import 'package:trust_money/utils/colorsConstant.dart';

class CustomBottomNavigation extends StatefulWidget {
  const CustomBottomNavigation({Key? key}) : super(key: key);

  @override
  State<CustomBottomNavigation> createState() => _CustomBottomNavigationState();
}

class _CustomBottomNavigationState extends State<CustomBottomNavigation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColors.btnColor,
        selectedItemColor: AppColors.primaryColor,
        unselectedItemColor: Colors.white.withOpacity(.60),
        selectedFontSize: 14,
        unselectedFontSize: 14,
        onTap: (value) {
          // Respond to item press.
        },
        items: const [
          BottomNavigationBarItem(
            label: 'Home',
            icon: Icon(Icons.favorite),
          ),
          BottomNavigationBarItem(
            label: 'Dashboard',
            icon: Icon(Icons.music_note),
          ),
          BottomNavigationBarItem(
            label: 'Portfolio',
            icon: Icon(Icons.location_on),
          ),
          BottomNavigationBarItem(
            label: 'Chat',
            icon: Icon(Icons.library_books),
          ),
          BottomNavigationBarItem(
            label: 'Account',
            icon: Icon(Icons.library_books),
          ),
        ],
      ),
    );
  }
}
