import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/groups_page/presentation/pages/groups_page.dart';
import 'package:flutter/material.dart';

import '../widgets/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, bottom: 15),
                  padding: EdgeInsets.all(15),
                  height: 78,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorCollections.LightBlueColor),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: ColorCollections.QuaterneryColor,
                        radius: 20,
                        child: Icon(Icons.info_outline_rounded),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ReusableText(
                            FromTop: 0,
                            FromBottom: 0,
                            TextString: "You have a pending payment for ",
                            FontSize: 15,
                            TextFontWeight: FontWeight.w600,
                            TextColor: Theme.of(context).colorScheme.primary,
                          ),
                          ReusableText(
                            FromTop: 0,
                            FromBottom: 0,
                            TextString: "\"Work Colleagues\"",
                            FontSize: 15,
                            TextFontWeight: FontWeight.w600,
                            TextColor: Theme.of(context).colorScheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: "Your Active Equbs",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w800,
                      TextColor: Theme.of(context).colorScheme.primary,
                    ),
                    InkWell(
                      onTap: () {},
                      child: ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "View All",
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                equbsReusableContainer(
                  context: context,
                  equbName: "Friends Saving",
                  member: 12,
                  cycleProgress: 0.5,
                  dateOfPayment: DateTime.now(),
                  isPayed: true,
                  onPayNow: () {},
                  onEqubClicked: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                equbsReusableContainer(
                  context: context,
                  equbName: "Work Colleagues",
                  member: 2,
                  cycleProgress: 0.5,
                  dateOfPayment: DateTime.now(),
                  isPayed: false,
                  onPayNow: () {},
                  onEqubClicked: () {},
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    homePaymentAndJoinGroupContainer(
                      context: context,
                      title: "Join New Group",
                      icon: Icons.add,
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => GroupsPage(),
                          ),
                        );
                      },
                    ),
                    SizedBox(width: 5),
                    homePaymentAndJoinGroupContainer(
                      context: context,
                      title: "Make Payment",
                      icon: Icons.payment,
                      onTap: () => showPaymentDialog(
                        context: context,
                        payingTo: "Family Group",
                        amount: "500",
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: "Recent Transaction",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w800,
                      TextColor: Theme.of(context).colorScheme.primary,
                    ),
                    InkWell(
                      onTap: () {},
                      child: ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "View All",
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.blue.shade900,
                      ),
                    ),
                  ],
                ),
                Container(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      recentTransactionContainer(
                        icon: Icons.add,
                        context: context,
                        title: "Payment to Friends Saving",
                        money: 200.0,
                        dateOfPayment: DateTime.now(),
                        onTap: () {},
                      ),
                      recentTransactionContainer(
                        icon: Icons.minimize,
                        context: context,
                        title: "Received Payout",
                        money: 185.0,
                        dateOfPayment: DateTime.now(),
                        onTap: () {},
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
