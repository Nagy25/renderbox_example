import 'package:flutter/material.dart';
import 'package:renderbox_example/screens/labeled_divider_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo for render object',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () => go(context, const LabeledDividerScreen()),
                child: const Text('labeled_divider')),
          ],
        ),
      ),
    );
  }
}

void go(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}
