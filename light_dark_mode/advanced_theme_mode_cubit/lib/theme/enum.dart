enum ThemeType { dark, light }

extension ThemeTypeExtension on ThemeType {
  static const values = {
    0: ThemeType.dark,
    1: ThemeType.light,
  };

  ThemeType? get value => values[this];
}
