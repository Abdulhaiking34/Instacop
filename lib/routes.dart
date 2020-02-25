import 'package:instacop/src/Views/splash_view.dart';
import 'package:instacop/src/Views/welcome_view.dart';
import 'package:instacop/src/views/register/register_view.dart';

const initialRoute = "splash_screen";

var routes = {
  'splash_screen': (content) => SplashView(),
  'welcome_screen': (content) => WelcomeScreen(),
  'register_screen': (content) => RegisterView(),
};
