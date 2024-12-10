import 'package:flutter/material.dart';

void main() {
  runApp(KalkulatorApp());
}

class KalkulatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kalkulator Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: KalkulatorHomePage(),
    );
  }
}

class KalkulatorHomePage extends StatefulWidget {
  @override
  _KalkulatorHomePageState createState() => _KalkulatorHomePageState();
}

class _KalkulatorHomePageState extends State<KalkulatorHomePage> {
  final TextEditingController _angka1Controller = TextEditingController();
  final TextEditingController _angka2Controller = TextEditingController();
  String _hasil = "";

  void _hitung(String operasi) {
    double angka1 = double.tryParse(_angka1Controller.text) ?? 0;
    double angka2 = double.tryParse(_angka2Controller.text) ?? 0;
    double hasil = 0;

    switch (operasi) {
      case '+':
        hasil = angka1 + angka2;
        break;
      case '-':
        hasil = angka1 - angka2;
        break;
      case '*':
        hasil = angka1 * angka2;
        break;
      case '/':
        if (angka2 != 0) {
          hasil = angka1 / angka2;
        } else {
          _hasil = "Tidak dapat dibagi dengan nol";
          setState(() {});
          return;
        }
        break;
    }

    _hasil = hasil.toString();
    setState(() {});
  }

  Widget _buildButton(String operasi, Color color) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        backgroundColor: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: () => _hitung(operasi),
      child: Text(
        operasi,
        style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Aplikasi Kalkulator'),
        backgroundColor: Colors.blue[900],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _angka1Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 1',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 20.0),
            TextField(
              controller: _angka2Controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Angka 2',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            SizedBox(height: 30.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _buildButton('+', Colors.green),
                _buildButton('-', Colors.red),
                _buildButton('*', Colors.orange),
                _buildButton('/', Colors.blue),
              ],
            ),
            SizedBox(height: 30.0),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                'Hasil: $_hasil',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.blue[900]),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[200], // Background warna untuk keseluruhan aplikasi
    );
  }
}
