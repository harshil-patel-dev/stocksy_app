import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key, this.e}) : super(key: key);
  final Exception? e;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Page not found !!"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('The page that you\'re looking for does not exist.'),
            MaterialButton(
              onPressed: () {},
            )
          ],
        ),
      ),
    );
  }
}
