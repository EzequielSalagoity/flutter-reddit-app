import 'flavors.dart';
import 'main.dart' as app;

void main() async {
  F.appFlavor = Flavor.dev;
  app.main();
}
