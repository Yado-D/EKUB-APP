import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/profile/presentaion/pages/help/help_widgets/help_widget_page.dart';
import 'package:flutter/material.dart';

class HelpPage extends StatelessWidget {
  const HelpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: helpAppBar(context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 15,
              ),
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  helpReusableContainer(
                    context: context,
                    icon: Icons.insert_comment_outlined,
                    title: "Chat With US",
                    subtitle: "Available 24/7",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  reusableSliceContainer(),
                  SizedBox(
                    height: 15,
                  ),
                  helpReusableContainer(
                    context: context,
                    icon: Icons.phone_callback_outlined,
                    title: "Call Support",
                    subtitle: "Mon-Fri,9AM-6AM",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  reusableSliceContainer(),
                  SizedBox(
                    height: 15,
                  ),
                  helpReusableContainer(
                    context: context,
                    icon: Icons.menu_book_outlined,
                    title: "FAQ",
                    subtitle: "Find Quick Answer",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  reusableSliceContainer(),
                  SizedBox(
                    height: 15,
                  ),
                  helpReusableContainer(
                    context: context,
                    icon: Icons.email_outlined,
                    title: "Email Support",
                    subtitle: "Response within 24h",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
            //urgent help
            Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.only(top: 35),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade100,
              ),
              height: 120,
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: "Need urgent help?",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w900,
                    TextColor: Colors.green.shade500,
                  ),
                  ReusableText(
                    FromTop: 5,
                    FromBottom: 0,
                    TextString:
                        "Our support team is available 24/7 to assist you with any issues.",
                    FontSize: 16,
                    TextFontWeight: FontWeight.w700,
                    TextColor: Colors.green.shade500,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
