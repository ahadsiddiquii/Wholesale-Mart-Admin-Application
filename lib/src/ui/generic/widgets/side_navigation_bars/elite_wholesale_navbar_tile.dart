part of 'elite_wholesale_side_navigation_bar.dart';

class _EliteWholesaleNavBarTile extends StatelessWidget {
  const _EliteWholesaleNavBarTile({
    required this.onTap,
    required this.title,
    required this.icon,
  });
  final VoidCallback? onTap;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: onTap ?? () {},
      child: PaddingBorder(
        verticalPadding: ScreenConfig.screenSizeHeight * 0.015,
        horizontalPadding: ScreenConfig.screenSizeWidth * 0.04,
        child: Row(
          children: [
            WidthSpacer(
              space: ScreenConfig.screenSizeWidth * 0.05,
            ),
            Icon(
              icon,
              color: Colors.white,
              size: Decorations.kNavBarMediumIconDiameter + 5,
            ),
            WidthSpacer(
              space: ScreenConfig.screenSizeWidth * 0.06,
            ),
            CustomText(
              title,
              style: FontSizes.size16Medium(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
