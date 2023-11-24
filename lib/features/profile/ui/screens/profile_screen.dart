import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:session7test/features/auth/cubit/auth_cubit.dart';
import 'package:session7test/features/auth/cubit/auth_state.dart';
import 'package:session7test/features/profile/cubit/profile_cubit.dart';
import 'package:session7test/features/profile/cubit/profile_state.dart';
import 'package:session7test/route_manager.dart';
import 'package:session7test/ui/resources/app_colors.dart';
import 'package:session7test/ui/resources/text_styles.dart';
import 'package:session7test/ui/widgets/loading_indicator.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage();

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? imageFile;

  @override
  Widget build(BuildContext context) {
    final profile = ProfileCubit.get(context);
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                    );
                  } else {
                    Navigator.pop(context);
                    if (state is LoggedOut) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Successfully logout",
                            style: TextStyle(fontSize: 15),
                          ),
                          backgroundColor: AppColors.main,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    } else if (state is AuthError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "There is an error",
                            style: TextStyle(fontSize: 15),
                          ),
                          backgroundColor: AppColors.primary,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  }
                },
                child: GestureDetector(
                  onTap: () {
                    AuthCubit.get(context).logout();
                    Navigator.pushReplacementNamed(context, Routes.login);
                  },
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Container(
                      margin: const EdgeInsets.only(top: 15),
                      height: 50,
                      width: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xff385f98),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(
                        Icons.logout,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () async {},
              child: BlocConsumer<ProfileCubit, ProfileState>(
                listener: (_, state) {
                  if (state is UploadProfileImageLoading) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const LoadingIndicator();
                      },
                    );
                  } else {
                    if (Navigator.of(context).canPop()) {
                      Navigator.pop(context);
                    }
                    if (state is UploadProfileImageError) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Failed to Upload",
                            style: TextStyle(fontSize: 15),
                          ),
                          backgroundColor: AppColors.error,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                    if (state is UploadProfileImageSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            "Successfully Uploaded",
                            style: TextStyle(fontSize: 15),
                          ),
                          backgroundColor: AppColors.main,
                          duration: Duration(seconds: 3),
                        ),
                      );
                    }
                  }
                },
                builder: (context, state) {
                  return Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Hero(
                        tag: ProfileCubit.get(context).user.profileImage != null
                            ? ProfileCubit.get(context).user.profileImage!
                            : "https://cdn-icons-png.flaticon.com/128/2922/2922506.png",
                        child: Container(
                          height: 120.h,
                          width: 120.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.2),
                                spreadRadius: 5,
                                blurRadius: 20,
                              ),
                            ],
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                ProfileCubit.get(context).user.profileImage !=
                                        null
                                    ? ProfileCubit.get(context)
                                        .user
                                        .profileImage!
                                    : "https://cdn-icons-png.flaticon.com/128/2922/2922506.png",
                              ),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          final ImagePicker picker = ImagePicker();
                          final XFile? xFile = await picker.pickImage(
                            source: ImageSource.gallery,
                          );

                          if (xFile != null) {
                            File xFilePathToFile(XFile xFile) {
                              return File(xFile.path);
                            }

                            imageFile = xFilePathToFile(xFile);
                            if (context.mounted) {
                              profile.uploadMedicalEquipmentImagesToFireStorage(
                                profile.user.id!,
                                imageFile!,
                              );
                            }
                          }
                        },
                        child: const Icon(Icons.edit),
                      ),
                    ],
                  );
                },
              ),
            ),
            SizedBox(
              height: 12.h,
            ),
            Text(
              "${profile.user.firstName} ${profile.user.lastName}",
              style: openSans18W500(color: Colors.black),
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(
              "Points: ${profile.user.points}",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey[400],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildStatColumn("53", "Photos"),
                buildStatColumn("223k", "Followers"),
                buildStatColumn("117", "Following"),
              ],
            ),
            Container(
              padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
              margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.15),
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'MY COURSES',
                          style: TextStyle(color: Color(0xff385f98)),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'MISSION',
                              style: TextStyle(color: Color(0xff385f98)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                'Astronomy',
                                style: TextStyle(color: Color(0xff385f98)),
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                thumbColor: Colors.white,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                divisions: 4,
                                label: "75%",
                                value: 75,
                                max: 100,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                'Satellites For Environment',
                                style: TextStyle(color: Color(0xff385f98)),
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                thumbColor: Colors.white,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                divisions: 4,
                                label: "25%",
                                value: 25,
                                max: 100,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const Expanded(
                              child: Text(
                                'Science and Climate',
                                style: TextStyle(color: Color(0xff385f98)),
                              ),
                            ),
                            Expanded(
                              child: Slider(
                                thumbColor: Colors.white,
                                activeColor: Colors.green,
                                inactiveColor: Colors.grey,
                                divisions: 4,
                                label: "50%",
                                value: 50,
                                max: 100,
                                onChanged: (value) {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'MY COURSES',
                          style: TextStyle(color: Color(0xff385f98)),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'RATING',
                              style: TextStyle(color: Color(0xff385f98)),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: const Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                'Astronomy',
                                style: TextStyle(color: Color(0xff385f98)),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                'Satellites For Environment',
                                style: TextStyle(color: Color(0xff385f98)),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.grey,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Expanded(
                              child: Text(
                                'Science and Climate',
                                style: TextStyle(color: Color(0xff385f98)),
                              ),
                            ),
                            Expanded(
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                  Icon(
                                    Icons.star,
                                    size: 20,
                                    color: Colors.amber,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Card buildPictureCard(String url) {
    return Card(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(url),
          ),
        ),
      ),
    );
  }

  Column buildStatColumn(String value, String title) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
            color: Colors.grey[400],
          ),
        ),
      ],
    );
  }
}
