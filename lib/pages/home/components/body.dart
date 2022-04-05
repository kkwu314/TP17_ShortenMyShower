import 'package:flutter/material.dart';
import 'package:shorten_my_shower/constant.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 100.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text("Water in \nAustralia".toUpperCase(),
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        color: kTextcolor,
                        fontWeight: FontWeight.bold,
                      )),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "Blahblahblahblahblahblahblahblahblahblahblahblah\nblahblahblahblahblahblahblahahblah\nblahblahblahblahblahblahblahblah\nblahblahblahblahblah",
                style: TextStyle(
                  fontSize: 21,
                  color: kTextcolor.withOpacity(0.5),
                ),
              ),
            ),
            FittedBox(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Color(0xFF3D3E41),
                  borderRadius: BorderRadius.circular(34),
                ),
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10),
                      height: 38,
                      width: 38,
                      decoration: BoxDecoration(
                        color: kPrimaryColor,
                        shape: BoxShape.circle,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFF3D3E41),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    SizedBox(width: 15),
                    Text(
                      "Learn More".toUpperCase(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 19,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
