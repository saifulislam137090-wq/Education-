import 'package:flutter/material.dart';
import '../theme/x_colors.dart';
import 'grok_spark_icon.dart';

class IdleStateBody extends StatelessWidget {
  const IdleStateBody({super.key, required this.onSearch});

  final ValueChanged<String> onSearch;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Search input field
        Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
          child: GestureDetector(
            onTap: () => _showSearchDialog(context),
            child: Container(
              height: 44.0,
              decoration: BoxDecoration(
                color: XColors.cardFill,
                borderRadius: BorderRadius.circular(22.0),
                border: Border.all(color: XColors.border, width: 0.5),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: const Row(
                children: [
                  Icon(Icons.search, color: XColors.secondaryText, size: 20.0),
                  SizedBox(width: 10.0),
                  Expanded(
                    child: Text(
                      'Search Grok for unfiltered truth...',
                      style: TextStyle(
                        color: XColors.secondaryText,
                        fontSize: 15.0,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Center content
        const Expanded(
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GrokSparkIcon(
                    size: 64.0,
                    color: Color(0xFF9CA3AF),
                  ),
                  SizedBox(height: 24.0),
                  Text(
                    'Cut through the noise',
                    style: TextStyle(
                      color: XColors.primaryText,
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 12.0),
                  Text(
                    'Share a post from X or search below to instantly reveal '
                    'the unfiltered truth verified by Grok AI.',
                    style: TextStyle(
                      color: XColors.secondaryText,
                      fontSize: 14.0,
                      height: 1.4,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showSearchDialog(BuildContext context) {
    final controller = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: XColors.cardFill,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
          side: const BorderSide(color: XColors.border),
        ),
        title: const Text(
          'Search Grok',
          style: TextStyle(color: XColors.primaryText, fontSize: 18.0),
        ),
        content: TextField(
          controller: controller,
          autofocus: true,
          style: const TextStyle(color: XColors.primaryText),
          cursorColor: XColors.activeBlue,
          decoration: const InputDecoration(
            hintText: 'Enter search query...',
            hintStyle: TextStyle(color: XColors.secondaryText),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: XColors.border),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: XColors.activeBlue),
            ),
          ),
          onSubmitted: (value) {
            if (value.trim().isNotEmpty) {
              Navigator.of(ctx).pop();
              onSearch(value.trim());
            }
          },
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(ctx).pop(),
            child: const Text(
              'Cancel',
              style: TextStyle(color: XColors.secondaryText),
            ),
          ),
          TextButton(
            onPressed: () {
              final value = controller.text.trim();
              if (value.isNotEmpty) {
                Navigator.of(ctx).pop();
                onSearch(value);
              }
            },
            child: const Text(
              'Search',
              style: TextStyle(color: XColors.activeBlue),
            ),
          ),
        ],
      ),
    );
  }
}
