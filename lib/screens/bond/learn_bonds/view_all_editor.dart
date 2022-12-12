import 'package:flutter/material.dart';
import 'package:trust_money/screens/bond/learn_bonds/view_all_list.dart';

import '../../../utils/app_bar.dart';
import '../../../utils/images.dart';
import '../common_widget.dart';

class ViewAllEditors extends StatelessWidget {
  const ViewAllEditors({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "EDITORS TOP PICKS",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(padding: const EdgeInsets.all(1),
                decoration:
                    const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.person,
                  color: const Color(0xff00C6D8),
                )),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            editorList(),
            const SizedBox(
              height: 20,
            ),
            CommonWidget.subscribe(),
            const SizedBox(
              height: 20,
            ),
            CommonWidget.needHelp(),
          ],
        ),
      ),
    );
  }

  Widget editorList() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12),
          child: Container(
            decoration: BoxDecoration(boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.25),
                spreadRadius: 2,
                blurRadius: 11,
                offset: const Offset(0, 3),
              ),
            ], color: Colors.white, borderRadius: BorderRadius.circular(8)),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: EditorList(
                readText: '5 min read',
                title: 'What are 54EC Bonds or Capital Gain Bonds',
                image: Image.asset(
                  ConstantImage.dummy_pic,
                ),
                date: 'Jan 24, 2022',
              ),
            ),
          ),
        );
      },
    );
  }
}
