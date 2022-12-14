import 'package:flutter/material.dart';
import 'package:feedback/feedback.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  runApp(BetterFeedback(
    theme: FeedbackThemeData(
        background: Colors.blueGrey,
        feedbackSheetColor: Colors.white,
        drawColors: [
          Colors.amber,
          Colors.indigo,
          Colors.pink,
          Colors.tealAccent
        ]),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
            TextButton(
                onPressed: () => BetterFeedback.of(context).show((p0) {
                      sendMsg(p0.text);
                    }),
                child: const Text('Ошибка'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  sendMsg(String msg) {
    print('Ошибка отправлена! :-)');
    Share.share('Блин!! Ошибка (( $msg');
  }
}
