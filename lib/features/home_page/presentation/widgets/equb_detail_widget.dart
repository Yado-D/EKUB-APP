import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/home_page/presentation/widgets/home_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget smallContainerForDisplayingDate({
  required int number,
  required String time,
}) {
  return Column(
    children: [
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade500),
          color: Colors.green.shade100,
        ),
        child: Center(
          child: ReusableText(
            FromTop: 0,
            FromBottom: 0,
            TextString: "$number",
            FontSize: 20,
            TextFontWeight: FontWeight.w900,
            TextColor: Colors.green.shade900,
          ),
        ),
      ),
      ReusableText(
        FromTop: 2,
        FromBottom: 0,
        TextString: time,
        FontSize: 18,
        TextFontWeight: FontWeight.w500,
        TextColor: Colors.black,
      ),
    ],
  );
}

Widget paymentNowWidget({
  required String imgUrl,
  required String name,
  required bool isPaid,
  required bool isWon,
  required int round,
}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(imgUrl),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 2,
                  FromBottom: 0,
                  TextString: "Yared Dereje",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w800,
                  TextColor: Colors.black,
                ),
                Row(
                  children: [
                    Icon(
                      isPaid
                          ? Icons.check_circle_outline
                          : Icons.cancel_outlined,
                      color: isPaid ? Colors.green : Colors.red.shade500,
                      size: 20,
                    ),
                    ReusableText(
                      FromTop: 2,
                      FromBottom: 0,
                      TextString: name,
                      FontSize: 18,
                      TextFontWeight: FontWeight.w600,
                      TextColor: Colors.black54,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
        isWon
            ? Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amber.shade50,
                ),
                child: Center(
                  child: ReusableText(
                    FromTop: 2,
                    FromBottom: 0,
                    TextString: "Won Round $round",
                    FontSize: 16,
                    TextFontWeight: FontWeight.w600,
                    TextColor: Colors.black54,
                  ),
                ),
              )
            : SizedBox(),
      ],
    ),
  );
}

Widget DrawHistoryWidget({
  required String imgUrl,
  required String name,
  required int round,
  required DateTime dateWon,
  required String amount,
}) {
  return Container(
    margin: EdgeInsets.only(left: 15),
    padding: EdgeInsets.all(10),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: Colors.green,
              backgroundImage: NetworkImage(imgUrl),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 2,
                  FromBottom: 0,
                  TextString: name,
                  FontSize: 18,
                  TextFontWeight: FontWeight.w800,
                  TextColor: Colors.black,
                ),
                ReusableText(
                  FromTop: 2,
                  FromBottom: 0,
                  TextString: "Round $round • ${formatIntelDate(dateWon)}",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Colors.black54,
                ),
              ],
            ),
          ],
        ),
        Column(
          children: [
            ReusableText(
              FromTop: 2,
              FromBottom: 0,
              TextString: "ET$amount",
              FontSize: 18,
              TextFontWeight: FontWeight.w900,
              TextColor: Colors.black,
            ),
            Container(
              height: 35,
              width: 90,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade50,
              ),
              child: Center(
                child: ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "Paid out",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Colors.black54,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}
