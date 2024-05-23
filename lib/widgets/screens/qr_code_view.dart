import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:url_launcher/url_launcher.dart';

class QRCodeView extends StatefulWidget {
  const QRCodeView({super.key});
  @override
  @override
  State<QRCodeView> createState() => _QRCodeViewState();
}

Future<void> _launchURL(BuildContext context, String url) async {
  Uri uri = Uri.parse(url);
  try {
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception("Could not launch $uri");
    }
  } catch (err) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(err.toString()),
      ),
    );
  }
}

class _QRCodeViewState extends State<QRCodeView> {
  final GlobalKey qrKey = GlobalKey();
  QRViewController? controller;
  String? qrText;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('QR Code Scanner')),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: Text('Scan result: $qrText'),
            ),
          )
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData.code;
        _launchURL(context, qrText!);
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
