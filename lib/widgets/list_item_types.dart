import 'package:flutter/material.dart';

class ListItemTypes extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Image.network(
          'https://cdn.pixabay.com/photo/2017/12/05/20/10/pizza-3000285_1280.png',
          height: 100,
          width: 100,
        ),
        Column(
          children: <Widget>[
            Text('Pizza'),
            Text('25 items'),
          ],
        ),
        RawMaterialButton(
          onPressed: () {},
          child: Icon(Icons.arrow_forward_ios),
        ),
      ],
    );
  }
}
