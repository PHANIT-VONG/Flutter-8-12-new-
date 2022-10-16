import 'package:firebase_8_12/services/authentications.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    const spacingHeight = SizedBox(height: 30);
    //const spacingWidth = SizedBox(width: 15);
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const SizedBox(height: 100),
                const FlutterLogo(size: 100),
                spacingHeight,
                Text(
                  'Welcome back \nto Login',
                  style: Theme.of(context).textTheme.headline4,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 50),
                TextField(
                  controller: email,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                    hintText: 'Enter email',
                  ),
                ),
                spacingHeight,
                TextField(
                  controller: password,
                  style: Theme.of(context).textTheme.headline6,
                  decoration: const InputDecoration(
                    hintText: 'Enter password',
                  ),
                ),
                spacingHeight,
                CupertinoButton.filled(
                  child: const Text('Log in'),
                  onPressed: () async {
                    await AutheticationService().login(
                      email.text,
                      password.text,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
