import 'package:example/tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredGridViewCountPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body:  new StaggeredGridView.countBuilder(
          crossAxisCount: 3,
          crossAxisSpacing: 4.0,
          mainAxisSpacing: 4.0,
          itemCount: 30,
          itemBuilder: _getChild,
          staggeredTileBuilder: _getTile),
    );
  }

  StaggeredTile _getTile(int index){
    return new StaggeredTile.ratio(1, (index == 1)  ? 3 : 2);
  }

  TileWidget _getChild(BuildContext context, int index){
    return new TileWidget(
        key: new ObjectKey(index),
        index: index,
        backgroundColor: Colors.green);
  }
}
