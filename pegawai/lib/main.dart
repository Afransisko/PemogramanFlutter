import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: SalaryCalculator(),
  ));
}

class SalaryCalculator extends StatefulWidget {
  @override
  _SalaryCalculatorState createState() => _SalaryCalculatorState();
}

class _SalaryCalculatorState extends State<SalaryCalculator> {
  TextEditingController nipController = TextEditingController();
  TextEditingController namaController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  DateTime? selectedDate; // Tambahkan variabel untuk menyimpan tanggal terpilih
  String golongan = 'IIIA';

  List<String> golonganOptions = ['IIIA', 'IIIB', 'IIIC'];

  double gajiPokok = 0.0;
  double tunjanganAnak = 0.0;
  double tunjanganIstri = 0.0;

  // Fungsi untuk menampilkan date picker
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = (await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    ))!;
    if (picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gaji Pegawai'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: nipController,
              decoration: InputDecoration(labelText: 'NIP'),
            ),
            TextField(
              controller: namaController,
              decoration: InputDecoration(labelText: 'Nama'),
            ),
            TextField(
              controller: alamatController,
              decoration: InputDecoration(labelText: 'Alamat'),
            ),
            Text('Golongan:'),
            DropdownButton<String>(
              value: golongan,
              items: golonganOptions.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  golongan = newValue!;
                });
              },
            ),
            Row(
              children: <Widget>[
                Text('Tanggal: '),
                if (selectedDate != null)
                  Text(
                    "${selectedDate!.toLocal()}".split(' ')[0],
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ElevatedButton(
                  onPressed: () => _selectDate(context),
                  child: Text('Pilih Tanggal'),
                ),
              ],
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Hitung gaji pokok berdasarkan golongan
                if (golongan == 'IIIA') {
                  gajiPokok = 1000000;
                } else if (golongan == 'IIIB') {
                  gajiPokok = 2000000;
                } else if (golongan == 'IIIC') {
                  gajiPokok = 3000000;
                }

                // Hitung tunjangan anak dan istri
                tunjanganAnak = 0.05 * gajiPokok;
                tunjanganIstri = 0.05 * gajiPokok;

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SalaryResult(
                      nip: nipController.text,
                      nama: namaController.text,
                      alamat: alamatController.text,
                      golongan: golongan,
                      tanggal: selectedDate != null
                          ? "${selectedDate!.toLocal()}".split(' ')[0]
                          : '',
                      gajiPokok: gajiPokok,
                      tunjanganAnak: tunjanganAnak,
                      tunjanganIstri: tunjanganIstri,
                    ),
                  ),
                );
              },
              child: Text('Hitung'),
            ),
          ],
        ),
      ),
    );
  }
}

class SalaryResult extends StatelessWidget {
  final String nip;
  final String nama;
  final String alamat;
  final String golongan;
  final String tanggal;
  final double gajiPokok;
  final double tunjanganAnak;
  final double tunjanganIstri;

  SalaryResult({
    required this.nip,
    required this.nama,
    required this.alamat,
    required this.golongan,
    required this.tanggal,
    required this.gajiPokok,
    required this.tunjanganAnak,
    required this.tunjanganIstri,
  });

  @override
  Widget build(BuildContext context) {
    // Hitung gaji bersih
    double gajiBersih = gajiPokok + tunjanganIstri + tunjanganAnak;

    return Scaffold(
      appBar: AppBar(
        title: Text('Hasil'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('NIP: $nip'),
            Text('Nama: $nama'),
            Text('Alamat: $alamat'),
            Text('Golongan: $golongan'),
            Text('Tanggal: $tanggal'),
            Text('Gaji Pokok: $gajiPokok'),
            Text('Tunjangan Anak: $tunjanganAnak'),
            Text('Tunjangan Istri: $tunjanganIstri'),
            Text('Gaji Bersih: $gajiBersih'), // Tambahkan gaji bersih di sini
          ],
        ),
      ),
    );
  }
}