import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:session7test/Components/bezierContainer.dart';
import 'package:session7test/features/auth/cubit/auth_cubit.dart';
import 'package:session7test/features/auth/cubit/auth_state.dart';
import 'package:session7test/features/auth/data/models/register_data.dart';
import 'package:session7test/route_manager.dart';
import 'package:session7test/ui/resources/app_colors.dart';
import 'package:session7test/ui/resources/text_styles.dart';
import 'package:session7test/ui/widgets/default_form_field.dart';
import 'package:session7test/ui/widgets/default_password_form_filed.dart';
import 'package:session7test/ui/widgets/default_text_button.dart';
import 'package:session7test/ui/widgets/loading_indicator.dart';
import 'package:session7test/utils/helper_methods.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, this.title});

  final String? title;

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(
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

  Widget _title() {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'Tech',
        style: TextStyle(
          fontSize: 30.sp,
          fontWeight: FontWeight.w700,
          color: AppColors.primary,
        ),
        children: [
          TextSpan(
            text: 'Verse',
            style: TextStyle(color: AppColors.main, fontSize: 30.sp),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final authCubit = AuthCubit.get(context);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Positioned(
                top: -MediaQuery.of(context).size.height * .15,
                right: -MediaQuery.of(context).size.width * .4,
                child: const BezierContainer(),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 16.0.w,
                  right: 16.w,
                  bottom: MediaQuery.of(context).viewInsets.bottom * 0.2,
                ),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: <Widget>[
                      _backButton(),
                      SizedBox(height: height * .2),
                      _title(),
                      SizedBox(
                        height: 50.h,
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
                      SizedBox(
                        height: 32.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.person,
                            color: Color(0xffc64170),
                          ),
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 0.05,
                          ),
                          Expanded(
                            child: DefaultFormField(
                              controller: firstNameController,
                              type: TextInputType.name,
                              validate: (value) =>
                                  validateGeneral(value, 'First Name'),
                              label: "First Name",
                            ),
                          ),
                          SizedBox(
                            width: 15.w,
                          ),
                          Expanded(
                            child: DefaultFormField(
                              controller: lastNameController,
                              type: TextInputType.name,
                              validate: (value) =>
                                  validateGeneral(value, 'Last Name'),
                              label: "Last Name",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 32.h,
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
                      SizedBox(
                        height: 32.h,
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
                              controller: confirmPasswordController,
                              validate: validatePassword,
                              label: "Confirm password",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 38.h,
                      ),
                      BlocListener<AuthCubit, AuthState>(
                        listener: (context, state) {
                          if (state is EmailVerifyRequestSentLoading) {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return const LoadingIndicator();
                              },
                            );
                          } else {
                            Navigator.pop(context);
                            if (state is EmailVerifyRequestSentSuccess) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "A verification link has been sent to your email address. Please check your email to complete the registration process.",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  backgroundColor: AppColors.main,
                                  duration: Duration(
                                    seconds: 6,
                                  ), // You can adjust the duration as per your preference
                                ),
                              );
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.login,
                              );
                            } else if (state is EmailVerifyRequestSentError) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "There is an error, try again",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  backgroundColor: AppColors.error,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          }
                        },
                        child: DefaultTextButton(
                          function: () {
                            if (passwordController.text ==
                                confirmPasswordController.text) {
                              if (formKey.currentState!.validate()) {
                                authCubit.register(
                                  RegisterData(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    firstName: firstNameController.text,
                                    lastName: lastNameController.text,
                                  ),
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text(
                                    "Password dose not match, please try again",
                                    style: TextStyle(fontSize: 15),
                                  ),
                                  backgroundColor: AppColors.error,
                                  duration: Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          text: "Create account",
                          textStyle: openSans14W500(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 18.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have account ?",
                            style: openSans14W400(color: Colors.black),
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.login,
                              );
                            },
                            child: Text(
                              "login",
                              style: openSans14W500(
                                color: AppColors.primary,
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
