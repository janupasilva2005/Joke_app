import 'package:flutter/material.dart';

void main() {
  // Running the app
  runApp(const Main());
}

// Main
class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Joke app',
      home: Body(),
    );
  }
}

// Body
class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
      appBar: AppBar(
        title: const Text('Joke app'),
      ),
    );
  }
}
