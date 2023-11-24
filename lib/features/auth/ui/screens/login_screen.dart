import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session7test/Components/bezierContainer.dart';
import 'package:session7test/features/auth/cubit/auth_cubit.dart';
import 'package:session7test/features/auth/cubit/auth_state.dart';
import 'package:session7test/features/auth/data/models/login_data.dart';
import 'package:session7test/features/profile/cubit/profile_cubit.dart';
import 'package:session7test/features/profile/cubit/profile_state.dart';
import 'package:session7test/route_manager.dart';
import 'package:session7test/ui/resources/app_colors.dart';
import 'package:session7test/ui/resources/text_styles.dart';
import 'package:session7test/ui/widgets/default_form_field.dart';
import 'package:session7test/ui/widgets/default_password_form_filed.dart';
import 'package:session7test/ui/widgets/default_text_button.dart';
import 'package:session7test/ui/widgets/loading_indicator.dart';
import 'package:session7test/utils/helper_methods.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, this.title});

  final String? title;

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pushReplacementNamed(
          context,
          Routes.splash,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.h),
        child: Row(
          children: <Widget>[
            const Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
              size: 28,
            ),
            Text(
              'Back',
              style: openSans16W500(color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final authCubit = AuthCubit.get(context);
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0.w,
                  right: 16.w,
                  bottom: MediaQuery.of(context).viewInsets.bottom * 1.2,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      _backButton(),
                      SizedBox(height: height * .15),
                      SizedBox(
                        width: 200.w,
                        height: 200.h,
                        child: Image.asset("images/login2.jpg"),
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          text: 'Wel',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w700,
                            color: Color(0xffc64170),
                          ),
                          children: [
                            TextSpan(
                              text: 'come',
                              style: TextStyle(
                                color: Color(0xff467fad),
                                fontSize: 40,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.email,
                            color: Color(0xffc64170),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          Expanded(
                            child: DefaultFormField(
                              controller: emailController,
                              type: TextInputType.emailAddress,
                              validate: validateEmail,
                              label: "E-mail",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.lock,
                            color: Color(0xffc64170),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          Expanded(
                            child: DefaultPasswordFormField(
                              controller: passwordController,
                              validate: validatePassword,
                              label: "Password",
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => Navigator.pushNamed(
                            context,
                            Routes.resetPassword,
                          ),
                          child: Text(
                            "Forget password",
                            style: openSans16W500(color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 31.h,
                      ),
                      MultiBlocListener(
                        listeners: [
                          BlocListener<AuthCubit, AuthState>(
                            listener: (context, state) {
                              if (state is AuthLoading) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const LoadingIndicator();
                                  },
                                );
                              } else {
                                Navigator.of(context).pop();
                                if (state is AuthSuccess) {
                                  ProfileCubit.get(context).getUser();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Successfully login",
                                        style: TextStyle(fontSize: 15),
                                      ),
                                      backgroundColor: AppColors.main,
                                      duration: Duration(seconds: 3),
                                    ),
                                  );
                                } else if (state is AuthError) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                     SnackBar(
                                      content: Text(
                                        state.message,
                                        style: const TextStyle(fontSize: 15),
                                      ),
                                      backgroundColor: AppColors.error,
                                      duration: const Duration(seconds: 3),
                                    ),
                                  );
                                }
                              }
                            },
                          ),
                          BlocListener<ProfileCubit, ProfileState>(
                            listener: (context, state) {
                              if (state is GetUserSuccess) {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Routes.layout,
                                );
                              }
                            },
                          ),
                        ],
                        child: DefaultTextButton(
                          function: () {
                            if (formKey.currentState!.validate()) {
                              authCubit.login(
                                LoginData(
                                  email: emailController.text,
                                  password: passwordController.text,
                                ),
                              );
                            }
                          },
                          backgroundColor: AppColors.primary,
                          text: "Login",
                          textStyle: openSans14W500(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: height * 0.04),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don’t have an Account?",
                            style: openSans14W400(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.register,
                              );
                            },
                            child: Text(
                              "Create Account",
                              style: openSans14W400(
                                color: const Color(0xffc64170),
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
