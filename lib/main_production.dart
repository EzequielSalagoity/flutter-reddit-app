import 'flavors.dart';
import 'main.dart' as app;

void main() async {
  F.appFlavor = Flavor.production;
  app.main();
}
