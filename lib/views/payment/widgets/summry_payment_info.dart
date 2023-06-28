import 'package:chat_app_max/views/payment/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SummaryPaymentInfo extends StatelessWidget {
  const SummaryPaymentInfo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          child: Material(
            clipBehavior: Clip.antiAlias,
            elevation: 2.0,
            borderRadius: BorderRadius.circular(4.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ProfileTile(
                    title: "Thank You!",
                    textColor: Colors.purple,
                    subtitle: "Your transaction was successful",
                  ),
                  const ListTile(
                    title: Text("Date"),
                    subtitle: Text("26 June 2018"),
                    trailing: Text("11:00 AM"),
                  ),
                  const ListTile(
                    title: Text("Pawan Kumar"),
                    subtitle: Text("mtechviral@gmail.com"),
                    trailing: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: NetworkImage(
                          "https://avatars0.githubusercontent.com/u/12619420?s=460&v=4"),
                    ),
                  ),
                  const ListTile(
                    title: Text("Amount"),
                    subtitle: Text("\$299"),
                    trailing: Text("Completed"),
                  ),
                  Card(
                    clipBehavior: Clip.antiAlias,
                    elevation: 0.0,
                    color: Colors.grey.shade300,
                    child: const ListTile(
                      leading: Icon(
                        FontAwesomeIcons.ccAmex,
                        color: Colors.blue,
                      ),
                      title: Text("Credit/Debit Card"),
                      subtitle: Text("Amex Card ending ***6"),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
  }
}