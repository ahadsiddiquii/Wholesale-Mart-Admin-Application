import '../../constants/font_sizes.dart';
import '../../exports/space_exports.dart';
import '../../models/menu_item_details.dart';
import '../buttons/ink_well_wrapper.dart';
import '../spacers/height_spacer.dart';
import '../text/custom_text.dart';

class EliteWholesaleNavbarVerticalTile extends StatelessWidget {
  const EliteWholesaleNavbarVerticalTile({
    super.key,
    required this.itemDetails,
    this.textColor = Colors.white,
  });
  final ItemDetails itemDetails;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return InkWellWrapper(
      onTap: itemDetails.onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            itemDetails.itemImage,
            fit: BoxFit.contain,
          ),
          HeightSpacer(
            space: Spaces.fieldSpacingVertical,
          ),
          CustomText(
            itemDetails.itemName,
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: FontSizes.size16Medium(
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
