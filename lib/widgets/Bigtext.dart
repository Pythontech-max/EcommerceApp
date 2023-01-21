import 'package:flutter/cupertino.dart';
import 'package:food_full_app/Dimentions.dart';

class Bigtext extends StatelessWidget {
  Color? color;
  final String text;
  double size;
  TextOverflow overflow;
  Bigtext(
      {Key? key,
      this.color = const Color(0xff06113C),
      required this.text,
      this.overflow = TextOverflow.ellipsis,
      this.size = 0})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: overflow,
      style: TextStyle(

          color: color,
          fontWeight: FontWeight.w500,
          fontFamily: 'Roboto',
          fontSize: size == 0 ? Dimentions.fonts20 : size),
    );
  }
}
