import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:petfriends/screens/dashboard.dart';

class PetStore extends StatefulWidget {
  const PetStore({super.key});

  @override
  State<PetStore> createState() => _PetStoreState();
}

class _PetStoreState extends State<PetStore> {
  File? _image;

  Future<void> _pickImage(ImageSource source) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  void _showPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Galeria'),
                onTap: () {
                  _pickImage(ImageSource.gallery);
                  Navigator.of(context).pop();
                },
              ),
              ListTile(
                leading: const Icon(Icons.photo_camera),
                title: const Text('Câmera'),
                onTap: () {
                  _pickImage(ImageSource.camera);
                  Navigator.of(context).pop();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _handleCreatePressed(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Dashboard()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'PetFriends',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
        toolbarHeight: 50,
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: constraints.maxHeight,
                ),
                child: IntrinsicHeight(
                  child: Container(
                    color: const Color(0xFFB3856D),
                    width: double.infinity,
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: Container(
                        width: 350,
                        padding: const EdgeInsets.all(16.0),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            const SizedBox(height: 25.0),
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.pets,
                                  size: 40,
                                  color: Colors.blue,
                                ),
                                SizedBox(width: 10),
                                Text(
                                  'Cadastre o seu pet!',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 25.0),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Nome',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Raça',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Idade',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            const CastradoDropdown(),
                            const SizedBox(height: 18.0),
                            const TreinadoDropdown(),
                            const SizedBox(height: 18.0),
                            const TextField(
                              decoration: InputDecoration(
                                labelText: 'Sexo',
                                border: OutlineInputBorder(),
                              ),
                            ),
                            const SizedBox(height: 18.0),
                            _image == null
                                ? const Text(
                                    'Nenhuma imagem selecionada.',
                                    textAlign: TextAlign.center,
                                  )
                                : Image.file(
                                    _image!,
                                    height: 150,
                                    width: 150,
                                  ),
                            const SizedBox(height: 18.0),
                            ElevatedButton.icon(
                              icon: const Icon(Icons.photo),
                              label: const Text('Adicionar Foto'),
                              onPressed: () {
                                _showPicker(context);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                                minimumSize: const Size(250, 50),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(16.0),
                                backgroundColor: const Color(0xFF004CBF),
                                minimumSize: const Size(250, 50),
                              ),
                              onPressed: () => _handleCreatePressed(context),
                              child: const Text(
                                'Cadastrar',
                                style: TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 1.5,
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class CastradoDropdown extends StatefulWidget {
  const CastradoDropdown({super.key});

  @override
  State<CastradoDropdown> createState() => _CastradoDropdownState();
}

class _CastradoDropdownState extends State<CastradoDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Seu pet é castrado?',
        border: OutlineInputBorder(),
      ),
      value: selectedValue,
      items: const [
        DropdownMenuItem(value: 'Sim', child: Text('Sim')),
        DropdownMenuItem(value: 'Não', child: Text('Não')),
      ],
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}

class TreinadoDropdown extends StatefulWidget {
  const TreinadoDropdown({super.key});

  @override
  State<TreinadoDropdown> createState() => _TreinadoDropdownState();
}

class _TreinadoDropdownState extends State<TreinadoDropdown> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: const InputDecoration(
        labelText: 'Seu pet possui treinamento?',
        border: OutlineInputBorder(),
      ),
      value: selectedValue,
      items: const [
        DropdownMenuItem(value: 'Sim', child: Text('Sim')),
        DropdownMenuItem(value: 'Não', child: Text('Não')),
      ],
      onChanged: (value) {
        setState(() {
          selectedValue = value;
        });
      },
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: PetStore(),
  ));
}
