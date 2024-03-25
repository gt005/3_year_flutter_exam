import 'dart:math';
import 'package:flutter/material.dart';
import 'styles/theme.dart';
import 'widgets/block_option.dart';
import 'modals/show_criteria.dart';


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
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  String selectedColor = "";
  String selectedResult = "";
  String selectedTransition = "";

  final List<String> colors = ["Розовый", "Желтый", "Зеленый"];
  final List<String> results = ["Dialog", "SnackBar"];
  final List<String> transitions = [
    "Снизу вверх",
    "Сверху вниз",
    "Справа налево"
  ];

  int getRandomIndex(int length) {
    return Random().nextInt(length);
  }

  void selectRandomElement() {
    setState(() {
      selectedColor = colors[getRandomIndex(colors.length)];
      selectedResult = results[getRandomIndex(results.length)];
      selectedTransition = transitions[getRandomIndex(transitions.length)];
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("$selectedColor, $selectedResult, $selectedTransition"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Подбор варианта на экзамен"),
        backgroundColor: AppTheme.primaryColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text("Основной цвет"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              blockOption("Розовый", selectedColor == "Розовый"),
              blockOption("Желтый", selectedColor == "Желтый"),
              blockOption("Зеленый", selectedColor == "Зеленый"),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Показ результата"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              blockOption("Dialog", selectedResult == "Dialog"),
              blockOption("SnackBar", selectedResult == "SnackBar"),
            ],
          ),
          const SizedBox(height: 20),
          const Text("Переход между экранами"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              blockOption("Снизу вверх", selectedTransition == "Снизу вверх"),
              blockOption("Сверху вниз", selectedTransition == "Сверху вниз"),
              blockOption("Справа налево", selectedTransition == "Справа налево"),
            ],
          ),
          ElevatedButton(
            onPressed: selectRandomElement,
            child: const Text("Подобрать вариант"),
          ),
          ElevatedButton(
            onPressed: () => showCriteria(context),
            child: const Text("Открыть критерии"),
          ),
        ],
      ),
    );
  }
}
