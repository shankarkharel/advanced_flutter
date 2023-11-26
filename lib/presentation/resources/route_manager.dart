import 'package:flutter/material.dart';

import '../details/details_view.dart';
import '../forgetpassword/forget_password_view.dart';
import '../login/login_view.dart';
import '../main/main_view.dart';
import '../onboarding/on_boarding_view.dart';
import '../signup/register_view.dart';
import '../splash/splash_view.dart';
import 'color_manager.dart';
import 'font_style_manager.dart';
import 'string_manager.dart';
import 'values_manager.dart';

class Routes {
  static const String splashRoute = '/';
  static const String onBoardinghRoute = '/onBoarding';

  static const String loginRoute = '/login';

  static const String registerRoute = '/register';
  static const String detailsRoute = '/details';
  static const String mainRoute = '/main';
  static const String forgetPasswordRoute = '/forgetPassword';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardinghRoute:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.registerRoute:
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.mainRoute:
        return MaterialPageRoute(builder: (_) => const MainView());
      case Routes.detailsRoute:
        return MaterialPageRoute(builder: (_) => const DetailsView());
      case Routes.forgetPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordView());
      default:
        return MaterialPageRoute(builder: (_) => const DefaultRoute());
    }
  }
}

class DefaultRoute extends StatelessWidget {
  const DefaultRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          AppStrings.noRouteDefined,
          style:
              getSemiBold(fontColor: ColorManager.red, fontSize: AppSize.s14),
        ),
      ),
    );
  }
}
