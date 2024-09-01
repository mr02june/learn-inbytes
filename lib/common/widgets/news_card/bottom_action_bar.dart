// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
// import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

// Project imports:
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/model/news_model.dart';
import 'package:inshort_clone/services/news/offline_service.dart';
// import 'package:inshort_clone/services/news/share_service.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';
import '../../../aplication_localization.dart';

class BottomActionBar extends StatelessWidget {
  final containerKey;
  final Articles articles;

  const BottomActionBar({
    Key? key,
    this.containerKey,
    required this.articles,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      color: Theme.of(context).cardColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          actionButton(
            title: AppLocalizations.of(context).translate("share"),
            // icon: FeatherIcons.share2,
            icon: FontAwesomeIcons.shareNodes,
            onTap: () {
              Provider.of<FeedProvider>(context, listen: false)
                  .setWatermarkVisible(true);

              // Future.delayed(Duration(seconds: 2),
              //     () => convertWidgetToImageAndShare(context, containerKey));
              print('share');
            },
          ),
          WatchBoxBuilder(
            box: Hive.box<Articles>('bookmarks'),
            builder: (context, snap) => actionButton(
              title: AppLocalizations.of(context).translate("bookmark"),
              icon: snap.containsKey(articles.url)
                  ? Icons.bookmark
                  // : FeatherIcons.bookmark,
                  : FontAwesomeIcons.bookmark,
              onTap: () {
                handleBookmarks(articles);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget actionButton({
    required String title,
    required IconData icon,
    void Function()? onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            icon,
            color: AppColor.accent,
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: AppTextStyle.bottomActionbar,
          ),
        ],
      ),
    );
  }
}
