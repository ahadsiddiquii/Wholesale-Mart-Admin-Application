import '../../assets/icon_assets.dart';
import '../../constants/decorations.dart';
import '../../constants/font_sizes.dart';
import '../../constants/theme_colors.dart';
import '../../exports/space_exports.dart';
import '../../exports/widget_exports.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppbar({
    super.key,
    this.title,
    this.centerTitle = false,
    this.needsTranslation = true,
    this.showHamburger = false,
    this.showLeading = false,
    this.leadingFunction,
    this.showOrderInProgressSection = false,
    this.customWidget,
    this.customWidgetHeight = 0,
    this.extendCurvedContainerHeight = 0,
    this.increaseAppBarHeight = 0,
    this.trailingIcons,
  });

  final String? title;
  final bool centerTitle;
  final bool needsTranslation;
  //Leading
  //Hamburger Icon
  final bool showHamburger;
  final bool showLeading;
  final VoidCallback? leadingFunction;
  //Trailing

  final List<Widget>? trailingIcons;

  final bool? showOrderInProgressSection;
  final Widget? customWidget;
  final double customWidgetHeight;
  final double extendCurvedContainerHeight;
  final double increaseAppBarHeight;

  Widget? _getLeading(BuildContext context) {
    if (showHamburger) {
      return InkWell(
        onTap: leadingFunction,
        child: Image.asset(
          IconAssets.HAMBURGER_ICON,
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
        child: InvertHandledContainer(
          child: Image.asset(
            IconAssets.BACK_ICON,
          ),
        ),
      );
    }
    return null;
  }

  @override
  Size get preferredSize => Size.fromHeight(Decorations.appBarHeight +
      customWidgetHeight +
      extendCurvedContainerHeight +
      increaseAppBarHeight);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Decorations.appBarHeight +
          customWidgetHeight +
          extendCurvedContainerHeight +
          increaseAppBarHeight,
      // padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
        gradient: Decorations.appBarGradient,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(
            Decorations.kAppBarRadius,
          ),
          bottomLeft: Radius.circular(
            Decorations.kAppBarRadius,
          ),
        ),
      ),
      padding: const EdgeInsets.only(
        top: 2.5,
      ),
      child: Column(
        children: [
          AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            leading: _getLeading(context),
            centerTitle: centerTitle,
            title: (title != null)
                ? Padding(
                    padding: Decorations.mediumIconPadding,
                    child: CustomText(
                      title!,
                      needsTranslation: needsTranslation,
                      style: FontSizes.size20Bold(
                        color: Colors.white,
                      ),
                    ),
                  )
                : null,
            actions: trailingIcons,
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
        ],
      ),
    );
  }
}
