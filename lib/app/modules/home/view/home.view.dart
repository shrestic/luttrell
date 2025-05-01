import 'package:flutter/material.dart';
import 'package:luttrell/app/modules/authentication/authentication_bloc/authentication_bloc.dart';
import 'package:luttrell/app/modules/home/bloc/home_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:luttrell/app/utils/utils.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(title: const Text('HomeView'), centerTitle: true),
            body: Center(child: Text(context.loc.appTitle, style: const TextStyle(fontSize: 20))),
            drawer: Drawer(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(decoration: BoxDecoration(color: Colors.blue), child: Text('Menu')),
                  ListTile(
                    title: const Text('Sign out'),
                    onTap: () {
                      context.read<AuthenticationBloc>().add(AuthenticationLogOutRequested());
                      context.pop();
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
