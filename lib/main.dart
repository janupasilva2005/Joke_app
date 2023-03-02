import 'package:dio/dio.dart';
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
      home: Body(),
      title: 'Joke app',
      debugShowCheckedModeBanner: false,
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
  late Future<String> joke;

  // Fetching the joke API
  Future<String> fetchAPI() async {
    var data = await Dio().get('https://api.chucknorris.io/jokes/random');

    // returning the value
    return data.data['value'];
  }

  @override
  void initState() {
    super.initState();

    // Setting the joke value
    joke = fetchAPI();
  }

  // Refreshing the joke
  void refreshJoke() {
    setState(() {
      joke = fetchAPI();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xff1d2136),
        child: Center(
          child: FutureBuilder(
            future: joke,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }

              return Container(
                padding: const EdgeInsets.all(10),
                child: Text(
                  '${snapshot.data}',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Joke app'),
        backgroundColor: const Color(0xff1d2136),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: refreshJoke,
        backgroundColor: const Color(0xff323244),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
