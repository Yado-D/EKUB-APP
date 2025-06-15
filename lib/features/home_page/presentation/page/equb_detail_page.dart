import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/home_page/presentation/widgets/equb_detail_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class EqubDetailPage extends StatefulWidget {
  const EqubDetailPage({super.key});

  @override
  State<EqubDetailPage> createState() => _EqubDetailPageState();
}

class _EqubDetailPageState extends State<EqubDetailPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: Icon(
              Icons.keyboard_arrow_left_outlined,
              size: 30,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                commonSnackBar(
                  context,
                  "You logged out from this equb. ",
                  ColorCollections.TeritiaryColor,
                );
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.logout,
                size: 25,
              ),
            ),
            const SizedBox(
              width: 15,
            ),
          ],
        ),
        body: CustomScrollView(
          shrinkWrap: true,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: [
                    ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: "Weekend Savers EQUB",
                      FontSize: 22,
                      TextFontWeight: FontWeight.w900,
                      TextColor: Theme.of(context).colorScheme.primary,
                    ),
                    ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: "Started May 15, 2023 • 12 members",
                      FontSize: 16,
                      TextFontWeight: FontWeight.w600,
                      TextColor: Colors.grey.shade700,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      padding: const EdgeInsets.all(10),
                      height: 150,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade500),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "Total Pot",
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w600,
                                    TextColor: Colors.grey.shade700,
                                  ),
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "ET200",
                                    FontSize: 20,
                                    TextFontWeight: FontWeight.w900,
                                    TextColor: Colors.black,
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "Weekly Contribution",
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w600,
                                    TextColor: Colors.grey.shade700,
                                  ),
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "ET200",
                                    FontSize: 20,
                                    TextFontWeight: FontWeight.w900,
                                    TextColor: Colors.black,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          LinearPercentIndicator(
                            lineHeight: 14.0,
                            percent: 0.5,
                            backgroundColor: Colors.green.shade200,
                            progressColor: Colors.green,
                            barRadius: Radius.circular(10),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          ReusableText(
                            FromTop: 5,
                            FromBottom: 0,
                            TextString: "9 of 12 rounds completed",
                            FontSize: 16,
                            TextFontWeight: FontWeight.w600,
                            TextColor: Colors.grey.shade700,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      padding: const EdgeInsets.all(10),
                      height: 400,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade500),
                      ),
                      child: Column(
                        children: [
                          ReusableText(
                            FromTop: 0,
                            FromBottom: 10,
                            TextString: "This Week's Draw",
                            FontSize: 20,
                            TextFontWeight: FontWeight.w800,
                            TextColor: Colors.black,
                          ),
                          Stack(
                            children: [
                              Container(
                                width: double.infinity, // or specific width
                                height: 250,
                                child: FortuneWheel(
                                  animateFirst: false,
                                  // selected: selectedStream,
                                  indicators: <FortuneIndicator>[
                                    FortuneIndicator(
                                      alignment: Alignment.topCenter,
                                      child: TriangleIndicator(
                                        color: Colors.green,
                                        width: 20.0,
                                        height: 20.0,
                                        elevation: 0,
                                      ),
                                    ),
                                  ],
                                  items: [
                                    for (int i = 0; i < items.length; i++)
                                      FortuneItem(
                                        child: Text(items[i]),
                                        style: FortuneItemStyle(
                                          color: colors[i],
                                          borderColor: Colors.green,
                                          borderWidth: 3,
                                        ),
                                      ),
                                  ],
                                ),
                              ),
                              Positioned(
                                left: 155,
                                top: 100,
                                child: CircleAvatar(
                                  radius: 25,
                                  backgroundColor:
                                      ColorCollections.PrimaryColor,
                                  child: Center(
                                    child: ReusableText(
                                      FromTop: 0,
                                      FromBottom: 0,
                                      TextString: "EQUB",
                                      FontSize: 14,
                                      TextFontWeight: FontWeight.w700,
                                      TextColor: Colors.black,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              margin: const EdgeInsets.only(top: 15),
                              height: 50,
                              width: 200,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: Colors.grey.shade500),
                              ),
                              child: Center(
                                child: ReusableText(
                                  FromTop: 0,
                                  FromBottom: 0,
                                  TextString: "Spin the Wheel",
                                  FontSize: 20,
                                  TextFontWeight: FontWeight.w800,
                                  TextColor: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 15, bottom: 15),
                      padding: const EdgeInsets.all(10),
                      height: 250,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade500),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            FromTop: 0,
                            FromBottom: 0,
                            TextString: "Next Draw",
                            FontSize: 22,
                            TextFontWeight: FontWeight.w800,
                            TextColor: Colors.black,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 20,
                              ),
                              ReusableText(
                                FromTop: 0,
                                FromBottom: 0,
                                TextString: "May 27, 2023 at 12:00 PM",
                                FontSize: 18,
                                TextFontWeight: FontWeight.w500,
                                TextColor: Colors.grey.shade700,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              smallContainerForDisplayingDate(
                                number: 2,
                                time: "Days",
                              ),
                              smallContainerForDisplayingDate(
                                number: 2,
                                time: "Hours",
                              ),
                              smallContainerForDisplayingDate(
                                number: 2,
                                time: "Minutes",
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.amber.shade100,
                                radius: 18,
                                child: Icon(
                                  Icons.timer_outlined,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            height: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                FromTop: 0,
                                FromBottom: 0,
                                TextString: "Next pot amount",
                                FontSize: 18,
                                TextFontWeight: FontWeight.w500,
                                TextColor: Colors.grey.shade700,
                              ),
                              ReusableText(
                                FromTop: 0,
                                FromBottom: 0,
                                TextString: "ET201",
                                FontSize: 20,
                                TextFontWeight: FontWeight.w900,
                                TextColor: Colors.black,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 15),
                      padding: const EdgeInsets.all(10),
                      height: 210,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade500),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            FromTop: 0,
                            FromBottom: 5,
                            TextString: "Your Contribution",
                            FontSize: 20,
                            TextFontWeight: FontWeight.w900,
                            TextColor: Colors.black,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "This Week",
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w500,
                                    TextColor: Colors.grey.shade700,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.check_circle_outline,
                                        color: Colors.green,
                                      ),
                                      ReusableText(
                                        FromTop: 0,
                                        FromBottom: 0,
                                        TextString: "Paid on May 20",
                                        FontSize: 18,
                                        TextFontWeight: FontWeight.w800,
                                        TextColor: Colors.black,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: ReusableText(
                                  FromTop: 0,
                                  FromBottom: 0,
                                  TextString: "View Receipt",
                                  FontSize: 18,
                                  TextFontWeight: FontWeight.w900,
                                  TextColor: Colors.green,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 15, bottom: 15),
                            height: 1,
                            color: Colors.grey,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "Next Payment",
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w500,
                                    TextColor: Colors.grey.shade700,
                                  ),
                                  ReusableText(
                                    FromTop: 0,
                                    FromBottom: 0,
                                    TextString: "May 27, 2023",
                                    FontSize: 18,
                                    TextFontWeight: FontWeight.w800,
                                    TextColor: Colors.black,
                                  ),
                                ],
                              ),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  height: 50,
                                  width: 140,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: Colors.green.shade500),
                                      color: Colors.green),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.payment_rounded,
                                        color: ColorCollections.PrimaryColor,
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      ReusableText(
                                        FromTop: 0,
                                        FromBottom: 0,
                                        TextString: "Pay Now",
                                        FontSize: 16,
                                        TextFontWeight: FontWeight.w900,
                                        TextColor:
                                            ColorCollections.PrimaryColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              pinned: true, // AppBar stays visible
              floating: true, // AppBar appears on scroll up
              expandedHeight: 50,
              bottom: TabBar(
                tabs: [
                  Container(
                    child: ReusableText(
                      FromTop: 0,
                      FromBottom: 10,
                      TextString: "Pay Now",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w800,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                  ),
                  Container(
                    child: ReusableText(
                      FromTop: 0,
                      FromBottom: 10,
                      TextString: "Draw History",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w800,
                      TextColor: ColorCollections.TeritiaryColor,
                    ),
                  ),
                ],
              ),
            ),
            SliverFillRemaining(
              child: TabBarView(
                children: [
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return paymentNowWidget(
                        imgUrl: "https://picsum.photos/1200/300",
                        name: "Yared Dereje",
                        isPaid: true,
                        isWon: true,
                        round: 3,
                      );
                    },
                  ),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return DrawHistoryWidget(
                        imgUrl: "https://picsum.photos/1200/300",
                        name: "Yared Dereje",
                        round: 2,
                        dateWon: DateTime.now(),
                        amount: "200",
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  final items = <String>[
    'Grogu',
    'Dejene',
    'Kaleb',
    'Roba',
    'Yishaq',
    'Yared',
    'Yoda',
    'Estifanose',
  ];
  final colors = <Color>[
    Colors.blue.shade500,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade100,
  ];
}
