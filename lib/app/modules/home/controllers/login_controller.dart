// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:modul3/app/modules/home/controllers/auth_repository.dart';

// class LoginController extends GetxController {
//   AuthRepository authRepository;
//   LoginController(this.authRepository);
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   TextEditingController emailEditingController = TextEditingController();
//   TextEditingController passwordEditingController = TextEditingController();

//   bool isFormValid = false;

//   String? validateEmail(String value) {
//     if (!GetUtils.isEmail(value)) {
//       return "Provide valid Email";
//     }
//     return null;
//   }

//   String? validatePassword(String value) {
//     if (value.isEmpty) {
//       return "Provide valid Email";
//     }
//     return null;
//   }

//   void validateAndLogin(
//       {required String email, required String password}) async {
//     isFormValid = formKey.currentState!.validate();
//     if (!isFormValid) {
//       return;
//     } else {
//       formKey.currentState!.save();
//     }
//   }
// }
