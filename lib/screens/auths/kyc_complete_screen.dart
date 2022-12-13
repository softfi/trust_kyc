import 'package:flutter/material.dart';
import 'package:trust_money/screens/kyc/profile/my_profile.dart';
import 'package:trust_money/utils/images.dart';
import 'package:trust_money/utils/strings.dart';
import 'package:trust_money/utils/styles.dart';

class KYCComplete extends StatelessWidget {
  const KYCComplete({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.only( left: 38, ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              ConstantImage.thumb,
              height: 108,
              width: 114,
            ),
            _space,
            InkWell( onTap: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MyProfile()));
            },

              child: Text(
                Strings.Congratskyc,
                style: ConstStyle.quickStandMedium,
                textAlign:TextAlign.center,
              ),
            ),
            _space,
            _space,

          ],
        ),
      ),
    );
  }

  Widget get _space => const SizedBox(height: 30);
}
