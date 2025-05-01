import 'package:flutter/material.dart';
import 'package:luttrell/app/data/repositories/authentication_repository.dart';
import 'package:luttrell/app/modules/authentication/authentication_bloc/authentication_bloc.dart';
import 'package:luttrell/app/modules/root/root.view.dart';
import 'package:luttrell/app/routes/app_routes.dart';
import 'package:luttrell/app/settings/keys.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'app/app_bloc_observer.dart';
import 'app/di/injection.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = AppBlocObserver();
  configureDependencies();
  await Hive.initFlutter();
  await Hive.openBox(AppStorageKey.BOX);
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AuthenticationRepository>(
          create: (context) => GetIt.I.get<AuthenticationRepository>(),
        ),
        RepositoryProvider<AppRoutes>(create: (context) => AppRoutes()),
      ],
      child: BlocProvider(
        create: (context) => AuthenticationBloc(
          context.read<AuthenticationRepository>(),
        )..add(AuthenticationStarted()),
        child: const RootView(),
      ),
    );
  }
}
