import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:token/core/config/network/dio_settings.dart';
import 'package:token/data/repositories/auth_repositroy.dart';
import 'package:token/presentation/cubuits/cubit/confirm_code_cubit.dart';
import 'package:token/presentation/cubuits/registr_cubit/registr_cubit.dart';
import 'package:token/presentation/screens/registr_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepositroy(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => RegistrCubit(
                repositroy: RepositoryProvider.of<AuthRepositroy>(context)),
          ),
          BlocProvider(
            create: (context) => ConfirmCodeCubit(
                repositroy: RepositoryProvider.of<AuthRepositroy>(context)),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
              backgroundColor: Colors.red,
            ),
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const RegistrScreen(),
        ),
      ),
    );
  }
}
