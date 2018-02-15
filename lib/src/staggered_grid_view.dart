import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/src/sliver_staggered_grid.dart';
import 'package:flutter_staggered_grid_view/src/staggered_tile.dart';

/// A scrollable, 2D array of widgets with variable sizes.
///
/// The main axis direction of a grid is the direction in which it scrolls (the
/// [scrollDirection]).
///
/// The most commonly used grid layouts are [StaggeredGridView.count], which
/// creates a layout with a fixed number of tiles in the cross axis, and
/// [StaggeredGridView.extent], which creates a layout with tiles that have a maximum
/// cross-axis extent. A custom [SliverStaggeredGridDelegate] can produce an
/// arbitrary 2D
/// arrangement of children, including arrangements that are unaligned or
/// overlapping.
///
/// To create a grid with a large (or infinite) number of children, use the
/// [StaggeredGridView.builder] constructor with either a
/// [SliverStaggeredGridDelegateWithFixedCrossAxisCount] or a
/// [SliverStaggeredGridDelegateWithMaxCrossAxisExtent] for the [gridDelegate].
///
/// To use a custom [SliverChildDelegate], use [StaggeredGridView.custom].
///
/// To create a linear array of children, use a [ListView].
///
/// To control the initial scroll offset of the scroll view, provide a
/// [controller] with its [ScrollController.initialScrollOffset] property set.
///
/// ### Sample code
///
/// Here are two brief snippets showing a [StaggeredGridView]
///
/// ```dart
/// new StaggeredGridView.count(
///   primary: false,
///   padding: const EdgeInsets.all(20.0),
///   crossAxisSpacing: 10.0,
///   crossAxisCount: 4,
///   children: <Widget>[
///     const Text('He\'d have you all unravel at the'),
///     const Text('Heed not the rabble'),
///     const Text('Sound of screams but the'),
///     const Text('Who scream'),
///     const Text('Revolution is coming...'),
///     const Text('Revolution, they...'),
///   ],
///   staggeredTiles: const <StaggeredTile>[
///     const StaggeredTile.count(2,2),
///     const StaggeredTile.count(2,1),
///     const StaggeredTile.count(1,1),
///     const StaggeredTile.count(3,2),
///     const StaggeredTile.count(2,2),
///     const StaggeredTile.count(2,3),
///     ],
/// )
/// ```
///
/// See also:
///
///  * [SingleChildScrollView], which is a scrollable widget that has a single
///    child.
///  * [ListView], which is scrollable, linear list of widgets.
///  * [PageView], which is a scrolling list of child widgets that are each the
///    size of the viewport.
///  * [CustomScrollView], which is a scrollable widget that creates custom
///    scroll effects using slivers.
///  * [SliverStaggeredGridDelegateWithFixedCrossAxisCount], which creates a
///    layout with a fixed number of tiles in the cross axis.
///  * [SliverStaggeredGridDelegateWithMaxCrossAxisExtent], which creates a
///    layout with tiles that have a maximum cross-axis extent.
///  * [ScrollNotification] and [NotificationListener], which can be used to watch
///    the scroll position without using a [ScrollController].
class StaggeredGridView extends BoxScrollView {
  /// Creates a scrollable, 2D array of widgets with a custom
  /// [SliverStaggeredGridDelegate].
  ///
  /// The [gridDelegate] argument must not be null.
  ///
  /// The `addAutomaticKeepAlives` argument corresponds to the
  /// [SliverChildListDelegate.addAutomaticKeepAlives] property. The
  /// `addRepaintBoundaries` argument corresponds to the
  /// [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
  /// null.
  StaggeredGridView({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
    List<Widget> children: const <Widget>[],
  })
      : assert(gridDelegate != null),
        childrenDelegate = new SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// Creates a scrollable, 2D array of widgets that are created on demand.
  ///
  /// This constructor is appropriate for grid views with a large (or infinite)
  /// number of children because the builder is called only for those children
  /// that are actually visible.
  ///
  /// Providing a non-null [itemCount] improves the ability of the
  /// [SliverStaggeredGridDelegate] to estimate the maximum scroll extent.
  ///
  /// [itemBuilder] will be called only with indices greater than or equal to
  /// zero and less than [itemCount].
  ///
  /// The [gridDelegate] argument must not be null.
  ///
  /// The `addAutomaticKeepAlives` argument corresponds to the
  /// [SliverChildBuilderDelegate.addAutomaticKeepAlives] property. The
  /// `addRepaintBoundaries` argument corresponds to the
  /// [SliverChildBuilderDelegate.addRepaintBoundaries] property. Both must not
  /// be null.
  StaggeredGridView.builder({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    @required IndexedWidgetBuilder itemBuilder,
    int itemCount,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
  })
      : assert(gridDelegate != null),
        childrenDelegate = new SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// Creates a scrollable, 2D array of widgets with both a custom
  /// [SliverStaggeredGridDelegate] and a custom [SliverChildDelegate].
  ///
  /// To use an [IndexedWidgetBuilder] callback to build children, either use
  /// a [SliverChildBuilderDelegate] or use the
  /// [SliverStaggeredGridDelegate.builder] constructor.
  ///
  /// The [gridDelegate] and [childrenDelegate] arguments must not be null.
  StaggeredGridView.custom({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required this.gridDelegate,
    @required this.childrenDelegate,
  })
      : assert(gridDelegate != null),
        assert(childrenDelegate != null),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// Creates a scrollable, 2D array of widgets of variable sizes with a fixed
  /// number of tiles in the cross axis.
  ///
  /// Uses a [SliverStaggeredGridDelegateWithFixedCrossAxisCount] as the
  /// [gridDelegate].
  ///
  /// The `addAutomaticKeepAlives` argument corresponds to the
  /// [SliverChildListDelegate.addAutomaticKeepAlives] property. The
  /// `addRepaintBoundaries` argument corresponds to the
  /// [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
  /// null.
  ///
  /// See also:
  ///
  ///  * [new SliverGrid.count], the equivalent constructor for [SliverGrid].
  StaggeredGridView.count({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required int crossAxisCount,
    double mainAxisSpacing: 0.0,
    double crossAxisSpacing: 0.0,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
    List<Widget> children: const <Widget>[],
    List<StaggeredTile> staggeredTiles: const <StaggeredTile>[],
  })
      : gridDelegate = new SliverStaggeredGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          staggeredTileBuilder: (i) => _getIndexedStaggeredTile(i,
              staggeredTiles),
        ),
        childrenDelegate = new SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// Creates a scrollable, 2D array of widgets of variable sizes with a fixed
  /// number of tiles in the cross axis that are created on demand.
  ///
  /// This constructor is appropriate for grid views with a large (or infinite)
  /// number of children because the builder is called only for those children
  /// that are actually visible.
  ///
  /// Uses a [SliverStaggeredGridDelegateWithFixedCrossAxisCount] as the
  /// [gridDelegate].
  ///
  ///  Providing a non-null [itemCount] improves the ability of the
  /// [SliverStaggeredGridDelegate] to estimate the maximum scroll extent.
  ///
  /// [itemBuilder] and [staggeredTileBuilder] will be called only with
  /// indices greater than or equal to
  /// zero and less than [itemCount].
  ///
  /// The `addAutomaticKeepAlives` argument corresponds to the
  /// [SliverChildListDelegate.addAutomaticKeepAlives] property. The
  /// `addRepaintBoundaries` argument corresponds to the
  /// [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
  /// null.
  StaggeredGridView.countBuilder({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required int crossAxisCount,
    @required IndexedWidgetBuilder itemBuilder,
    @required IndexedStaggeredTileBuilder staggeredTileBuilder,
    int itemCount,
    double mainAxisSpacing: 0.0,
    double crossAxisSpacing: 0.0,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
  })
      : gridDelegate = new SliverStaggeredGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          staggeredTileBuilder: staggeredTileBuilder,
        ),
        childrenDelegate = new SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// Creates a scrollable, 2D array of widgets of variable sizes with tiles
  /// that  each have a maximum cross-axis extent.
  ///
  /// Uses a [SliverGridDelegateWithMaxCrossAxisExtent] as the [gridDelegate].
  ///
  ///  Providing a non-null [itemCount] improves the ability of the
  /// [SliverStaggeredGridDelegate] to estimate the maximum scroll extent.
  ///
  /// [itemBuilder] and [staggeredTileBuilder] will be called only with
  /// indices greater than or equal to
  /// zero and less than [itemCount].
  ///
  /// The `addAutomaticKeepAlives` argument corresponds to the
  /// [SliverChildListDelegate.addAutomaticKeepAlives] property. The
  /// `addRepaintBoundaries` argument corresponds to the
  /// [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
  /// null.
  ///
  /// See also:
  ///
  ///  * [new SliverGrid.extent], the equivalent constructor for [SliverGrid].
  StaggeredGridView.extent({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required double maxCrossAxisExtent,
    double mainAxisSpacing: 0.0,
    double crossAxisSpacing: 0.0,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
    List<Widget> children: const <Widget>[],
    List<StaggeredTile> staggeredTiles: const <StaggeredTile>[],
  })
      : gridDelegate = new SliverStaggeredGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: maxCrossAxisExtent,
          mainAxisSpacing: mainAxisSpacing,
          crossAxisSpacing: crossAxisSpacing,
          staggeredTileBuilder: (i) => _getIndexedStaggeredTile(i,
              staggeredTiles),
        ),
        childrenDelegate = new SliverChildListDelegate(
          children,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// Creates a scrollable, 2D array of widgets of variable sizes with tiles
  /// that  each have a maximum cross-axis extent that are created on demand.
  ///
  /// This constructor is appropriate for grid views with a large (or infinite)
  /// number of children because the builder is called only for those children
  /// that are actually visible.
  ///
  /// Uses a [SliverGridDelegateWithMaxCrossAxisExtent] as the [gridDelegate].
  ///
  /// The `addAutomaticKeepAlives` argument corresponds to the
  /// [SliverChildListDelegate.addAutomaticKeepAlives] property. The
  /// `addRepaintBoundaries` argument corresponds to the
  /// [SliverChildListDelegate.addRepaintBoundaries] property. Both must not be
  /// null.
  ///
  /// See also:
  ///
  ///  * [new SliverGrid.extent], the equivalent constructor for [SliverGrid].
  StaggeredGridView.extentBuilder({
    Key key,
    Axis scrollDirection: Axis.vertical,
    bool reverse: false,
    ScrollController controller,
    bool primary,
    ScrollPhysics physics,
    bool shrinkWrap: false,
    EdgeInsetsGeometry padding,
    @required double maxCrossAxisExtent,
    @required IndexedWidgetBuilder itemBuilder,
    @required IndexedStaggeredTileBuilder staggeredTileBuilder,
    int itemCount,
    double mainAxisSpacing: 0.0,
    double crossAxisSpacing: 0.0,
    bool addAutomaticKeepAlives: true,
    bool addRepaintBoundaries: true,
  })
      : gridDelegate = new SliverStaggeredGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: maxCrossAxisExtent,
            mainAxisSpacing: mainAxisSpacing,
            crossAxisSpacing: crossAxisSpacing,
            staggeredTileBuilder: staggeredTileBuilder),
        childrenDelegate = new SliverChildBuilderDelegate(
          itemBuilder,
          childCount: itemCount,
          addAutomaticKeepAlives: addAutomaticKeepAlives,
          addRepaintBoundaries: addRepaintBoundaries,
        ),
        super(
          key: key,
          scrollDirection: scrollDirection,
          reverse: reverse,
          controller: controller,
          primary: primary,
          physics: physics,
          shrinkWrap: shrinkWrap,
          padding: padding,
        );

  /// A delegate that controls the layout of the children within the
  /// [StaggeredGridView].
  ///
  /// The [StaggeredGridView] and [StaggeredGridView.custom] constructors let you specify this
  /// delegate explicitly. The other constructors create a [gridDelegate]
  /// implicitly.
  final SliverStaggeredGridDelegate gridDelegate;

  /// A delegate that provides the children for the [StaggeredGridView].
  ///
  /// The [StaggeredGridView.custom] constructor lets you specify this delegate
  /// explicitly. The other constructors create a [childrenDelegate] that wraps
  /// the given child list.
  final SliverChildDelegate childrenDelegate;

  @override
  Widget buildChildLayout(BuildContext context) {
    return new SliverGrid(
      delegate: childrenDelegate,
      gridDelegate: gridDelegate,
    );
  }
}

StaggeredTile _getIndexedStaggeredTile(int index, List<StaggeredTile> tiles){
  if (index < 0 || index >= tiles.length)
    return null;
  else
    return tiles[index];
}
