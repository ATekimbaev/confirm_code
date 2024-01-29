import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:token/data/models/registr_model.dart';
import 'package:token/presentation/cubuits/registr_cubit/registr_cubit.dart';
import 'package:token/presentation/screens/confirm_screen.dart';
import 'package:token/presentation/widgets/custom_button.dart';
import 'package:token/presentation/widgets/custom_text_filed.dart';

class RegistrScreen extends StatefulWidget {
  const RegistrScreen({super.key});

  @override
  State<RegistrScreen> createState() => _RegistrScreenState();
}

class _RegistrScreenState extends State<RegistrScreen> {
  final TextEditingController userName = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registr'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            CustomTextField(
              controller: userName,
              hintText: 'Login',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              controller: email,
              hintText: 'Email',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              obscureText: true,
              controller: password,
              hintText: 'Password',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomTextField(
              onChanged: (val) {
                setState(() {});
              },
              obscureText: true,
              controller: confirmPassword,
              hintText: 'Confirm Password',
            ),
            const SizedBox(
              height: 20,
            ),
            CustomButton(
              onPressed: confirmPassword.text != password.text
                  ? null
                  : () {
                      BlocProvider.of<RegistrCubit>(context).registr(
                        model: RegitsrModel(
                            email: email.text,
                            password: password.text,
                            username: userName.text,
                            passwordConfirm: confirmPassword.text),
                      );
                    },
              text: BlocConsumer<RegistrCubit, RegistrState>(
                listener: (context, state) {
                  if (state is RegistrSuccess) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ConfirmCodeScreen(),
                      ),
                    );
                  } else if (state is RegistrError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.errorText),
                      ),
                    );
                  }
                },
                builder: (context, state) {
                  if (state is RegistrLoading) {
                    return const CircularProgressIndicator();
                  }

                  return const Text(
                    'Registr',
                    style: TextStyle(
                      fontSize: 24,
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
