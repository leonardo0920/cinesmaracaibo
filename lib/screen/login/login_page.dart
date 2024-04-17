import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../../size_config.dart';
import 'controller/login_controller.dart';

class LoginPage extends StatefulWidget {
  static String routeName = "/login_page";

  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController _con = LoginController();

  @override
  void initState() {
    super.initState();

    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      _con.init(context, refresh);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Inicio de Sesion',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox.expand(
              child: DraggableScrollableSheet(
                initialChildSize: 1,
                minChildSize: 1,
                maxChildSize: 1,
                builder: (context, scrollController) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.grey[900],
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Container(
                        padding: const EdgeInsets.fromLTRB(50, 30, 50, 0),
                        child: Column(
                          children: [
                            SizedBox(
                              width: 280,
                              height: 280,
                              child: Image.asset(
                                'assets/image/Logo-removebg.png',
                              ),
                            ),
                            const Text(
                              '¡Bienvenido/a!',
                              style: TextStyle(
                                fontSize: 27,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(height: SizeConfig.screenHeight * 0.04),
                            loginForm(),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget loginForm() {
    return SizedBox(
      width: 300,
      child: Form(
        key: _con.formKey,
        child: Column(
          children: [
            buildEmailFormField(),
            const SizedBox(height: 15),
            buildPasswordFormField(),
            SizedBox(height: MediaQuery.of(context).size.height * 0.15),
            GestureDetector(
              onTap: () {
                _con.login();
              },
              child: Container(
                width: 180,
                height: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF006D85),
                ),
                child: const Center(
                  child: Text(
                    'Ingresar',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      onSaved: (newValue) => _con.email = newValue,
      controller: _con.emailController,
      decoration: const InputDecoration(
        labelText: "Usuario",
        labelStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "   Ex: user@user.com",
        hintStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      onSaved: (newValue) => _con.password = newValue,
      controller: _con.passwordController,
      decoration: const InputDecoration(
        labelText: "Contraseña",
        labelStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        hintText: "***************",
        hintStyle: TextStyle(
          fontSize: 13,
          color: Colors.white,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
      ),
      style: const TextStyle(
        color: Colors.white,
      ),
    );
  }

  void refresh() {
    setState(() {});
  }
}
