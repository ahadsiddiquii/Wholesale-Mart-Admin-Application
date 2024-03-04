import 'package:flutter/material.dart';

import '../../../../generic/context/app_context.dart';
import '../../../../generic/exports/assets_exports.dart';
import '../../../../generic/exports/helper_functions_exports.dart';
import '../../../../generic/exports/widget_exports.dart';
import '../../../../generic/widgets/appbars/custom_appbar_with_searchbar.dart';
import '../home_widgets/dashboard_wide_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return EliteWholeSaleSideNavigationBar(
      child: Scaffold(
        key: appContext.scaffoldKey,
        appBar: const CustomAppbarWithSearchbar(
          showSearchBarScanner: false,
          showSearchBar: false,
          leadingFunction: NavigationBarHandler.openDrawer,
          showUserIcon: false,
          extendCurvedContainerHeight: -10,
          showOtherIcon: true,
          showHamburger: true,
          titleImage: ImageAssets.DHA_MART_LOGO,
          showSearchBarCrossIcon: true,
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardWideTile(
                    isLeftTile: true,
                    iconString: IconAssets.TOTAL_SALES_ICON,
                    heading: 'Total Sales',
                    text: '0',
                  ),
                  DashboardWideTile(
                    iconString: IconAssets.REGISTERED_USERS_ICON,
                    heading: 'Registered Users',
                    text: '0',
                  ),
                ],
              ),
              HeightSpacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  DashboardWideTile(
                    isLeftTile: true,
                    iconString: IconAssets.TOTAL_ORDERS_ICON,
                    heading: 'Total Orders',
                    text: '0',
                  ),
                  DashboardWideTile(
                    iconString: IconAssets.ACTIVE_ORDERS_ICON,
                    heading: 'Active Orders',
                    text: '0',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
