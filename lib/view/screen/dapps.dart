import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hstore/controller/homeController.dart';
import 'package:hstore/utils/constants.dart';
import 'package:hstore/view/widgets/featured_popup.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';

import '../widgets/customShadow.dart';

class Dapps extends StatefulWidget {
  Dapps({Key? key}) : super(key: key);

  @override
  State<Dapps> createState() => _DappsState();
}

class _DappsState extends State<Dapps> {
  final HomeController homeController = Get.put(HomeController());

  @override
  void initState() {
    super.initState();
  }

  List<CarouselItem> itemList = [
    CarouselItem(
      image: const NetworkImage(
        'https://miro.medium.com/max/1400/1*RpaR1pTpRa0PUdNdfv4njA.png',
      ),
      boxDecoration: BoxDecoration(
        gradient: LinearGradient(
          begin: FractionalOffset.bottomCenter,
          end: FractionalOffset.topCenter,
          colors: [
            Colors.blueAccent.withOpacity(1),
            Colors.black.withOpacity(.3),
          ],
          stops: const [0.0, 1.0],
        ),
      ),
      title: 'Game of thrones',
      titleTextStyle: const TextStyle(
        fontSize: 25,
        color: Colors.white,
        fontFamily: 'Open',
        fontWeight: FontWeight.bold,
      ),
      leftSubtitle: '\$51,046 in prizes',
      rightSubtitle: '4882 participants',
      rightSubtitleTextStyle: const TextStyle(
        fontSize: 12,
        color: Colors.black,
      ),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://pbs.twimg.com/profile_banners/1444928438331224069/1633448972/600x200',
      ),
      title: 'God of war',
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontFamily: 'Open',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: const NetworkImage(
        'https://pbs.twimg.com/profile_banners/1444928438331224069/1633448972/600x200',
      ),
      title: 'MetaVast',
      titleTextStyle: const TextStyle(
        fontSize: 25,
        fontFamily: 'Open',
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
      leftSubtitle: '11 Feb 2022',
      rightSubtitle: 'v1.0.0',
      onImageTap: (i) {},
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE,
          title: Text(
            appName,
            style: header,
          ),
          actions: [
            IconButton(
                onPressed: () {
                  //handle search dapps here
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ))
          ],
        ),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  backgroundColor: WHITE,
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text("Top Deals",
                          style: TextStyle(
                            color: PRIMARAY,
                            fontSize: 16.0,
                          )),
                      background: Image.asset(
                        "assets/images/9721.jpg",
                        fit: BoxFit.cover,
                      )),
                ),
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            width: 90,
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                            decoration: BoxDecoration(
                                color: Color(0xfff4f4f4),
                                boxShadow: customShadow,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text('Featured',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Open",
                                      color: BLACK,
                                      fontSize: 11)),
                            )),
                        Container(
                            width: 90,
                            height: 50,
                            // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                            decoration: BoxDecoration(
                                color: Color(0xfff4f4f4),
                                boxShadow: customShadow,
                                borderRadius: BorderRadius.circular(20)),
                            child: Center(
                              child: Text('Pre-register',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: "Open",
                                      color: BLACK,
                                      fontSize: 11)),
                            )),
                        InkWell(
                          onTap: (() {
                            show();
                          }),
                          child: Container(
                              width: 90,
                              height: 50,
                              // margin: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                              decoration: BoxDecoration(
                                  color: Color(0xfff4f4f4),
                                  boxShadow: customShadow,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text('Top charts',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: "Open",
                                        color: BLACK,
                                        fontSize: 11)),
                              )),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: screenHeight(context) * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Latest DApp Updates',
                      style: TextStyle(
                          color: BLACK_TEXT,
                          fontSize: 20,
                          fontFamily: 'Open',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 220,
                      child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: Container(
                            height: 50,
                            width: 100,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey, width: 0.0001),
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle),
                            margin: EdgeInsets.all(10),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(10),
                                        topRight: Radius.circular(10)),
                                    child: Image.asset(
                                      "assets/images/948.jpg",
                                      fit: BoxFit.fill,
                                      height: 100,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Star Trek',
                                        style: TextStyle(
                                            fontFamily: "Open",
                                            fontSize: 12,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text("Scope inco",
                                          style: TextStyle(
                                              fontFamily: "Open",
                                              fontSize: 10,
                                              color: Colors.green)),
                                      SizedBox(height: 10),
                                      Container(
                                        height: 30,
                                        decoration: BoxDecoration(
                                            color: Color.fromARGB(
                                                94, 158, 158, 158),
                                            shape: BoxShape.circle),
                                        alignment: Alignment.topRight,
                                        child: Center(
                                          child: IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.download,
                                                  size: 10)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: CustomCarouselSlider(
                      items: itemList,
                      height: 150,
                      subHeight: 50,
                      width: MediaQuery.of(context).size.width * .9,
                      autoplay: true,
                    ),
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      'Newly Realeased CApps',
                      style: TextStyle(
                          color: BLACK_TEXT,
                          fontSize: 20,
                          fontFamily: 'Open',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: 3,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () {},
                          child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                // border: Border.all(color: Colors.grey, width: 0.0001),
                                borderRadius: BorderRadius.circular(10),
                                shape: BoxShape.rectangle),
                            margin: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      "assets/images/948.jpg",
                                      fit: BoxFit.fill,
                                      height: 100,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'MetaMask',
                                      style: TextStyle(
                                          fontFamily: "Open",
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text("Homwere studio",
                                        style: TextStyle(
                                            fontFamily: "Open",
                                            fontSize: 10,
                                            color: Colors.green)),
                                    SizedBox(height: 10),
                                    Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color:
                                              Color.fromARGB(94, 158, 158, 158),
                                          shape: BoxShape.circle),
                                      alignment: Alignment.topRight,
                                      child: Center(
                                        child: IconButton(
                                            onPressed: () {},
                                            icon:
                                                Icon(Icons.download, size: 10)),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )));
  }

  void show() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return FeaturedPopup(
            heading: 'efewfewf',
            subhead: 'sefxwff',
            image: 'assets/images/9721.jpg',
          );
        });
  }
}
