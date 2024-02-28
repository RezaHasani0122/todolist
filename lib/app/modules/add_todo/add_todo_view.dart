import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_application_todo/app/modules/add_todo/add_todo_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddTodo extends GetView<AddTodoController> {
  const AddTodo({super.key});
  static const String addTodoRoute = '/Addtodo';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Add Todo',
            style: TextStyle(fontSize: 32),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(children: [
              _textField_Title(20),
              _spacer_Height(12),
              _textField_Description(100),
              _checkBox(),
              _button(),
            ]),
          ),
        ));
  }

  Widget _button() {
    return Row(
      children: [
        _button_Add(),
        _spacer_Width(12),
        _button_Cancel('cancel'),
      ],
    );
  }

  Widget _checkBox() {
    return Obx(
      () => CheckboxListTile(
        title: Text('isDone?', style: TextStyle(fontSize: 24)),
        value: controller.isChecked.value,
        onChanged: (value) {
          controller.isChecked.value = value!;
        },
        activeColor: Colors.green,
      ),
    );
  }

  Widget _button_Add() {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            if (controller.index == null) {
              controller.addTodo();
            } else {
              controller.editTodo(controller.index!);
            }
          },
          child: Text(
            controller.index == null ? 'Add' : 'Save',
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.greenAccent,
          )),
    );
  }

  Widget _button_Cancel(String title) {
    return Expanded(
      child: ElevatedButton(
          onPressed: () {
            controller.cancel();
          },
          child: Text(
            title,
            style: TextStyle(fontSize: 24, color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            backgroundColor: Colors.redAccent,
          )),
    );
  }

  Widget _textField_Title(double height) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value == null || value.isEmpty ? 'Enter Title' : null,
      controller: controller.titleController.value,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          label: Text('Title', style: TextStyle(fontSize: 20)),
          contentPadding:
              EdgeInsets.symmetric(vertical: height, horizontal: 16),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.greenAccent,
            width: 2,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2))),
    );
  }

  Widget _textField_Description(double height) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) =>
          value == null || value.isEmpty ? 'Enter Description' : null,
      controller: controller.descriptionController.value,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
          label: Text('Title', style: TextStyle(fontSize: 20)),
          contentPadding:
              EdgeInsets.symmetric(vertical: height, horizontal: 16),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
            color: Colors.greenAccent,
            width: 2,
          )),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.purple, width: 2))),
    );
  }

  Widget _spacer_Height(double height) {
    return SizedBox(height: height);
  }

  Widget _spacer_Width(double width) {
    return SizedBox(width: width);
  }
}
