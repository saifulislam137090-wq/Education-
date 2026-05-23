import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'screens/home_screen.dart';
import 'theme/x_colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: XColors.background,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: XColors.background,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const XRayApp());
}

class XRayApp extends StatelessWidget {
  const XRayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'X-Ray',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: XColors.background,
        fontFamily: 'sans-serif',
        splashFactory: NoSplash.splashFactory,
        highlightColor: Colors.transparent,
      ),
      home: const HomeScreen(),
    );
  }
}
