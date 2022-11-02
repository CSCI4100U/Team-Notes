import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({Key? key}) : super(key: key);

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 300,
            child: Image.network("https://shared.ontariotechu.ca/shared/uoit/images/ontariotechu-og-image.jpg"),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                labelText: 'Banner/Student ID',
              ),
            ),
          ),
          Container(
            width: 300,
            margin: const EdgeInsets.only(top: 10.0),
            child: TextFormField(
              decoration: const InputDecoration(
                icon: Icon(Icons.key),
                labelText: 'Password',
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 60.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Login"),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 10.0),
            child: ElevatedButton(
              onPressed: () {},
              child: Text("Register"),
            ),
          ),
        ],
      ),
    );
  }
}