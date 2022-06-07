import 'package:drift/drift.dart';

@DataClassName('TokenDataClass')
class TokenTable extends Table {
  TextColumn get token => text()();
}
