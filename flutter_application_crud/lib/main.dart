import 'package:flutter/material.dart';
import 'package:flutter_application_crud/Mahasiswa.dart';
import 'package:flutter_application_crud/api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

// MyHomePage widget
// MyHomePage widget
class _MyHomePageState extends State<MyHomePage> {
  final ApiService _apiService = ApiService();
  final TextEditingController _namaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _tgllahirController = TextEditingController();

  Mahasiswa? _selectedMahasiswa; // Track the selected Mahasiswa for editing

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CRUD Example'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _namaController,
                    decoration: InputDecoration(labelText: 'Nama'),
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(labelText: 'Email'),
                  ),
                  TextFormField(
                    controller: _tgllahirController,
                    decoration: InputDecoration(labelText: 'Tgl Lahir'),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () async {
                      if (_selectedMahasiswa == null) {
                        // Creating a new Mahasiswa
                        Mahasiswa newPost = Mahasiswa(
                          id: 0,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await _apiService.createMahasiswa(newPost);
                      } else {
                        // Editing an existing Mahasiswa
                        Mahasiswa updatedMahasiswa = Mahasiswa(
                          id: _selectedMahasiswa!.id,
                          nama: _namaController.text,
                          email: _emailController.text,
                          tgllahir: _tgllahirController.text,
                        );
                        await _apiService.updateMahasiswa(updatedMahasiswa);
                        _selectedMahasiswa = null; // Reset selected Mahasiswa
                      }

                      // Clear text fields
                      _namaController.clear();
                      _emailController.clear();
                      _tgllahirController.clear();

                      // Refresh the UI
                      setState(() {});
                    },
                    child: Text(_selectedMahasiswa == null
                        ? 'Create Post'
                        : 'Update Mahasiswa'),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Mahasiswa>>(
              future: _apiService.getMahasiswa(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Mahasiswa> posts = snapshot.data!;
                  return ListView.builder(
                    itemCount: posts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(posts[index].nama),
                        subtitle: Text(posts[index].email),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.red),
                              ),
                              onPressed: () async {
                                await _apiService
                                    .deleteMahasiswa(posts[index].id);
                                setState(() {
                                  posts.removeAt(index);
                                });
                              },
                              child: Text("Delete"),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () async {
                                _selectedMahasiswa = posts[index];
                                // Set values to the controllers for editing
                                _namaController.text = _selectedMahasiswa!.nama;
                                _emailController.text =
                                    _selectedMahasiswa!.email;
                                _tgllahirController.text =
                                    _selectedMahasiswa!.tgllahir;

                                // Refresh the UI
                                setState(() {});
                              },
                              child: Text("Edit"),
                            ),
                          ],
                        ),
                        onTap: () async {
                          // Existing code for navigating to the MahasiswaEditScreen
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// MahasiswaEditScreen widget
// MahasiswaEditScreen widget
class MahasiswaEditScreen extends StatelessWidget {
  final Mahasiswa mahasiswa;

  MahasiswaEditScreen({required this.mahasiswa});

  final ApiService _apiService = ApiService();
  final TextEditingController _editedNamaController = TextEditingController();
  final TextEditingController _editedEmailController = TextEditingController();
  final TextEditingController _editedTglLahirController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    _editedNamaController.text = mahasiswa.nama;
    _editedEmailController.text = mahasiswa.email;
    _editedTglLahirController.text = mahasiswa.tgllahir;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Mahasiswa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _editedNamaController,
                decoration: InputDecoration(labelText: 'Nama'),
              ),
              TextFormField(
                controller: _editedEmailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: _editedTglLahirController,
                decoration: InputDecoration(labelText: 'Tgl Lahir'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () async {
                  // Example: Updating an existing Mahasiswa
                  Mahasiswa updatedMahasiswa = Mahasiswa(
                    id: mahasiswa.id,
                    nama: _editedNamaController.text,
                    email: _editedEmailController.text,
                    tgllahir: _editedTglLahirController.text,
                  );

                  // Save the updated Mahasiswa
                  await _apiService.updateMahasiswa(updatedMahasiswa);

                  // Return the updated Mahasiswa to the calling screen
                  Navigator.pop(context, updatedMahasiswa);
                },
                child: Text('Update Mahasiswa'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}