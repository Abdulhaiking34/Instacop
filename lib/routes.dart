import 'package:instacop/src/Views/sign_in_view.dart';
import 'package:instacop/src/Views/splash_view.dart';
import 'package:instacop/src/Views/welcome_view.dart';

const initialRoute = "splash_screen";

var routes = {
  'splash_screen': (content) => SplashView(),
  'welcome_screen': (content) => WelcomeScreen(),
  'sign_in_screen': (content) => SignInView(),
};
