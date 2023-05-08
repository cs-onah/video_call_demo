import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Fliqio(),
    );
  }
}

class Fliqio extends HookWidget {
  const Fliqio({Key? key}) : super(key: key);

  double get containerWidth => 260;
  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: const Duration(seconds: 2),
    );
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          if(controller.isAnimating){
            controller.stop();
          } else {
            controller.repeat();
          }
        },
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                box(),
                const SizedBox(height: 8),
                Stack(
                  children: [
                    box(false),
                    AnimatedBuilder(
                      animation: controller,
                      builder: (_, child) {
                        return Transform(
                          transform: Matrix4.skew(controller.value, 0),
                          child: Transform(
                            origin: const Offset(0, -4),
                            transform: Matrix4.identity()
                              ..rotateX(controller.value * pi),
                            child: box(false),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
            const Text(
              "3",
              style: TextStyle(color: Colors.white, fontSize: 250, fontWeight: FontWeight.bold,),
            ),
          ],
        ),
      ),
    );
  }

  Container box([bool roundedTop = true]) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 200,
      width: containerWidth,
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: roundedTop
            ? const BorderRadius.vertical(top: Radius.circular(20))
            : const BorderRadius.vertical(bottom: Radius.circular(20)),
      ),
      child: CircleAvatar(
        backgroundColor: Colors.amber[200],
      ),
    );
  }
}
