// Flutter imports:
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// Package imports:
// import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:inshort_clone/aplication_localization.dart';
import 'package:inshort_clone/routes/routes.gr.dart';
import 'package:inshort_clone/routes/rouut.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/view/search_screen/search.dart';

appSearchBar(context) {
  var router = AutoRouter.of(context);
  return PreferredSize(
    child: Material(
      elevation: 1,
      // color: Colors.white,
      child: GestureDetector(
        onTap: () {
          // Rouut.navigator.pushNamed(Rouut.searchScreen);
          router.push(SearchRoute());
        },
        child: Container(
          margin: const EdgeInsets.fromLTRB(16, 98, 16, 16),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppColor.surface,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                // FeatherIcons.search,
                FontAwesomeIcons.magnifyingGlass,
                color: AppColor.iconGrey,
              ),
              SizedBox(width: 16),
              Text(
                AppLocalizations.of(context).translate("search_message"),
                style: TextStyle(
                  color: AppColor.iconGrey,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
            ],
          ),
        ),
      ),
    ),
    preferredSize: Size.fromHeight(142),
  );
}
