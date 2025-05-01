import 'package:luttrell/app/modules/authentication/login/view/login.view.dart';
import 'package:luttrell/app/modules/home/view/home.view.dart';
import 'package:go_router/go_router.dart';

part 'app_pages.dart';

class AppRoutes {
  static const initial = AppPages.HOME;
  GoRouter get router => _router;
  final _router = GoRouter(
    routes: [
      GoRoute(path: AppPages.HOME, builder: (context, state) => const HomeView()),
      GoRoute(path: AppPages.LOGIN, builder: (context, state) => LoginView()),
    ],
    routerNeglect: true,
  );
}
