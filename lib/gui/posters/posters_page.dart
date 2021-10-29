import 'package:flutter/material.dart';

import '../../resources/resources.dart';

class PostersPage extends StatelessWidget {
  const PostersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: SingleChildScrollView(
                child: Wrap(
                  runSpacing: 16,
                  spacing: 16,
                  alignment: WrapAlignment.spaceBetween,
                  children: [
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                    Image.asset(MyAlbumImages.posterImage),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: OutlinedButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.camera,
                        color: Colors.black,
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  SizedBox(
                    width: 56,
                    height: 56,
                    child: TextButton(
                      onPressed: () {},
                      child: const Icon(
                        Icons.photo_library,
                        color: Colors.white,
                      ),
                      style: OutlinedButton.styleFrom(
                        backgroundColor: const Color(0xff18192b),
                        shape: const CircleBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              bottom: 80,
              right: 24,
            ),
          ],
        ),
      ),
    );
  }
}
