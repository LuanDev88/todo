import 'package:flutter/material.dart';

import '../global.dart';

class IntrayTodo extends StatelessWidget {
  String title;
  String keyValue;
  
  IntrayTodo({this.keyValue, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: Key(keyValue),
      margin: EdgeInsets.only(bottom: 5),
      padding: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
        color: custonRed,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 10.0,
          ),
        ],
      ),
      child: Row(
        children: <Widget>[
          Radio(),
          Column(
            children: <Widget>[
              Text(
                title,
                style: darkTodoTitle,
              )
            ],
          )
        ],
      ),
    );
  }
}
