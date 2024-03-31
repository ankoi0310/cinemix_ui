import 'package:cinemix_ui/core/res/theme/theme.dart';
import 'package:cinemix_ui/core/services/injection_container.dart';
import 'package:cinemix_ui/core/services/router.dart';
import 'package:cinemix_ui/src/onboarding/presentation/views/onboarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the dependency injection container
  await init();

  await initializeDateFormatting().then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cinemix',
      debugShowCheckedModeBanner: false,
      theme: KAppTheme.light,
      darkTheme: KAppTheme.dark,
      onGenerateRoute: generateRoute,
      initialRoute: OnboardingScreen.routeName,
    );
  }
}
