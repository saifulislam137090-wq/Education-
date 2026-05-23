import 'package:flutter/material.dart';
import '../theme/x_colors.dart';
import 'grok_spark_icon.dart';

class XBottomNavBar extends StatelessWidget {
  const XBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: XColors.background,
        border: Border(
          top: BorderSide(color: XColors.border, width: 1.0),
        ),
      ),
      child: SafeArea(
        top: false,
        child: SizedBox(
          height: 52.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Icon(
                Icons.home_filled,
                color: XColors.activeBlue,
                size: 26.0,
              ),
              const Icon(
                Icons.search,
                color: XColors.secondaryText,
                size: 26.0,
              ),
              GrokSparkIcon(
                size: 26.0,
                color: XColors.secondaryText,
              ),
              const Icon(
                Icons.notifications_outlined,
                color: XColors.secondaryText,
                size: 26.0,
              ),
              const Icon(
                Icons.bookmark_border,
                color: XColors.secondaryText,
                size: 26.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
