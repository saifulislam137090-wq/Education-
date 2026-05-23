import 'package:flutter/material.dart';
import '../theme/x_colors.dart';

class XTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const XTopAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(56.0);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: XColors.background,
        border: Border(
          bottom: BorderSide(color: XColors.border, width: 1.0),
        ),
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: 56.0,
          child: Row(
            children: [
              const SizedBox(width: 16.0),
              // Profile avatar placeholder
              Container(
                width: 32.0,
                height: 32.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: XColors.cardFill,
                  border: Border.all(color: XColors.border, width: 0.5),
                ),
                child: const Icon(
                  Icons.person,
                  color: XColors.secondaryText,
                  size: 18.0,
                ),
              ),
              const Expanded(
                child: Center(
                  child: Text(
                    'X-Ray',
                    style: TextStyle(
                      color: XColors.primaryText,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.2,
                    ),
                  ),
                ),
              ),
              const Icon(
                Icons.settings_outlined,
                color: XColors.primaryText,
                size: 24.0,
              ),
              const SizedBox(width: 16.0),
            ],
          ),
        ),
      ),
    );
  }
}
