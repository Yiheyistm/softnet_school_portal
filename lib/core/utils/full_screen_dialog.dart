import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:softnet_school_portal/core/theme/app_colors.dart';

class FullscreenLoader {
  static bool _isDialogOpen = false;

  static void show(BuildContext context) {
    if (!_isDialogOpen) {
      _isDialogOpen = true;
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (context.mounted) {
          showDialog(
            context: context,
            barrierDismissible: false,
            barrierColor: AppColors.transparentColor,
            builder: (BuildContext context) {
              return const PopScope(
                canPop: false,
                child: Center(
                  child: SpinKitCircle(
                    color: AppColors.primaryColor,
                    size: 50.0,
                  ),
                ),
              );
            },
          ).then((value) => _isDialogOpen = false);
        }
      });
    }
  }

  static void hide(BuildContext context) {
    if (_isDialogOpen) {
      _isDialogOpen = false;
      Navigator.of(context, rootNavigator: true).pop();
    }
  }

  static bool isDialogOpen() {
    return _isDialogOpen;
  }
}
