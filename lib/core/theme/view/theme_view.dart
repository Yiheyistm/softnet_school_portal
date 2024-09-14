import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softnet_school_portal/core/theme/app_theme.dart';
import 'package:softnet_school_portal/core/theme/cubit/theme_cubit.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';

class ThemeView extends StatefulWidget {
  const ThemeView({super.key});

  @override
  _ThemeViewState createState() => _ThemeViewState();
}

class _ThemeViewState extends State<ThemeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Theme'),
      //   backgroundColor: Theme.of(context).canvasColor,
      // ),
      body: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return Padding(
            padding: EdgeInsets.all(defaultPadding),
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: appThemesData[AppTheme.darkTheme]!.canvasColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                        onTap: () {
                          context
                              .read<ThemeCubit>()
                              .toggoleTheme(AppTheme.darkTheme);
                        },
                        child: Row(
                          children: [
                            const Icon(
                              Icons.dark_mode,
                              color: Colors.white,
                            ),
                            SizedBox(width: defaultPadding / 2),
                            Text(
                              'Dark Theme',
                              style: appThemesData[AppTheme.darkTheme]!
                                  .textTheme
                                  .bodyLarge
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        )),
                  ),
                ),
                SizedBox(width: defaultPadding),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(defaultPadding),
                    decoration: BoxDecoration(
                      color: appThemesData[AppTheme.lightTheme]!.canvasColor,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: InkWell(
                      onTap: () {
                        context
                            .read<ThemeCubit>()
                            .toggoleTheme(AppTheme.lightTheme);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.light_mode,
                            color: Colors.black,
                          ),
                          SizedBox(width: defaultPadding / 2),
                          Text(
                            'Light Theme',
                            style: appThemesData[AppTheme.lightTheme]!
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
