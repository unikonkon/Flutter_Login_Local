import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/Page/Main_Page.dart';
import 'package:flutter_login/Page/Register_Page.dart';
import 'package:flutter_login/Page/bloc/user_bloc.dart';
import 'package:flutter_login/Page/cubit/user_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        void _onChak(String username, String password) {
          if (state.name == username &&
              state.password == password &&
              state.name.isNotEmpty &&
              state.password.isNotEmpty) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainPage(),
              ),
            );
            // context.read<UserCubit>().enabled();
          }
        }

        return Scaffold(
          body: Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                  child: Image.asset('assets/images/user.png'),
                  width: 100.w,
                  height: 100.h),
              Form(
                key: _formKey,
                child: Padding(
                  padding: EdgeInsets.only(left: 15.w, right: 15.w),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 10),
                        child: TextFormField(
                          controller: username,
                          decoration: const InputDecoration(
                            hintText: "Username",
                          ),
                          validator: (username) {
                            if (username == null || username.isEmpty) {
                              return "Username is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextFormField(
                          obscureText: true,
                          controller: password,
                          decoration: const InputDecoration(
                            hintText: "Password",
                          ),
                          validator: (password) {
                            if (password == null || password.isEmpty) {
                              return "password is required";
                            }
                            return null;
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: TextButton(
                          child: const Text(
                            "Register",
                            style: TextStyle(
                              color: Colors.green,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RegisterPage(),
                              ),
                            );
                          },
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 42, 92, 131),
                            fixedSize: Size(120.w, 30.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Processing Data')),
                              );
                              _onChak(username.text, password.text);
                            }

                            // SharedPreferences prefs = await SharedPreferences.getInstance();
                            // prefs.setString(
                            //     "user",
                            //     jsonEncode({
                            //       "username": username.text,
                            //       "password": password.text,
                            //     }));
                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) => MainPage(),
                            //   ),
                            // );
                          },
                          child: const Text("Login"),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
