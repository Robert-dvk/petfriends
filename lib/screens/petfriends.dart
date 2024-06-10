import 'package:flutter/material.dart';
import 'package:petfriends/screens/loginscreen.dart';

class PetFriends extends StatelessWidget {
  const PetFriends({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Login(),
    );
  }
}
