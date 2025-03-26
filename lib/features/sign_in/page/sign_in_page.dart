import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SignUpForm()),
      ],
    );
  }
}

class SignUpForm extends StatefulWidget {

  SignUpForm({super.key});

  @override
  State<StatefulWidget> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: Colors.black,
        gradient: RadialGradient(
          center: Alignment(0,1.8),
          radius: 0.7,
          colors: [
            Colors.deepOrange,
            Colors.black,
          ],
        ),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              'assets/image/logo.png',
              height: 60,
            ),
            SizedBox(height: 10),
            Text(
              'Where Artificial Intelligence Meets Clinical Excellence',
              style: TextStyle(
                color: Colors.white60,
                fontSize: 18,
                fontFamily: AppStyle.fontFamily2,
              ),
            ),
            SizedBox(height: 45),
            ShadForm(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 350),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ShadInputFormField(
                      id: 'email',
                      label: const Text('Email'),
                      placeholder: const Text('Enter your Email'),
                      description: const Text('The email of your account'),
                    ),
                    const SizedBox(height: 10),
                    ShadInputFormField(
                      placeholder: const Text('Password'),
                      label: const Text('Password'),
                      obscureText: obscure,
                      leading: const Padding(
                        padding: EdgeInsets.all(2.0),
                        child: Icon(LucideIcons.lock, size: 20,),
                      ),
                      trailing: ShadButton(
                        width: 24,
                        height: 24,
                        padding: EdgeInsets.zero,
                        decoration: const ShadDecoration(
                          color: Colors.transparent,
                          secondaryBorder: ShadBorder.none,
                          secondaryFocusedBorder: ShadBorder.none,
                        ),
                        icon: Icon(obscure ? LucideIcons.eyeOff : LucideIcons.eye,),
                        onPressed: () {
                          setState(() => obscure = !obscure);
                        },
                      ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.deepOrangeAccent,
                              side: const BorderSide(color: Colors.deepOrangeAccent),
                            ),
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: (){},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: Colors.deepOrangeAccent,
                              side: const BorderSide(color: Colors.deepOrangeAccent),
                            ),
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              spacing: 10,
                              children: [
                                Image.asset(
                                  'assets/image/google.png',
                                  height: 15,
                                ),
                                Text(
                                  'Sign In With Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      spacing: 5,
                      children: [
                        Text(
                          'Don\'t have an account?',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 14,
                            fontFamily: AppStyle.fontFamily2,
                          ),
                        ),
                        TextButton(
                          onPressed: (){},
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              color: Colors.deepOrangeAccent,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}