import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:softnet_school_portal/core/utils/constants.dart';
import 'package:softnet_school_portal/core/utils/image_icon_name.dart';

class DashboardHeader extends StatelessWidget {
  const DashboardHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: defaultPadding, vertical: defaultPadding / 2),
      decoration: BoxDecoration(
        color: Theme.of(context).canvasColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).primaryColor.withOpacity(0.8),
            blurRadius: 10,
            offset: const Offset(0.4, 0.4),
          ),
        ],
      ),
      child: Row(
        children: [
          // IconButton(
          //   icon: const Icon(Icons.menu),
          //   onPressed: () {},
          // ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  prefixIcon: InkWell(
                    onTap: () {},
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: defaultPadding / 2),
                      child: SvgPicture.asset(
                        searchIcon,
                        width: 15,
                        height: 15,
                        colorFilter: ColorFilter.mode(
                            Theme.of(context).textTheme.bodyMedium!.color!,
                            BlendMode.srcIn),
                      ),
                    ),
                  )),
            ),
          ),

          const Spacer(
            flex: 3,
          ),
          IconButton(
            onPressed: () {},
            icon: Badge.count(
              count: 3,
              child: SvgPicture.asset(
                bellIcon,
                height: 25,
                width: 25,
                colorFilter: ColorFilter.mode(
                    Theme.of(context).textTheme.bodyMedium!.color!,
                    BlendMode.srcIn),
              ),
            ),
          ),
          SizedBox(
            width: defaultPadding,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage(profilePic),
          )
        ],
      ),
    );
  }
}
