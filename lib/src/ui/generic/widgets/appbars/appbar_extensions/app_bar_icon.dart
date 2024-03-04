import '../../../exports/constants_exports.dart';
import '../../../exports/space_exports.dart';
import '../../../exports/widget_exports.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    super.key,
    required this.icon,
    this.isFinalButton = false,
    this.onTap,
  });
  final IconData icon;
  final VoidCallback? onTap;
  final bool isFinalButton;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: isFinalButton
          ? Decorations.lastIconPadding
          : Decorations.mediumIconPadding,
      child: InkWellWrapper(
        onTap: onTap,
        child: CircleAvatar(
          backgroundColor: Colors.white,
          radius: 18,
          child: Icon(
            icon,
            size: 20,
          ),
        ),
      ),
    );
  }
}
