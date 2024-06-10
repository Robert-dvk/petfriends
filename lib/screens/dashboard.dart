import 'package:flutter/material.dart';
import 'package:petfriends/screens/about.dart';
import 'package:petfriends/screens/friends.dart';
import 'package:petfriends/screens/profilepage.dart';
import 'package:petfriends/screens/loginscreen.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int selectedIndex = 0;

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
        title: const Text('Dashboard',
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
          Expanded(child: Container()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(Icons.close_outlined, size: 30, color: Colors.black),
                  ),
                ),
                onPressed: () {
                  // Add your logic for the close icon here
                },
              ),
              IconButton(
                icon: const Icon(Icons.info_outline, size: 55, color: Colors.black),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const About()),
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.favorite_border, size: 55, color: Colors.black),
                onPressed: () {
                  // Add your logic for the heart icon here
                },
              ),
            ],
          ),
          const SizedBox(height: 10), // Adiciona espaço entre os ícones e a barra de navegação
          BottomNavigationBar(
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
        ],
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: Dashboard(),
  ));
}
