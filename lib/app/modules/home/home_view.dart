import 'package:flutter/material.dart';
import 'package:flutter_application_todo/app/data/model/model.dart';
import 'package:flutter_application_todo/app/modules/home/home_controller.dart';
import 'package:flutter_application_todo/app/modules/home/widgets/card_todo.dart';
import 'package:get/get.dart';

class HomeApp extends GetView<HomeController> {
  const HomeApp({super.key});

  static const String homeRoute = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 100,
        title: const Text(
          'Todo App',
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: Obx(() => _list_Todo()),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.addTodoPage();
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _list_Todo() {
    if (DataModel.model.isEmpty) {
      return Center(
        child: Text(
          'No Todo',
        ),
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        itemCount: DataModel.model.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 24, crossAxisSpacing: 24),
        itemBuilder: (context, index) {
          return CardTodo(
            title: DataModel.model[index].title,
            isCheck: DataModel.model[index].isChecked,
            index: index,
          );
        },
      );
    }
  }
}
