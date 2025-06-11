import 'package:ekub_application/features/home_page/presentation/widgets/home_page_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: homeNotificationAppBar(context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            homeNotificationReusableContainer(
              context: context,
              title: "Congratulations you are the winner!!!",
              subtitle: "Take your money you are the winner for todays luck",
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            homeNotificationReusableContainer(
              context: context,
              title: "Congratulations you are the winner!!!",
              subtitle: "Take your money you are the winner for todays luck",
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
            homeNotificationReusableContainer(
              context: context,
              title: "Congratulations you are the winner!!!",
              subtitle: "Take your money you are the winner for todays luck",
              onTap: () {},
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
