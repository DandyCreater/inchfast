import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/design_component/button.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/config/di/injection_container.dart';
import '../../../../core/config/routes/route.dart';
import '../../../../core/constants/assets.constants.dart';
import '../../../../core/theme/colors.dart';
import '../../../../core/theme/style_text.dart';
import '../../../auth/domain/usecase/clear_user_data.usecase.dart';
import '../../../auth/presentation/bloc/user-bloc/user_bloc.dart';

class LogOutDialog extends StatelessWidget {
  const LogOutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<UserBloc>(),
        )
      ],
      child: const LogOutContent(),
    );
  }
}

class LogOutContent extends StatefulWidget {
  const LogOutContent({super.key});

  @override
  State<LogOutContent> createState() => _LogOutContentState();
}

class _LogOutContentState extends State<LogOutContent> {
  @override
  void initState() {
    super.initState();
    context.read<UserBloc>().add(
          LoadUserData(),
        );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      title: GestureDetector(
        onTap: () {
          context.pop();
        },
        child: Row(
          children: [
            const Icon(
              Icons.arrow_back_ios,
              color: UIColors.blackColor,
            ),
            Text(
              "Back",
              style: UIStyle.semiBold(
                fontSize: 10.0,
              ),
            )
          ],
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              SvgPicture.asset(
                AssetsConstants.avatarIcon,
              ),
              SizedBox(
                width: 16.sp,
              ),
              BlocBuilder<UserBloc, UserState>(
                builder: (context, state) {
                  if (state is UserLoading) {
                    return Skeletonizer(
                        child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello, Addyson Chavez!",
                          style: UIStyle.semiBold(fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 4.sp,
                        ),
                        Text(
                          "Hello, Addyson Chavez!",
                          style: UIStyle.semiBold(fontSize: 12.0),
                        ),
                      ],
                    ));
                  }
                  if (state is UserSuccess) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          state.value?.data?.user?.fullname ?? '',
                          style: UIStyle.semiBold(fontSize: 12.0),
                        ),
                        SizedBox(
                          height: 4.sp,
                        ),
                        Text(
                          state.value?.data?.user?.mail ?? '',
                          style: UIStyle.semiBold(fontSize: 12.0),
                        ),
                      ],
                    );
                  }
                  return Skeletonizer(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Hello, Addyson Chavez!",
                        style: UIStyle.semiBold(fontSize: 12.0),
                      ),
                      SizedBox(
                        height: 4.sp,
                      ),
                      Text(
                        "Hello, Addyson Chavez!",
                        style: UIStyle.semiBold(fontSize: 12.0),
                      ),
                    ],
                  ));
                },
              ),
            ],
          ),
          SizedBox(
            height: 40.sp,
          ),
          UIButton.customPrimaryFull(
              title: 'LOGOUT',
              onTap: () async {
                await sl<ClearUserDataUseCase>().call();
                if (context.mounted) {
                  context.pushReplacementNamed(AppRoutes.login);
                }
              })
        ],
      ),
    );
  }
}
