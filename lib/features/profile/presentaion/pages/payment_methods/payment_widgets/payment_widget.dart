import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
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
              Icon(
                Icons.payment_outlined,
                color: Colors.green,
              ),
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

void showPaymentCreateDialog({
  required BuildContext context,
  required Function(String?) onCrdHolder,
  required Function(String?) onCrdNum,
  required Function(String?) onExpDate,
  required Function(String?) onCvcNum,
  required VoidCallback onCreate,
}) {
  showDialog(
    barrierDismissible: false,
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.blue.shade50,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ReusableText(
              FromTop: 0,
              FromBottom: 10,
              TextString: "Create your card",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Colors.black,
            ),
            IconButton(
              onPressed: () => Navigator.pop(context),
              icon: Icon(Icons.cancel_outlined),
            ),
          ],
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 300.0, // Set your minimum width
            maxWidth: 350.0, // Set your maximum width
            minHeight: 300,
            maxHeight: 330,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "Card Holder Name",
                FontSize: 17,
                TextFontWeight: FontWeight.w700,
                TextColor: Colors.black,
              ),
              const SizedBox(height: 8),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Enter your number',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.name,
                onChanged: onCrdHolder,
              ),
              const SizedBox(height: 8),
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "Card number",
                FontSize: 17,
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
                onChanged: onCrdNum,
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
                      onChanged: onExpDate,
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
                      onChanged: onCvcNum,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Divider(),
              SizedBox(
                width: double.infinity,
                child: InkWell(
                  onTap: onCreate,
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorCollections.GreenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: ReusableText(
                        TextString: "Create Card",
                        FontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
