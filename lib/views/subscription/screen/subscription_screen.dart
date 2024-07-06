import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:subscription/common/extension/context_ext.dart';
import 'package:subscription/common/widgets/base_layout.dart';
import 'package:subscription/views/subscription/widgets/custom_elevated_button.dart';
import 'package:subscription/views/subscription/widgets/custom_item_button.dart';
import 'package:subscription/views/subscription/widgets/subscription_container.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
  int _selectedSubscriptionProvider = 1;

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final screenSize = context.screenSize;
    return Container(
      color: Colors.blueGrey,
      constraints: const BoxConstraints(maxWidth: 1440),
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: context.isTablet ? AppBar() : null,
          drawer: context.isTablet ? const Drawer() : null,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                children: [
                  /*<<----------->> top bar <<----------->>*/
                  if (context.isLabtop || context.isDesktop)
                    Container(
                      padding: const EdgeInsets.all(10),
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              "MONIRUL ISLAM",
                              style: theme.textTheme.bodyLarge?.copyWith(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomItemButton(
                                  label: "How it works",
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                ),
                                CustomItemButton(
                                  label: "Services",
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                ),
                                CustomItemButton(
                                  label: "Pricing",
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                ),
                                CustomItemButton(
                                  label: "Reviews",
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                ),
                                CustomItemButton(
                                  label: "Blog",
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Expanded(
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: CustomElevatedButton(
                                label: "Join the team",
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  /*<<----------->> extra size <<----------->>*/
                  SizedBox(
                    height: screenSize.height * .1,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /*<<----------->> subscription title <<----------->>*/
                      Text(
                        "Subscription",
                        style: theme.textTheme.displayLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 200),
                      /*<<----------->> subscription tab <<----------->>*/
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 3,
                          vertical: 3,
                        ),
                        decoration: BoxDecoration(
                          color: CupertinoColors.systemGrey5,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          children: [
                            /*<<----------->> for individuals <<----------->>*/
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSubscriptionProvider = 1;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedSubscriptionProvider == 1
                                      ? theme.colorScheme.primary
                                      : null,
                                ),
                                child: Text(
                                  "For individuals",
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: _selectedSubscriptionProvider == 1
                                        ? theme.colorScheme.onPrimary
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            /*<<----------->> for companies <<----------->>*/
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedSubscriptionProvider = 2;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: _selectedSubscriptionProvider == 1
                                      ? null
                                      : theme.colorScheme.primary,
                                ),
                                child: Text(
                                  "For companies",
                                  style: theme.textTheme.bodyLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: _selectedSubscriptionProvider == 1
                                        ? Colors.black
                                        : theme.colorScheme.onPrimary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: screenSize.height * .1,
                  ),
                  SizedBox(
                    height: screenSize.height * .6,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SubscriptionContainer(
                          dollar: "49",
                          month: "30",
                        ),
                        SubscriptionContainer(
                          dollar: "109",
                          month: "60",
                        ),
                        SubscriptionContainer(
                          dollar: "159",
                          month: "90",
                        ),
                        SubscriptionContainer(
                          dollar: "205",
                          month: "120",
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
