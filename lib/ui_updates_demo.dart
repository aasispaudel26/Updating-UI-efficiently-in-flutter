import 'package:demo/demo_buttons.dart';
import 'package:flutter/material.dart';

class UIUpdatesDemo extends StatelessWidget {
  const UIUpdatesDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Text(
                "Every flutter developer should have knowledge about flutter internals",
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 16,
              ),
              Text(
                "Do you undersand how flutter uis updates?",
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(
                child: DemoButtons(),
              )
            ],
          ),
        ));
  }
}
