import 'package:cinemix_ui/core/res/theme/theme.dart';
import 'package:cinemix_ui/core/services/injection_container.dart';
import 'package:cinemix_ui/core/services/router.dart';
import 'package:cinemix_ui/src/authentication/presentation/views/welcome_screen.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the dependency injection container
  await init();

  await initializeDateFormatting().then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final navigatorKey = GlobalKey<NavigatorState>();

    return MaterialApp(
      title: 'Cinemix',
      debugShowCheckedModeBanner: false,
      theme: KAppTheme.theme,
      builder: FToastBuilder(),
      navigatorKey: navigatorKey,
      onGenerateRoute: generateRoute,
      initialRoute: WelcomeScreen.routeName,
    );
  }
}
