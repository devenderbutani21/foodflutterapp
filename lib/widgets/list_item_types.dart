import 'package:flutter/material.dart';

class ListItemTypes extends StatelessWidget {
  final String title;
  final String items;
  final String url;

  ListItemTypes(this.title, this.items, this.url);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 60, top: 5, bottom: 5),
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 5.0,
              bottom: 5.0,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey[500],
                    offset: Offset(2.0, 2.0),
                    blurRadius: 8.0,
                    spreadRadius: 1.0),
              ],
            ),
            width: 300,
            height: 100,
            child: Column(
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  items + ' items',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18.0,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            right: -40,
            bottom: 28.5,
            child: RawMaterialButton(
              fillColor: Colors.white,
              onPressed: () {},
              child: Container(
                child: Icon(Icons.arrow_forward_ios),
              ),
              padding: EdgeInsets.all(8.0),
              shape: CircleBorder(),
            ),
          ),
          Positioned(
            left: -70.0,
            bottom: -32.5,
            child: Image.network(
              url,
              height: 160,
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
