// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
// import 'package:feather_icons_flutter/feather_icons_flutter.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// Project imports:
import 'package:inshort_clone/aplication_localization.dart';
import 'package:inshort_clone/bloc/feed/news_feed_bloc.dart';
import 'package:inshort_clone/bloc/feed/news_feed_event.dart';
import 'package:inshort_clone/controller/feed_controller.dart';
import 'package:inshort_clone/controller/provider.dart';
import 'package:inshort_clone/global/global.dart';
// import 'package:inshort_clone/routes/rouut.dart';
import 'package:inshort_clone/style/colors.dart';
import 'package:inshort_clone/style/text_style.dart';

class CustomAppBar extends StatelessWidget {
  final int index;
  const CustomAppBar({Key? key, this.index = 1}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FeedProvider>(
      builder: (context, value, child) => SafeArea(
        child: Material(
          // color: Colors.white,
          child: Container(
            height: 52,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: index != 1
                            ? IconButton(
                                // icon: Icon(FeatherIcons.settings),
                                icon: Icon(FontAwesomeIcons.gear),
                                onPressed: () {
                                  // Router.navigator
                                  //     .pushNamed(Router.settingsScreen);
                                },
                              )
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  IconButton(
                                    // icon: Icon(FeatherIcons.chevronLeft),
                                    icon: Icon(FontAwesomeIcons.arrowLeft),
                                    onPressed: () {
                                      FeedController.addCurrentPage(0);
                                    },
                                  ),
                                  Text(
                                    AppLocalizations.of(context)
                                            .translate("discover") ??
                                        "Discover",
                                    style: AppTextStyle.appBarTitle,
                                  )
                                ],
                              ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        index == 1
                            ? value.getAppBarTitle
                            : AppLocalizations.of(context)
                                .translate("discover") ?? "Discover",
                        style: AppTextStyle.appBarTitle.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            index != 1
                                ? Text(
                                    value.getAppBarTitle != null
                                        ? value.getAppBarTitle
                                        : AppLocalizations.of(context)
// Suggested code may be subject to a license. Learn more: ~LicenseLog:369230817.
                                            .translate("my_feed") ?? "My Feed",
                                    style: AppTextStyle.appBarTitle,
                                    overflow: TextOverflow.ellipsis,
                                    textDirection: TextDirection.rtl,
                                  )
                                : Container(),
                            getIcon(context)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Container(
                  width: Global.width(context) * 0.1,
                  height: 3,
                  color: AppColor.accent,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void bringToTop(PageController pageController) {
    pageController.animateToPage(0,
        duration: Duration(milliseconds: 700), curve: Curves.ease);
  }

  IconButton getIcon(context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);

    if (index != 1) {
      return IconButton(
          // icon: Icon(FeatherIcons.chevronRight),
          icon: Icon(FontAwesomeIcons.arrowRight),
          onPressed: () {
            FeedController.addCurrentPage(1);
          });
    } else {
      if (provider.gethasDataLoaded) {
        return provider.getCurentArticalIndex == 0
            ? IconButton(
                // icon: Icon(FeatherIcons.rotateCw),
                icon: Icon(FontAwesomeIcons.rotateRight),
                onPressed: () {
                  reloade(context);
                })
            : IconButton(
                // icon: Icon(FeatherIcons.arrowUp),
                icon: Icon(FontAwesomeIcons.arrowUp),
                onPressed: () => bringToTop(provider.getfeedPageController));
      } else {
        return IconButton(
            // icon: Icon(FeatherIcons.loader),
            icon: Icon(FontAwesomeIcons.spinner),
            onPressed: null);
      }
    }
  }

  void reloade(context) {
    final provider = Provider.of<FeedProvider>(context, listen: false);
    print(provider.getLastGetRequest.elementAt(0));

    switch (provider.getLastGetRequest.elementAt(0)) {
      case "getNewsByTopic":
        BlocProvider.of<NewsFeedBloc>(context)
          ..add(
            FetchNewsByTopicEvent(
                topic: provider.getLastGetRequest.elementAt(1)),
          );
        break;
      case "getNewsByCategory":
        BlocProvider.of<NewsFeedBloc>(context)
          ..add(
            FetchNewsByCategoryEvent(
                category: provider.getLastGetRequest.elementAt(1)),
          );
        break;
      case "getNewsFromLocalStorage":
        BlocProvider.of<NewsFeedBloc>(context)
          ..add(
            FetchNewsFromLocalStorageEvent(
                box: provider.getLastGetRequest.elementAt(1)),
          );
        break;
      default:
        return;
    }
  }
}
