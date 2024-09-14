// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:softnet_school_portal/core/routes/routes_name.dart';
import 'package:softnet_school_portal/core/utils/image_icon_name.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Future.delayed(const Duration(seconds: 2)).then((_) async {
        context.goNamed(RouteName.main);
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(
          logoUrl,
          alignment: Alignment.center,
          width: double.infinity,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
