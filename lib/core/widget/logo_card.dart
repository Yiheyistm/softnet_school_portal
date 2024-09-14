import 'package:flutter/material.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/core/utils/image_icon_name.dart';

class LogoCard extends StatelessWidget {
  const LogoCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width * 0.2,
      padding: EdgeInsets.all(defaultPadding * 1.2),
      margin: EdgeInsets.only(left: defaultPadding * 9, right: defaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).canvasColor,
      ),
      child: Image.asset(logoUrl),
    );
  }
}
