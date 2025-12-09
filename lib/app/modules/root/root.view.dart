import 'package:context_holder/context_holder.dart';
import 'package:luttrell/app/modules/authentication/authentication_bloc/authentication_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:luttrell/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import '../../routes/app_routes.dart';

class RootView extends StatelessWidget {
  const RootView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      key: ContextHolder.key,
      routerConfig: context.read<AppRoutes>().router,
      builder: (context, child) {
        child = EasyLoading.init()(context, child);
        child = MediaQuery(
          data: MediaQuery.of(context)
              .copyWith(textScaler: TextScaler.linear(1.0)),
          child: BlocListener<AuthenticationBloc, AuthenticationState>(
            listener: (context, state) {
              if (state is AuthenticationAuthenticated) {
                context.read<AppRoutes>().router.go(AppPages.HOME);
              }
              if (state is AuthenticationNotAuthenticated) {
                context.read<AppRoutes>().router.go(AppPages.LOGIN);
              }
            },
            child: child,
          ),
        );

        return child;
      },
      title: 'Application',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
    );
  }
}
