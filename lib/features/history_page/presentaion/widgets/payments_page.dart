import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'common_history_widget.dart';

Widget payments_page(BuildContext context) {
  return ListView(
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
        title: "Payment to Friends Saving",
        money: 230,
        dateOfPayment: DateTime.now(),
        statusIcon: Icons.check_circle,
        onPayment: () {},
      ),
      ReusableHistoryContainer(
        icon: Icons.minimize,
        context: context,
        title: "Payment to Friends Saving",
        money: 230,
        dateOfPayment: DateTime.now(),
        statusIcon: Icons.check_circle,
        onPayment: () {},
      ),
    ],
  );
}
