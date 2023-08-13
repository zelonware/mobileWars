import 'package:blocform/bloc/login_bloc.dart';
import 'package:blocform/bloc/provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [background(context), formDecoration(), loginForm(context)],
      ),
    );
  }

  Widget loginForm(BuildContext context) {
    final bloc = Provider.loginBloc(context);
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea(
              child: Container(
            height: 170,
          )),
          Container(
            width: size.width * 0.85,
            margin: const EdgeInsets.symmetric(vertical: 30),
            padding: const EdgeInsets.symmetric(vertical: 50),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                boxShadow: const [
                  BoxShadow(
                      color: Colors.black, blurRadius: 3, offset: Offset(0, 5)),
                ]),
            child: Column(
              children: [
                const Text('Welcome!'),
                const SizedBox(
                  height: 40,
                ),
                _emailField(bloc),
                const SizedBox(
                  height: 30,
                ),
                _passwordField(bloc),
                const SizedBox(
                  height: 30,
                ),
                _loginButton(),
                const SizedBox(
                  height: 20,
                ),
                // forgotPasswordAction()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _emailField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.emailStream,
        builder: (context, snapshot) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.alternate_email,
                      color: Colors.purple,
                    ),
                    hintText: 'example@mail.com',
                    labelText: 'Your email'),
                onChanged: bloc.changeEmail,
              ));
        });
  }

  Widget _passwordField(LoginBloc bloc) {
    return StreamBuilder(
        stream: bloc.passwordStream,
        builder: (context, snapshot) {
          return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onChanged: bloc.changeEmail,
                obscureText: true,
                decoration: const InputDecoration(
                    icon: Icon(
                      Icons.lock,
                      color: Colors.purple,
                    ),
                    hintText: 'your.safe.password',
                    labelText: 'Your password'),
              ));
        });
  }

  Widget _loginButton() {
    return ElevatedButton(
      onPressed: () {},
      style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll(Colors.purple)),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
        child: const Text(
          'Come in!',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Container formDecoration() {
    return Container(
      padding: const EdgeInsets.only(top: 80),
      child: const Column(
        children: [
          Icon(
            Icons.person_pin_circle,
            color: Colors.white,
            size: 100,
          ),
          SizedBox(
            width: double.infinity,
          ),
          Text(
            'My awesome app',
            style: TextStyle(color: Colors.white, fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget background(context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
    );
  }
}
