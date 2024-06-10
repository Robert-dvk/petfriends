import 'package:flutter/material.dart';
import 'package:petfriends/screens/friends.dart';
import 'package:petfriends/screens/dashboard.dart';
import 'package:petfriends/screens/loginscreen.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int selectedIndex = 3;

  void _logout() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Login()),
    );
  }

  void _deleteAccount() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Excluir conta"),
          content: const Text("Tem certeza de que deseja excluir sua conta?"),
          actions: [
            TextButton(
              child: const Text("Cancelar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: const Text("Excluir"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Profile Page',
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
              'Configurações',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print('Ícone "Meus dados" clicado');
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
                    'Meus dados',
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
              print('Ícone "Meu pet" clicado');
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
                    'Meu pet',
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
          Expanded(child: Container()), 
          const SizedBox(height: 10), // Add space between "Meu pet" and "Excluir conta"
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: _deleteAccount,
              child: const Text(
                'Excluir conta',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
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
    home: ProfilePage(),
  ));
}
