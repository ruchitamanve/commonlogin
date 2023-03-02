// ignore_for_file: non_constant_identifier_names

import 'dart:ffi';
import 'dart:io';
import 'dart:typed_data';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

// assuming that your file is called filename.dart. This will give an error at first,
// but it's needed for drift to know about the generated code
part 'moor_db.g.dart';

// this will generate a table called "todos" for us. The rows of that table will
// be represented by a class called "Todo".
class user_ui_details extends Table {
  IntColumn get id => integer().autoIncrement()();
  // TextColumn get title => text().withLength()();
  TextColumn get aOMFeedbackEmailId => text().withLength()();
  TextColumn get aOMFeedbackFromEmailId => text().withLength()();
  TextColumn get baseURL1 => text().withLength()();
  TextColumn get baseURL2 => text().withLength()();
  TextColumn get buttoncolor => text().withLength()();
  TextColumn get clientID => text().withLength()();
  TextColumn get clientLogo => text().withLength()();
  TextColumn get clientName => text().withLength()();
  TextColumn get dottedLineColour => text().withLength()();
  TextColumn get errorNumber => text().withLength()();
  TextColumn get fontFamily => text().withLength()();
  TextColumn get fontFilesName => text().withLength()();
  TextColumn get fontPath => text().withLength()();
  TextColumn get headerColour => text().withLength()();
  TextColumn get headerTextcolour => text().withLength()();
  TextColumn get iconColour => text().withLength()();
  TextColumn get isDownloadAndroid => text().withLength()();
  TextColumn get isDownloadIOS => text().withLength()();
  TextColumn get isDownloadWindows => text().withLength()();
  TextColumn get securityModel => text().withLength()();
  TextColumn get subHeadercolour => text().withLength()();
  TextColumn get subHeadercolourdark => text().withLength()();
  TextColumn get subHeadercolourlight => text().withLength()();
  TextColumn get subscriberSessionGUID => text().withLength()();
  TextColumn get termsOfUseContent => text().withLength()();
  TextColumn get termsOfUseFileName => text().withLength()();
}

class user_related_tokens extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get client_token => text().withLength()();
  TextColumn get device_hash => text().withLength()();
  TextColumn get uuid => text().withLength()();
  TextColumn get android_id => text().withLength()();
  TextColumn get pns_key => text().withLength()();
  TextColumn get some_another_key => text().withLength()();
  TextColumn get some_another_value => text().withLength()();
}

LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'caas_db.sqlite'));
    return NativeDatabase(file);
  });
}

@DriftDatabase(tables: [user_ui_details, user_related_tokens])
class CaasLocalDatabase extends _$CaasLocalDatabase {
  CaasLocalDatabase() : super(_openConnection());

  // you should bump this number whenever you change or add a table definition.
  // Migrations are covered later in the documentation.
  @override
  int get schemaVersion => 1;

  Future<int> insert_user_data(
      user_ui_detailsCompanion user_ui_detailsCompanion) async {
    return await into(userUiDetails).insert(user_ui_detailsCompanion);
  }

  Future<List<user_ui_detail>> fetch_user_data() async {
    return await select(userUiDetails).get();
  }

  Future delete_all_rows() {
    // delete the oldest nine tasks
    print("older rows have been deleted");
    return (delete(userUiDetails).go());
  }

////////////////////////////////////////////////////////////
  Future<int> insert_client_credentials_tokens(
      user_related_tokensCompanion user_related_tokensCompanion) async {
    print("token has been inserted");
    return await into(userRelatedTokens).insert(user_related_tokensCompanion);
  }

  Future<List<user_related_token>> fetch_client_specefic_data_tokens() async {
    return await select(userRelatedTokens).get();
  }
// Future<int> count_rows()  async {

//   var countExp = userRelatedTokens.id.count();
//   final query = selectOnly(userRelatedTokens)..addColumns([countExp]);
//   var result =  query.map((row) => row.read(countExp)).getSingle();

// return await result;
// }
  Stream<user_related_token> entryById(int id) {
    return (select(userRelatedTokens)..where((t) => t.id.equals(id)))
        .watchSingle();
  }

  Future<List<user_related_token>> get allTodoEntries =>
      select(userRelatedTokens).get();
  String getAllOrder() => select(userRelatedTokens).get().toString();

  Future<List<user_related_token>> get_users_tokens() async {
    return await select(userRelatedTokens).get();
  }

  Future delete_all_tokens() {
    // delete the oldest nine tasks
    print("older tokens have been deleted");
    return (delete(userRelatedTokens).go());
  }
}
