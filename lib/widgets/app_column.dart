import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/widgets/small_text.dart';

import '../colors.dart';
import 'Bigtext.dart';
import 'Icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
   final String text;
  const AppColumn({Key? key , required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Bigtext(text: text , size: Dimentions.fonts26,),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                  5,
                      (index) => Icon(
                    Icons.star,
                    color: Appcolors.maincolor,
                    size: 15,
                  )),
            ),
            const SizedBox(
              width: 10,
            ),
            Smalltext(text: '4.5'),
            const SizedBox(
              width: 10,
            ),
            Smalltext(text: '1455'),
            const SizedBox(
              width: 10,
            ),
            Smalltext(text: 'comments'),
          ],
          // व्रैप विजेट मल्टीप्ल अप्प पैदा करेगा।
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            IconAndtextwidget(
              icon:
              IconData(0xf81c, fontFamily: 'MaterialIcons'),
              IconColor: Color(0xffF9D923),
              text: 'Delicious',
              color: Color(0xff9A86A4),
            ),
            IconAndtextwidget(
              icon:
              IconData(0xe3ac, fontFamily: 'MaterialIcons'),
              IconColor: Color(0xffF32424),
              text: '1.7 km',
              color: Color(0xff9A86A4),
            ),
            IconAndtextwidget(
              icon:
              IconData(0xe662, fontFamily: 'MaterialIcons'),
              IconColor: Color(0xffF806CC),
              text: '32 min',
              color: Color(0xff9A86A4),
            )
          ],
        )
      ],
    );
  }
}
