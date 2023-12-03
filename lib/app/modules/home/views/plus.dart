import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:modul3/app/modules/home/views/add_todo_views.dart';
import 'package:modul3/app/modules/models/todo_models.dart';
import 'package:modul3/widget/bottom_navigation_bar_widget.dart';

class ToDoListPage extends StatefulWidget {
  const ToDoListPage({Key? key}) : super(key: key);

  @override
  State<ToDoListPage> createState() => _ToDoListPageState();
}

class _ToDoListPageState extends State<ToDoListPage> {
  List<TodoModel> data = [
    TodoModel(
        title: "title",
        description: "description",
        isDone: true,
        createdAt: DateTime.now())
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('To-Do List'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(const AddTodoScreen());
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
                  onChanged: (value) {
                    setState(() {
                      data[index].isDone = value!;
                    });
                  },
                ),
                trailing: Text(
                  "${data[index].createdAt.day}-${data[index].createdAt.month}-${data[index].createdAt.day}",
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
