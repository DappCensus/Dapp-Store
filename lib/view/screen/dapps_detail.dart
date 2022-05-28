import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:hstore/utils/constants.dart';
import 'package:hstore/view/widgets/default_button.dart';
import 'package:star_rating/star_rating.dart';
import 'package:expandable/expandable.dart';

class DappsDetail extends StatefulWidget {
  const DappsDetail({Key? key}) : super(key: key);

  @override
  State<DappsDetail> createState() => _DappsDetailState();
}

class _DappsDetailState extends State<DappsDetail> {
  String name = '';
  String image = '';
  String company = '';
  String rating = '';
  String age = '';

  double ratingDouble = 0.0;

  @override
  void initState() {
    name = Get.arguments['name'];
    image = Get.arguments['image'];
    company = Get.arguments['company'];
    rating = Get.arguments['rating'];
    age = Get.arguments['age'];
    ratingDouble = double.parse(rating);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                    )),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.search),
                    ),
                    IconButton(
                        onPressed: () {}, icon: Icon(Icons.more_vert_outlined))
                  ],
                )
              ],
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.001,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(image, height: 80, width: 80),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                          fontFamily: 'Open',
                          fontSize: 16,
                          color: PRIMARAY,
                          fontWeight: FontWeight.w700,
                        )),
                    Text(
                      company,
                      style: TextStyle(
                          fontFamily: 'Open', fontSize: 13, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'In-app purchases',
                      style: TextStyle(
                          fontFamily: 'Open', fontSize: 11, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Text(
                          'Rating',
                          style: TextStyle(
                              fontFamily: 'Open',
                              fontSize: 11,
                              color: Colors.grey),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          age,
                          style: TextStyle(
                              fontFamily: 'Open',
                              fontSize: 11,
                              color: Colors.purple),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
            child: Row(
              children: [
                StarRating(
                  mainAxisAlignment: MainAxisAlignment.start,
                  length: 5,
                  rating: ratingDouble,
                  between: 5.0,
                  color: Colors.green,
                  starSize: 20.0,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('5.0',
                    style: TextStyle(
                      fontFamily: 'Open',
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: defaultButton(
                text: 'Install', color: Colors.blue, onPressed: () {}),
          ),
          SizedBox(
            height: 60,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                onTap: () {},
                child: Container(
                  height: 10,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.1),
                      borderRadius: BorderRadius.circular(10),
                      shape: BoxShape.rectangle),
                  margin: EdgeInsets.all(10),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        'Addictive',
                        style: TextStyle(
                          fontFamily: 'Open',
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          SizedBox(
            height: 200,
            child: ListView.builder(
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(image, height: 100, width: 200),
                    ),
                  )),
            ),
          ),
          SizedBox(
            height: screenHeight(context) * 0.05,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              "what's new",
              style: TextStyle(
                  fontFamily: 'Open',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ExpandablePanel(
              header: Text(
                "Updates",
              ),
              collapsed: Text(
                'New Events',
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                'This is a text showing the updates made on the app new vwersion',
                softWrap: true,
              ),
            ),
          )
        ],
      ),
    ));
  }
}
