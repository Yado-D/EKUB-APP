import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

AppBar groupsAppBar(BuildContext context) {
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
              TextString: "EKUB Groups",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ReusableText(
              FromTop: 5,
              FromLeft: 15,
              TextString: "Join or manage your savings group",
              FontSize: 16,
              TextFontWeight: FontWeight.w600,
              TextColor: Theme.of(context).colorScheme.onPrimary,
            ),
          ],
        ),
      ],
    ),
  );
}

Widget equbGroupReusableContainer({
  required BuildContext context,
  required String equbName,
  required int member,
  required bool isPayed,
  required String newRecipient,
  required double amount,
  required VoidCallback onPayNow,
  required VoidCallback onEqubClicked,
}) {
  return InkWell(
    onTap: onEqubClicked,
    child: Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.all(10),
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
                  Row(
                    children: [
                      Icon(Icons.people),
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
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.green.shade200,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(
                      color: Theme.of(context).colorScheme.tertiaryContainer),
                ),
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "ET$amount/weekly",
                  FontSize: 15,
                  TextFontWeight: FontWeight.w600,
                  TextColor: ColorCollections.MediumGreyColor,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 18,
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
                    TextString: "New Recipient",
                    FontSize: 16,
                    TextFontWeight: FontWeight.w600,
                    TextColor: Theme.of(context).colorScheme.onPrimary,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.green.shade200,
                        radius: 16,
                        child: Center(
                          child: ReusableText(
                            FromTop: 0,
                            FromBottom: 0,
                            TextString: newRecipient[0],
                            FontSize: 16,
                            TextFontWeight: FontWeight.w700,
                            TextColor: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                      ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: newRecipient,
                        FontSize: 16,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Theme.of(context).colorScheme.primary,
                      ),
                    ],
                  ),
                ],
              ),
              InkWell(
                onTap: onPayNow,
                child: Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.green.shade200,
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
    ),
  );
}
