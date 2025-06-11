import 'package:dotted_border/dotted_border.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

import '../payment_widgets/payment_widget.dart';

class PaymentMethods extends StatelessWidget {
  const PaymentMethods({super.key});

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
              onTap: () {},
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
            paymentReusableContainer(
              context: context,
              title: "...4356",
              subtitle: "Expires 12/24",
              onTap: () {},
              onDelete: () {},
            ),
            paymentReusableContainer(
              context: context,
              title: "...4356",
              subtitle: "Expires 12/24",
              onTap: () {},
              onDelete: () {},
            ),
          ],
        ),
      ),
    );
  }
}
