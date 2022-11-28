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
  Widget build(BuildContext context) { // thủ phạm chính là context của HomePage trong hàm build của HomePage


    return Scaffold(
      appBar: AppBar(
        title: Text("Demo Build context"),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            return FlatButton(
              child: Text('show snackbar'),
              color: Colors.pink,
              onPressed: () {
                // xử lý show snackbar khi click
                final snackBar = SnackBar(content: Text('Không thể truy cập bài viết này vì thấy hay mà không vote'));
                Scaffold.of(context).showSnackBar(snackBar);
                // nguyên nhân truyền sai context ( truyền sai vtri đến hàm scaffod)
              },
            );
          }
        ),
      )
    );
  }
}




