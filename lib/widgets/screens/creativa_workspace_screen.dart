import 'package:creative_portsaid/main.dart';
import 'package:flutter/material.dart';
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

class CreativaWorkspaceScreen extends StatelessWidget {
  const CreativaWorkspaceScreen({super.key});

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
              "lib/assets/creativa_workspace.jpeg",
            ),
            const SizedBox(height: 8),
            const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                "Creativa Workspace",
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
                "Creativa Workspace is a coworking space that provides a creative and collaborative environment for entrepreneurs, freelancers, and startups. We offer flexible workspaces, meeting rooms, and event spaces to help you grow your business.",
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
                child: const Text("Contact Us"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
