import 'package:flutter/cupertino.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/widgets/small_text.dart';

class IconAndtextwidget extends StatelessWidget {
  final IconData icon ;
  final String text ;
  final Color color ;
  final Color IconColor ;

  const IconAndtextwidget({Key? key, required this.icon, required this.text, required this.color, required this.IconColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: IconColor ,size: Dimentions.iconSize24,),
        SizedBox(width: 5,),
        Smalltext(text: text , color: color,)



      ],



    );
  }
}
