import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'custom_text.dart';

class ShowDialog {
  static void showMyDialog(
    BuildContext context, {
    required String title,
    required String discription,
    required String? choiceTrue,
    String? choiceFalse,
    double? height,
    required void Function()? onChoiceTrue,
    void Function()? onChoiceFalse,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        SizeConfig.init(context);
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                height: setHeight(height ?? 30),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,

                  //getColorTheme(),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   // setVerticalSpace(1.5),
                    CustomText(
                      text: title,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      alignment: Alignment.center,
                      color: primaryColor,
                    ),
                    const Divider(),
                    setVerticalSpace(1.5),
                    CustomText(
                      text: discription,
                      fontSize: 16,
                      alignment: Alignment.center,
                      fontWeight: FontWeight.bold,
                      color: Colors.black54,
                      
                    ),
                    const Spacer(
                      flex: 1,
                    ),
                    Row(
                      children: [
                        const Spacer(),
                        ElevatedButton(
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor)),
                          onPressed: () {
                            Navigator.pop(context, true);
                          },
                          child: CustomText(
                            text: choiceTrue!,
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                        const Spacer(),
                        if (choiceFalse != null)
                          ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStateProperty.all(Colors.white)),
                            child: CustomText(
                              text: choiceFalse,
                              fontSize: 12,
                            ),
                            onPressed: () {
                              // Perform saving action here
                              Navigator.pop(context, false);
                            },
                          ),
                        if (choiceFalse != null) const Spacer(),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
              ),
              // const Positioned(
              //   top: -22,
              //   left: 0,
              //   right: 0,
              //   child: CircleAvatar(
              //    // backgroundColor: Colors.white,
              //     radius: 24,
              //     child: Icon(Icons.error_outline,size: 35,)
              //     // Lottie.asset(
              //     //   'assets/lottiefiles/e.json',
              //     // ),
              //   ),
              // ),
            ],
          ),
        );
      },
    ).then((value) {
      // Handle result of user's action
      if (value) {
        onChoiceTrue!();
      } else {
        onChoiceFalse!();
      }
    });
  }
}
