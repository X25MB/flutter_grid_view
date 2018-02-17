import 'package:example/example_1.dart';
import 'package:example/home.dart';
import 'package:example/spannable_count_extent_page.dart';
import 'package:example/spannable_count_count_page.dart';
import 'package:example/spannable_extent_extent_page.dart';
import 'package:example/spannable_extent_count_page.dart';
import 'package:example/staggered_count_extent_page.dart';
import 'package:example/staggered_count_count_page.dart';
import 'package:example/staggered_extent_extent_page.dart';
import 'package:example/staggered_extent_count_page.dart';
import 'package:flutter/material.dart';

const String homeRoute = '/';

const String staggeredCountCountRoute = '/staggered_count_count';
const String staggeredExtentCountRoute = '/staggered_extent_count';
const String staggeredCountExtentRoute = '/staggered_count_extent';
const String staggeredExtentExtentRoute = '/staggered_extent_extent';

const String spannableCountCountRoute = '/spannable_count_count';
const String spannableExtentCountRoute = '/spannable_extent_count';
const String spannableCountExtentRoute = '/spannable_count_extent';
const String spannableExtentExtentRoute = '/spannable_extent_extent';

const String example01 = '/example_01';

Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  homeRoute: (BuildContext context) => new Home(),
  staggeredCountCountRoute: (BuildContext context) =>
      new StaggeredCountCountPage(),
  staggeredExtentCountRoute: (BuildContext context) =>
      new StaggeredExtentCountPage(),
  staggeredCountExtentRoute: (BuildContext context) =>
      new StaggeredCountExtentPage(),
  staggeredExtentExtentRoute: (BuildContext context) =>
      new StaggeredExtentExtentPage(),
  spannableCountCountRoute: (BuildContext context) =>
      new SpannableCountCountPage(),
  spannableExtentCountRoute: (BuildContext context) =>
      new SpannableExtentCountPage(),
  spannableCountExtentRoute: (BuildContext context) =>
      new SpannableCountExtentPage(),
  spannableExtentExtentRoute: (BuildContext context) =>
      new SpannableExtentExtentPage(),
  example01: (BuildContext context) => new Example01(),
};
