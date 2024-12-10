import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warnet Billing',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WarnetBilling(),
    );
  }
}

class WarnetBilling extends StatefulWidget {
  @override
  _WarnetBillingState createState() => _WarnetBillingState();
}

class _WarnetBillingState extends State<WarnetBilling> {
  final _kodeController = TextEditingController();
  final _namaController = TextEditingController();
  final _jenisController = TextEditingController();
  final _jamMasukController = TextEditingController();
  final _jamKeluarController = TextEditingController();

  double _totalBayar = 0.0;
  bool _showResult = false;

  void _hitungTotal() {
    final tarifPerJam = 10000.0;
    final jamMasuk = double.tryParse(_jamMasukController.text) ?? 0;
    final jamKeluar = double.tryParse(_jamKeluarController.text) ?? 0;

    final lama = jamKeluar - jamMasuk;
    double diskon = 0.0;

    if (lama > 2) {
      if (_jenisController.text == "VIP") {
        diskon = 0.02 * (lama * tarifPerJam);
      } else if (_jenisController.text == "GOLD") {
        diskon = 0.05 * (lama * tarifPerJam);
      }
    }

    setState(() {
      _totalBayar = (lama * tarifPerJam) - diskon;
      _showResult = true; // Menampilkan hasil
    });
  }

  void _resetForm() {
    _kodeController.clear();
    _namaController.clear();
    _jenisController.clear();
    _jamMasukController.clear();
    _jamKeluarController.clear();
    setState(() {
      _showResult = false; // Kembali ke form entri
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Warnet'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _showResult ? _buildResultView() : _buildEntryForm(),
      ),
    );
  }

  Widget _buildEntryForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _kodeController,
          decoration: InputDecoration(labelText: 'Kode Pelanggan'),
        ),
        TextField(
          controller: _namaController,
          decoration: InputDecoration(labelText: 'Nama Pelanggan'),
        ),
        TextField(
          controller: _jenisController,
          decoration: InputDecoration(labelText: 'Jenis Pelanggan (VIP/GOLD)'),
        ),
        TextField(
          controller: _jamMasukController,
          decoration: InputDecoration(labelText: 'Jam Masuk'),
          keyboardType: TextInputType.number,
        ),
        TextField(
          controller: _jamKeluarController,
          decoration: InputDecoration(labelText: 'Jam Keluar'),
          keyboardType: TextInputType.number,
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _hitungTotal,
          child: Text('Hitung Total Bayar'),
        ),
      ],
    );
  }

  Widget _buildResultView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Total Bayar: Rp ${_totalBayar.toStringAsFixed(2)}',
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: _resetForm,
          child: Text('Kembali ke Form'),
        ),
      ],
    );
  }
}
