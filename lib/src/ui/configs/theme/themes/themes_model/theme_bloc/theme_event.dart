part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class CheckedSavedTheme extends ThemeEvent {}

class SwitchAppTheme extends ThemeEvent {
  SwitchAppTheme({required this.updatedFlavor});
  final ThemeFlavor updatedFlavor;
}
