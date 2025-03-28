extension StringCasingExtension on String {
  String get toCapitalizedFirst => length > 0 ? '${this[0].toUpperCase()}${substring(1).toLowerCase()}' : '';
  String get toCapitalized => replaceAll(RegExp(' +'), ' ').split(' ').map((str) => str.toCapitalizedFirst).join(' ');
}
