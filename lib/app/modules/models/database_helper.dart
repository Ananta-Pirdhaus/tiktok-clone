import 'package:appwrite/appwrite.dart';
import 'package:appwrite/models.dart';
import 'package:modul3/app/modules/home/views/register_view.dart';
import 'package:modul3/app/modules/models/todo_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper _instance = DatabaseHelper._privateConstructor();
  static DatabaseHelper get instance => _instance;

  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

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
      String? userId = await _prefs
          .then((SharedPreferences prefs) => prefs.getString('userId'));
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

  getTodos() async {
    databases ?? init();
    try {
      String userId = await _prefs
          .then((SharedPreferences prefs) => prefs.getString('userId') ?? "");
      DocumentList response = await databases!.listDocuments(
        databaseId: "6566f28ea98dfce6545a",
        collectionId: "6566f2c8c6bd13cb153c",
        queries: [
          Query.equal("userId", userId),
        ],
      );
      return response.documents
          .map(
            (e) => TodoModel.fromJson(e.data, e.$id),
          )
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  void updateTodo(TodoModel todo) async {
    databases ?? init();
    try {
      await databases!.updateDocument(
        databaseId: "6566f28ea98dfce6545a",
        collectionId: "6566f2c8c6bd13cb153c",
        documentId: todo.id,
        data: {
          "title": todo.title,
          "description": todo.description,
          "isDone": todo.isDone,
          "createdAt": todo.createdAt.toIso8601String(),
          "userId": todo.userId,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  void deleteTodo(String id) async {
    databases ?? init();
    try {
      await databases!.deleteDocument(
        databaseId: "6566f28ea98dfce6545a",
        collectionId: "6566f2c8c6bd13cb153c",
        documentId: id,
      );
    } catch (e) {
      rethrow;
    }
  }
}
