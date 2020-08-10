import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Food App',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: deviceSize.height,
                width: deviceSize.width / 3,
                color: Color(0xffFD6A02),
              ),
              Container(
                height: deviceSize.height,
                width: deviceSize.width * 2 / 3,
                color: Color(0xfff9f8f6),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              SizedBox(width: 40,),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
                color: Colors.white,
                iconSize: 25.0,
              ),
              SizedBox(width: 250,),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () {},
                color: Colors.grey.shade400,
                iconSize: 25.0,
              ),
            ],
          ),
          Column(
            children: <Widget>[
              Row(
                
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
