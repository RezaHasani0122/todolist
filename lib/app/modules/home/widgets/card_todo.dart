import 'package:flutter/material.dart';
import 'package:flutter_application_todo/app/modules/home/home_controller.dart';
import 'package:get/get.dart';

class CardTodo extends GetView<HomeController> {
  CardTodo({
    super.key,
    required this.index,
    required this.title,
    required this.isCheck,
  });
  final String title;
  final bool isCheck;
  final int index;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        controller.showTodoPage(index);
      },
      child: Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              color: Colors.black, blurRadius: 10, blurStyle: BlurStyle.solid),
        ], color: isCheck == true ? Colors.greenAccent.shade200 : Colors.white),
        height: 100,
        width: 100,
        child: _card_Content(index),
      ),
    );
  }

  Widget _card_Content(int index) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _header(),
        _spacer(12),
        _icon_Todo(),
        _title_Todo(),
        _icon_Edit_Delete(index),
        _spacer(12)
      ],
    );
  }

  Widget _icon_Todo() => Center(child: Icon(Icons.home, size: 32));

  Widget _icon_Edit_Delete(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_icon_Edit(index), _icon_Delete(index)],
      ),
    );
  }

  Widget _header() {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.purple, Colors.red])),
      height: 5,
    );
  }

  Widget _icon_Delete(int index) {
    return InkWell(
      onTap: () {
        controller.deleteTask(index);
      },
      child: Icon(
        Icons.delete,
        color: Colors.red,
        size: 24,
      ),
    );
  }

  Widget _icon_Edit(int index) {
    return InkWell(
      onTap: () {
        controller.editTodoPage(index);
      },
      child: Icon(
        Icons.edit,
        color: Colors.blue,
        size: 32,
      ),
    );
  }

  Widget _title_Todo() {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  Widget _spacer(double height) {
    return SizedBox(
      height: height,
    );
  }
}
