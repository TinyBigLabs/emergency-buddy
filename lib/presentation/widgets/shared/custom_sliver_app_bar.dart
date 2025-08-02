import 'package:emergency_buddy/core/utils/constants.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CustomSliverAppBar extends SliverPersistentHeaderDelegate {
  final String title;
  final Widget content;

  CustomSliverAppBar({
    required this.title,
    required this.content,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / maxExtent;
    final isCollapsed = progress >= 0.8;
    final statusBarHeight = MediaQuery.of(context).padding.top;

    return Container(
      color: Theme.of(context).colorScheme.inversePrimary,
      child: Stack(
        children: [
          // Header title - always visible
          Positioned(
            top: statusBarHeight + 8,
            left: UIConstants.mediumSize,
            right: UIConstants.mediumSize,
            child: Center(
              child: Text(
                title,
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top + 60,
            left: UIConstants.mediumSize,
            right: UIConstants.mediumSize,
            child: AnimatedOpacity(
              opacity: isCollapsed ? 0.0 : 1.0 - progress,
              duration: const Duration(milliseconds: 150),
              child: content,
            ),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => kIsWeb ? 200.0 : 300.0; // Full height when expanded

  @override
  double get minExtent => kIsWeb ? 80.0 : 150.0;

  @override
  bool shouldRebuild(CustomSliverAppBar oldDelegate) {
    return title != oldDelegate.title || content != oldDelegate.content;
  }
}
