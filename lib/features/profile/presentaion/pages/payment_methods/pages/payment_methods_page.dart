import 'dart:core';

import 'package:dotted_border/dotted_border.dart';
import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/main.dart';
import 'package:flutter/material.dart';

import '../payment_widgets/card_model.dart';
import '../payment_widgets/payment_widget.dart';

class PaymentMethods extends StatefulWidget {
  PaymentMethods({super.key});

  @override
  State<PaymentMethods> createState() => _PaymentMethodsState();
}

class _PaymentMethodsState extends State<PaymentMethods> {
  List<CardModel> userCards = [];

  String cardHolderName = '';

  String cardNumber = '';

  String expiredDate = '';

  String cvcNumber = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: paymentAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            InkWell(
              onTap: () {
                showPaymentCreateDialog(
                  context: context,
                  onCrdHolder: (onCrdHolder) {
                    setState(() {
                      cardHolderName = onCrdHolder ?? "";
                    });
                  },
                  onCrdNum: (onCrdNum) {
                    setState(() {
                      cardNumber = onCrdNum ?? "";
                    });
                  },
                  onExpDate: (onExpDate) {
                    setState(() {
                      expiredDate = onExpDate ?? "";
                    });
                  },
                  onCvcNum: (onCvcNum) {
                    setState(() {
                      cvcNumber = onCvcNum ?? "";
                    });
                  },
                  onCreate: () {
                    if (cardHolderName.isNotEmpty ||
                        cardNumber.isNotEmpty ||
                        expiredDate.isNotEmpty ||
                        cvcNumber.isNotEmpty) {
                      CardModel cardModel = CardModel(
                        cardHolderName: cardHolderName,
                        cardNumber: cardNumber,
                        CVCCode: cvcNumber,
                        ExpiredDate: expiredDate,
                      );
                      setState(() {
                        userCards.add(cardModel);
                      });
                      commonSnackBar(
                        context,
                        "Card added successfully!",
                        ColorCollections.TeritiaryColor,
                      );
                      Navigator.pop(context);
                    } else {
                      commonSnackBar(
                        context,
                        "Please Fill the Required Fields First.",
                        ColorCollections.TeritiaryColor,
                      );
                    }
                  },
                );
              },
              child: DottedBorder(
                color: Colors.black,
                strokeWidth: 1,
                dashPattern: [6, 3], // [dash length, gap length]
                child: Center(
                  child: ReusableText(
                    FromTop: 15,
                    FromBottom: 15,
                    TextString: "+    Add New Card",
                    FontSize: 20,
                    TextFontWeight: FontWeight.w700,
                    TextColor: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
            ),
            ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: userCards.length,
              itemBuilder: (context, index) {
                return paymentReusableContainer(
                  context: context,
                  title: userCards[index].cardNumber,
                  subtitle: "Expires ${userCards[index].ExpiredDate}",
                  onTap: () {},
                  onDelete: () {},
                );
              },
            ),
            userCards.isEmpty
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 200, left: 30, right: 30),
                        child: ReusableText(
                          FromTop: 15,
                          FromBottom: 15,
                          TextString:
                              "No Cards Added yet. click add new card button above.",
                          FontSize: 20,
                          TextFontWeight: FontWeight.w700,
                          TextColor: Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ],
                  )
                : SizedBox(),
          ],
        ),
      ),
    );
  }
}
