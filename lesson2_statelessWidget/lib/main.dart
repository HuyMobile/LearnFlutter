import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo stateless Widget"),
      ),
      body: AppCountWidget(),
    );
  }
}

class AppCountWidget extends StatefulWidget {
  const AppCountWidget({Key? key}) : super(key: key);

  @override
  State<AppCountWidget> createState() => _AppCountWidgetState();
}

class _AppCountWidgetState extends State<AppCountWidget> {
  var count=0;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          TextWidget(count: count),
          ElevatedButton(onPressed: (){
              setState((){
                count++;
              });
          }, child: Text("ADD"))
        ],
      ),
    );
  }
}

class TextWidget extends StatelessWidget {
  const TextWidget({
    Key? key,
    required this.count,
  }) : super(key: key);

  final int count;

  @override
  Widget build(BuildContext context) {
    return Text('Tui là widget Text. Data của tui hiện tại là: $count');
  }
}







