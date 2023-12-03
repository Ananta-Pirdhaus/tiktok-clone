import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:modul3/app/modules/models/database_models.dart';

class AddTodoScreen extends StatefulWidget {
  const AddTodoScreen({super.key});

  @override
  State<AddTodoScreen> createState() => AddTodoScreentState();
}

class AddTodoScreentState extends State<AddTodoScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Todo"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Title",
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter title";
                  }
                  return null;
                },
                onSaved: (newValue) => _title = newValue ?? "Title",
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: "Description",
                ),
                onSaved: (newValue) => _description = newValue ?? "description",
              ),
              Padding(padding: EdgeInsets.symmetric(vertical: 15.0)),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();

                    try {
                      bool result = await DatabaseModels.instance.createTodo(
                        title: _title,
                        description: _description,
                      );

                      if (result) {
                        Get.snackbar(
                          "Success",
                          "Added todo successfully",
                          duration: Duration(seconds: 2),
                          snackPosition: SnackPosition.TOP,
                        );
                      }
                    } catch (e) {
                      Get.snackbar(
                        "Error",
                        e.toString(),
                        duration: Duration(seconds: 2),
                        snackPosition: SnackPosition.TOP,
                      );
                    }
                  }
                },
                child: const Text("Add Todo"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
