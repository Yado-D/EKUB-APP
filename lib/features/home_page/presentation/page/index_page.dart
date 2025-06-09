import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/groups_page/presentation/pages/groups_page.dart';
import 'package:ekub_application/features/history_page/presentaion/pages/history_page.dart';
import 'package:ekub_application/features/home_page/presentation/page/home_page.dart';
import 'package:ekub_application/features/profile/presentaion/pages/profile_page.dart';
import 'package:ekub_application/features/wheel/presentaion/pages/wheel_page.dart';
import 'package:flutter/material.dart';

class IndexPage extends StatefulWidget {
  const IndexPage({super.key});

  @override
  State<IndexPage> createState() => _IndexPageState();
}

class _IndexPageState extends State<IndexPage> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
            print(index);
          });
        },
        backgroundColor: ColorCollections.PrimaryColor,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            label: "Home",
            icon: Icon(Icons.home),
          ),
          BottomNavigationBarItem(
            label: "Groups",
            icon: Icon(Icons.groups),
          ),
          BottomNavigationBarItem(
            label: "Wheel",
            icon: Icon(Icons.circle_outlined),
          ),
          BottomNavigationBarItem(
            label: "History",
            icon: Icon(Icons.history),
          ),
          BottomNavigationBarItem(
            label: "Profile",
            icon: Icon(Icons.person),
          ),
        ],
      ),
    );
  }

  List<Widget> pages = [
    HomePage(),
    GroupsPage(),
    WheelPage(),
    HistoryPage(),
    ProfilePage(),
  ];
}
