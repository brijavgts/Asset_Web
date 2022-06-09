
import 'package:flutter/cupertino.dart';

import '../../core/res/spacing.dart';
import '../../core/res/styles.dart';

class EmptyScreen extends StatelessWidget{

  final String imageUrl;
  final String text;


  EmptyScreen({required this.imageUrl,required this.text});


  @override
  Widget build(BuildContext context) {

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Image.asset(imageUrl),

          VerticalSpacing.custom(value: 22.0),

          Text(text,style: AppTextStyle.h4Heading.copyWith(fontWeight: FontWeight.w500),)
        ],
      ),
    );
  }

}