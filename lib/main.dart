import'package:flutter/material.dart';
import'screen_home.dart';
void main(){
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        home: ScreenHome()
    );
  }

}
