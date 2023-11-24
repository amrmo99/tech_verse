import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:session7test/features/auth/cubit/auth_cubit.dart';
import 'package:session7test/features/profile/cubit/profile_cubit.dart';
import 'package:session7test/features/profile/cubit/profile_state.dart';
import 'package:session7test/route_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<SplashScreen> {


  @override
  void initState() {
    super.initState();
    if (AuthCubit.get(context).isLoggedIn) {
      ProfileCubit.get(context).getUser();
    } else {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacementNamed(context, Routes.login);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
        listener: (_, state) {
      if (state is GetUserSuccess) {
        Navigator.pushReplacementNamed(context, Routes.layout);
      }
    },
      child: Scaffold(
        backgroundColor: const Color(0xffffeff4),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'images/Tech.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "TECHVERSE",
                style: TextStyle(
                    fontSize: 50,
                    color: Color(0xff0a4570),
                    fontWeight: FontWeight.bold,),
              ),
              const Text("Your Venture into the realm ",style: TextStyle(color: Color(0xff0a4570),fontSize: 18,),),
              const Text("of future technology ", style: TextStyle(color: Color(0xff0a4570),fontSize: 18,),),
            ],
          ),
        ),
      ),
    );
  }
}
