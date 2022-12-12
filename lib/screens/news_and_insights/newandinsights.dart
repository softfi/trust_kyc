import 'package:flutter/material.dart';
import 'package:trust_money/screens/news_and_insights/explore.dart';
import 'package:trust_money/utils/images.dart';
import '../../utils/app_bar.dart';
import '../bond/common_widget.dart';
import '../bond/learn_bonds/cutome_lists.dart';

class NewsAndInsights extends StatefulWidget {
  const NewsAndInsights({Key? key}) : super(key: key);

  @override
  State<NewsAndInsights> createState() => _NewsAndInsightsState();
}

class _NewsAndInsightsState extends State<NewsAndInsights> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppToolbar.appBar(
          "NEWS AND INSIGHTS",
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          IconButton(
            icon: Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                    color: Colors.white, shape: BoxShape.circle),
                child: const Icon(
                  Icons.person,
                  size: 20,
                  color: Color(0xff00C6D8),
                )),
            onPressed: () {},
          )),
      body: SingleChildScrollView(
        child: Column(
          children: [
            newsListWidget(),
            const SizedBox(
              height: 35,
            ),
           /* Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Container(
                height: 50,
                width: 180,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: AppColors.btnColor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Load More",
                        style: GoogleFonts.quicksand(
                          textStyle: const TextStyle(
                            color: Color(0xffFfffff),
                            fontWeight: FontWeight.w600,
                            fontSize: 15,
                          ),
                        )),
                    const Icon(
                      Icons.refresh,
                      size: 25,
                      color: Colors.white,
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),*/
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

  Widget newsListWidget() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 5,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 7.0,horizontal: 12.0),
          child: InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const NewsAndInsightExplore()));
            },
            child: CustomTile(
              date: 'Jan 24, 2022',
              title: 'Is Bonds Good Investment Compared With Mutual..',
              image: Image.asset(
                ConstantImage.dummy_bond,
              ),
              readText: 'Trading',
            ),
          ),
        );
      },
    );
  }

}
