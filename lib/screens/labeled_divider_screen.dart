import 'package:flutter/material.dart';
import 'package:renderbox_example/render_objects/labeled_divider.dart';

class LabeledDividerScreen extends StatelessWidget {
  const LabeledDividerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('labeled_divider'),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Above the divider'),
          LabeledDivider(
            label: 'Divider Label',
            thickness: 2.0,
            color: Colors.blue,
          ),
          Text('Below the divider'),
        ],
      ),
    );
  }
}
