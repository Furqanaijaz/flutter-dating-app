import 'package:dartz/dartz.dart';
import 'package:dating_app/core/button/bloc/button_cubit.dart';
import 'package:dating_app/core/button/bloc/button_state.dart';
import 'package:dating_app/features/auth/data/model/user_creation_req.dart';
import 'package:dating_app/features/auth/data/model/user_signin_req.dart';
import 'package:dating_app/features/auth/domain/usecase/signin_usecase.dart';
import 'package:dating_app/features/auth/domain/usecase/signup_usescase.dart';
import 'package:dating_app/features/auth/presentation/page/signup_page.dart';
import 'package:dating_app/features/auth/presentation/page/widget/custom_textfield.dart';
import 'package:dating_app/features/auth/presentation/page/widget/primary_button.dart';
import 'package:dating_app/features/home/presentation/page/home_page.dart';
import 'package:dating_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SigninPage extends StatelessWidget {
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            CustomTextField(
              controller: emailCtrl,
              hintText: "Email",
              icon: Icons.email,
            ),
            SizedBox(height: 20),
            CustomTextField(
              controller: passCtrl,
              isPassword: true,
              hintText: "Password",
              icon: Icons.password,
            ),

            SizedBox(height: 70),
            PrimaryButton(
              text: "SignUp",
              onPressed: () async {
                Either result = await sl<SigninUsecase>().call(
                  UserSigninReq(email: emailCtrl.text, password: passCtrl.text),
                );
                result.fold(
                  (error) {
                    print(error + "Login Failed");
                  },
                  (data) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                );
              },
            ),
            Row(
              children: [
                Text("Don't Have an Account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUpPage()),
                    );
                  },
                  child: Text("SignUP"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
