import 'package:creative_portsaid/main.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

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

class AboutCreativaScreen extends StatelessWidget {
  const AboutCreativaScreen({super.key});

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
                "Creativa Hub Port-Said",
                style: TextStyle(
                  fontSize: 24,
                  color: kBlueColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Creativa Port Said is a startup incubator that aims to support and develop the entrepreneurial ecosystem in Port Said, Egypt. We provide training, mentorship, and resources to help entrepreneurs launch and grow their businesses.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(kYellowColor),
                ),
                onPressed: () {
                  _launchURL(
                    context,
                    "https://www.facebook.com/Creativa.Hub.Portsaid",
                  );
                },
                child: const Text("Learn More"),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                customeIcon(
                  icon: const Icon(Icons.facebook),
                  color: const Color(0xFF0866FF),
                  onPressed: () {
                    _launchURL(
                      context,
                      "https://www.facebook.com/Creativa.Hub.Portsaid",
                    );
                  },
                ),
                const SizedBox(width: 10),
                customeIcon(
                  icon: const FaIcon(FontAwesomeIcons.whatsapp),
                  color: const Color(0xFF0CC143),
                  onPressed: () {
                    _launchURL(
                      context,
                      "https://chat.whatsapp.com/DNeSlNMWCKyIKFDSMnn2Qy",
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget customeIcon({
  required Widget icon,
  required Color color,
  required Function() onPressed,
}) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(50),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 8,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: IconButton(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all(32),
        foregroundColor: MaterialStateProperty.all(color),
      ),
      onPressed: onPressed,
      icon: icon,
    ),
  );
}
