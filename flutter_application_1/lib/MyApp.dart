import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:qr_flutter/qr_flutter.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PC Booking App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String qrCode = '';
  bool loading = false;

  Future<void> generateQRCode(String bookingId) async {
    setState(() {
      loading = true;
    });
    final response = await http.post(
      Uri.parse('http://localhost:3000/api/generateQR'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'bookingId': bookingId,
      }),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        qrCode = data['qrCode'];
        loading = false;
      });
    } else {
      Fluttertoast.showToast(
        msg: 'Failed to generate QR Code',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    appBar: AppBar(
      title: Text('PC Booking App'),
    ),
    body: Center(
      child: loading
          ? CircularProgressIndicator()
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Chiamata alla funzione per generare il QR Code
                    generateQRCode('your_booking_id');
                  },
                  child: Text('Generate QR Code'),
                ),
                SizedBox(height: 20),
               // qrCode.isNotEmpty
                //    ? QrImage(data: qrCode)
                 //   : SizedBox.shrink(),
              ],
            ),
    ),
  );
  }
}
