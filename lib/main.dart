import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:softnet_school_portal/core/locator/locator.dart';
import 'package:softnet_school_portal/core/routes/routes.dart';
import 'package:softnet_school_portal/core/theme/cubit/theme_cubit.dart';
import 'package:softnet_school_portal/core/utils/app_string.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  DependancyInjection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [BlocProvider(create: (_) => ThemeCubit()..setInitialTheme())],
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              title: AppString.appName,
              theme: state.theme,
              routerConfig: router);
        },
      ),
    );
  }
}
