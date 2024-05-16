import 'package:flutter/material.dart';
import 'package:myapp/config/widget/checkbox_config.dart';
import 'package:myapp/config/widget/size_config.dart';
import 'package:myapp/config/widget/text_config.dart';
import 'package:myapp/pages/provider/auth_provider.dart';
import 'package:myapp/pages/routes/routes.dart';
import 'package:provider/provider.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  bool _obscureText = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void handleSubmit() {
      if (_formKey.currentState!.validate()) {
        final email = _emailController.text;
        final password = _passwordController.text;
        if (email.isNotEmpty && password.isNotEmpty) {
          Provider.of<AuthProvider>(context, listen: false)
              .login(email, password);
        }
      }
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.green,
        body: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Grocery App',
                      style: largeTextStyle(context, color: Colors.white),
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Welcome back',
                            style: largeTextStyle(context),
                          ),
                          spaceHeight(context, height: 0.01),
                          Text(
                            'Rerum ducimus tempore aliasEt eos itaque ',
                            style: smallTextStyle(context),
                          ),
                          spaceHeight(context),
                          TextFormField(
                            controller: _emailController,
                            decoration: const InputDecoration(
                              hintText: 'Email',
                              border: OutlineInputBorder(),
                              prefixIcon: Icon(
                                Icons.account_circle,
                                size: 30,
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Email cannot be empty';
                              } else if (!value.contains('@')) {
                                return 'Invalid email';
                              }
                              return null;
                            },
                          ),
                          spaceHeight(context),
                          TextFormField(
                            controller: _passwordController,
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              border: const OutlineInputBorder(),
                              prefixIcon: const Icon(
                                Icons.lock,
                                size: 30,
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                ),
                                onPressed: () {
                                  setState(() {
                                    _obscureText = !_obscureText;
                                  });
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Password cannot be empty';
                              } else if (value.length < 6 ||
                                  value.length > 12) {
                                return 'Password must be between 6 and 12 characters';
                              }
                              return null;
                            },
                          ),
                          spaceHeight(context),
                          InkWell(
                            onTap: handleSubmit,
                            child: SizedBox(
                              width: double.infinity,
                              height: getHeight(context, height: 0.08),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.green,
                                ),
                                child: Center(
                                  child: Text(
                                    'SIGN IN',
                                    style: largeTextStyle(context,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          spaceHeight(context, height: 0.02),
                          Row(
                            children: [
                              const CheckBox(),
                              Expanded(
                                child: Text(
                                  'Keep Sign in',
                                  style: smallTextStyle(context,
                                      size: 0.017, color: Colors.green),
                                ),
                              ),
                              Expanded(
                                child: TextButton(
                                  onPressed: () {
                                    Navigator.pushReplacementNamed(
                                        context, Routes.signinScreen);
                                  },
                                  child: Text(
                                    'Forgot Password?',
                                    style: smallTextStyle(context,
                                        color: Colors.green, size: 0.017),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          spaceHeight(context),
                          Center(
                            child: Text(
                              'Do not have an account ?',
                              style: mediumTextStyle(context),
                            ),
                          ),
                          spaceHeight(context, height: 0.02),
                          SizedBox(
                            width: double.infinity,
                            height: getHeight(context, height: 0.08),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.green,
                              ),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushReplacementNamed(
                                      context, Routes.registerScreen);
                                },
                                child: Center(
                                  child: Text(
                                    'CREATE AN ACCOUNT',
                                    style: largeTextStyle(context,
                                        size: 0.03, color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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
