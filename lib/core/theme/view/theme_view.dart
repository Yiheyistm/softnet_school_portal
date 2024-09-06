import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnet_school_portal/core/theme/app_theme.dart';
import 'package:softnet_school_portal/core/theme/cubit/theme_cubit.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  _ThemeViewState createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).primaryColor);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return ListView.builder(
            itemCount: AppTheme.values.length,
            itemBuilder: (context, index) {
              final itemAppTheme = AppTheme.values[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                color: appThemesData[itemAppTheme]!.primaryColor,
                child: ListTile(
                  title: Text(
                    itemAppTheme.name.toUpperCase(),
                    style: appThemesData[itemAppTheme]!.textTheme.bodyLarge,
                  ),
                  onTap: () {
                    context.read<ThemeCubit>().toggoleTheme(itemAppTheme);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
