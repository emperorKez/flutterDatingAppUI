import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../providers/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? errorMessage = '';
  bool isLoggin = true;
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();

  Future<void> signInWithEmailAndPassword() async {
    try {
      await AuthProvider().signInWithEmailAndPassword(
          email: _email.text, password: _password.text);
    } on FirebaseAuthException catch (e) {
      setState(() {
        errorMessage = e.message;
      });
    }
  }

  Widget _entryField(String title, TextEditingController controller) {
    return TextField();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
