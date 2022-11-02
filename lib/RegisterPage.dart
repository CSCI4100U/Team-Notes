import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register Page'),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            Container(
              width: 200,
              child: Image.network("https://shared.ontariotechu.ca/shared/uoit/images/ontariotechu-og-image.jpg"),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 1',
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 2',
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 3',
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 4',
                ),
              ),
            ),
            Container(
              width: 300,
              margin: const EdgeInsets.only(top: 30.0),
              child: TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.app_registration),
                  labelText: 'Enter Course 5',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Register'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}