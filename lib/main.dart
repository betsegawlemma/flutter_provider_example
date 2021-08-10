import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Provider Demo"),
        ),
        body: ChangeNotifierProvider(
          create: (BuildContext ctx) => CountState(),
          child: CounterWidget(),
        ),
      ),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () {
              Provider.of<CountState>(context, listen: false).decrement();
            },
            icon: Icon(Icons.remove),
          ),
          Consumer<CountState>(
            builder: (ctx, countState, child) => Text("${countState.value}"),
          ),
          IconButton(
            onPressed: () {
              Provider.of<CountState>(context, listen: false)
                  .increment(Random().nextInt(100));
            },
            icon: Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}

class CountState extends ChangeNotifier {
  int value = 0;

  void increment(int val) {
    value += val;
    notifyListeners();
  }

  void decrement() {
    value--;
    notifyListeners();
  }
}
