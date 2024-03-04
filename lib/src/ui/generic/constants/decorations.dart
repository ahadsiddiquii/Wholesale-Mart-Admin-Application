import '../../configs/screen_config.dart';
import '../exports/space_exports.dart';
import 'theme_colors.dart';

class Decorations {
  Decorations._();

  static double maxWidth = 1200;

  //App bar Constants
  static double appBarHeight = 60 + 55;
  static double kCurvedBoxHeight = 25;
  static double kAppBarSearchButtonPadding = 8;
  static double kAppBarTrailingButtonPadding = 17;
  static double kAppBarHeightStaticExtension = 45;
  static const double kAppBarSearchbarHeight = 42;
  static const double kHamburgerIconSize = 35;
  // static double kAppBarSearchFieldContentPaddingB =
  //     ScreenConfig.screenSizeHeight * 0.017;
  static double kAppBarSearchFieldContentPaddingB = 4;
  static List<BoxShadow> kAppBarSearchBoxShadow = [
    BoxShadow(
      color: ThemeColors.kThemeColor.withOpacity(0.5), // Shadow color
      offset: const Offset(
          0, 4), // Vertical offset, negative value for bottom shadow
      blurRadius: 4, // Blur radius
    ),
  ];
  static BorderRadius kAppBarSearchBoxBorderRadius = BorderRadius.circular(
    100,
  );
  static LinearGradient appBarGradient = const LinearGradient(
    colors: [
      Color.fromARGB(255, 19, 145, 248),
      Color.fromARGB(255, 90, 171, 252)
    ], // Adjust colors as needed
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static EdgeInsets mediumIconPadding = EdgeInsets.only(
    right: Spaces.defaultSpacingHorizontal * 0.5,
    left: Spaces.defaultSpacingHorizontal * 0.5,
  );

  static EdgeInsets lastIconPadding = EdgeInsets.only(
    right: Decorations.kAppBarTrailingButtonPadding + 5,
    left: Spaces.defaultSpacingHorizontal * 0.5,
  );

  //Bottom Bar Constants
  static double kBottomNavigationBarHeight = 100;
  static double kBottomNavigationBarWidth = 370;
  static const double kBottomBarPadding = 20;

  //TextField Constants
  static double kItemQuantityFieldLargeWidth = 100;
  static double kItemQuantityFieldSmallWidth = 50;
  static double kItemQuantityWithButtonsSmallWidth = 120;

  //Navigation Bar Constants
  static double kNavBarLargeIconDiameter = 30;
  static double kNavBarMediumIconDiameter = 25;

  //List Item Constants
  static const double kListItemDiameter = 80;
  static const double kItemDetailsBoxDiameter = 90;
  static const double kItemDetailsBoxPadding = 8;
  static const double kItemDetailsBoxSpace = 5;

  //Order Item Constants
  static const double kOrderIconDiameter = 30;
  static const double kOrderListItemTrailingBoxWidth = 90;
  static const double kItemsRadius = 10;
  static const double kItemsListGapping = 8;
  static const double kItemsVerticalPadding = 6;
  static const double kItemsHorizontalPadding = 10;
  static List<BoxShadow> kItemBoxShadow = [
    BoxShadow(
      color: ThemeColors.kThemeColor.withOpacity(0.5), // Shadow color
      offset: const Offset(
          0, 2), // Vertical offset, negative value for bottom shadow
      blurRadius: 4, // Blur radius
    ),
  ];

  //Menu Item Constants

  static double kStatisticsItemHeight = 140;
  static double kStatisticsItemWidth = 80;
  static double kStatisticsItemIconDiameter = 50;

  //Three Level Stepper
  static const double stepperCircleRadius = 18;

  //Wide Button Constants and Text Field Constants
  static const double kWideButtonBorderRadius = 8;
  static const double kSecondaryFieldBorderRadius = 10;
  static const double kIconButtonBorderRadius = 4;
  static const double kIconButtonIconSize = 23;
  static const double kAppBarRadius = 22;
  static const double kContainerRadius = 10;

  static const double kWideButtonHeight = 49;
  static const double kWideButtonSecondaryHeight = 40;
  static final double kWideButtonWidth = ScreenConfig.screenSizeWidth * 0.85;
  static const double kIconButtonHeight = 30;
  static final double kIconButtonWidth = ScreenConfig.screenSizeWidth * 0.1;
  static const double kTextFieldHorizontalContentPadding = 21;
  static const double kTextFieldVerticalContentPadding = 9;
  static const double kSecondaryTextFieldVerticalContentPadding = 12;
  static const double kFieldIconHeight = 20;
  static const double kFieldIconWidth = 50;
  static const double kFieldIconVerticalPadding = 15;
  static const double kFieldIconHorizontalPadding = 10;
  static const double kButtonIconSize = 15;

  //Used in onboarding only
  static const double kOnboardingCheckIconDiameter = 16;
  static const double kOnboardingCheckIconSize = 12;
  static const double kOnboardingIconBorder = 2;
  static const double kOtpFieldHeight = 48;
  static const double kOtpFieldWidth = 48;
  static const double kOtpFieldBorder = 12;

  //Letter Spacing and line spacing
  static const double letterSpacingForSmallSizes = -0.2;
  static const double lineSpacingForCompactBoxes = 0.8;

  //Dialog box decorations
  static const double kDialogBoxBottomPadding = 14;
  static const double kDialogBoxIconBLRPadding = 14;
  static const double kDialogBoxRadius = 15;
  static const double kDialogBackgroundOpacity = 15;

  //Product Tile
  static const double kAddSubtractBorderRadius = 12;
  static const double kAddSubtractIconSize = 7;
  static const double kAddSubtractIconWidth = 30;
  static const double kAddSubtractIconHeight = 22;
  static const double kImageBoxHeight = 80;

  //Product Suggestion
  static const double kVerticalFieldContentPadding = 15;
  static const double kHorizontalFieldContentPadding = 20;
  static const EdgeInsets productSuggestionFieldContentPadding =
      EdgeInsets.symmetric(
    vertical: kVerticalFieldContentPadding,
    horizontal: kHorizontalFieldContentPadding,
  );

  //Item Details
  static const double kIconItemDetailsDescriptionTagDiameter = 30;

  //Category Item
  static const double kCategoryItemHeight = 100;
  static const double kCategoryItemPadding = 20;
  static const double kCategoryItemImageBoxHeight = 75;

  //Invoice
  static const double kDueInvoicesVerticalPadding = 10;
  static const double kDueInvoicesHorizontalPadding = 20;
  static const double kDueInvoiceRadius = 12;

  //User Cards
  static BorderRadius kAppBarUserCardBorderRadius = BorderRadius.circular(
    32,
  );
  static List<BoxShadow> kAppBarUserCardBoxShadow = [
    BoxShadow(
      color: Colors.white.withOpacity(0.5), // Shadow color
      offset: const Offset(
          -2, 4), // Vertical offset, negative value for bottom shadow
      blurRadius: 4, // Blur radius
    ),
  ];

  //
  static const double kOnboardingQrDiameter = 300;

  //PopUp constants
  //Double Button Popup
  static double singleButtonWidth = ScreenConfig.screenSizeWidth * 0.25;
  static const double singleButtonHeight = 45;
  static const double spaceBetweenButtons = 15;

  //User Profile Screen
  static BorderRadius kUserProfileTextButtonBorderRadius =
      BorderRadius.circular(
    10,
  );

  static List<BoxShadow> kUserProfileScreenBoxShadow = [
    BoxShadow(
      color: ThemeColors.kThemeColor.withOpacity(0.5), // Shadow color
      offset: const Offset(
          -2, 4), // Vertical offset, negative value for bottom shadow
      blurRadius: 4, // Blur radius
    ),
  ];

  static final double kBorderMarginValue = ScreenConfig.screenSizeWidth * 0.05;

  static final EdgeInsets kBorderMargin = EdgeInsets.symmetric(
    horizontal: kBorderMarginValue,
  );

  static final double kBorderPickingOrderItemValue =
      ScreenConfig.screenSizeWidth * 0.10;

  static final EdgeInsets kBorderPickingOrderItemMargin = EdgeInsets.symmetric(
    horizontal: ScreenConfig.screenSizeWidth * 0.10,
  );

  // Text Field Outline Input Border
  static OutlineInputBorder fieldOutlineBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(
      kWideButtonBorderRadius,
    ),
  );
  static OutlineInputBorder fieldOutlineBlueBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: ThemeColors.kFontSecondaryBlueColor,
    ),
    borderRadius: BorderRadius.circular(
      kWideButtonBorderRadius,
    ),
  );

  static OutlineInputBorder wmsSecondaryFieldOutlineBlueBorder =
      OutlineInputBorder(
    borderSide: const BorderSide(
      color: ThemeColors.kFontSecondaryBlueColor,
    ),
    borderRadius: BorderRadius.circular(
      kSecondaryFieldBorderRadius,
    ),
  );

  static OutlineInputBorder wmsTransparentFieldOutlineBlueBorder =
      OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.transparent,
    ),
    borderRadius: BorderRadius.circular(
      kSecondaryFieldBorderRadius,
    ),
  );

  static OutlineInputBorder fieldOutlineBorderMobileField =
      const OutlineInputBorder(
    borderSide: BorderSide(
      color: ThemeColors.kFontHintColor,
    ),
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(
        Decorations.kWideButtonBorderRadius,
      ),
      bottomRight: Radius.circular(
        Decorations.kWideButtonBorderRadius,
      ),
    ),
  );
}
