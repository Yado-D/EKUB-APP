import 'package:dots_indicator/dots_indicator.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/auth/presentation/pages/signin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

Widget reusableOnboardingWidget({
  required BuildContext context,
  required String lottieText,
  String? topBoldText,
  required String bottomBoldText1,
  required String bottomBoldText2,
  required String smallText,
  required double dotIndex,
  required bool isTourFinished,
  required PageController pageController,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      SizedBox(
        height: 100,
      ),
      Center(
        child: Lottie.asset(
          lottieText,
          height: 200,
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      topBoldText != null
          ? ReusableText(
              TextString: topBoldText,
              FontSize: 30,
              TextColor: Theme.of(context).colorScheme.primary,
              TextFontWeight: FontWeight.w900,
            )
          : SizedBox(),
      RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: bottomBoldText1,
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.w900,
              ),
            ),
            TextSpan(
              text: bottomBoldText2,
              style: TextStyle(
                fontSize: 30,
                color: Theme.of(context).colorScheme.onTertiary,
                fontWeight: FontWeight.w900,
              ),
            )
          ],
        ),
      ),
      Center(
        child: ReusableText(
          FromLeft: 50,
          FromRight: 50,
          FromTop: 100,
          TextString: smallText,
          FontSize: 16,
          TextColor: Theme.of(context).colorScheme.primary,
          TextFontWeight: FontWeight.w900,
        ),
      ),
      const SizedBox(
        height: 100,
      ),
      DotsIndicator(
        position: dotIndex,
        dotsCount: 3,
      ),
      const SizedBox(
        height: 50,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          InkWell(
            onTap: () {
              if (isTourFinished) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SigninPage()),
                );
              } else {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeIn,
                );
              }
            },
            child: isTourFinished
                ? Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Theme.of(context).colorScheme.onTertiary,
                    ),
                    child: Center(
                        child: ReusableText(TextString: "Start", FontSize: 18)),
                  )
                : Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 35,
                    color: Theme.of(context).colorScheme.onTertiary,
                  ),
          ),
          const SizedBox(
            width: 50,
          ),
        ],
      ),
    ],
  );
}
