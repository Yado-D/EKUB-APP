import 'package:dots_indicator/dots_indicator.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/onboarding/presentation/widgets/onboarding_widget.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class onBoardingOnePage extends StatelessWidget {
   onBoardingOnePage({super.key});

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        body: PageView(
          controller: pageController,
          onPageChanged: (changed) {},
          children: [
            reusableOnboardingWidget(
              context: context,
              lottieText: "assets/onboarding/onboarding_1.json",
              topBoldText: "EKUB",
              bottomBoldText1: "DIGITAL ",
              bottomBoldText2: "SAVING",
              smallText: "Save smarter,Grow faster!",
              dotIndex: 0,
              isTourFinished: false,
              pageController: pageController,
            ),
            reusableOnboardingWidget(
              context: context,
              lottieText: "assets/onboarding/onboarding_2.json",
              bottomBoldText1: "Easy Group",
              bottomBoldText2: " Savings",
              smallText:
                  "Invite friends, set rules, and contribute effortlessly. No paperwork, no stress—just seamless digital saving",
              dotIndex: 1,
              isTourFinished: false,
              pageController: pageController,
            ),
            reusableOnboardingWidget(
              context: context,
              lottieText: "assets/onboarding/onboarding_3.json",
              bottomBoldText1: "Secure & ",
              bottomBoldText2: "Transparent",
              smallText:
                  "Track every transaction in real-time with blockchain-backed security. With Ekub, your savings are always safe.",
              dotIndex: 2,
              isTourFinished: true,
              pageController: pageController,
            ),
          ],
        ),
      ),
    );
  }
}
