
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.only(left: 8, top: 16, right: 8),
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusDirectional.circular(4),
              ),
              shadows: [
                BoxShadow(
                    color: Color(0xff3d000000),
                    offset: Offset(2, 2),
                    blurRadius: 2)
              ]),
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: Colors.grey,
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Text("اسم المستخدم ${index + 1}",style: TextStyle(fontWeight: FontWeight.w900),)
                      ],
                    ),
                    Spacer(),
                    Expanded(
                      flex: 4,
                      child: IconTheme(
                        data: IconThemeData(color: Colors.grey),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Icon(Icons.share),
                            Icon(Icons.bookmark),
                            Icon(Icons.favorite)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Image.asset("assets/waterfall.jpg"),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "هذا النص هو مثال لنصذا النص هو مثال لنصذا النص هو مثال لنصذا النص هو مثال لنصذا النص هو مثال لنصذا النص هو مثال لنص",
                  style: TextStyle(
                      fontFamily: 'Almarai', fontWeight: FontWeight.normal),
                ),
              )
              
            ],
          ),
        );
      },
    );
  }
}
