import 'package:bodymood/resources/resources.dart';
import 'package:bodymood/routes/routes.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  static const route = '/login';
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            SplashImages.background,
            fit: BoxFit.cover,
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    color: Color(0xfffee500),
                  ),
                  constraints: const BoxConstraints.expand(
                    width: 300,
                    height: 45,
                  ),
                  child: TextButton(
                    onPressed: () {
                      goto.myAlbum(context);
                    },
                    child: const Text('카카오 로그인'),
                  ),
                ),
                const SizedBox(height: 18),
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                  constraints: const BoxConstraints.expand(
                    width: 300,
                    height: 45,
                  ),
                  child: TextButton(
                    onPressed: () {
                      goto.myAlbum(context);
                    },
                    child: const Text('애플 로그인'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
