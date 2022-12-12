import 'package:flutter/material.dart';
import 'package:rotated_corner_decoration/rotated_corner_decoration.dart';
import 'package:trust_money/utils/styles.dart';

class AppToolbar {
  static appBar(String title, Widget icon, Widget icon1) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(80.0),
      child: Column(
        children: [
          Container(
            color: const Color(0xff00C6D8),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Stack(
                children: [
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      icon,
                      Text(
                        title,
                        style: ConstStyle.quickStandSmall11,
                      ),
                      icon1
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            color: Colors.transparent,
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
    );
  }
}
