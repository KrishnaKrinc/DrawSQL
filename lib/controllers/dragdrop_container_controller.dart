import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DragDropContainerController extends GetxController {
  var containerPosition = const Offset(0, 0).obs;

  final double dx = 75;
  final double dy = 60;

  void onPanStart(DragStartDetails details) {
    containerPosition.value = details.globalPosition - Offset(dx, dy);
  }

  void onPanUpdate(DragUpdateDetails details) {
    containerPosition.value = details.globalPosition - Offset(dx, dy);
  }
}
