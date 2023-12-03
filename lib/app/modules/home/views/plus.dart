import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modul3/app/modules/home/views/add_todo_views.dart';
import 'package:modul3/app/modules/models/database_helper.dart';
import 'package:modul3/app/modules/models/todo_models.dart';
import 'package:modul3/widget/bottom_navigation_bar_widget.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<TodoModel> data = [];

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  _loadData() async {
    try {
      // Mengambil data dari database menggunakan DatabaseHelper
      List<TodoModel> todos = await DatabaseHelper.instance.getTodos();

      setState(() {
        data = todos;
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigasi ke halaman tambah To-Do dan tunggu hasilnya
          bool? result = await Get.to<bool>(() => const AddTodoScreen());

          // Jika hasilnya true, artinya ada perubahan data, maka reload data
          if (result == true) {
            _loadData();
          }
        },
        child: const Icon(Icons.add),
      ),
      body: data.isEmpty
          ? const Center(
              child: Text("No todo added"),
            )
          : ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(data[index].title),
                subtitle: Text(data[index].description),
                leading: Checkbox(
                  value: data[index].isDone,
                  onChanged: (value) async {
                    setState(() {
                      data[index].isDone = value!;
                    });

                    // Menyimpan perubahan ke database menggunakan DatabaseHelper
                    DatabaseHelper.instance.updateTodo(data[index]);
                  },
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.edit,
                        color: Colors.green, // Warna icon hijau
                      ),
                      onPressed: () async {
                        // Tambahkan logika untuk mengedit To-Do di sini
                        // Misalnya, navigasi ke halaman edit To-Do dengan Get.to()
                        // dan sertakan data To-Do yang ingin diedit.
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red, // Warna icon merah
                      ),
                      onPressed: () async {
                        // Hapus To-Do dari database menggunakan DatabaseHelper
                        DatabaseHelper.instance.deleteTodo(data[index].id);

                        // Hapus To-Do dari daftar lokal
                        setState(() {
                          data.removeAt(index);
                        });
                      },
                    ),
                    Text(
                      "${data[index].createdAt.day}-${data[index].createdAt.month}-${data[index].createdAt.year}",
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: BottomNavigationBarWidget(
        selectedIndex: 2,
        onItemSelected: (index) {
          print("Item terpilih: $index");
        },
      ),
    );
  }
}
