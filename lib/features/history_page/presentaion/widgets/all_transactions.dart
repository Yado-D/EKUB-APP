import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/home_page/presentation/widgets/home_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_history_widget.dart';

Widget allTransactions(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      ReusableHistoryContainer(
        icon: Icons.minimize,
        context: context,
        title: "Payment to Friends Saving",
        money: 230,
        dateOfPayment: DateTime.now(),
        statusIcon: Icons.check_circle,
        onPayment: () {},
      ),
      ReusableHistoryContainer(
        icon: Icons.minimize,
        context: context,
        title: "Payment to Work colleagues",
        money: 230,
        dateOfPayment: DateTime.now(),
        statusIcon: Icons.error,
        onPayment: () {},
      ),
      ReusableHistoryContainer(
        icon: Icons.add,
        context: context,
        title: "Received Payout",
        money: 230,
        dateOfPayment: DateTime.now(),
        statusIcon: Icons.check_circle,
        onPayment: () {},
      ),
    ],
  );
}


