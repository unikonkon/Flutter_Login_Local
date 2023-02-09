import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_login/Page/Login_Page.dart';
import 'package:flutter_login/Page/Main_Page.dart';
import 'package:flutter_login/Page/Register_Page.dart';
import 'package:flutter_login/Page/bloc/user_bloc.dart';
import 'package:flutter_login/Page/cubit/user_cubit.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserBloc()),
        BlocProvider(create: (_) => UserCubit())
      ],
      child: const AppView(),
    );
  }
}

class AppView extends StatefulWidget {
  const AppView({super.key});

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(428, 926),
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              // backgroundColor: Color.fromARGB(255, 224, 228, 229),
              scaffoldBackgroundColor: Color.fromARGB(255, 224, 228, 229),
            ),
            home: BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                final value = context.select((UserCubit cubit) => cubit.state);
                if (state.name.isNotEmpty && state.password.isNotEmpty) {
                  return const MainPage();
                } else {
                  return const LoginPage();
                }
              },
            ),
          );
        });
  }
}
