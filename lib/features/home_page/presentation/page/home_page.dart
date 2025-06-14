import 'package:ekub_application/config/theme/app_color_pallet.dart';
import 'package:ekub_application/core/utils/common_snackbar.dart';
import 'package:ekub_application/core/utils/common_widget.dart';
import 'package:ekub_application/features/groups_page/presentation/pages/groups_page.dart';
import 'package:ekub_application/features/home_page/presentation/bloc/home_bloc.dart';
import 'package:ekub_application/features/home_page/presentation/widgets/home_shimmer_effect.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/home_page_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    setState(() {
      context.read<HomeBloc>().add(LoadEqubFromLocal());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: homeAppBar(context),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<HomeBloc, HomeState>(
        listener: (context, state) {
          if (state is HomeFailure) {
            commonSnackBar(
                context, state.message.toString(), ColorCollections.GreenColor);
          }
        },
        builder: (context, state) {
          if (state is HomeLoading || state is HomeInitial)
            return buildShimmerEffect();
          final success = state as HomeSuccess;

          return ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 15),
                      padding: const EdgeInsets.all(15),
                      height: 78,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.green.shade100),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.green.shade500,
                            radius: 20,
                            child: Icon(Icons.info_outline_rounded),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ReusableText(
                                FromTop: 0,
                                FromBottom: 0,
                                TextString: "You have a pending payment for ",
                                FontSize: 15,
                                TextFontWeight: FontWeight.w600,
                                TextColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                              ReusableText(
                                FromTop: 0,
                                FromBottom: 0,
                                TextString: "\"Work Colleagues\"",
                                FontSize: 15,
                                TextFontWeight: FontWeight.w600,
                                TextColor:
                                    Theme.of(context).colorScheme.primary,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          TextString: "Your Active Equbs",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w800,
                          TextColor: Theme.of(context).colorScheme.primary,
                        ),
                        InkWell(
                          onTap: () {},
                          child: ReusableText(
                            FromTop: 0,
                            FromBottom: 0,
                            TextString: "View All",
                            FontSize: 15,
                            TextFontWeight: FontWeight.w700,
                            TextColor: Colors.green.shade900,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: success.equbModel.length,
                      itemBuilder: (context, index) {
                        final data = success.equbModel[index];
                        return equbsReusableContainer(
                          context: context,
                          equbName: data.name,
                          member: data.members_no,
                          cycleProgress: data.cycle_progress,
                          dateOfPayment: DateTime.now(),
                          isPayed: true,
                          onPayNow: () {},
                          onEqubClicked: () {},
                        );
                      },
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        homePaymentAndJoinGroupContainer(
                          context: context,
                          title: "Join New Group",
                          icon: Icons.add,
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => GroupsPage(),
                              ),
                            );
                          },
                        ),
                        SizedBox(width: 5),
                        homePaymentAndJoinGroupContainer(
                          context: context,
                          title: "Make Payment",
                          icon: Icons.payment,
                          onTap: () => showPaymentDialog(
                            context: context,
                            payingTo: "Family Group",
                            amount: "500",
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ReusableText(
                          FromTop: 0,
                          FromBottom: 0,
                          TextString: "Recent Transaction",
                          FontSize: 18,
                          TextFontWeight: FontWeight.w800,
                          TextColor: Theme.of(context).colorScheme.primary,
                        ),
                        InkWell(
                          onTap: () {},
                          child: ReusableText(
                            FromTop: 0,
                            FromBottom: 0,
                            TextString: "View All",
                            FontSize: 15,
                            TextFontWeight: FontWeight.w700,
                            TextColor: Colors.blue.shade900,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      child: ListView(
                        shrinkWrap: true,
                        children: [
                          recentTransactionContainer(
                            icon: Icons.add,
                            context: context,
                            title: "Payment to Friends Saving",
                            money: 200.0,
                            dateOfPayment: DateTime.now(),
                            onTap: () {},
                          ),
                          recentTransactionContainer(
                            icon: Icons.minimize,
                            context: context,
                            title: "Received Payout",
                            money: 185.0,
                            dateOfPayment: DateTime.now(),
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
