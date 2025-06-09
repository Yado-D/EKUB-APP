import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/home_page/presentation/widgets/home_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget allTransactions(BuildContext context) {
  return ListView(
    shrinkWrap: true,
    children: [
      allTransactionContainer(
        icon: Icons.minimize,
        context: context,
        title: "Payment to Friends Saving",
        money: 230,
        dateOfPayment: DateTime.now(),
      ),
      allTransactionContainer(
        icon: Icons.minimize,
        context: context,
        title: "Payment to Work colleagues",
        money: 230,
        dateOfPayment: DateTime.now(),
      ),
      allTransactionContainer(
        icon: Icons.add,
        context: context,
        title: "Received Payout",
        money: 230,
        dateOfPayment: DateTime.now(),
      ),
    ],
  );
}

Widget allTransactionContainer({
  required IconData icon,
  required BuildContext context,
  required String title,
  required double money,
  required DateTime dateOfPayment,
}) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          backgroundColor:
              icon == Icons.add ? Colors.green.shade50 : Colors.grey.shade50,
          radius: 20,
          child: Center(
            child: Icon(
              icon,
              color: ColorCollections.GreenColor,
            ),
          ),
        ),
        const SizedBox(width: 20,),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: title,
                FontSize: 16,
                TextFontWeight: FontWeight.w600,
                TextColor: Theme.of(context).colorScheme.onPrimary,
              ),
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "${formatIntelDate(dateOfPayment)}",
                FontSize: 16,
                TextFontWeight: FontWeight.w600,
                TextColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(icon,size: 20,),
                ReusableText(
                  FromTop: 0,
                  FromRight: 0,
                  FromBottom: 0,
                  TextString: "ET${money}",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: icon == Icons.add
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.check_circle),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "success",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: icon == Icons.add
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary,
                ),
              ],
            )
          ],
        ),
      ],
    ),
  );
}
