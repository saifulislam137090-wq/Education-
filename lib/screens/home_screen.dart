import 'package:flutter/material.dart';
import '../theme/x_colors.dart';
import '../widgets/idle_state_body.dart';
import '../widgets/search_result_body.dart';
import '../widgets/x_bottom_nav_bar.dart';
import '../widgets/x_top_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? _activeQuery;

  void _onSearch(String query) {
    setState(() => _activeQuery = query);
  }

  void _onClear() {
    setState(() => _activeQuery = null);
  }

  @override
  Widget build(BuildContext context) {
    final hasQuery = _activeQuery != null;

    return Scaffold(
      backgroundColor: XColors.background,
      appBar: const XTopAppBar(),
      body: AnimatedSwitcher(
        duration: const Duration(milliseconds: 300),
        switchInCurve: Curves.easeIn,
        switchOutCurve: Curves.easeOut,
        child: hasQuery
            ? SearchResultBody(
                key: ValueKey(_activeQuery),
                query: _activeQuery!,
                onClear: _onClear,
              )
            : IdleStateBody(
                key: const ValueKey('idle'),
                onSearch: _onSearch,
              ),
      ),
      bottomNavigationBar: const XBottomNavBar(),
    );
  }
}
