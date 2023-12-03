import 'package:appwrite/appwrite.dart';
// import 'package:modul3/app/modules/home/controllers/auth_controller.dart';
import 'package:modul3/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      // Ambil userId dari hasil signup
      final prefs = await SharedPreferences.getInstance();
      final String storedUserId = prefs.getString('userId') ?? "";

      if (storedUserId.isNotEmpty) {
        await databases!.createDocument(
          databaseId: "6566f28ea98dfce6545a",
          collectionId: "6566f2c8c6bd13cb153c",
          documentId: ID.unique(),
          data: {
            "title": title,
            "description": description,
            "isDone": false,
            "createdAt": DateTime.now().toIso8601String(),
            "userId": storedUserId, // Menggunakan storedUserId, bukan userId
          },
        );
        return true;
      } else {
        // Handle jika userId tidak tersedia (misalnya belum ada yang login)
        return false;
      }
    } catch (e) {
      rethrow;
    }
  }
}
