import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softnet_school_portal/core/routes/routes_name.dart';
import 'package:softnet_school_portal/core/utils/app_string.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const TextField(
                decoration: InputDecoration(hintText: 'Name'),
              ),
              const Text(AppString.loginButton),
              ElevatedButton.icon(
                  onPressed: () {
                    context.pushNamed(RouteName.theme);
                  },
                  icon: const Icon(Icons.theater_comedy),
                  label: const Text('Go to Theme')),
            ],
          ),
        ),
      ),
    );
  }
}
