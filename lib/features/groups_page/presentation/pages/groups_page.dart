import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/groups_widget.dart';

class GroupsPage extends StatefulWidget {
  const GroupsPage({super.key});

  @override
  State<GroupsPage> createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: groupsAppBar(context),
      body: Container(
        padding: EdgeInsets.all(15),
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                      ),
                      onChanged: (value) {},
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        isDense: true,
                        hintText: "Search groups ...",
                        hintStyle: TextStyle(
                          color: Theme.of(context).colorScheme.onPrimary,
                        ),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      obscureText: false,
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue.shade50,
                    ),
                    child: Icon(Icons.filter_alt),
                  )
                ],
              ),
            ),
            ReusableText(
              FromTop: 15,
              FromBottom: 0,
              FromLeft: 15,
              TextString: "Your Groups",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                equbGroupReusableContainer(
                  context: context,
                  equbName: "Friends Saving",
                  amount: 185.0,
                  newRecipient: "Yared",
                  isPayed: true,
                  member: 11,
                  onTap: () {},
                ),
                equbGroupReusableContainer(
                  context: context,
                  equbName: "Colleagues Saving",
                  amount: 185.0,
                  newRecipient: "Dereje",
                  isPayed: true,
                  member: 8,
                  onTap: () {},
                ),
              ],
            ),
            ReusableText(
              FromTop: 15,
              FromBottom: 0,
              FromLeft: 15,
              TextString: "Available Groups",
              FontSize: 20,
              TextFontWeight: FontWeight.w900,
              TextColor: Theme.of(context).colorScheme.primary,
            ),
            ListView(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: [
                equbGroupReusableContainer(
                  context: context,
                  equbName: "Delta Saving",
                  amount: 185.0,
                  newRecipient: "Dejene",
                  isPayed: true,
                  member: 19,
                  onTap: () {},
                ),
                equbGroupReusableContainer(
                  context: context,
                  equbName: "Alpha",
                  amount: 20.0,
                  newRecipient: "Workineh",
                  isPayed: true,
                  member: 21,
                  onTap: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
