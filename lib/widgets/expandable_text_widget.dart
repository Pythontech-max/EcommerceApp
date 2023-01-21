import 'package:flutter/material.dart';
import 'package:food_full_app/Dimentions.dart';
import 'package:food_full_app/colors.dart';
import 'package:food_full_app/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {
  late String firstHalf;
  late String secondHalf;
  bool hiddenText = true; // furthermore we will chip true/false of binery with turnery operator

  double textHeight = Dimentions.screenheight / 4.42;
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt()+1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = ''; // if we declare a variable as late it has to be initialized.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty? Smalltext(text: firstHalf , height: 1.8,color: Appcolors.smalltextreadablecolour,) : Column(
              children: [
                Smalltext( height: 1.8,color: Appcolors.smalltextreadablecolour,
                    text: hiddenText
                        ? (firstHalf + '...')
                        : (firstHalf + secondHalf)),
                InkWell(   //text aur icon children ke roop me clickable ho gaye
                  onTap: () {
                  setState(() {
                    hiddenText =!hiddenText; // used to toggle backcondition ,  setstate withdraw value chain .

                  });

                  },
                  child: Row(
                    children: [
                      hiddenText?Smalltext(
                        height: 1.8,
                        text: 'Show more',
                        color: Appcolors.bottombaraddtocart,
                      ):Smalltext(
                        height: 1.8,
                        text: 'Show less',
                        color: Appcolors.bottombaraddtocart,
                      ),
                      Icon(hiddenText?
                        Icons.arrow_drop_down : Icons.arrow_drop_up,
                        color: Appcolors.bottombaraddtocart,
                      )
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
