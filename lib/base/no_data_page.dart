import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NoDataPage extends StatelessWidget {
  final String text;
  final String ImagePath;
  const NoDataPage({Key? key, required this.text, this.ImagePath = 'lib/assets/image/123.png' }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
       mainAxisAlignment: MainAxisAlignment.center,
       crossAxisAlignment: CrossAxisAlignment.stretch,
       children: [
         Image.asset(ImagePath ,
           height: MediaQuery.of(context).size.height*0.52,
           width: MediaQuery.of(context).size.height*0.52,
         ),
         SizedBox(height: MediaQuery.of(context).size.height*0.03, ),
         Text(text , style: TextStyle(fontSize:MediaQuery.of(context).size.height*0.0375,
         color: Theme.of(context).disabledColor,


         ),
           textAlign: TextAlign.center,




         )




       ],



    );
  }
}
