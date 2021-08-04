import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wavr/config/pallate.dart';
import 'package:wavr/config/wavr_icons.dart';
import 'package:wavr/features/dashboard/view/dashboard.dart';
import 'package:wavr/features/home/controller/home_controller.dart';
import 'package:wavr/features/settings/view/settings_screen.dart';
import 'package:wavr/features/transactions_screen/view/transactions_screen.dart';
import 'package:wavr/features/transfers_screen/view/transfers_screen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      builder: (controller) {
        return Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
               Dashboard(),
               TransfersScreen(),
                TransactionsScreen(),
                SettingsScreen(),
              ],
            ),
          ),
            bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: wItemUnSelected,
            selectedItemColor: wPrimaryColorDark,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.white,
            elevation: 0,
            items: [
              _bottomNavigationBarItem(
                icon: Icon(Wavr.home),
                label: 'Home',
              ),
              _bottomNavigationBarItem(
                icon: Icon(Wavr.transfer),
                label: 'Transfer',
              ),
              _bottomNavigationBarItem(
                icon: Icon(Wavr.transactions),
                label: 'Transactions',
              ),
              _bottomNavigationBarItem(
                icon: Icon(Wavr.settings),
                label: 'Settings',
              ),
            ],
          ),
        );
      },
    );
  }

  _bottomNavigationBarItem({required Icon icon, required String label}) {
    return BottomNavigationBarItem(
      icon: icon,
      label: label,
    );
   }
  }