import 'package:flutter_application_todo/app/modules/show_todo/show_todo_controller.dart';
import 'package:get/get.dart';

class ShowTodoBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ShowTodoController>(
      () => ShowTodoController(),
      fenix: true,
    );
  }
}
