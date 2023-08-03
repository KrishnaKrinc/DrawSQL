import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DragDropContainer(),
    );
  }
}

class DragDropContainer extends StatefulWidget {
  @override
  DragDropContainerState createState() => DragDropContainerState();
}

class DragDropContainerState extends State<DragDropContainer> {
  // Variable to store the position of the container.
  Offset _containerPosition = const Offset(0, 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Container')),
      body: Stack(
        children: [
          // Background, you can add other widgets here as per your requirements.
          // For simplicity, we'll use an empty Container.
          Container(color: Colors.grey[300]),

          // Positioned widget to control the position of the draggable container.
          Positioned(
            left: _containerPosition.dx,
            top: _containerPosition.dy,
            child: GestureDetector(
              // When the user starts dragging the container.
              onPanStart: (details) {
                setState(() {
                  _containerPosition =
                      details.globalPosition - const Offset(50, 50);
                });
              },
              // When the user drags the container.
              onPanUpdate: (details) {
                setState(() {
                  _containerPosition =
                      details.globalPosition - const Offset(50, 50);
                });
              },
              // When the user drops the container.
              onPanEnd: (details) {
                // No need for any random position; the container will stay at the released position.
              },
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(child: Text('Drag me')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
