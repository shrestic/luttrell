// ignore_for_file: constant_identifier_names

enum Flavor {
  PROD,
  DEV,
  STAGE,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.PROD:
        return 'Production';
      case Flavor.DEV:
        return 'Development';
      case Flavor.STAGE:
        return 'Stage';
      default:
        return 'title';
    }
  }
}
