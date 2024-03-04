import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:icons_plus/icons_plus.dart';

import '../../../configs/app_config.dart';
import '../../../configs/router/routes.dart';
import '../../../configs/screen_config.dart';
import '../../../configs/translation/translations/translations_model/global_translation.dart';
import '../../exports/assets_exports.dart' show IconAssets;
import '../../exports/constants_exports.dart'
    show Decorations, FontSizes, ThemeColors;
import '../../exports/helper_functions_exports.dart' show NavigationBarHandler;
import '../../exports/models_exports.dart' show ItemDetails;
import '../../exports/widget_exports.dart'
    show
        CustomText,
        EliteWholesaleNavBarText,
        HeightSpacer,
        InkWellWrapper,
        PaddingBorder,
        WidthSpacer;
import '../dialogs/used_dialogs.dart';
import 'elite_wholesale_navbar_vertical_tile.dart';

part 'elite_wholesale_navbar_tile.dart';

class EliteWholeSaleSideNavigationBar extends StatelessWidget {
  const EliteWholeSaleSideNavigationBar({
    super.key,
    required this.child,
  });
  final Scaffold child;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      rtlOpening: translations.isLeftLanguageByCode(
        languageCode: translations.currentLanguage,
      ),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          color: ThemeColors.kNavBarBackgroundBlueColor,
        ),
      ),
      controller: NavigationBarHandler.getAdvancedDrawerController(),
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      drawer: SafeArea(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: PaddingBorder(
            verticalPadding: ScreenConfig.screenSizeHeight * 0.02,
            horizontalPadding: ScreenConfig.screenSizeWidth * 0.03,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWellWrapper(
                  onTap: () {
                    NavigationBarHandler.closeDrawer();
                  },
                  child: SizedBox(
                    height: Decorations.kNavBarLargeIconDiameter,
                    width: Decorations.kNavBarLargeIconDiameter,
                    child: Image.asset(
                      IconAssets.CROSS_ICON,
                    ),
                  ),
                ),
                const HeightSpacer(),
                // UserBlocHelper
                //     .requestUserBlocForUserDetailsSectionForNavigationBar(),
                Expanded(
                  // height: ScreenConfig.screenSizeHeight * 0.5,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        _EliteWholesaleNavBarTile(
                          onTap: () {
                            NavigationBarHandler.closeDrawer();
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName(
                                CustomRouter.homeScreenRouteName,
                              ),
                            );
                          },
                          icon: Icons.dashboard_outlined,
                          title: EliteWholesaleNavBarText.DASHBOARD,
                        ),
                        _EliteWholesaleNavBarTile(
                          onTap: () {
                            NavigationBarHandler.closeDrawer();
                            Navigator.popUntil(
                              context,
                              ModalRoute.withName(
                                CustomRouter.homeScreenRouteName,
                              ),
                            );
                          },
                          icon: Icons.person_2_outlined,
                          title: EliteWholesaleNavBarText.USERMANAGEMENT,
                        ),
                        _EliteWholesaleNavBarTile(
                          onTap: () {
                            NavigationBarHandler.closeDrawer();
                            Navigator.pushNamed(
                              context,
                              CustomRouter.allCategoryScreenRouteName,
                            );
                          },
                          icon: Iconsax.category_2_outline,
                          title: EliteWholesaleNavBarText.CATEGORIES,
                        ),
                      ],
                    ),
                  ),
                ),
                const HeightSpacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    EliteWholesaleNavbarVerticalTile(
                        itemDetails: ItemDetails(
                      onTap: () {
                        UsedDialogs.logout(
                          context,
                        );
                      },
                      itemId: 'logout_button',
                      itemName: EliteWholesaleNavBarText.LOGOUT,
                      itemImage: IconAssets.LOGOUT_ICON,
                    )),
                  ],
                ),
                const HeightSpacer(),
                Center(
                  child: CustomText(
                    AppConfig.getAppVersionToShow(),
                    textAlign: TextAlign.center,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: FontSizes.size14Medium(
                      color: Colors.white70,
                    ),
                  ),
                ),
                const HeightSpacer(),
              ],
            ),
          ),
        ),
      ),
      child: child,
      // Scaffold(
      //   appBar: AppBar(
      //     title: const Text('Advanced Drawer Example'),
      //     leading: IconButton(
      //       onPressed: _handleMenuButtonPressed,
      //       icon: ValueListenableBuilder<AdvancedDrawerValue>(
      //         valueListenable: _advancedDrawerController,
      //         builder: (_, value, __) {
      //           return AnimatedSwitcher(
      //             duration: const Duration(milliseconds: 250),
      //             child: Icon(
      //               value.visible ? Icons.clear : Icons.menu,
      //               key: ValueKey<bool>(value.visible),
      //             ),
      //           );
      //         },
      //       ),
      //     ),
      //   ),
      //   body: Container(),
      // ),
    );
  }
}
