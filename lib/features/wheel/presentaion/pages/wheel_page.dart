import 'dart:async';

import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/wheel/presentaion/widgets/wheel_page_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_fortune_wheel/flutter_fortune_wheel.dart';

class WheelPage extends StatefulWidget {
  const WheelPage({super.key});

  @override
  State<WheelPage> createState() => _WheelPageState();
}

class _WheelPageState extends State<WheelPage> {
  int selectedIndex = 0;
  late Stream<int> selectedStream;

  @override
  void initState() {
    super.initState();
    selectedStream = Stream.value(selectedIndex);
  }

  void spinWheel() {
    setState(() {
      selectedIndex = Fortune.randomInt(0, items.length);
      selectedStream = Stream.value(selectedIndex);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: wheelAppBar(context),
      body: GestureDetector(
        onTap: spinWheel,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Expanded(
                child: FortuneWheel(
                  animateFirst: false,
                  selected: selectedStream,
                  indicators: <FortuneIndicator>[
                    FortuneIndicator(
                      alignment: Alignment.topCenter,
                      child: TriangleIndicator(
                        color: Colors.green,
                        width: 20.0,
                        height: 20.0,
                        elevation: 0,
                      ),
                    ),
                  ],
                  items: [
                    for (int i = 0; i < items.length; i++)
                      FortuneItem(
                        child: Text(items[i]),
                        style: FortuneItemStyle(
                          color: colors[i],
                          borderColor: Colors.green,
                          borderWidth: 3,
                        ),
                      ),
                  ],
                ),
              ),
              ReusableText(
                FromTop: 15,
                FromBottom: 0,
                FromLeft: 15,
                TextString: "The Winner is: ${items[selectedIndex]}",
                FontSize: 20,
                TextFontWeight: FontWeight.w900,
                TextColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }

  final items = <String>[
    'Grogu',
    'Dejene',
    'Kaleb',
    'Roba',
    'Yishaq',
    'Yared',
    'Yoda',
    'Estifanose',
  ];
  final colors = <Color>[
    Colors.blue.shade500,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade100,
    Colors.blue.shade500,
    Colors.blue.shade100,
  ];
}