import 'package:flutter/material.dart';
import 'package:petfriends/screens/loginscreen.dart';
import 'package:petfriends/screens/profilepage.dart';
import 'package:petfriends/screens/dashboard.dart';

class Friends extends StatefulWidget {
  const Friends({super.key});

  @override
  State<Friends> createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  int selectedIndex = 2;

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Pet Friends',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 50,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: _logout,
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Meus pet friends',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap event here if needed
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 60,
              width: double.infinity,
              color: const Color(0xFFB3856D),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Rex', // Substitua "Rex" pelo nome do seu pet
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              // Handle tap event here if needed
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              height: 60,
              width: double.infinity,
              color: const Color(0xFFB3856D),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Fluffy', // Substitua "Fluffy" pelo nome do seu pet
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Icon(Icons.arrow_forward_ios, color: Colors.white),
                ],
              ),
            ),
          ),
          // Adicione mais GestureDetector para outros pets, se necessário
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.search, color: Colors.black), label: 'Busca'),
          BottomNavigationBarItem(
              icon: Icon(Icons.mail, color: Colors.black), label: 'Mail'),
          BottomNavigationBarItem(
              icon: Icon(Icons.pets, color: Colors.black), label: 'Pets'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person, color: Colors.black), label: 'Person'),
        ],
        iconSize: 40,
        onTap: (valor) {
          if (valor == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Dashboard()),
            );
          }
          if (valor == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const Friends()),
            );
          }
          if (valor == 3) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ProfilePage()),
            );
          } else {
            setState(() {
              selectedIndex = valor;
            });
          }
        },
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Friends(),
  ));
}
