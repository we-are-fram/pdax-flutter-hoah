import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../resources/colors.dart';

class SkeletonWidget extends StatelessWidget {
  const SkeletonWidget({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      period: const Duration(milliseconds: 1000),
      baseColor: FakerColors.shimmer,
      highlightColor: Colors.white,
      enabled: true,
      child: child,
    );
  }
}
