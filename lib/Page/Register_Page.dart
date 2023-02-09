import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/Page/Login_Page.dart';
import 'package:flutter_login/Page/bloc/user_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController fullName = TextEditingController();
  TextEditingController birthDate = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController telephone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        void _onAdd(
          String name,
          String password,
          String confirmPassword,
          String fullName,
          String birthDate,
          String email,
          String telephone,
        ) {
          context.read<UserBloc>().add(
                OnAddData(
                    name: name,
                    password: password,
                    confirmPassword: confirmPassword,
                    fullName: fullName,
                    birthDate: birthDate,
                    email: email,
                    telephone: telephone),
              );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginPage(),
            ),
          );
        }

        return Expanded(
          child: Scaffold(
            body: Form(
              key: _formKey,
              child: Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 40.h,
                    ),
                    TextFormField(
                      // obscureText: true,
                      controller: username,
                      decoration: const InputDecoration(
                        hintText: "username *",
                      ),
                      validator: (username) {
                        if (username == null || username.isEmpty) {
                          return "Username is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      obscureText: true,
                      controller: password,
                      decoration: const InputDecoration(
                        hintText: "Password *",
                      ),
                      validator: (password) {
                        if (password == null || password.isEmpty) {
                          return "Password is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                        obscureText: true,
                        controller: confirmPassword,
                        decoration: const InputDecoration(
                          hintText: "Confirm Password *",
                        ),
                        validator: (confirmPassword) {
                          if (confirmPassword == null ||
                              confirmPassword.isEmpty) {
                            return "Confirm Password is required";
                          }
                          if (confirmPassword != password.text) {
                            return "Password does not match";
                          }

                          return null;
                        }),
                    TextFormField(
                      controller: fullName,
                      decoration: const InputDecoration(
                        hintText: "Full Name *",
                      ),
                      validator: (fullName) {
                        if (fullName == null || fullName.isEmpty) {
                          return "FullName is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: birthDate,
                      decoration: const InputDecoration(
                        hintText: "Birth Date *",
                      ),
                      validator: (birthDate) {
                        if (birthDate == null || birthDate.isEmpty) {
                          return "BirthDate is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        hintText: "Email *",
                      ),
                      validator: (email) {
                        if (email == null || email.isEmpty) {
                          return "Email is required";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: 'Telephone'),
                      validator: (telephone) {
                        if (telephone == null || telephone.isEmpty) {
                          return 'Telephone is required';
                        }
                        if (telephone.length != 10) {
                          return 'Telephone must have length 10';
                        }
                        return null;
                      },
                      controller: telephone,
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 42, 131, 88),
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
                              _onAdd(
                                username.text,
                                password.text,
                                confirmPassword.text,
                                fullName.text,
                                birthDate.text,
                                email.text,
                                telephone.text,
                              );
                            }
                          },
                          child: const Text("Confirm"),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color.fromARGB(255, 42, 93, 131),
                            fixedSize: Size(120.w, 30.h),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage(),
                              ),
                            );
                          },
                          child: const Text("Back"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
