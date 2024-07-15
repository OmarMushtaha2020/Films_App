
import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  IconData? iconData;
  double?size;
  VoidCallback? onPressed;
  Color?color;
  IconButtonWidget({this.iconData,this.size,this.onPressed,this.color});

  @override
  Widget build(BuildContext context) {
    return           IconButton(onPressed: onPressed, icon: Icon(iconData,size: size,color: color,));
    ;
  }
}
