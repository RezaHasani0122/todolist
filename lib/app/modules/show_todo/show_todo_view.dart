import 'package:flutter/material.dart';
import 'package:flutter_application_todo/app/modules/show_todo/show_todo_controller.dart';
import 'package:get/get.dart';

class ShowTodo extends GetView<ShowTodoController> {
  const ShowTodo({super.key});

  static const String showTodoRoute = '/showTodo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          controller.a.value,
          style: TextStyle(fontSize: 32),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(flex: 1, child: _box_Show_Title(controller.title.value)),
            _spacer_Height(12),
            Expanded(
                flex: 5,
                child: _box_Show_Description(controller.description.value)),
            _spacer_Height(12),
            Row(
              children: [
                Expanded(child: _edit_Button()),
                _spacer_Width(24),
                Expanded(child: _back_Button()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _spacer_Height(double height) => SizedBox(height: height);
  Widget _spacer_Width(double width) => SizedBox(width: width);

  Widget _edit_Button() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            controller.editTask(controller.index);
          },
          child: Text('Edit'),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Colors.greenAccent,
          )));
  Widget _back_Button() => SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: Text('Back'),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            backgroundColor: Colors.blueAccent,
          )));

  Widget _box_Show_Title(String text) {
    return Obx(() => Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  blurStyle: BlurStyle.solid),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
              child: Text(
            controller.title.value,
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )),
        ));
  }

  Widget _box_Show_Description(String text) {
    return Obx(() => Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  blurStyle: BlurStyle.solid),
            ],
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(controller.description.value),
        ));
  }
}
