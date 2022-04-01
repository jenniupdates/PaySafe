// make payment via normal such as google pay, apple pay, etc
// will lead to text-to-voice services

import 'package:flutter/cupertino.dart';
class HomePage extends StatelessWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'If you are a volunteer, kindly ask for the pin number from the onwer. This is to ensure trust between owner and volunteer.'
        ),
      ),
    );
  }
}