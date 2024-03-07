import 'package:counter/count_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: _MyHomePage(),
    );
  }
}

class _MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CountModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('カウンター'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              // providerでは、Consumerが適用されたものだけを再ビルドすることができる
              Consumer<CountModel>(builder: (context, model, child) {
                return Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          return Consumer<CountModel>(builder: (context, model, child) {
            return FloatingActionButton(
              onPressed: () {
                model.incrementCounter();
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            );
          });
        }),
      ),
    );
  }
}
