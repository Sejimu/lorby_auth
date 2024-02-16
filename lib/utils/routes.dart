import '../screens/splash_screen.dart';
import '../screens/confirm_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/register_screen.dart';

var routes = {
  "/": (context) => const SplashScreen(),
  "/login": (context) => const LogInScreen(),
  "/home": (context) => const HomeScreen(),
  "/register": (context) => const RegisterScreen(),
  "/confirm": (context) => const ConfirmScreen(),
};
