import 'package:flutter/material.dart';
import 'package:flutter_application_todo/app/modules/add_todo/add_todo_binding.dart';
import 'package:flutter_application_todo/app/modules/add_todo/add_todo_view.dart';
import 'package:flutter_application_todo/app/modules/home/home_binding.dart';
import 'package:flutter_application_todo/app/modules/home/home_view.dart';
import 'package:flutter_application_todo/app/modules/show_todo/show_todo_binding.dart';
import 'package:flutter_application_todo/app/modules/show_todo/show_todo_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(GetMaterialApp(
    defaultTransition: Transition.fade,
    debugShowCheckedModeBanner: false,
    initialRoute: HomeApp.homeRoute,
    getPages: [
      GetPage(
          name: '/',
          page: () => const HomeApp(),
          binding: HomeBinding(),
          children: [
            GetPage(
              name: '/Addtodo',
              page: () => const AddTodo(),
              binding: AddTodoBinding(),
            ),
            GetPage(
              name: '/showTodo',
              page: () => const ShowTodo(),
              binding: ShowTodoBinding(),
            ),
          ]),
    ],
  ));
}
