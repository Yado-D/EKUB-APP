import 'package:ekub_application/features/history_page/presentaion/widgets/all_transactions.dart';
import 'package:ekub_application/features/history_page/presentaion/widgets/history_page_widget.dart';
import 'package:ekub_application/features/history_page/presentaion/widgets/payments_page.dart';
import 'package:ekub_application/features/history_page/presentaion/widgets/payout_page.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({super.key});

  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: historyAppBar(context, tabController),
      body: TabBarView(
        controller: tabController,
        children: [
          allTransactions(context),
          payments_page(),
          payouts_page(),
        ],
      ),
    );
  }
}
