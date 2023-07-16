import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc_tutorial/presentation/core/storage.dart';
import 'package:firebase_core/firebase_core.dart';

class Global {
  static late StorageService storageService;

  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    storageService = await StorageService().init();
  }
}
