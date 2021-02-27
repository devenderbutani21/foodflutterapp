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
    data = jsonDecode(response.body);
    print(data);
    return data;
  }

  Future<ProjectModel> getPostInfo() async {
    String url = 'http://10.0.2.2:5000/myData';

    var response = await http.get(url);
    if (response.statusCode == 200) {
      return ProjectModel.fromJson(json.decode(response.body));
    } else {
      throw Exception('Cant Load Data');
    }
  }

  Widget func() {
    return FutureBuilder<ProjectModel>(
      future: getPostInfo(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ProjectModel _projectModel = snapshot.data;
          return SafeArea(
            child: Scaffold(
              body: Column(
                children: <Widget>[
                  Text("Item 1: ${_projectModel.item1.toString()}"),
                  Text("Item 2: ${_projectModel.item2.toString()}"),
                  Text("Item 3: ${_projectModel.item3.toString()}"),
                  Text("Item 4: ${_projectModel.item4.toString()}"),
                  Text("Item 5: ${_projectModel.item5.toString()}"),
                ],
              ),
            ),
          );
        } else {
          // return circularProgressIndicator();
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    getProjectDetails();
  }

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    // func();
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
                ListItemTypes(data['1']['category'], data['1']['items'], data['1']['img_url'],data['1']['img_height'],data['1']['img_width'],data['1']['pos_left'],data['1']['pos_bottom'],),
                ListItemTypes(data['2']['category'], data['2']['items'], data['2']['img_url'],data['2']['img_height'],data['2']['img_width'],data['2']['pos_left'],data['2']['pos_bottom'],),
                ListItemTypes(data['3']['category'], data['3']['items'], data['3']['img_url'],data['3']['img_height'],data['3']['img_width'],data['3']['pos_left'],data['3']['pos_bottom'],),
                ListItemTypes(data['4']['category'], data['4']['items'], data['4']['img_url'],data['4']['img_height'],data['4']['img_width'],data['4']['pos_left'],data['4']['pos_bottom'],),
                ListItemTypes(data['5']['category'], data['5']['items'], data['5']['img_url'],data['5']['img_height'],data['5']['img_width'],data['5']['pos_left'],data['5']['pos_bottom'],),
                // Expanded(
                //   child: FutureBuilder(
                //     future: getProjectDetails(),
                //     builder: (context, projectSnap) {
                //       var showData = Map<String, dynamic>.from(projectSnap.data);
                //       // var showData = jsonDecode(projectSnap.data);
                //       if (projectSnap.connectionState == ConnectionState.none &&
                //           projectSnap.hasData == null) {
                //         // print('project snapshot data is: ${projectSnap.data}');
                //         return Container();
                //       } else {
                //         return ListView.builder(
                //           itemCount: showData.length,
                //           itemBuilder: (context, index) {
                //             return ListItemTypes(
                //               showData[index]['category'],
                //               showData[index]['items'],
                //               showData[index]['img_url'],
                //               showData[index]['img_height'],
                //               showData[index]['img_width'],
                //               showData[index]['pos_left'],
                //               showData[index]['pos_bottom'],
                //             );
                //           },
                //         );
                //       }
                //     },
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
