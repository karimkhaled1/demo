import 'package:flutter/material.dart';

import 'Colors.dart';

class Account extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.3 +
                MediaQuery.of(context).size.height * 0.0875,
            child: Stack(
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  decoration: BoxDecoration(color: secondary_color, boxShadow: [
                    BoxShadow(
                        color: Color(0xff32000000),
                        blurRadius: 24,
                        offset: Offset(0, 0))
                  ]),
                ),
                Positioned(
                  bottom: 0,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/profil_pic.jpg"),
                      radius: MediaQuery.of(context).size.height * 0.0875,
                    ),
                  ),
                )
              ],
            )),
        SizedBox(
          height: 10,
        ),
        Text("اسم المستخدم",
            style:
                TextStyle(fontFamily: "Almarai", fontWeight: FontWeight.w900)),
        Text(
          "User99@gmail.com",
          style: TextStyle(color: Colors.grey),
        ),
        Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Spacer(),
            rowItem("المفضلة", Icons.favorite),
            Spacer(),
            rowItem("الإعدادات", Icons.settings),
            Spacer(),
            rowItem("تعديل بياناتي", Icons.edit),
            Spacer(),
          ],
        ),
        Spacer(),
      ],
    );
  }

  Widget rowItem(String text, IconData icon) {
    return Expanded(
      child: Column(
        children: <Widget>[
          LayoutBuilder(builder: (context, snapshot) {
            return Container(
              height: snapshot.maxWidth,
              width: snapshot.maxWidth,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: primary_color),
              child: Icon(
                icon,
                color: Colors.white,
              ),
            );
          }),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: TextStyle(
                fontFamily: 'Almarai',
                fontWeight: FontWeight.normal,
                color: Color(0xffde000000)),
          )
        ],
      ),
    );
  }
}
