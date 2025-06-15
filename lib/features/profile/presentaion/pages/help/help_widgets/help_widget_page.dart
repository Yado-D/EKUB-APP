import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

import '../pages/help_page.dart';

AppBar helpAppBar(BuildContext context) {
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
          TextString: "Help & Support",
          FontSize: 22,
          TextFontWeight: FontWeight.w900,
          TextColor: Theme.of(context).colorScheme.primary,
        ),
      ],
    ),
  );
}

Widget helpReusableContainer({
  required BuildContext context,
  required IconData icon,
  required String title,
  required String subtitle,
  required VoidCallback onTap,
}) {
  return InkWell(
    onTap: onTap,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon),
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
        Icon(
          Icons.keyboard_arrow_right_sharp,
          size: 30,
        ),
      ],
    ),
  );
}

Widget reusableSliceContainer() {
  return Container(
    width: double.infinity,
    height: 2,
    color: Colors.grey.shade100,
  );
}

Widget liveChatContainer({
  required BuildContext context,
  required VoidCallback onChatStart,
  required bool isClicked,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: 170, maxHeight: 300),
    child: Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green.shade100,
                ),
                child: Icon(
                  Icons.chat_bubble_outline,
                  color: ColorCollections.GreenColor,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ReusableText(
                    FromTop: 5,
                    FromBottom: 0,
                    TextString: "Live Chat",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w700,
                    TextColor: Theme.of(context).colorScheme.primary,
                  ),
                  ReusableText(
                    FromTop: 0,
                    FromBottom: 0,
                    TextString: "Online - Quick Response",
                    FontSize: 18,
                    TextFontWeight: FontWeight.w700,
                    TextColor: ColorCollections.GreenColor,
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 15,
          ),
          !isClicked
              ? InkWell(
                  onTap: onChatStart,
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.green,
                    ),
                    child: Center(
                      child: ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "Start Chat",
                        FontSize: 20,
                        TextFontWeight: FontWeight.w700,
                        TextColor: ColorCollections.PrimaryColor,
                      ),
                    ),
                  ),
                )
              : LiveChatBox(context),
        ],
      ),
    ),
  );
}

Widget LiveChatBox(BuildContext context) {
  return Container(
    child: Column(
      children: [
        Container(
          padding: EdgeInsets.all(15),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // border: Border.all(color: Colors.grey),
            color: Colors.green.shade50,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "Support Agent",
                FontSize: 16,
                TextFontWeight: FontWeight.w700,
                TextColor: ColorCollections.TeritiaryColor,
              ),
              ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "Hello! How can I help you today?",
                FontSize: 16,
                TextFontWeight: FontWeight.w700,
                TextColor: ColorCollections.TeritiaryColor,
              ),
            ],
          ),
        ),
        Row(
          children: [
            Expanded(
              child: reusableTextField(
                context: context,
                hintText: "Type your message",
                textType: 'message',
                onChanged: (onChanged) {},
              ),
            ),
            SizedBox(
              width: 10,
            ),
            InkWell(
              onTap: () {},
              child: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.green.shade100,
                ),
                child: Icon(
                  Icons.send_outlined,
                  color: ColorCollections.GreenColor,
                ),
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget callSupportWidget(BuildContext context) {
  return Container(
    padding: EdgeInsets.all(15),
    height: 300,
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey),
    ),
    child: Column(
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade100,
              ),
              child: Icon(
                Icons.call_outlined,
                color: ColorCollections.GreenColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 5,
                  FromBottom: 0,
                  TextString: "Call Support",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w700,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "Talk to an Agent",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w700,
                  TextColor: ColorCollections.GreenColor,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          // margin: EdgeInsets.all(10),
          height: 80,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.green.shade50,
          ),
          child: Center(
            child: ReusableText(
              FromTop: 5,
              FromBottom: 0,
              TextString: "1-800-EQUB-HELP",
              FontSize: 25,
              TextFontWeight: FontWeight.w700,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          children: [
            Icon(Icons.access_time),
            SizedBox(
              width: 5,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 5,
                  FromBottom: 0,
                  TextString: "Monday - Friday: 9:00 AM - 8:00 PM EST",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 2,
                  FromBottom: 0,
                  TextString: " Saturday: 10:00 AM - 6:00 PM EST",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 2,
                  FromBottom: 0,
                  TextString: "Sunday: Closed",
                  FontSize: 16,
                  TextFontWeight: FontWeight.w600,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            )
          ],
        )
      ],
    ),
  );
}

Widget helpFaqExpansionTile({
  required String title,
  required String subTitle,
}) {
  return ConstrainedBox(
    constraints: BoxConstraints(minHeight: 100, maxHeight: 300),
    child: Container(
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: ExpansionTile(
        title: ReusableText(
          FromTop: 5,
          FromBottom: 0,
          TextString: title,
          FontSize: 18,
          TextFontWeight: FontWeight.w700,
          TextColor: Colors.black,
        ),
        children: [
          ReusableText(
            FromTop: 5,
            FromBottom: 0,
            TextString: subTitle,
            FontSize: 16,
            TextFontWeight: FontWeight.w600,
            TextColor: Colors.grey.shade700,
          ),
        ],
      ),
    ),
  );
}

