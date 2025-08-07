import 'package:dartz/dartz.dart';
import 'package:dating_app/core/button/bloc/button_cubit.dart';
import 'package:dating_app/core/button/bloc/button_state.dart';
import 'package:dating_app/features/auth/data/model/user_creation_req.dart';
import 'package:dating_app/features/auth/domain/usecase/signup_usescase.dart';
import 'package:dating_app/features/auth/presentation/page/signin_page.dart';
import 'package:dating_app/features/auth/presentation/page/widget/custom_textfield.dart';
import 'package:dating_app/features/auth/presentation/page/widget/primary_button.dart';
import 'package:dating_app/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends StatelessWidget {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController emailCtrl = TextEditingController();
  final TextEditingController passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Sign Up')),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: nameCtrl,
              hintText: "Full Name",
              icon: Icons.person,
            ),
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
                Either result = await sl<SignupUsescase>().call(
                  UserCreationReq(
                    fullName: nameCtrl.text,
                    email: emailCtrl.text,
                    password: passCtrl.text,
                  ),
                );
                result.fold(
                  (error) {
                    print(error + "SignUp Failed");
                  },
                  (data) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                );
              },
            ),
            Row(
              children: [
                Text("Already Have an Account?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SigninPage()),
                    );
                  },
                  child: Text("LogIn"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
