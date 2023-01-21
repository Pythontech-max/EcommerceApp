import 'package:flutter/cupertino.dart';
import 'package:food_full_app/Dimentions.dart';

class AppIcon extends StatelessWidget {
  final IconData icon;
  final Color backgroundcolour;
  final Color iconcolour;
  final double size;
  final double iconsize;

  AppIcon(
      {Key? key,
      required this.icon,
      this.backgroundcolour = const Color(0xffCDF0EA),
      this.iconcolour = const Color(0xff03045E),
      this.size = 40,
        this.iconsize = 16
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(size/2),
        color: backgroundcolour
      ),
      child:  Icon(
        icon,
        color: iconcolour,
        size: iconsize,


      ),



    );
  }
}
