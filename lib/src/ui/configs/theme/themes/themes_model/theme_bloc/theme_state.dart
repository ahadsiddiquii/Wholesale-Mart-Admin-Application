part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {}

class ThemeFetched extends ThemeState {
  ThemeFetched({required this.theme});
  final ThemeFlavor theme;
}
