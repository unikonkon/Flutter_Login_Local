// ignore_for_file: public_member_api_docs, sort_constructors_first
// ignore_for_file: void_checks

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/Page/Login_Page.dart';
import 'package:flutter_login/Page/bloc/user_bloc.dart';
import 'package:flutter_login/Page/cubit/user_cubit.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserBloc, UserState>(
      builder: (context, state) {
        final user = state.fullName;
        final email = state.email;
        final birthDate = state.birthDate;
        final telephone = state.telephone;

        print(user);
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              'MainPage',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            backgroundColor: const Color.fromARGB(255, 172, 170, 170),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 20.w, top: 10.h),
                child: Container(
                  margin: EdgeInsets.only(top: 5),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 117, 41, 41),
                      fixedSize: Size(120.w, 30.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    onPressed: () {
                      // context.read<UserCubit>().none();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: const Text("Logout"),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: Image.asset('assets/images/user.png')),
                      const SizedBox(height: 20),
                      Text('Name : $user'),
                      const SizedBox(height: 10),
                      Text('Email : $email'),
                      const SizedBox(height: 10),
                      Text('BirthDate : $birthDate'),
                      const SizedBox(height: 10),
                      Text('Telephone : $telephone'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
