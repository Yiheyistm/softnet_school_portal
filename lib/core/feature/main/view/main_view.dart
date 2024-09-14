import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/theme/view/theme_view.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/core/widget/dashboard_header.dart';
import 'package:softnet_school_portal/core/widget/drawer_menu.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int _selectedPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(defaultPadding),
          child: Row(
            children: [
              Expanded(
                child: SideMenu(
                  onItemSelected: (int index) {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      setState(() {
                        _selectedPage = index;
                      });
                    });
                  },
                ),
              ),
              Expanded(
                flex: 4,
                child: Column(
                  children: [
                    const DashboardHeader(),
                    // Dashboard Content - switch views with IndexedStack
                    Expanded(
                      child: IndexedStack(
                        index: _selectedPage,
                        children: [
                          // List of container widgets
                          Container(
                            color: Colors.red,
                            width: double.infinity,
                          ),
                          Container(
                            color: Colors.green,
                            width: double.infinity,
                          ),
                          Container(
                            color: Colors.blue,
                            width: double.infinity,
                          ),
                          Container(
                            color: Colors.yellow,
                            width: double.infinity,
                          ),
                          const ThemeView(),

                          Container(
                            color: Colors.purple,
                            width: double.infinity,
                          ),
                          Container(
                            color: Colors.orange,
                            width: double.infinity,
                          ),
                          // DashboardPage1(), // First dashboard view
                          // DashboardPage2(), // Second dashboard view
                          // DashboardPage3(), // Add as needed
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
