import 'package:eyescare/style/app_style.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: SignInForm()),
      ],
    );
  }
}

class SignInForm extends StatefulWidget {

  SignInForm({super.key});

  @override
  State<StatefulWidget> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
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
                '人工智能与临床卓越的结合',
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
                        label: const Text('邮箱'),
                        placeholder: const Text('输入邮箱地址'),
                        description: const Text('账户绑定的邮箱'),
                      ),
                      const SizedBox(height: 10),
                      ShadInputFormField(
                        placeholder: const Text('密码'),
                        label: const Text('密码'),
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
                              onPressed: (){
                                Navigator.pushNamed(context, '/studio');
                              },
                              style: OutlinedButton.styleFrom(
                                foregroundColor: Colors.deepOrangeAccent,
                                side: const BorderSide(color: Colors.deepOrangeAccent),
                              ),
                              child: Text(
                                '登录',
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
                                    '使用Google登录',
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
                            '还没有账户?',
                            style: TextStyle(
                              color: Colors.white60,
                              fontSize: 14,
                              fontFamily: AppStyle.fontFamily2,
                            ),
                          ),
                          TextButton(
                            onPressed: (){},
                            child: Text(
                              '注册',
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
      ),
    );
  }
}