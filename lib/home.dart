import 'package:flutter/material.dart';
import 'package:hstore/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int pageidx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          onTap: (idx) {
            setState(() {
              pageidx = idx;
            });
          },
          backgroundColor: WHITE,
          unselectedItemColor: Colors.grey,
          selectedItemColor: PRIMARAY,
          type: BottomNavigationBarType.fixed,
          currentIndex: pageidx,
          items: [
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.apps,
                  size: 20,
                ),
                label: "DApps"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.wallet_membership_sharp,
                  size: 20,
                ),
                label: "Wallet"),
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_box_outlined,
                  size: 20,
                ),
                label: "Account"),
          ],
        ),
        body: pages[pageidx]);
  }
}
