import 'package:icons_plus/icons_plus.dart';

import '../../../configs/screen_config.dart';
import '../../../configs/translation/translations/translations_model/global_translation.dart';
import '../../constants/decorations.dart';
import '../../constants/font_sizes.dart';
import '../../constants/generic_used_texts.dart';
import '../../constants/theme_colors.dart';
import '../../exports/assets_exports.dart';
import '../../exports/space_exports.dart';
import '../../exports/widget_exports.dart';
import 'appbar_extensions/trailing_extension.dart';

class CustomAppbarWithSearchbar extends StatelessWidget
    implements PreferredSizeWidget {
  const CustomAppbarWithSearchbar({
    super.key,
    this.title,
    this.titleImage,
    this.needsTranslation = true,
    this.showHamburger = false,
    this.showLeading = false,
    this.leadingFunction,
    this.showSearchBar = true,
    this.showSearchBarCrossIcon = false,
    this.searchBarCrossAdditionFunction,
    this.showImageOverlay = false,
    this.showUserIcon = true,
    this.userIconFunction,
    this.showOtherIcon = false,
    this.otherIcon,
    this.otherIconFunction,
    this.showOtherIconNumber = false,
    this.otherIconWidget,
    this.showOrderInProgressSection = false,
    this.searchBarIcon,
    this.searchBarIconColor,
    this.searchBarIconFunction,
    this.showSearchBarScanner = true,
    this.showSearchScannerCustomFunction,
    this.searchHint,
    this.searchController,
    this.customWidget,
    this.customWidgetHeight = 0,
    this.extendCurvedContainerHeight = 0,
    this.increaseAppBarHeight = 0,
    this.onChangeSearch,
    this.showSearchInBar = false,
    this.showCartIcon = false,
    this.showThreeDots = false,
  });

  final String? title, titleImage;
  final bool needsTranslation;
  //Leading
  //Hamburger Icon
  final bool showHamburger;
  final bool showLeading;
  final VoidCallback? leadingFunction;
  //Search Bar
  final bool showSearchBar;
  final bool showImageOverlay;
  //Trailing
  final bool showUserIcon;
  final VoidCallback? userIconFunction;
  final bool showOtherIcon;
  final IconData? otherIcon;
  final VoidCallback? otherIconFunction;
  final bool showOtherIconNumber;
  final Widget? otherIconWidget;
  final String? searchBarIcon;
  final Color? searchBarIconColor;
  final VoidCallback? searchBarIconFunction;
  final bool showSearchBarCrossIcon;
  final VoidCallback? searchBarCrossAdditionFunction;
  final bool showSearchBarScanner;
  final VoidCallback? showSearchScannerCustomFunction;
  final String? searchHint;
  final void Function(String)? onChangeSearch;
  final TextEditingController? searchController;
  final bool? showOrderInProgressSection;
  final Widget? customWidget;
  final double customWidgetHeight;
  final double extendCurvedContainerHeight;
  final double increaseAppBarHeight;

  //Trailing Icons
  final bool showSearchInBar, showCartIcon, showThreeDots;

  Widget? _getLeading(BuildContext context) {
    if (showHamburger) {
      return InkWell(
        onTap: leadingFunction,
        child: const Icon(
          BoxIcons.bx_menu_alt_left,
          size: Decorations.kHamburgerIconSize,
        ),
      );
    }
    if (showLeading) {
      return InkWell(
          onTap: () {
            if (leadingFunction != null) {
              leadingFunction!();
            }
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            size: Decorations.kButtonIconSize + 12,
          )
          // InvertHandledContainer(
          //   child: Image.asset(
          //     IconAssets.BACK_ICON,
          //   ),
          // ),
          );
    }
    return null;
  }

  Widget? _getSuffixIcon() {
    if (showSearchBarCrossIcon &&
        searchController != null &&
        searchController!.text.isNotEmpty) {
      return InkWellWrapper(
        onTap: () {
          searchController!.clear();
          if (searchBarCrossAdditionFunction != null) {
            searchBarCrossAdditionFunction!();
          }
        },
        child: Icon(
          Icons.close_rounded,
          size: Decorations.kAppBarTrailingButtonPadding + 2,
          color: ThemeColors.kFontSearchHintColor,
        ),
      );
    }
    return Icon(
      Iconsax.search_normal_1_outline,
      size: Decorations.kAppBarTrailingButtonPadding,
      color: ThemeColors.kFontSearchHintColor,
    );
  }

  List<Widget>? _getTrailing() {
    List<Widget>? trailingWidgets;
    if (showSearchInBar) {
      trailingWidgets ??= [];
      trailingWidgets.add(
        InkWellWrapper(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
              right: Spaces.defaultSpacingHorizontal * 1.5,
              left: Spaces.defaultSpacingHorizontal * 1.5,
            ),
            child: const Icon(
              Iconsax.search_normal_1_outline,
            ),
          ),
        ),
      );
    }
    if (showCartIcon) {
      trailingWidgets ??= [];
      trailingWidgets.add(
        InkWellWrapper(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
              right: Spaces.defaultSpacingHorizontal * 1.5,
              left: Spaces.defaultSpacingHorizontal * 1.5,
            ),
            child: const Icon(
              Bootstrap.cart3,
            ),
          ),
        ),
      );
    }

    if (showThreeDots) {
      trailingWidgets ??= [];
      trailingWidgets.add(
        InkWellWrapper(
          onTap: () {},
          child: Padding(
            padding: EdgeInsets.only(
              right: Spaces.defaultSpacingHorizontal * 0.5,
              left: Spaces.defaultSpacingHorizontal * 0.5,
            ),
            child: const Icon(
              Bootstrap.three_dots_vertical,
            ),
          ),
        ),
      );
    }

    if (showUserIcon || showOtherIcon) {
      trailingWidgets ??= [];
      trailingWidgets.add(
        TrailingExtensionDisplay(
          showUserIcon: showUserIcon,
          userIconFunction: userIconFunction,
          showOtherIcon: showOtherIcon,
          otherIcon: otherIcon,
          otherIconFunction: otherIconFunction,
          otherIconWidget: otherIconWidget,
          showOtherIconNumber: showOtherIconNumber,
        ),
      );
    }
    if (trailingWidgets != null && trailingWidgets.isNotEmpty) {
      trailingWidgets.add(
        const WidthSpacer(),
      );
    }

    return trailingWidgets;
  }

  @override
  Size get preferredSize => Size.fromHeight(Decorations.appBarHeight +
      customWidgetHeight +
      extendCurvedContainerHeight +
      increaseAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: ThemeColors.kAppBarColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          leading: _getLeading(context),
          centerTitle: false,
          title: (title != null)
              ? CustomText(
                  title!,
                  needsTranslation: needsTranslation,
                  style: FontSizes.size20Medium(
                    color: Colors.white,
                  ),
                )
              : (titleImage != null)
                  ? SizedBox(
                      height: 40,
                      width: 145,
                      child: Image.asset(
                        titleImage!,
                        fit: BoxFit.contain,
                      ),
                    )
                  : null,
          actions: _getTrailing(),
        ),
        if (customWidget != null) ...[
          Container(
            height: customWidgetHeight,
            width: Decorations.maxWidth,
            decoration: const BoxDecoration(
              color: ThemeColors.kThemeColor,
            ),
            child: customWidget,
          ),
        ],
        SizedBox(
          width: Decorations.maxWidth,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                height:
                    Decorations.kCurvedBoxHeight + extendCurvedContainerHeight,
                width: Decorations.maxWidth,
                decoration: const BoxDecoration(
                  color: ThemeColors.kThemeColor,
                  borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(
                      Decorations.kContainerRadius + 20,
                    ),
                    bottomLeft: Radius.circular(
                      Decorations.kContainerRadius + 20,
                    ),
                  ),
                ),
              ),
              if (showImageOverlay)
                Padding(
                  padding: EdgeInsets.only(
                    top: Spaces.defaultSpacingVertical,
                  ),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: CircleAvatar(
                      radius: ScreenConfig.screenSizeHeight * 0.075,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        radius: ScreenConfig.screenSizeHeight * 0.07,
                        backgroundColor: ThemeColors.kFontSecondaryBlueColor,
                        child: const SizedBox(),
                        // UserBlocHelper
                        //     .requestUserBlocForUserProfileImageDisplay(
                        //   diameter: ScreenConfig.screenSizeHeight * 0.14,
                        //   invertedErrorColors: true,
                        // ),
                      ),
                    ),
                  ),
                ),
              if (showSearchBar)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        height: Decorations.kAppBarSearchbarHeight,
                        margin: translations.isLeftLanguageByCode(
                          languageCode: translations.currentLanguage,
                        )
                            ? EdgeInsets.only(
                                right: Decorations.kBorderMarginValue,
                                left: (searchBarIcon == null)
                                    ? Decorations.kBorderMarginValue
                                    : 0,
                              )
                            : EdgeInsets.only(
                                left: Decorations.kBorderMarginValue,
                                right: (searchBarIcon == null)
                                    ? Decorations.kBorderMarginValue
                                    : 0,
                              ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          // boxShadow: Decorations.kAppBarSearchBoxShadow,
                          borderRadius:
                              Decorations.kAppBarSearchBoxBorderRadius,
                        ),
                        child: Row(
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.all(
                            //     Decorations.kAppBarTrailingButtonPadding,
                            //   ),
                            //   child: Image.asset(
                            //     IconAssets.SEARCH_ICON,
                            //     fit: BoxFit.contain,
                            //   ),
                            // ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal:
                                      Decorations.kAppBarTrailingButtonPadding,
                                ),
                                child: EliteWholesaleBlankInputField(
                                  controller: searchController,
                                  hintText:
                                      searchHint ?? GenericUsedText.SEARCHHERE,
                                  onChanged: (value) => onChangeSearch!(value),
                                  customWidth:
                                      ScreenConfig.screenSizeWidth * 0.4,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                if (showSearchBarScanner) {
                                  if (showSearchScannerCustomFunction != null) {
                                    showSearchScannerCustomFunction!();
                                  } else {
                                    // Navigator.pushNamed(
                                    //   context,
                                    //   CustomRouter
                                    //       .manuallySearchScreenRouteName,
                                    // );
                                  }
                                }
                              },
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical:
                                      Decorations.kAppBarTrailingButtonPadding -
                                          5,
                                  horizontal:
                                      Decorations.kAppBarTrailingButtonPadding +
                                          5,
                                ),
                                child: showSearchBarScanner
                                    ? Image.asset(
                                        IconAssets.SCANNER_ICON,
                                        fit: BoxFit.contain,
                                      )
                                    : _getSuffixIcon(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    if (searchBarIcon != null)
                      Expanded(
                        child: Container(
                          height: Decorations.kWideButtonHeight,
                          width: Decorations.kWideButtonHeight,
                          margin: Decorations.kBorderMargin,
                          decoration: BoxDecoration(
                            boxShadow: Decorations.kAppBarSearchBoxShadow,
                            color: Colors.white,
                            borderRadius:
                                Decorations.kAppBarSearchBoxBorderRadius,
                          ),
                          child: InkWellWrapper(
                            onTap: searchBarIconFunction ?? () {},
                            child: (searchBarIcon != null)
                                ? Stack(
                                    alignment: AlignmentDirectional.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(
                                          Decorations
                                              .kAppBarTrailingButtonPadding,
                                        ),
                                        child: Image.asset(
                                          searchBarIcon!,
                                          fit: BoxFit.contain,
                                          color: searchBarIconColor,
                                        ),
                                      ),
                                    ],
                                  )
                                : const SizedBox(),
                          ),
                        ),
                      )
                  ],
                )
            ],
          ),
        )
      ],
    );
  }
}
