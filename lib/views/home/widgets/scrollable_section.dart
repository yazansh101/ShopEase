import 'package:flutter/material.dart';

class ScroallableSection extends StatelessWidget {
   final Widget titleOfSecton;
   final Widget? seeAllText;
   final  listoF;
   final double? heightBetween;
  const ScroallableSection({super.key, 
    required this.titleOfSecton,
    required this.listoF,
    this.seeAllText,
    this.heightBetween=10,

  });

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
            titleOfSecton,
            seeAllText?? const SizedBox(height: 0,width: 0,),
                ],
              ),
         SizedBox(height:heightBetween,),
         listoF,
            ],
          );
  }
}
