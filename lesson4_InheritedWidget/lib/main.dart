import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(myChild: MyCenterWidget()),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.myChild}) : super(key: key);
  final Widget myChild;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count=0;

  @override
  Widget build(BuildContext context) {
    print('1. hàm build được gọi do hàm setState được gọi');
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo InheritedWidget'),
      ),
      // khởi tạo MyInheritedWidget tại vị trí cha của cả MyCenterWidget và MyText
      body: MyInheritedWidget(
        myData: count,
        child: widget.myChild,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState((){
            count++;
          });
        },child: Icon(Icons.add),
      ),
    );
  }
}
class MyInheritedWidget extends InheritedWidget{
  //1
  MyInheritedWidget({required super.child,required this.myData});

  //2
  final int myData;

  //3
  @override
  bool updateShouldNotify( MyInheritedWidget oldWidget) {
    return myData%2==1;
    //  myData!= oldWidget.myData;
  }
  //4
static MyInheritedWidget of(BuildContext context){
    //5
  return context.dependOnInheritedWidgetOfExactType<MyInheritedWidget>()!;
}
  
}
// thoải mái xóa hết constructor và data trong MyCenterWidget
class MyCenterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('2. log build MyCenterWidget');
    return Center(
      child: MyText(),
    );
  }
}

// thậm chí xóa luôn constructor và data khai báo trong MyText
class MyText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    // Nhờ hàm MyInheritedWidget.of ta sẽ get được data
    // Bởi vì hàm of là hàm static nên ta có thể gọi ở bất cứ widget con nào ta muốn
    final counter = MyInheritedWidget.of(context).myData;
    print('3. log build MyText với counter = $counter');
    // get được data thì update UI thôi :D
    return Text('Tui là widget Text. Data của tui hiện tại là: $counter');
  }
}

