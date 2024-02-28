import 'package:flutter_application_todo/app/data/model/model.dart';
import 'package:get/get.dart';

class ShowTodoController extends GetxController {
  RxString title = RxString('');
  RxString description = RxString('');
  RxString a = RxString('Detail Todo');

  int index = Get.arguments;
  @override
  void onInit() {
    title.value = DataModel.model[index].title;
    description.value = DataModel.model[index].description;

    super.onInit();
  }

  void editTask(int index) {
    Get.offAllNamed('/Addtodo', arguments: index);
  }

  void cancel(int index) {
    Get.back();
  }
}
