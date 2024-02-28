import 'package:get/get.dart';

class DataModel {
  String title;
  String description;
  bool isChecked;

  static RxList<DataModel> model = <DataModel>[].obs;

  DataModel(
      {required this.title,
      required this.description,
      required this.isChecked});
}
