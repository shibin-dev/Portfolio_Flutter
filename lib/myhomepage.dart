import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: media.width,
        height: media.height,
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff0f0c29),
            Color(0xff302b63),
            Color(0xff24243e)
          ]),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: media.height * .05,
              ),
              CircleAvatar(
                radius: media.width * .16,
                backgroundColor: Colors.white,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    media.width * .16,
                  ),
                  child: Image.asset(
                    'assets/rakesh.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                'Rakesh C',
                style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
              SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 15,
              ),
              Shimmer.fromColors(
                baseColor: Colors.black54,
                highlightColor: Colors.grey[300],
                child: Text(
                  'Connect with me',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImageContainer(
                      'assets/telegram.png', 'https://t.me/RakeshRajan555'),
                  SizedBox(
                    width: 5,
                  ),
                  ImageContainer('assets/linkedin.png',
                      'https://www.linkedin.com/in/rakesh-c-b6aa1220a'),
                  SizedBox(
                    width: 5,
                  ),
                  ImageContainer('assets/insta.png',
                      'https://www.instagram.com/its_rakesh_kbm/'),
                  SizedBox(
                    width: 5,
                  ),
                  ImageContainer('assets/facebook.png',
                      'https://m.facebook.com/100006892897687/'),
                ],
              ),
              SizedBox(
                height: 5,
              )
              // ElevatedButton(
              //   onPressed: () {},
              //   child: Text('Download Resume'),
              //   style: ElevatedButton.styleFrom(primary: Colors.yellow[700]),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  final String image;
  final String _url;
  ImageContainer(this.image, this._url);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return InkWell(
      onTap: _launchUrl,
      child: Container(
        width: media.width * 1 / 7,
        height: media.height * 1 / 7,
        child: Image.asset(image),
      ),
    );
  }

  void _launchUrl() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';
}
