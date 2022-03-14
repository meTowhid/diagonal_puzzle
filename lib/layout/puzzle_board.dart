import 'dart:math';

import 'package:flutter/material.dart';
import 'package:very_good_slide_puzzle/puzzle/puzzle.dart';

/// {@template simple_puzzle_board}
/// Display the board of the puzzle in a [size]x[size] layout
/// filled with [tiles]. Each tile is spaced with [spacing].
/// {@endtemplate}
@visibleForTesting
class SimplePuzzleBoard extends StatelessWidget {
  /// {@macro simple_puzzle_board}
  const SimplePuzzleBoard({
    Key? key,
    required this.size,
    required this.tiles,
    required this.tileSize,
    required this.spacing,
  }) : super(key: key);

  /// The size of the board.
  final int size;

  /// The tiles to be displayed on the board.
  final List<PuzzleTile> tiles;

  /// The spacing between each tile from [tiles].
  final double spacing;

  /// each tile size
  final double tileSize;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: pi / 4,
      child: Transform.scale(
        scale: .84,
        child: Stack(children: tiles.map(_buildAnimatedTile).toList()),
      ),
    );
  }

  AnimatedPositioned _buildAnimatedTile(PuzzleTile tile) {
    return AnimatedPositioned(
      key: Key('${tile.tile.value}'),
      duration: const Duration(milliseconds: 400),
      curve: Curves.easeInOutCirc,
      top: (tile.tile.currentPosition.y - 1) * (tileSize + spacing),
      left: (tile.tile.currentPosition.x - 1) * (tileSize + spacing),
      child: SizedBox.square(dimension: tileSize, child: tile),
    );
  }
}
