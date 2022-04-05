import 'package:flutter/material.dart';
import 'package:shorten_my_shower/components/app_bar.dart';
import 'package:shorten_my_shower/pages/home/components/body.dart';

class HomePage extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      body: Container(
        height: size.height,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/background.jpg"),
              fit: BoxFit.cover),
        ),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Image.asset(
                              "assets/images/logo.png",
                              height: 100,
                              alignment: Alignment.topCenter,
                            ),
                            SizedBox(width: 5),
                            Text(
                              "Shorten My Shower".toUpperCase(),
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                //color: kPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                      //
                      Container(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.blue[300],
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Home")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/timer');
                                  },
                                  child: Text("Timer")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Estimation")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Refletion")),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      primary: Colors.white,
                                      onPrimary: Colors.black,
                                      fixedSize: Size(100, 60),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(50))),
                                  onPressed: () {},
                                  child: Text("Login")),
                            ),
                          ],
                        ),
                      )
                    ]),
              ),
              SizedBox(
                height: 100,
              ),
              //
              Spacer(),

              Body(),

              Spacer(
                flex: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
