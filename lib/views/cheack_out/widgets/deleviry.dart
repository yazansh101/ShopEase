import 'package:chat_app_max/core/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/enum.dart';
import '../../../core/utils/size_config.dart';
import '../../../core/widgets/custom_text.dart';


class DeliveryTime extends StatefulWidget {
  const DeliveryTime({super.key});

  @override
  State<DeliveryTime> createState() => _DeliveryTimeState();
}

class _DeliveryTimeState extends State<DeliveryTime> {
  Deleviry deleviry = Deleviry.standardDelivery;
  DateTime date = DateTime(2023, 12, 24);

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    const defaultHeight = 0.03;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        setVerticalSpace(defaultHeight),
        RadioListTile<Deleviry>(
          activeColor: primaryColor,
          value: Deleviry.standardDelivery,
          groupValue: deleviry,
          onChanged: (Deleviry? value) {
            setState(() {
              deleviry = value!;
            });
          },
          title: CustomText(
            text: 'Standard Delivery',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
          subtitle: CustomText(
            text: '\nOrder will be deliverd between 3 -5 business days',
            fontSize: 15,
          ),
        ),
        // setHeight(defaultHeight),
        const Divider(),

        RadioListTile<Deleviry>(
          activeColor: primaryColor,
          value: Deleviry.nextDayDelivery,
          groupValue: deleviry,
          onChanged: (Deleviry? value) {
            setState(() {
              deleviry = value!;
            });
          },
          title: CustomText(
            fontWeight: FontWeight.bold,
            text: 'Next Day Delivery',
            fontSize: 18,
          ),
          subtitle: CustomText(
            text:
                '\nplace your order before 6pm and your items will be delivered the next day',
            fontSize: 15,
          ),
        ),
        //  setHeight(defaultHeight),
        const Divider(),
        RadioListTile<Deleviry>(
          activeColor: primaryColor,
          value: Deleviry.nominatedDelivery,
          groupValue: deleviry,
          onChanged: (Deleviry? value) async {
            setState(() {
              deleviry = value!;
            });
            DateTime? newDate= await showDatePicker(
              context: context,
              initialDate: date,
              firstDate: DateTime(2020, 01, 01),
              lastDate: DateTime(2100, 12, 24),
            );
            if (newDate==null){return;}
            else{
              setState(() {
                    date=newDate;                                                       
              });
          
            }
          },
          title: CustomText(
            fontWeight: FontWeight.bold,
            text: 'Nominated Delivery',
            fontSize: 18,
          ),
          subtitle: CustomText(
            text:
                '\nPick a particular date from the calender and order will be delivered on Selected date: ${date.year}.${date.month}.${date.day}',
            fontSize: 15,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
