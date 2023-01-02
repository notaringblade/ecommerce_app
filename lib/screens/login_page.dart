import 'package:ecommerce_app/bloc/login/login_bloc.dart';
import 'package:ecommerce_app/config/theme.dart';
import 'package:ecommerce_app/widgets/common/default_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginWidget extends StatelessWidget {
  const LoginWidget({
    Key? key,
    required this.username,
    required this.password,
    required this.onTap
  }) : super(key: key);

  final TextEditingController username;
  final TextEditingController password;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
    child: SizedBox(
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
        },
        child: Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 120,
        ),
        Center(
          child: Text(
            "Please Sign In To View Your Account Details",
            style: theme()
                .textTheme
                .displayMedium!
                .copyWith(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            DefaultInputField(
              sectionname: "username",
              controller: username,
            ),
            const SizedBox(
              height: 10,
            ),
            DefaultInputField(
              sectionname: "password",
              // username,
              secret: true,
              controller: password,
            ),
            const SizedBox(
              height: 20,
            ),
  
            InkWell(
              onTap: () {
                context.read<LoginBloc>().add(LoggingInEvent(username.text, password.text));
                onTap();
              },
              child: Container(
                // padding: EdgeInsets.all(8),
                width: 350,
                decoration: const BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(
                    Radius.circular(14),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: const Text("Login", textAlign: TextAlign.center, style: TextStyle(color: Colors.white, fontSize: 16),),
                ),
              ),
            )
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Not A Member?    ",
              style: theme().textTheme.bodyLarge!.copyWith(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            InkWell(
                onTap: () {},
                child: Text("Sign up",
                    style: theme().textTheme.bodyLarge!.copyWith(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold)))
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            OutlinedButton(
              onPressed: () {
                context.read<LoginBloc>().add(const LoggingInEvent("Google", "Login"));
                onTap();
              },
              style: OutlinedButton.styleFrom(side: const BorderSide(width: 2)),
              child: const FaIcon(FontAwesomeIcons.google, color: Colors.black,),
            ),
            OutlinedButton(
              onPressed: () {
                context.read<LoginBloc>().add(const LoggingInEvent("FaceBook", "Login"));
                onTap();
              },
              style: OutlinedButton.styleFrom(side: const BorderSide(width: 2)),
              child: const FaIcon(FontAwesomeIcons.facebook, color: Colors.black,),
            ),
          ],
        )
      ],
    ),
        ),
      ),
    ),
  );
  }
}