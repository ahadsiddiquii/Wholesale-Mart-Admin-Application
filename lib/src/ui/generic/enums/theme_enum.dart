enum ThemeFlavor {
  Default,
  Dark,
}

ThemeFlavor? getThemeFlavorByName(String name) {
  for (final value in ThemeFlavor.values) {
    if (value.name == name) {
      return value;
    }
  }
  return null;
}
