import 'package:flutter_application_todo/app/data/model/model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  void deleteTask(int index) {
    DataModel.model.removeAt(index);
  }

  void editTodoPage(int index) {
    Get.toNamed('/Addtodo', arguments: index);
  }

  void addTodoPage() {
    Get.toNamed('/Addtodo');
  }

  void showTodoPage(int index) {
    Get.toNamed('/showTodo', arguments: index);
  }
}
