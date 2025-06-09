import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

AppBar homeAppBar(BuildContext context) {
  return AppBar(
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
              TextString: "EKUB",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ReusableText(
              FromTop: 5,
              FromLeft: 15,
              TextString: "Welcome back, Yared",
              FontSize: 16,
              TextFontWeight: FontWeight.w600,
              TextColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
        Stack(
          children: [
            CircleAvatar(
              radius: 25,
              backgroundColor: ColorCollections.DeepGreyColor,
              backgroundImage: const AssetImage("assets/profile/yared.png"),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.red,
                  radius: 12,
                  child: Center(
                    child: ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: "1",
                      FontSize: 16,
                      TextFontWeight: FontWeight.w600,
                      TextColor: Theme.of(context).colorScheme.onSecondary,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    ),
  );
}

Widget equbsReusableContainer({
  required BuildContext context,
  required String equbName,
  required int member,
  required double cycleProgress,
  required DateTime dateOfPayment,
  required bool isPayed,
  required VoidCallback onTap,
}) {
  return Container(
    padding: EdgeInsets.all(15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey.shade100),
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: equbName,
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "$member members",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Theme.of(context).colorScheme.onPrimary,
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.tertiaryContainer,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(
                    color: Theme.of(context).colorScheme.tertiaryContainer),
              ),
              child: Row(
                children: [
                  isPayed
                      ? Icon(Icons.check_circle_outline)
                      : Icon(Icons.error_outline_outlined),
                  ReusableText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: isPayed ? "Paid" : "Pending",
                    FontSize: 15,
                    TextFontWeight: FontWeight.w600,
                    TextColor: ColorCollections.MediumGreyColor,
                  ),
                ],
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
              TextString: "Cycle progress",
              FontSize: 16,
              TextFontWeight: FontWeight.w600,
              TextColor: Theme.of(context).colorScheme.onPrimary,
            ),
            ReusableText(
              FromTop: 0,
              FromBottom: 0,
              TextString: "${cycleProgress * 100} %",
              FontSize: 16,
              TextFontWeight: FontWeight.w600,
              TextColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        LinearPercentIndicator(
          lineHeight: 14.0,
          percent: cycleProgress,
          backgroundColor: Colors.blue.shade100,
          progressColor: Colors.blue,
        ),
        const SizedBox(
          height: 18,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "Next Payout",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Theme.of(context).colorScheme.onPrimary,
                ),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "${formatIntelDate(dateOfPayment)}",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w700,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            InkWell(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiaryContainer,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.tertiaryContainer),
                ),
                child: Row(
                  children: [
                    ReusableText(
                      FromTop: 0,
                      FromBottom: 0,
                      TextString: "Pay Now",
                      FontSize: 15,
                      TextFontWeight: FontWeight.w600,
                      TextColor: ColorCollections.MediumGreyColor,
                    ),
                    Icon(Icons.arrow_forward),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget homePaymentAndJoinGroupContainer({
  required BuildContext context,
  required String title,
  required IconData icon,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.tertiaryContainer,
        borderRadius: BorderRadius.circular(15),
        border:
            Border.all(color: Theme.of(context).colorScheme.tertiaryContainer),
      ),
      child: Column(
        children: [
          Icon(icon),
          ReusableText(
            FromTop: 0,
            FromBottom: 0,
            TextString: title,
            FontSize: 15,
            TextFontWeight: FontWeight.w600,
            TextColor: ColorCollections.MediumGreyColor,
          ),
        ],
      ),
    ),
  );
}

Widget recentTransactionContainer({
  required IconData icon,
  required BuildContext context,
  required String title,
  required double money,
  required DateTime dateOfPayment,
}) {
  return Container(
    padding: EdgeInsets.only(top: 25),
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
        Column(
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
        // 0985151696
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(icon),
            ReusableText(
              FromTop: 0,
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
      ],
    ),
  );
}

String formatIntelDate(DateTime date) {
  final months = [
    'Jan',
    'Feb',
    'Mar',
    'Apr',
    'May',
    'Jun',
    'Jul',
    'Aug',
    'Sep',
    'Oct',
    'Nov',
    'Dec'
  ];
  final day = date.day.toString().padLeft(2, '0');
  final month = months[date.month - 1];
  final year = date.year.toString();
  final hour = date.hour.toString().padLeft(2, '0');
  final minute = date.minute.toString().padLeft(2, '0');
  final second = date.second.toString().padLeft(2, '0');

  return '$month-$day-$year';
}

void showPaymentDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue.shade50,
        title: ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Make Payment",
          FontSize: 18,
          TextFontWeight: FontWeight.w900,
          TextColor: Colors.black,
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "Paying to ",
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black,
                      ),
                      ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "Family Group",
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Column(
                    children: [
                      ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "Amount",
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black,
                      ),
                      ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "\$500",
                        FontSize: 15,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Colors.black,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "Card number",
                FontSize: 15,
                TextFontWeight: FontWeight.w700,
                TextColor: Colors.black,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '4242 4242 4242 4242',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'MM/YY',
                        border: OutlineInputBorder(),
                        labelText: 'Expiry Date',
                      ),
                      keyboardType: TextInputType.datetime,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'CVC',
                        border: OutlineInputBorder(),
                        labelText: 'CVC',
                      ),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    commonSnackBar(
                      context,
                      "Payment Successful!!!",
                      ColorCollections.TeritiaryColor,
                    );
                  },
                  child: const Text('Pay Now'),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
