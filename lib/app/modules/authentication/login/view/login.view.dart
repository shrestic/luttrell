import 'package:flutter/material.dart';
import 'package:luttrell/app/data/repositories/authentication_repository.dart';
import 'package:luttrell/app/modules/authentication/authentication_bloc/authentication_bloc.dart';
import 'package:luttrell/app/modules/authentication/login/bloc/login_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoginView extends StatelessWidget {
  LoginView({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController userController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(context.read<AuthenticationRepository>()),
      child: BlocConsumer<LoginBloc, LoginState>(
        builder: (context, state) {
          return Scaffold(
            body: Form(
              key: _formKey,
              child: Align(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const Center(
                              child: Text("Login",
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold))),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: userController,
                            decoration: InputDecoration(
                              hintText: "Username",
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            keyboardType: TextInputType.emailAddress,
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: "Password",
                              isDense: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                            keyboardType: TextInputType.visiblePassword,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: ElevatedButton(
                                  onPressed: () => login(context),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 40),
                                  ),
                                  child: const Text("Login",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                            ],
                          ),
                        ]),
                  ),
                ),
              ),
            ),
            backgroundColor: Colors.blueGrey[200],
          );
        },
        listener: (context, state) {
          if (state is LoginLoading) {
            EasyLoading.show();
          }
          if (state is LoginSuccess) {
            context.read<AuthenticationBloc>().add(AuthenticationUserChanged(
                  user: state.user,
                  accessToken: state.accessToken,
                  refreshToken: state.refreshToken,
                ));
            EasyLoading.dismiss();
          }
          if (state is LoginFailure) {
            EasyLoading.dismiss();
            EasyLoading.showError(state.error);
          }
        },
      ),
    );
  }

  void login(BuildContext context) {
    context.read<LoginBloc>().add(
          LoginInWithUsernameButtonPressed(
            user: userController.text,
            password: passwordController.text,
          ),
        );
  }
}
