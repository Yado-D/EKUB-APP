import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/profile/presentaion/pages/help/help_widgets/help_widget_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HelpPage extends StatefulWidget {
  const HelpPage({super.key});

  @override
  State<HelpPage> createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> {
  DropdownOptions? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: helpAppBar(context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Column(
              children: [
                Container(
                  height: 60,
                  width: 60,
                  child: Image.asset("assets/icons/public_safty.png"),
                ),
                ReusableText(
                  FromTop: 15,
                  FromBottom: 0,
                  TextString: "How  can  we  help ? ",
                  FontSize: 25,
                  TextFontWeight: FontWeight.w900,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                ReusableText(
                  FromTop: 5,
                  FromBottom: 15,
                  TextString: "Choose how you'd like to get support ",
                  FontSize: 18,
                  TextFontWeight: FontWeight.w700,
                  TextColor: Theme.of(context).colorScheme.primary,
                ),
                liveChatContainer(
                  context: context,
                  onChatStart: () {
                    
                  },
                ),
                SizedBox(
                  height: 15,
                ),
                callSupportWidget(context),
                SizedBox(
                  height: 15,
                ),
                faqWidget(context),
                SizedBox(
                  height: 15,
                ),
                emailSupportMessage(
                  context: context,
                  onChanged: (DropdownOptions? newValue) {
                    setState(() {
                      selectedValue = newValue;
                    });
                  },
                  selectedValue: selectedValue,
                ),
                SizedBox(
                  height: 70,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
