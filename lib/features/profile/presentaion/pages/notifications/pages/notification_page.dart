import 'package:ekub_application/features/profile/presentaion/pages/help/help_widgets/help_widget_page.dart';
import 'package:ekub_application/features/profile/presentaion/pages/notifications/widgets/notification_widget.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: notificationsAppBar(context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 15,
              ),
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  notificationReusableContainer(
                    context: context,
                    title: "Payment Due",
                    subtitle: "Get notified when the payment is due",
                    value: true,
                    switchClicked: (onChanged) {},
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  reusableSliceContainer(),
                  SizedBox(
                    height: 15,
                  ),
                  notificationReusableContainer(
                    context: context,
                    title: "Payment Received",
                    subtitle: "Get notified when you receive a payment",
                    value: true,
                    switchClicked: (onChanged) {},
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  reusableSliceContainer(),
                  SizedBox(
                    height: 15,
                  ),
                  notificationReusableContainer(
                    context: context,
                    title: "New Group Invitation",
                    subtitle: "Get notified when you're invited to a new group",
                    value: true,
                    switchClicked: (onChanged) {},
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  reusableSliceContainer(),
                  SizedBox(
                    height: 15,
                  ),
                  notificationReusableContainer(
                    context: context,
                    title: "Group Updates",
                    subtitle: "Get notified about group activity and updates",
                    value: false,
                    switchClicked: (onChanged) {},
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15,
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
