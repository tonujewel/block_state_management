import 'package:bloc_state_management/screens/Image_gallery/image_gallery_screen.dart';
import 'package:bloc_state_management/screens/authentication/login/login_screen.dart';
import 'package:bloc_state_management/screens/get_api/get_api_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffdfe6e9),
      appBar: AppBar(title: const Text("Flutter Bloc Example")),
      body: ListView(
        children: [
          const SizedBox(height: 10),
          HomeItemContainer(
            title: "Get api",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const GetApiScreen(),
              ),
            ),
          ),
          HomeItemContainer(
            title: "Todo with hive ",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => LoginScreen(),
              ),
            ),
          ),
          HomeItemContainer(
            title: "Image Gallery",
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ImageGalleryScreen(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HomeItemContainer extends StatelessWidget {
  final Function() onTap;
  final String title;
  const HomeItemContainer({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 20),
            ),
            const Spacer(),
            const Icon(Icons.arrow_forward_ios)
          ],
        ),
      ),
    );
  }
}
