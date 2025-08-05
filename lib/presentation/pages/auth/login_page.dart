import 'package:flutter/material.dart';

import 'widgets/build_auth_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildAuthTextField(
                labelText: 'E-mail',
                enabled: true,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
              ),
              BuildAuthTextField(
                labelText: 'Senha',
                enabled: true,
                controller: _passwordController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}