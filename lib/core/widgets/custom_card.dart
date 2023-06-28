import 'package:flutter/material.dart';

class CutomCard extends StatelessWidget {
    final String primaryText;
    final Widget?  icon;


  const CutomCard({
    required this.primaryText,
    this.icon,
    
  });

  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {},
      // highlightColor: Colors.transparent,
      // splashColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.fromLTRB(_w / 20, _w / 20, _w / 20, 0),
        padding: EdgeInsets.all(_w / 20),
        height: _w / 5,
        width: _w,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleAvatar(
              radius: _w / 15,
              child: icon ?? const FlutterLogo(size: 30),
            ),
            Container(
              alignment: Alignment.centerLeft,
              width: _w / 2,
              child: Text(
                primaryText,
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Muli'
                ),
              ),
            ),
           const Icon(Icons.navigate_next_outlined)
          ],
        ),
      ),
    );
  }
}
