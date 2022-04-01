import 'package:flutter/material.dart';
import 'package:paysafev3/screens/home_page.dart';
import 'package:paysafev3/screens/payment_page.dart';
import 'package:paysafev3/screens/profile_page.dart';
import 'package:paysafev3/screens/scanner_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({ Key? key }) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  List pages = [
    // HomePage(),
    MapScreen(),
    ScannerPage(),
    PaymentPage(),
  ];
  int currentIndex = 1;
  void onTap(int index){
    setState(() {
      currentIndex = index;
      // if (pages.remove(HomePage())) {
      //   pages.remove(HomePage());
      // };
    });
  }

  // void showDialog()

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: Icon(Icons.menu),
        title: const Text('PaySafe'),
        // centerTitle: true,
        actions: [
          // Icon(Icons.favorite),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              icon: const Icon(Icons.volume_up),
              onPressed: () async {},
            ),
          ),
          // Icon(Icons.more_vert),
        ],
        // Color: Colors.black54,
        backgroundColor: Colors.black87,
      ),
      backgroundColor: Colors.white,
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 0,
        selectedFontSize: 0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        onTap: onTap,
        currentIndex: currentIndex,
        selectedItemColor: Colors.black54,
        unselectedItemColor: Colors.grey.withOpacity(0.5),
        showUnselectedLabels: false,
        showSelectedLabels: false,
        elevation: 0,
        items: [
          BottomNavigationBarItem(label: "Profile", icon: Icon(Icons.account_circle)),
          BottomNavigationBarItem(label: "Scanner", icon: Icon(Icons.camera)),
          BottomNavigationBarItem(label: "Payment", icon: Icon(Icons.credit_card)),
        ]
      ),
      
    );
  }

}