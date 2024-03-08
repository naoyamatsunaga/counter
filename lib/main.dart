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
                'Consumerを使用した更新方法',
              ),
              // providerでは、Consumerが適用されたものだけを再ビルドすることができる
              // Consumerで囲む他に４種類書き方がある
              Consumer<CountModel>(builder: (context, model, child) {
                return Text(
                  '${model.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              const Text(
                'Provider.of<CountModel>(context);を使用した更新方法',
              ),
              Builder(builder: (context) {
                final model2 = Provider.of<CountModel>(context);
                return Text(
                  '${model2.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              const Text(
                'context.watch<CountModel>();を使用した更新方法',
              ),
              Builder(builder: (context) {
                final model3 = context.watch<CountModel>();
                return Text(
                  '${model3.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
              // 宿題
              const Text(
                'context.select<CountModel, int>();を使用した更新方法',
              ),
              Builder(builder: (context) {
                final count2 = context.select<CountModel, int>(
                  (CountModel model) => model.counter2,
                );
                return Text(
                  '$count2',
                  style: Theme.of(context).textTheme.headlineMedium,
                );
              }),
            ],
          ),
        ),
        floatingActionButton: Builder(builder: (context) {
          //return Consumer<CountModel>(builder: (context, model, child) {
          // Consumerで囲む以外の方法
          // count_modelにアクセスしたいだけなので、readで良い（watchでも動きはする）
          final model = context.read<CountModel>();
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(
                onPressed: () {
                  model.incrementCounter1();
                },
                tooltip: 'Increment 1',
                child: const Icon(Icons.add),
              ),
              // 宿題
              FloatingActionButton(
                onPressed: () {
                  model.incrementCounter2();
                },
                tooltip: 'Increment 10',
                child: const Icon(Icons.add),
              ),
            ],
          );
          //}),
        }),
      ),
    );
  }
}
