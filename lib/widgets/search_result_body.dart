import 'package:flutter/material.dart';
import '../theme/x_colors.dart';
import 'grok_spark_icon.dart';

class SearchResultBody extends StatelessWidget {
  const SearchResultBody({
    super.key,
    required this.query,
    required this.onClear,
  });

  final String query;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Query display with clear button
          Row(
            children: [
              Expanded(
                child: Text(
                  'Results for "$query"',
                  style: const TextStyle(
                    color: XColors.secondaryText,
                    fontSize: 14.0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              GestureDetector(
                onTap: onClear,
                child: const Icon(
                  Icons.close,
                  color: XColors.secondaryText,
                  size: 20.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          // Verification container
          Container(
            decoration: BoxDecoration(
              color: XColors.cardFill,
              borderRadius: BorderRadius.circular(16.0),
              border: Border.all(color: XColors.border, width: 1.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header row
                Padding(
                  padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 12.0),
                  child: Row(
                    children: [
                      const GrokSparkIcon(
                        size: 18.0,
                        color: XColors.secondaryText,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'Verified by Grok',
                        style: TextStyle(
                          color: XColors.secondaryText,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(
                  color: XColors.border,
                  height: 1.0,
                  thickness: 0.5,
                ),
                // Bullet points
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: _BulletPoint(
                    text:
                        'Primary source verification confirms the original claim '
                        'is consistent with publicly available records and data.',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 0.0),
                  child: _BulletPoint(
                    text:
                        'Cross-referenced with three independent fact-checking '
                        'organizations, all of which corroborate the key details.',
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 16.0),
                  child: _BulletPoint(
                    text:
                        'No contradictory evidence found in recent reporting. '
                        'Timeline and attribution have been independently verified.',
                  ),
                ),
                // Image grid
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12.0),
                    child: SizedBox(
                      height: 200.0,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              decoration: BoxDecoration(
                                color: XColors.border,
                                borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12.0),
                                  bottomLeft: Radius.circular(12.0),
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.image_outlined,
                                  color: XColors.secondaryText,
                                  size: 36.0,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 2.0),
                          Expanded(
                            child: Column(
                              children: [
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: XColors.border,
                                      borderRadius: const BorderRadius.only(
                                        topRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_outlined,
                                        color: XColors.secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 2.0),
                                Expanded(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: XColors.border,
                                      borderRadius: const BorderRadius.only(
                                        bottomRight: Radius.circular(12.0),
                                      ),
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.image_outlined,
                                        color: XColors.secondaryText,
                                        size: 24.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
                // Trust indicator bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(2.0),
                        child: const LinearProgressIndicator(
                          value: 0.85,
                          minHeight: 3.0,
                          backgroundColor: XColors.border,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            XColors.activeBlue,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        'Grok Trust Score: High Credibility',
                        style: TextStyle(
                          color: XColors.secondaryText,
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _BulletPoint extends StatelessWidget {
  const _BulletPoint({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 6.0),
          child: Icon(
            Icons.circle,
            size: 6.0,
            color: XColors.secondaryText,
          ),
        ),
        const SizedBox(width: 10.0),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(
              color: XColors.primaryText,
              fontSize: 15.0,
              height: 1.45,
            ),
          ),
        ),
      ],
    );
  }
}
