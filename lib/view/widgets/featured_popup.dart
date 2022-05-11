import 'package:flutter/material.dart';
import 'package:hstore/utils/constants.dart';
import 'package:hstore/view/widgets/default_button.dart';

class FeaturedPopup extends StatelessWidget {
  FeaturedPopup(
      {Key? key,
      required this.heading,
      required this.subhead,
      required this.image})
      : super(key: key);

  final String heading;
  final String subhead;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Scaffold(
        body: Container(
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: WHITE,
            borderRadius: BorderRadius.all(
              Radius.circular(15),
            ),
          ),
          child: Stack(children: [
            Container(
              alignment: Alignment.topRight,
              child: Image.asset(
                image,
                height: 300,
              ),
            ),
            Positioned(
                top: 20,
                left: 10,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      heading,
                      style: TextStyle(
                          color: PRIMARAY,
                          fontFamily: 'Open',
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: 100,
                      child: Text(
                        subhead,
                        style: TextStyle(
                            color: PRIMARAY, fontFamily: 'Open', fontSize: 14),
                      ),
                    )
                  ],
                )),
            Positioned(
                top: 120,
                left: 10,
                child: Container(
                  child: Row(
                    children: [
                      defaultButton(
                          text: 'Close', color: Colors.red, onPressed: () {}),
                      SizedBox(
                        width: 10,
                      ),
                      defaultButton(text: 'Open', color: PRIMARAY)
                    ],
                  ),
                ))
          ]),
        ),
      ),
    );
  }
}
