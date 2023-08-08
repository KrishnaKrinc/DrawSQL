import 'package:draw_sql_exp/PageLayout/DragDropContainer/drag_drop_container_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DragDropContainerController extends GetxController {
  var containerPosition = const Offset(0, 0).obs;
  var listOfContainer = <Widget>[
    const CustomContainer(),
  ].obs;

  final double dx = 75;
  final double dy = 60;

  void onPanStart(DragStartDetails details) {
    containerPosition.value = details.globalPosition - Offset(dx, dy);
  }

  void onPanUpdate(DragUpdateDetails details) {
    containerPosition.value = details.globalPosition - Offset(dx, dy);
  }

  Future<void> addContainer() async {
    listOfContainer.add(const CustomContainer());
    print(listOfContainer);
  }
}
