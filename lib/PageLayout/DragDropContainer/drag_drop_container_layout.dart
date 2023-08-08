import 'package:draw_sql_exp/controllers/dragdrop_container_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DragDropContainerLayout extends StatelessWidget {
  DragDropContainerLayout({super.key});
  final DragDropContainerController dragDropContainerController =
      Get.put(DragDropContainerController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Container')),
      body: Stack(
        children: [
          Obx(
            () => Positioned(
              left: dragDropContainerController.containerPosition.value.dx,
              top: dragDropContainerController.containerPosition.value.dy,
              child: GestureDetector(
                //To show Options and Editable Options
                onTap: () => print('clicked'),
                // When the user starts dragging the container.
                onPanStart: (details) =>
                    dragDropContainerController.onPanStart(details),
                // When the user drags the container.
                onPanUpdate: (details) =>
                    dragDropContainerController.onPanUpdate(details),
                child: Column(
                  children: dragDropContainerController.listOfContainer,
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          dragDropContainerController.addContainer();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            height: 10,
            decoration: const BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
            ),
          ),
          Container(
            height: 200,
            decoration: BoxDecoration(
              color: Colors.grey.shade100,
              border: const Border.symmetric(),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
            ),
            child: const Center(
              child: Text('Drag Me'),
            ),
          ),
        ],
      ),
    );
  }
}
