import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar paymentAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: Row(
      children: [
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.keyboard_arrow_left_rounded,
            size: 30,
          ),
        ),
        ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Payment Methods",
          FontSize: 22,
          TextFontWeight: FontWeight.w900,
          TextColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    ),
  );
}

Widget paymentReusableContainer({
  required BuildContext context,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
  required VoidCallback onDelete,

}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(Icons.payment_outlined,color: Colors.green,),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: title,
                    FontSize: 18,
                    TextFontWeight: FontWeight.w900,
                    TextColor: Theme.of(context).colorScheme.primary,
                  ),
                  ReusableText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: subtitle,
                    FontSize: 18,
                    TextFontWeight: FontWeight.w500,
                    TextColor: Colors.grey.shade700,
                  ),
                ],
              ),
            ],
          ),
          InkWell(
            onTap: onDelete,
            child: Icon(
              Icons.delete_outline_outlined,
              color: Colors.red,
              size: 30,
            ),
          ),
        ],
      ),
    ),
  );
}