import 'package:erobot_app/data/ir_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class CircleButtonText extends StatelessWidget {
  const CircleButtonText({
    Key key,
    @required this.isShow,
    @required this.display,
    @required this.value,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  final bool isShow;
  final String display;
  final String value;
  final String color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Hexcolor(color)),
      child: IconButton(
          icon: Text(!isShow ? display : value,
              style: TextStyle(
                  color:
                      color != 'ffffff' ? Colors.white : Hexcolor('161f28'))),
          onPressed: onPressed),
    );
  }
}

class CircleButtonIcon extends StatelessWidget {
  const CircleButtonIcon({
    Key key,
    @required this.isShow,
    @required this.value,
    @required this.path,
    @required this.color,
    @required this.onPressed,
  }) : super(key: key);

  final bool isShow;
  final String value;
  final String path;
  final String color;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: Hexcolor(color),
      ),
      child: IconButton(
          icon: !isShow
              ? Padding(
                  padding: EdgeInsets.all(path == 'playpause.png' ? 11.0 : 8.0),
                  child: Image.asset('assets/sender/$path'),
                )
              : Text(
                  value,
                  style: TextStyle(
                      color: color != 'ffffff'
                          ? Colors.white
                          : Hexcolor('161f28')),
                ),
          onPressed: onPressed),
    );
  }
}

class ThreeCircleButtons extends StatelessWidget {
  const ThreeCircleButtons({
    Key key,
    @required this.isShow,
    @required this.value,
    @required this.index,
    this.onPressed,
  }) : super(key: key);

  final Function onPressed;
  final int index;
  final bool isShow;
  final List<String> value;

  @override
  Widget build(BuildContext context) {
    List<String> colors = [
      btnColors[index],
      btnColors[index + 1],
      btnColors[index + 2],
    ];

    List<String> title = [titles[index], titles[index + 1], titles[index + 2]];
    List<String> path = [paths[index], paths[index + 1], paths[index + 2]];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        for (int i = 0; i < 3; i++)
          path[i] == null
              ? CircleButtonText(
                  onPressed: () => print(value[i]),
                  isShow: isShow,
                  display: title[i],
                  value: value[i],
                  color: '${colors[i]}')
              : CircleButtonIcon(
                  onPressed: 
                      i == 2 && index == 3 ? onPressed : () => print(value[i]),
                  isShow: isShow,
                  value: value[i],
                  path: path[i],
                  color: '${colors[i]}'),
      ],
    );
  }
}
