import 'package:ItenMart/consts/consts.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class scanBarcodeScreen extends StatefulWidget {
  const scanBarcodeScreen({super.key});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<scanBarcodeScreen> {
  String _scanBarcode = '';

  Future<void> startBarcodeScanStream() async {
    FlutterBarcodeScanner.getBarcodeStreamReceiver(
            '#ff6666', 'Cancel', true, ScanMode.BARCODE)!
        .listen((barcode) => debugPrint(barcode));
  }

  Future<void> scanQR() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.QR);
      debugPrint(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> scanBarcodeNormal() async {
    String barcodeScanRes;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.DEFAULT);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    if (!mounted) return;

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          elevation: 0.0,
          backgroundColor: Colors.transparent,
        ),
        fontFamily: regular,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Scan Barcode & Qr"),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white, // Set text color to white
                  backgroundColor: redColor, // Set button color to red
                ),
                onPressed: () => scanBarcodeNormal(),
                child: const Text('Start barcode scan'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white, // Set text color to white
                  backgroundColor: redColor, // Set button color to red
                ),
                onPressed: () => scanQR(),
                child: const Text('Start QR scan'),
              ),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                    primary: Colors.white, // Set text color to white
                    backgroundColor: redColor // Set button color to red
                    ),
                onPressed: () => startBarcodeScanStream(),
                child: const Text('Start barcode scan stream'),
              ),
              Text(
                'Scan result : $_scanBarcode\n',
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
