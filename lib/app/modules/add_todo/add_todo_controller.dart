import 'package:flutter/material.dart';
import 'package:flutter_application_todo/app/data/model/model.dart';
import 'package:get/get.dart';

class AddTodoController extends GetxController {
  Rx<TextEditingController> titleController = TextEditingController().obs;
  Rx<TextEditingController> descriptionController = TextEditingController().obs;
  RxBool isChecked = false.obs;

  int? index = Get.arguments;

  @override
  void onInit() {
    if (index != null) {
      titleController.value.text = DataModel.model[index!].title;
      descriptionController.value.text = DataModel.model[index!].description;
      isChecked.value = DataModel.model[index!].isChecked;
    }
    super.onInit();
  }

  void addTodo() {
    DataModel.model.add(DataModel(
      title: titleController.value.text,
      description: descriptionController.value.text,
      isChecked: isChecked.value,
    ));
    titleController.value.clear();
    descriptionController.value.clear();
    isChecked.value = false;
    index = null;
    Get.back();
    showSnackBar();
  }

  void editTodo(int index) {
    DataModel.model[index].title = titleController.value.text;
    DataModel.model[index].description = descriptionController.value.text;
    DataModel.model[index].isChecked = isChecked.value;
    titleController.value.clear();
    descriptionController.value.clear();
    isChecked.value = false;
    Get.back();
    showSnackBar();
  }

  void cancel() {
    titleController.value.clear();
    descriptionController.value.clear();
    Get.offAllNamed('/');
  }

  void showSnackBar() {
    Get.snackbar(
      titleController.value.text,
      'is added',
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(seconds: 2),
    );
  }
}
