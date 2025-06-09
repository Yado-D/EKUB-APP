import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

CommonShowDialogue({
  required BuildContext context,
  required String TitleText,
  required VoidCallback cancelOnTap,
  required VoidCallback confirmOnTap,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(

          title: Center(
            child: ReusableText(
              FromTop: 0,
              TextString: TitleText,
              FontSize: 20,
              TextFontWeight: FontWeight.w600,
              TextColor: ColorCollections.SecondaryColor,
            ),
          ),
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: confirmOnTap,
                      child: AppButton(
                        ButtonHeight: 50,
                        // ButtonWidth: 10,
                        ContainerColor: Colors.red.shade200,
                        ButtonText: 'Confirm',
                        ButtonColor: ColorCollections.SecondaryColor,
                      ),
                    ),
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                    child: InkWell(
                      onTap: cancelOnTap,
                      child: AppButton(
                        ButtonHeight: 50,
                        // ButtonWidth: 150,
                        ContainerColor: Colors.green,
                        ButtonText: 'Cancel',
                        ButtonColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      });
}

CommonErrorSnackBar({
  required BuildContext context,
  required String TitleText,
  required VoidCallback cancelOnTap,
  required VoidCallback confirmOnTap,
}) {
  return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Center(
            child: ReusableText(
              FromTop: 0,
              TextString: TitleText,
              FontSize: 26,
              TextFontWeight: FontWeight.w400,
              TextColor: ColorCollections.SecondaryColor,
            ),
          ),
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: confirmOnTap,
                      child: AppButton(
                        ButtonHeight: 50,
                        ButtonWidth: 100,
                        ContainerColor: Colors.white,
                        ButtonText: 'Confirm',
                        ButtonColor: ColorCollections.SecondaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: cancelOnTap,
                      child: AppButton(
                        ButtonHeight: 50,
                        ButtonWidth: 100,
                        ContainerColor: Colors.green,
                        ButtonText: 'Cancel',
                        ButtonColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        );
      });
}
