import 'package:flutter/material.dart';
import 'Colors.dart';

class CustomDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Material(
        color: Colors.transparent,
        child: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height / 2,
          decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(7),
              )),
          margin: EdgeInsets.only(
              right: 8,
              bottom: MediaQuery.of(context).viewInsets.bottom,
              left: 8),
          constraints: BoxConstraints(maxHeight: 200),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Color(0xffd8d8d8),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.camera_alt,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Uploade photo",
                          style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontFamily: 'Almarai'),
                        )
                      ],
                    ),
                  ),
                ),
                TextField(
                  maxLength: 120,
                  decoration: InputDecoration(
                    labelText: "اكتب تعليقا حول الصورة",
                    counterStyle: TextStyle(fontSize: 12),
                    labelStyle: TextStyle(
                        color: Colors.grey,
                        fontSize: 12,
                        fontFamily: 'Almarai'),
                    fillColor: primary_color,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    InkWell(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "تجاهل",
                        style: TextStyle(color: Colors.grey),
                      ),
                    )),
                    InkWell(
                        child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                      child: Text(
                        "نشر",
                        style: TextStyle(color: Colors.white),
                      ),
                      decoration: ShapeDecoration(
                          color: secondary_color,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadiusDirectional.circular(2))),
                    )),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
