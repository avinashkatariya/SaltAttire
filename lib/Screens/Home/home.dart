import 'package:flutter/material.dart';
import 'package:saltattire/Values/style.dart';
import 'package:saltattire/Widget/ExploreWidget.dart';
import 'package:saltattire/Widget/looks_widget.dart';
import 'package:saltattire/Widget/mediaBuzz_pager_widget.dart';
import 'package:saltattire/Widget/new_arrival_pager_widget.dart';
import 'package:saltattire/Widget/ourShopWidget.dart';
import 'package:saltattire/Widget/testinomials_pager_widget.dart';
import 'package:saltattire/Widget/topImageWidget.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black54,
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                title: Row(
                  children: [
                    IconButton(
                      icon: Image.asset("assets/images/9.png"),
                      onPressed: () {},
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.search,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 3,
                        child: Center(
                          child: Image.asset(
                            "assets/images/SALT_logo.png",
                            height: kTextTabBarHeight * 0.8,
                          ),
                        )),
                    IconButton(
                      icon: Image.asset("assets/images/shopping.png"),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Image.asset("assets/images/menuicon_v1.png"),
                      onPressed: () {},
                    ),
                  ],
                ),
                centerTitle: true,
                expandedHeight: MediaQuery.of(context).size.width * 1.78,
                floating: true,
                pinned: false,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.pin,
                  background: TopImageWidget(),
                ),
              ),
            ];
          },
          body: ListView(
            children: [
              NewArrivalPagerWidget(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    "Media Buzz",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.8,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "WHAT PROS",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        " talk ",
                        style: betweenCurl,
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        "ABOUT US",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
              MediaBuzzPagerWidget(),
              ShopItemPagerWidget(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    "Shop The Look",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.8,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "LOOKS",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        " We ",
                        style: betweenCurl,
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        "LOVE",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
              LookPagerWidget(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    "Shop By Your",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.8,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "PREFERENCE",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        " Or ",
                        style: betweenCurl,
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        "STYLE",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
              ExplorePagerWidget(),
              Container(
                margin: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    "Testimonials",
                    style: TextStyle(color: Colors.white),
                    textScaleFactor: 1.8,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 4),
                child: Center(
                  child: Wrap(
                    direction: Axis.horizontal,
                    children: [
                      Text(
                        "WHAT CUSTOMERS",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        " say ",
                        style: betweenCurl,
                        textScaleFactor: 1.2,
                      ),
                      Text(
                        "ABOUT US",
                        style: TextStyle(color: Color(0xFFfcc4a3)),
                        textScaleFactor: 1.2,
                      ),
                    ],
                  ),
                ),
              ),
              TestinomialsPagerWidget(),
              Container(
                padding: EdgeInsets.only(top: 40, bottom: 55),
                child: Center(
                  child: Text(
                    "Hi there!",
                    style: TextStyle(
                      color: Color(0xFF6C93E5),
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 32, right: 32),
                child: Text(
                  "Get on Our List For More!\n\nSign Up for new looks, insider styling tips, exclusive offers and more.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 32, top: 8, right: 32),
                color: Colors.white,
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Email Address"),
                      ),
                    ),
                    RaisedButton(
                      onPressed: () {},
                      padding: EdgeInsets.only(top: 16, bottom: 16),
                      color: Colors.black45,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 32, right: 32, top: 16),
                child: Text(
                  "By entering your email, you agree to our\nTerms & Condition + Privacy Policy including reciept of emails and promotions. You can unsubscribe at any time.",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: Center(
                  child: Text(
                    "Want to ask us something ?",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF6C93E5),
                      fontSize: 48,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: Text(
                    "We will get back to you \nwithin 24 hours ",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFFFFFFF),
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 16),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: RaisedButton(
                        onPressed: () {},
                        color: Color(0xFFc89e72),
                        child: Text("CONTACT US")),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Call Us",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20),
                    child: Text(
                      "(+91) 9015 904 904",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 10),
                    child: Text(
                      "Mon to Fri - 9:00 am to 7:00 pm \n Sat - 9:00 am to 2:00 pm",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 40),
                    child: Text(
                      "Email Us",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 20, bottom: 20),
                    child: Text(
                      "care@saltattire.com",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "RETURNS",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8, bottom: 8),
                    child: Text(
                      "CONTACT US",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  Divider(
                    color: Colors.white,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
