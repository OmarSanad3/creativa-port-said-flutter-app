import 'package:creative_portsaid/main.dart';
import 'package:creative_portsaid/widgets/screens/qr_code_view.dart';
import 'package:flutter/material.dart';

class TakeAttendanceScreen extends StatefulWidget {
  const TakeAttendanceScreen({super.key});

  @override
  State<TakeAttendanceScreen> createState() => _TakeAttendanceScreenState();
}

class _TakeAttendanceScreenState extends State<TakeAttendanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBlueColor.withOpacity(0.5),
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "lib/assets/creativa_building.jpeg",
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Scan QR Code",
                style: TextStyle(
                  fontSize: 24,
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.35,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    iconSize: 100,
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const QRCodeView(),
                        ),
                      );
                    },
                    icon: const Icon(Icons.qr_code_scanner_sharp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
