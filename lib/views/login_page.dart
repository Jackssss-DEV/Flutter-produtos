// ignore_for_file: body_might_complete_normally_nullable

import 'package:dart_learning/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../store/login_store/form_store.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  FormStore formStore = FormStore();

  @override
  void initState() {
    super.initState();
    formStore.setupValidations();
  }

  @override
  void dispose() {
    formStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Seja bem-vindo!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 36,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Entre na sua conta',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Observer(
                        builder: (_) {
                          return TextFormField(
                            onChanged: (email) {
                              formStore.setEmail(email);
                            },
                            decoration: InputDecoration(
                              errorText: formStore.error.email,
                              hintText: 'E-mail',
                              filled: true,
                              fillColor: Colors.blueGrey[50],
                              labelStyle: TextStyle(fontSize: 12),
                              contentPadding: EdgeInsets.only(left: 30),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 207, 216, 220)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color.fromARGB(255, 207, 216, 220)),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          );
                        },
                      )),
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Observer(
                      builder: (_) {
                        return TextFormField(
                          onChanged: (password) {
                            formStore.setPassword(password);
                          },
                          decoration: InputDecoration(
                            errorText: formStore.error.password,
                            hintText: 'Senha',
                            suffixIcon: Icon(
                              Icons.visibility_off_outlined,
                              color: Colors.grey,
                            ),
                            filled: true,
                            fillColor: Colors.blueGrey[50],
                            labelStyle: TextStyle(fontSize: 12),
                            contentPadding: EdgeInsets.only(left: 30),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 207, 216, 220)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color.fromARGB(255, 207, 216, 220)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Observer(
                  builder: (_) {
                    return Container(
                      child: IconButton(
                        icon: Icon(Icons.done),
                        onPressed: () {
                          if (formStore.validateAll == true) {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) => (RegisterPage()),
                              ),
                            );
                          }
                        },
                      ),
                    );
                  },
                ),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Ainda não é um membro?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => (RegisterPage()),
                          ),
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Registre-se agora',
                          style: TextStyle(
                            color: Colors.deepOrange,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
