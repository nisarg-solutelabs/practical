import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nisarg_test/src/core/extensions/context_extension.dart';
import 'package:nisarg_test/src/core/theme/asset_path.dart';
import 'package:nisarg_test/src/core/theme/color_scheme.dart';
import 'package:nisarg_test/src/core/theme/dimensions.dart';
import 'package:nisarg_test/src/core/utils/launch_url.dart';
import 'package:nisarg_test/src/core/utils/snackbar_utils.dart';
import 'package:nisarg_test/src/features/login/presentation/cubit/login_cubit.dart';
import 'package:nisarg_test/src/features/login/presentation/pages/home_page.dart';
import 'package:nisarg_test/src/features/login/presentation/widgets/bg_loader.dart';
import 'package:nisarg_test/src/features/login/presentation/widgets/rectangle_textfield.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    super.key,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _urlController;
  late TextEditingController _userNameController;
  late TextEditingController _passwordController;

  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  bool remeberMe = false;
  bool terms = false;

  @override
  void initState() {
    super.initState();
    _urlController = TextEditingController();
    _userNameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _urlController.dispose();
    _passwordController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginException) {
              showSnackBar(context, state.error.message);
            } else if (state is LoginLoaded) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    result: state.result.data,
                  ),
                ),
                (route) => false,
              );
            }
          },
          builder: (context, state) {
            return BgLoader(
              isLoading: state is LoginLoading,
              widget: Stack(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          color: context.colorScheme.background,
                          height: context.height * 0.3,
                        ),
                        Container(
                          color: context.colorScheme.primary,
                          height: context.height * 0.7,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      bottom: Dimensions.s,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimensions.m,
                        vertical: 2 * Dimensions.xxl4,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: cardShadow,
                          color: context.colorScheme.background,
                          borderRadius: BorderRadius.circular(
                            12,
                          ),
                        ),
                        child: SingleChildScrollView(
                          child: Form(
                            key: _key,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                                Center(
                                  child: Image.asset(
                                    AssetPath.appLogo,
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                                RectangularInputTextField(
                                  textEditingController: _urlController,
                                  enabled: true,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'required';
                                    }
                                    return null;
                                  },
                                  hintText: 'URL',
                                  prefix: Image.asset(
                                    AssetPath.link,
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                                RectangularInputTextField(
                                  enabled: true,
                                  textEditingController: _userNameController,
                                  hintText: 'Username',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'required';
                                    }
                                    return null;
                                  },
                                  prefix: Image.asset(
                                    AssetPath.user,
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                                RectangularInputTextField(
                                  enabled: true,
                                  textEditingController: _passwordController,
                                  hintText: 'Password',
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'required';
                                    }
                                    return null;
                                  },
                                  obscureText: true,
                                  prefix: Image.asset(
                                    AssetPath.padlock,
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                          width: 1.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      value: remeberMe,
                                      onChanged: (value) {
                                        setState(() {
                                          remeberMe = !remeberMe;
                                        });
                                      },
                                    ),
                                    const Text(
                                      'Remember me',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Spacer(),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        right: Dimensions.m,
                                      ),
                                      child: GestureDetector(
                                        onTap: () {
                                          launchUrl(
                                            url: 'https://www.google.com/',
                                          );
                                        },
                                        child: Text(
                                          'Forgot Password?',
                                          style: TextStyle(
                                            color: context.colorScheme.primary,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Checkbox(
                                      value: terms,
                                      onChanged: (value) {
                                        setState(() {
                                          terms = !terms;
                                        });
                                      },
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(4.0),
                                      ),
                                      side: MaterialStateBorderSide.resolveWith(
                                        (states) => const BorderSide(
                                          width: 1.0,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                    const Text(
                                      'I accept Terms & Condition',
                                      style: TextStyle(
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: Dimensions.xxl4,
                                ),
                                Center(
                                    child: InkWell(
                                  onTap: () async {
                                    if (_key.currentState!.validate()) {
                                      await context.read<LoginCubit>().login(
                                            password: _passwordController.text,
                                            url: _urlController.text,
                                            userName: _userNameController.text,
                                          );
                                    }
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: Dimensions.xl,
                                      vertical: Dimensions.m,
                                    ),
                                    decoration: BoxDecoration(
                                      color: context.colorScheme.primary,
                                      borderRadius: BorderRadius.circular(
                                        8,
                                      ),
                                    ),
                                    child: Text(
                                      'Sign In',
                                      style: TextStyle(
                                          color: context.colorScheme.background,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18),
                                    ),
                                  ),
                                )),
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                                Center(
                                  child: RichText(
                                    text: TextSpan(
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'Privacy Policy',
                                          style: TextStyle(
                                            color: context.colorScheme.primary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              launchUrl(
                                                url: 'https://www.google.com/',
                                              );
                                            },
                                        ),
                                        const TextSpan(
                                          text: ' and ',
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        TextSpan(
                                          text: 'Terms & Condition',
                                          style: TextStyle(
                                            color: context.colorScheme.primary,
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = () {
                                              launchUrl(
                                                url: 'https://www.google.com/',
                                              );
                                            },
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: Dimensions.m,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: Dimensions.m,
                    left: context.width / 2 - Dimensions.xxl4,
                    child: const Text(
                      'Version 1.6',
                      style: TextStyle(
                        color: Colors.white70,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