Widget faqWidget(BuildContext context) {
  return ConstrainedBox(
    constraints: BoxConstraints(
      minHeight: 100,
      maxHeight: 600,
    ),
    child: Container(
      padding: const EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey),
      ),
      child: SingleChildScrollView(
        // Add this to handle overflow
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade100,
                  ),
                  child: Icon(
                    Icons.help_outline_rounded,
                    color: ColorCollections.GreenColor,
                  ),
                ),
                const SizedBox(width: 10),
                ReusableText(
                  FromTop: 5,
                  FromBottom: 0,
                  TextString: "Frequently Asked Questions",
                  FontSize: 20,
                  TextFontWeight: FontWeight.w700,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
              ],
            ),
            const SizedBox(height: 15),
            helpFaqExpansionTile(
              title: "What is EQUB and how does it work?",
              subTitle:
                  "EQUB is a traditional rotating savings group where members contribute a fixed amount regularly. Each period, one member receives the total pot through a fair selection process.",
            ),
            const SizedBox(height: 10),
            helpFaqExpansionTile(
              title: "How is the winner selected each week?",
              subTitle:
                  "Winners are selected through our digital wheel of chance system, ensuring a fair and transparent process for all members.",
            ),
            const SizedBox(height: 10),
            helpFaqExpansionTile(
              title: "What happens if someone misses a payment?",
              subTitle:
                  "Members who miss payments may be subject to penalties and may lose their eligibility for the next draw. We encourage consistent participation.",
            ),
            const SizedBox(height: 10),
            helpFaqExpansionTile(
              title: "Is my money safe in EQUB?",
              subTitle:
                  "Yes, we use bank-grade security and encryption. All transactions are protected and funds are held in secure escrow accounts.",
            ),
          ],
        ),
      ),
    ),
  );
}

enum DropdownOptions { data1, data2, data3, data4 }

String getDropdownDisplayText(DropdownOptions option) {
  switch (option) {
    case DropdownOptions.data1:
      return "Payment Support";
    case DropdownOptions.data2:
      return "Account Support";
    case DropdownOptions.data3:
      return "Technical Problem";
    case DropdownOptions.data4:
      return "Other";
    default:
      return option.toString().split('.').last;
  }
}

Widget emailSupportMessage({
  required BuildContext context,
  required void Function(DropdownOptions?) onChanged,
  required DropdownOptions? selectedValue,
}) {
  return Container(
    padding: const EdgeInsets.all(15),
    width: double.infinity,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      border: Border.all(color: Colors.grey),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green.shade100,
              ),
              child: Icon(
                Icons.email_outlined,
                color: ColorCollections.GreenColor,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ReusableText(
                  FromTop: 5,
                  FromBottom: 0,
                  TextString: "Email Support",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w700,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 0,
                  FromBottom: 0,
                  TextString: "Response within 24 hours",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w700,
                  TextColor: ColorCollections.GreenColor,
                ),
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Name",
          FontSize: 18,
          TextFontWeight: FontWeight.w700,
          TextColor: ColorCollections.TeritiaryColor,
        ),
        reusableTextField(
          context: context,
          hintText: "enter your name",
          textType: "username",
          enabledBorderColor: Colors.grey.shade500,
          focusedBorderColor: Colors.green,
          onChanged: (onChanged) {},
        ),
        SizedBox(
          height: 15,
        ),
        ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Email",
          FontSize: 18,
          TextFontWeight: FontWeight.w700,
          TextColor: ColorCollections.TeritiaryColor,
        ),
        reusableTextField(
          context: context,
          hintText: "enter your email",
          textType: "email",
          enabledBorderColor: Colors.grey.shade500,
          focusedBorderColor: Colors.green,
          onChanged: (onChanged) {},
        ),
        SizedBox(
          height: 15,
        ),
        ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Subject",
          FontSize: 18,
          TextFontWeight: FontWeight.w700,
          TextColor: ColorCollections.TeritiaryColor,
        ),
        DropdownButton<DropdownOptions>(
          dropdownColor: Colors.white,
          value: selectedValue,
          hint: const Text("Select an option"),
          items: DropdownOptions.values.map((DropdownOptions option) {
            return DropdownMenuItem<DropdownOptions>(
              value: option,
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: getDropdownDisplayText(option),
                FontSize: 18,
                TextFontWeight: FontWeight.w500,
                TextColor: ColorCollections.TeritiaryColor,
              ),
            );
          }).toList(),
          onChanged: (onchanged) => onChanged(onchanged),
          underline: Container(), // Remove default underline
          borderRadius: BorderRadius.circular(8),
          isExpanded: true,
        ),
        SizedBox(
          height: 15,
        ),
        ReusableText(
          FromTop: 0,
          FromBottom: 0,
          TextString: "Message",
          FontSize: 18,
          TextFontWeight: FontWeight.w700,
          TextColor: ColorCollections.TeritiaryColor,
        ),
        reusableCommentTextField(
          context: context,
          hintText: "Your Message",
          textType: "message",
          enabledBorderColor: Colors.grey.shade500,
          focusedBorderColor: Colors.green,
          onChanged: (onChanged) {},
        ),
        SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: () {},
          child: Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.green,
            ),
            child: Center(
              child: ReusableText(
                FromTop: 0,
                FromBottom: 0,
                TextString: "Send Message",
                FontSize: 20,
                TextFontWeight: FontWeight.w700,
                TextColor: ColorCollections.PrimaryColor,
              ),
            ),
          ),
        )
      ],
    ),
  );
}
