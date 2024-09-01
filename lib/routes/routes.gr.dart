// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i10;
import 'package:inshort_clone/model/news_model.dart' as _i11;
import 'package:inshort_clone/view/app_base/app_base.dart' as _i1;
import 'package:inshort_clone/view/bookmarked_screen/bookmark.dart' as _i2;
import 'package:inshort_clone/view/discover_screen/discover.dart' as _i3;
import 'package:inshort_clone/view/feed_screen/feed.dart' as _i5;
import 'package:inshort_clone/view/photo_view/photo_expanded_screen.dart'
    as _i4;
import 'package:inshort_clone/view/search_screen/search.dart' as _i6;
import 'package:inshort_clone/view/settings_screen/settings.dart' as _i7;
import 'package:inshort_clone/view/web_screen/web.dart' as _i8;

/// generated route for
/// [_i1.AppBase]
class AppBase extends _i9.PageRouteInfo<void> {
  const AppBase({List<_i9.PageRouteInfo>? children})
      : super(
          AppBase.name,
          initialChildren: children,
        );

  static const String name = 'AppBase';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i1.AppBase();
    },
  );
}

/// generated route for
/// [_i2.BookmarkScreen]
class BookmarkRoute extends _i9.PageRouteInfo<void> {
  const BookmarkRoute({List<_i9.PageRouteInfo>? children})
      : super(
          BookmarkRoute.name,
          initialChildren: children,
        );

  static const String name = 'BookmarkRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i2.BookmarkScreen();
    },
  );
}

/// generated route for
/// [_i3.DiscoverScreen]
class DiscoverRoute extends _i9.PageRouteInfo<void> {
  const DiscoverRoute({List<_i9.PageRouteInfo>? children})
      : super(
          DiscoverRoute.name,
          initialChildren: children,
        );

  static const String name = 'DiscoverRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i3.DiscoverScreen();
    },
  );
}

/// generated route for
/// [_i4.ExpandedImageView]
class ExpandedImageView extends _i9.PageRouteInfo<ExpandedImageViewArgs> {
  ExpandedImageView({
    required dynamic image,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          ExpandedImageView.name,
          args: ExpandedImageViewArgs(image: image),
          initialChildren: children,
        );

  static const String name = 'ExpandedImageView';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ExpandedImageViewArgs>();
      return _i4.ExpandedImageView(image: args.image);
    },
  );
}

class ExpandedImageViewArgs {
  const ExpandedImageViewArgs({required this.image});

  final dynamic image;

  @override
  String toString() {
    return 'ExpandedImageViewArgs{image: $image}';
  }
}

/// generated route for
/// [_i5.FeedScreen]
class FeedRoute extends _i9.PageRouteInfo<FeedRouteArgs> {
  FeedRoute({
    _i10.Key? key,
    required int articalIndex,
    required List<_i11.Articles> articals,
    required bool isFromSearch,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          FeedRoute.name,
          args: FeedRouteArgs(
            key: key,
            articalIndex: articalIndex,
            articals: articals,
            isFromSearch: isFromSearch,
          ),
          initialChildren: children,
        );

  static const String name = 'FeedRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FeedRouteArgs>();
      return _i5.FeedScreen(
        key: args.key,
        articalIndex: args.articalIndex,
        articals: args.articals,
        isFromSearch: args.isFromSearch,
      );
    },
  );
}

class FeedRouteArgs {
  const FeedRouteArgs({
    this.key,
    required this.articalIndex,
    required this.articals,
    required this.isFromSearch,
  });

  final _i10.Key? key;

  final int articalIndex;

  final List<_i11.Articles> articals;

  final bool isFromSearch;

  @override
  String toString() {
    return 'FeedRouteArgs{key: $key, articalIndex: $articalIndex, articals: $articals, isFromSearch: $isFromSearch}';
  }
}

/// generated route for
/// [_i6.SearchScreen]
class SearchRoute extends _i9.PageRouteInfo<void> {
  const SearchRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i6.SearchScreen();
    },
  );
}

/// generated route for
/// [_i7.SettingsScreen]
class SettingsRoute extends _i9.PageRouteInfo<void> {
  const SettingsRoute({List<_i9.PageRouteInfo>? children})
      : super(
          SettingsRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i7.SettingsScreen();
    },
  );
}

/// generated route for
/// [_i8.WebScreen]
class WebRoute extends _i9.PageRouteInfo<WebRouteArgs> {
  WebRoute({
    required String url,
    required bool isFromBottom,
    _i10.PageController? pageController,
    List<_i9.PageRouteInfo>? children,
  }) : super(
          WebRoute.name,
          args: WebRouteArgs(
            url: url,
            isFromBottom: isFromBottom,
            pageController: pageController,
          ),
          initialChildren: children,
        );

  static const String name = 'WebRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WebRouteArgs>();
      return _i8.WebScreen(
        url: args.url,
        isFromBottom: args.isFromBottom,
        pageController: args.pageController,
      );
    },
  );
}

class WebRouteArgs {
  const WebRouteArgs({
    required this.url,
    required this.isFromBottom,
    this.pageController,
  });

  final String url;

  final bool isFromBottom;

  final _i10.PageController? pageController;

  @override
  String toString() {
    return 'WebRouteArgs{url: $url, isFromBottom: $isFromBottom, pageController: $pageController}';
  }
}
