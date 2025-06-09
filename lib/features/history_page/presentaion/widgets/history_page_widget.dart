import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

AppBar historyAppBar(BuildContext context,TabController tabController) {
  return AppBar(
    bottom: TabBar(
      controller: tabController,
      tabs: [
        Tab(text: 'All Transactions'),
        Tab(text: 'Payments'),
        Tab(text: 'Payout'),

      ],
    ),
    automaticallyImplyLeading: false,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReusableText(
              FromTop: 15,
              FromBottom: 0,
              FromLeft: 15,
              TextString: "Transaction History",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),

          ],
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade50,
          ),
          child: Icon(Icons.filter_alt),
        )
      ],
    ),
  );
}
