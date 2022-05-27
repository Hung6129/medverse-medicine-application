import 'dart:io';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseSqliteConnection {
  /// Get database's name
  static const String glossary = "Glossary.sqlite";
  static const String drugBank = "drugbank.sqlite3";

  /// Access to SQLite path
  static Future<Database> glossaryAccess() async {
    String databasePath = join(await getDatabasesPath(), glossary);

    if (await databaseExists(databasePath)) {
      print("Database already exists");
    } else {
      ByteData data = await rootBundle.load("database/$glossary");

      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Database has been copied.");
    }
    return openDatabase(databasePath);
  }

  /// Access to SQLite path
  static Future<Database> drugBankAccess() async {
    String databasePath = join(await getDatabasesPath(), drugBank);

    if (await databaseExists(databasePath)) {
      print("Database already exists");
    } else {
      ByteData data = await rootBundle.load("database/$drugBank");

      List<int> bytes =
      data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      await File(databasePath).writeAsBytes(bytes, flush: true);
      print("Database has been copied.");
    }
    return openDatabase(databasePath);
  }
}