import 'package:appwrite/appwrite.dart';
import 'package:modul3/app/modules/home/controllers/auth_controller.dart';
import 'package:modul3/main.dart';

class DatabaseModels {
  DatabaseModels._privateConstructor();
  static final DatabaseModels _instance = DatabaseModels._privateConstructor();
  static DatabaseModels get instance => _instance;

  static Databases? databases;

  init() {
    databases = Databases(client);
  }

  createTodo({
    required String title,
    required String description,
  }) async {
    databases ?? init();
    try {
      String? userId = await AuthController.instance.getSession();
      await databases!.createDocument(
          databaseId: "6566f28ea98dfce6545a",
          collectionId: "6566f2c8c6bd13cb153c",
          documentId: ID.unique(),
          data: {
            "title": title,
            "description": description,
            "isDone": false,
            "createdAt": DateTime.now().toIso8601String(),
            "userId": userId,
          });
      return true;
    } catch (e) {
      rethrow;
    }
  }
}
