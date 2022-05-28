import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hstore/controller/dappController.dart';

import 'package:hstore/utils/constants.dart';
import 'package:hstore/view/screen/dapps_detail.dart';
import 'package:flutter_custom_carousel_slider/flutter_custom_carousel_slider.dart';
import 'package:video_player/video_player.dart';
import 'package:http/http.dart' as http;
import '../../utils/appUrl.dart';
import '../widgets/customShadow.dart';
import 'package:badges/badges.dart';

class Dapps extends StatefulWidget {
  Dapps({Key? key}) : super(key: key);

  @override
  State<Dapps> createState() => _DappsState();
}

class _DappsState extends State<Dapps> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;
  final DappController _dappController = Get.put(DappController());

  List data = [];
  List data2 = [];
  bool isLoading = false;
  bool isLoading2 = false;

  @override
  void initState() {
    super.initState();
    //for top diaply video
    getVideo();
    this.getDapp();
    this.getCapp();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  getDapp() async {
    setState(() {
      isLoading = true;
    });

    var response = await http.get(Uri.parse(AppUrl.getDapps), headers: {
      "Accept": "application/json",
      // 'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      var items = json.decode(response.body)['dapp'];
      print('items is $items');

      print(items);
      setState(() {
        data = items;
        isLoading = false;
      });
    } else {
      var err = response.body;
      print(err);
      data = [];
      isLoading = false;
    }
  }

  getCapp() async {
    setState(() {
      isLoading2 = true;
    });

    var response = await http.get(Uri.parse(AppUrl.getCapps), headers: {
      "Accept": "application/json",
      // 'Authorization': 'Bearer $token'
    });

    if (response.statusCode == 200) {
      var jsonResponse = json.decode(response.body);
      print(jsonResponse);
      var items2 = json.decode(response.body)['capp'];
      print('items is $items2');

      print(items2);
      setState(() {
        data2 = items2;
        isLoading2 = false;
      });
    } else {
      var err = response.body;
      print(err);
      data2 = [];
      isLoading2 = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: WHITE,
          title: Text(
            appName,
            style: header,
          ),
          leading: Image.asset('assets/images/logo.png', height: 30, width: 30),
          actions: [
            IconButton(
                onPressed: () {
                  //handle search dapps here
                },
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                )),
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: InkWell(
                child: CircleAvatar(
                    backgroundColor: Color.fromARGB(61, 33, 149, 243),
                    child: Icon(Icons.person, color: PRIMARAY)),
              ),
            )
          ],
        ),
        // body: NestedScrollView(
        //     headerSliverBuilder:
        //         (BuildContext context, bool innerBoxIsScrolled) {
        //       return <Widget>[
        //         SliverAppBar(
        //           backgroundColor: WHITE,
        //           expandedHeight: 200.0,
        //           floating: false,
        //           pinned: true,
        //           flexibleSpace: FlexibleSpaceBar(
        //               centerTitle: true,
        //               background: FutureBuilder(
        //                   future: _initializeVideoPlayerFuture,
        //                   builder: (context, snapshot) {
        //                     if (snapshot.connectionState ==
        //                         ConnectionState.done) {
        //                       return AspectRatio(
        //                         aspectRatio: _controller.value.aspectRatio,
        //                         child: VideoPlayer(_controller),
        //                       );
        //                     } else
        //                       return const Center(
        //                           child: CircularProgressIndicator());
        //                   })),
        //         ),
        //       ];
        //     },
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/turbo.png',
                      height: 20,
                      width: 20,
                    ),
                    Container(
                        width: 90,
                        height: 30,
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
                        height: 30,
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
                      onTap: (() {}),
                      child: Container(
                          width: 90,
                          height: 30,
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
                height: screenHeight(context) * 0.03,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  'Latest DApps',
                  style: TextStyle(
                      color: BLACK_TEXT,
                      fontSize: 18,
                      fontFamily: 'Open',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 170,
                  child: isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                            color: PRIMARAY,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) =>
                              dappCard(context, data[index]),
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
                      fontSize: 18,
                      fontFamily: 'Open',
                      fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  height: 400,
                  child: isLoading2
                      ? Center(
                          child: CircularProgressIndicator(
                            color: PRIMARAY,
                            strokeWidth: 2.0,
                          ),
                        )
                      : ListView.builder(
                          itemCount: data2.length,
                          itemBuilder: (context, index) =>
                              cappCard(context, data2[index]),
                        ),
                ),
              ),
            ],
          ),
        ));
  }

  getVideo() {
    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );
    _initializeVideoPlayerFuture = _controller.initialize();
    _controller.setLooping(true);
    setState(() {
      // _controller.play();
    });
  }

  List<CarouselItem> itemList = [
    CarouselItem(
      image: AssetImage(
        'assets/images/got.png',
      ),
      boxDecoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
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
          fontSize: 12, color: Colors.black, fontFamily: 'Open'),
      onImageTap: (i) {},
    ),
    CarouselItem(
      image: AssetImage(
        'assets/images/gow.png',
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
      image: AssetImage(
        'assets/images/mv.png',
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
}

Widget cappCard(BuildContext context, item) {
  return InkWell(
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
              Image.network(
                item['cappImageUrl'],
                fit: BoxFit.fill,
                height: 100,
                width: 100,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                item['name'],
                style: TextStyle(
                    fontFamily: "Open",
                    fontSize: 12,
                    color: PRIMARAY,
                    fontWeight: FontWeight.w700),
              ),
              Text(item['company'],
                  style: TextStyle(
                      fontFamily: "Open", fontSize: 10, color: Colors.green)),
              SizedBox(height: 10),
              Container(
                height: 30,
                decoration: BoxDecoration(
                    color: Color.fromARGB(94, 158, 158, 158),
                    shape: BoxShape.circle),
                alignment: Alignment.topRight,
                child: Center(
                  child: IconButton(
                      onPressed: () {}, icon: Icon(Icons.download, size: 10)),
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}

Widget dappCard(BuildContext context, item) {
  return InkWell(
    onTap: () {
      Get.to(() => DappsDetail(), arguments: {
        'image': item['dappImageUrl'],
        'name': item['name'],
        'company': item['company'],
        'age': item['ageRating'],
        'rating': item['starRating']
      });
    },
    child: Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(color: PRIMARAY, width: 0.01),
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle),
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10), topRight: Radius.circular(10)),
              child: Image.network(
                item['dappImageUrl'],
                fit: BoxFit.fill,
                height: 100,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    item['name'],
                    style: TextStyle(
                        fontFamily: "Open",
                        fontSize: 12,
                        color: PRIMARAY,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(item['company'],
                      style: TextStyle(
                          fontFamily: "Open",
                          fontSize: 10,
                          color: Colors.green)),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
