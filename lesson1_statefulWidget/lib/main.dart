import'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Stateful Widget"),
      ),
      body: CouterAppWidget(),
    );
  }
}

class CouterAppWidget extends StatefulWidget {
  const CouterAppWidget({Key? key}) : super(key: key);
  // data ko thay đổi thì khai báo ở đây
  // data nào mutable xin mời qua class khác, là class State bên dưới :D

  // khi StatefulWidget được khởi tạo nó sẽ gọi hàm createState để tạo 1 object State

  @override
  State<CouterAppWidget> createState() => _CouterAppWidgetState();
}

// khi object Widget gọi hàm createState thì object State ra đời
class _CouterAppWidgetState extends State<CouterAppWidget> { // class qli state
  var count=0;

  //hàm build
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: Text("Số $count")),
        ElevatedButton(onPressed: (){
          setState((){
            count++;
          });
        }, child: Text("ADD")),

      ],
    );


  }
}






