import 'package:ekub_application/core/utils/AppShowDialogueWidget.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/auth/presentation/pages/signin.dart';
import 'package:ekub_application/features/profile/presentaion/pages/account_info_page.dart';
import 'package:ekub_application/features/profile/presentaion/widgets/profile_page_widget.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: ProfileAppBar(context),
      body: Container(
        padding: EdgeInsets.all(20),
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              margin: EdgeInsets.only(top: 15),
              padding: EdgeInsets.all(15),
              child: Row(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.blue.shade100,
                    radius: 30,
                    child: Center(
                      child: ReusableText(
                        FromTop: 0,
                        FromBottom: 0,
                        TextString: "Y",
                        FontSize: 20,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ReusableText(
                        FromBottom: 0,
                        TextString: "Yared Dereje",
                        FontSize: 18,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Theme.of(context).colorScheme.primary,
                      ),
                      ReusableText(
                        FromBottom: 0,
                        TextString: "Yareddereje780@gmail.com",
                        FontSize: 18,
                        TextFontWeight: FontWeight.w700,
                        TextColor: Theme.of(context).colorScheme.onPrimary,
                      ),
                    ],
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),

            profileReusableContainer(
              context: context,
              isNotification: false,
              title: "Account Information",
              icon: Icons.person,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AccountInformationScreen(),
                  ),
                );
              },
            ),
            profileReusableContainer(
              context: context,
              isNotification: false,
              title: "Payment Methods",
              icon: Icons.payment,
              onTap: () {},
            ),
            profileReusableContainer(
              context: context,
              isNotification: true,
              notificationNumber: 2,
              title: "Notifications",
              icon: Icons.notifications_none,
              onTap: () {},
            ),
            profileReusableContainer(
              context: context,
              isNotification: false,
              title: "Help & Support",
              icon: Icons.help_outline_rounded,
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                CommonShowDialogue(
                  context: context,
                  TitleText: "Are you sure you want to logout from the app ?",
                  cancelOnTap: () {
                    Navigator.pop(context);
                  },
                  confirmOnTap: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => SigninPage(),
                      ),
                      (pridictable) => false,
                    );
                  },
                );
              },
              child: Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.red.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.logout),
                    SizedBox(
                      width: 10,
                    ),
                    ReusableText(
                      FromBottom: 0,
                      TextString: "Log Out",
                      FontSize: 18,
                      TextFontWeight: FontWeight.w700,
                      TextColor: Theme.of(context).colorScheme.onPrimary,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
