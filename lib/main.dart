import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import './widgets/list_item_types.dart';
import './model/project_model.dart';

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
  Map data;

  Future getProjectDetails() async {
    http.Response response = await http.get('http://10.0.2.2:5000/myData');
    this.data = jsonDecode(response.body);
    print(data);
    return data;
  }


  @override
  void initState() {
    super.initState();
    getProjectDetails();
  }

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
               SizedBox(
                 width: 40,
               ),
               IconButton(
                 icon: Icon(Icons.menu),
                 onPressed: () {},
                 color: Colors.white,
                 iconSize: 25.0,
               ),
               SizedBox(
                 width: 250,
               ),
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
               SizedBox(
                 height: 90,
               ),
               ListItemTypes(data['1']['category'], data['1']['items'], data['1']['img_url']),
               ListItemTypes(data['2']['category'], data['2']['items'], data['2']['img_url']),
               ListItemTypes(data['3']['category'], data['3']['items'], data['3']['img_url']),
               ListItemTypes(data['4']['category'], data['4']['items'], data['4']['img_url']),
               ListItemTypes(data['5']['category'], data['5']['items'], data['5']['img_url']),
             ],
           ),
         ],
       ),
      ),
    );
  }
}
