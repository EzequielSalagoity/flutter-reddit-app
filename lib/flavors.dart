enum Flavor {
  dev,
  staging,
  production,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'Flutter Reddit Dev';
      case Flavor.staging:
        return 'Flutter Reddit Staging';
      case Flavor.production:
        return 'Flutter Reddit Prod';
      default:
        return 'title';
    }
  }

}
