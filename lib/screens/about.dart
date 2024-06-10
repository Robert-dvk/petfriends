import 'package:flutter/material.dart';
import 'package:petfriends/screens/dashboard.dart';
import 'package:petfriends/screens/friends.dart';
import 'package:petfriends/screens/loginscreen.dart';
import 'package:petfriends/screens/profilepage.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
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
        title: const Text('About',
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
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: const SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sobre o PetFriends',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O PetFriends é um aplicativo dedicado a conectar amantes de animais de estimação. Aqui você pode encontrar amigos para seus pets, agendar encontros e compartilhar suas experiências com outros donos de animais.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Funcionalidades:',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      '• Busca de amigos para pets\n• Mensagens diretas\n• Perfil personalizado para seu pet\n• Compartilhamento de fotos e vídeos\n• Informações sobre cuidados com animais',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Nosso Time',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'O PetFriends foi desenvolvido por uma equipe apaixonada por animais e tecnologia. Nosso objetivo é criar uma comunidade onde donos de pets possam se conectar e compartilhar suas experiências.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),
          ),
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
                  Navigator.pushReplacement(
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
          const SizedBox(height: 10),
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
    home: About(),
  ));
}
