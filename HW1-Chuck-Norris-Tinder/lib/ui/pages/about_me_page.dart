import 'package:flutter/material.dart';
import 'package:hw1_chuck_norris_tinder/ui/common/app_icons.dart';
import 'package:url_launcher/url_launcher.dart';


class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      width: double.infinity,
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                height: 250,
                width: 100,
                child: Image.asset('assets/images/photo.jpg'),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Eduard Zaripov",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 15
                      ),
                    ),
                    const Text(
                      "Java Backend Developer at Tinkoff",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.grey,
                          fontStyle: FontStyle.italic,
                          fontSize: 10
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () async {
                            await goToWebPage("https://github.com/edikgoose");
                          },
                          icon: const Icon(AppIcons.github),
                        ),
                        IconButton(
                          onPressed: () async {
                            await goToWebPage("https://www.linkedin.com/in/edikgoose/");
                          },
                          icon: const Icon(AppIcons.linkedin),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Future<void> goToWebPage(String urlString) async {
    final Uri url = Uri.parse(urlString);
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}

