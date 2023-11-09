import 'package:mobile_scanner/mobile_scanner.dart';

import '../../consts/consts.dart';

// minSdkVersion=21
// targetSdkVersion=33
// <uses-permission android:name="android.permission.CAMERA"/>

const bgColor = Color(0xfffafafa);

class QrScanner extends StatefulWidget {
  const QrScanner({super.key});

  @override
  State<QrScanner> createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  bool isScanCompleted = false;
  void closeScreen() {
    isScanCompleted = false;
  }

  @override
  Widget build(BuildContext) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            // Fungsi untuk kembali
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          "Precence Scanner",
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontFamily: bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Place the QR in the area",
                    style: TextStyle(
                      color: Colors.black87,
                      fontSize: 18,
                      fontFamily: bold,
                      letterSpacing: 1,
                    ),
                  ),
                  10.heightBox,
                  Text(
                    "Scanning will be started automatically",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                      fontFamily: bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: MobileScanner(
                allowDuplicates: true,
                onDetect: (barcode, args) {
                  if (!isScanCompleted) {
                    // String code = barcode.rawValue ?? '---';
                    // Navigator.push
                  }
                },
              ),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Develop by A05",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 10,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
