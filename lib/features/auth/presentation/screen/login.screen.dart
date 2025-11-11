import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:inchfast/core/config/routes/route.dart';
import 'package:inchfast/core/constants/assets.constants.dart';
import 'package:inchfast/core/theme/style_text.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:inchfast/features/auth/domain/parameter/login.parameter.dart';

import '../../../../core/config/di/injection_container.dart';
import '../../../../core/design_component/button.dart';
import '../../../../core/design_component/form.input.dart';
import '../../../../core/theme/colors.dart';
import '../../../main-feature/presentation/widget/handling.widget.dart';
import '../bloc/login-bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => sl<LoginBloc>(),
        )
      ],
      child: const LoginContent(),
    );
  }
}

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  FocusNode userNameNode = FocusNode();
  FocusNode passwordNode = FocusNode();

  final usernameCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginLoading) {
          // Show loading dialog
          // HandlingWidget.loadingDialog(context: context);
        }
        if (state is LoginSuccess) {
          context.pop();
          context.goNamed(AppRoutes.dashboard);
        }
        if (state is LoginFailed) {
          context.pop();
          usernameCtr.clear();
          passwordCtr.clear();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, // Prevent layout jump
        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30), // Fixed padding instead of .sp
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset(AssetsConstants.mainLogo)),
                  const SizedBox(height: 100),
                  Text(
                    'SIGN IN',
                    style: UIStyle.semiBold(fontSize: 20),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Enter your username and password',
                    style: UIStyle.semiBold(fontSize: 12),
                  ),
                  const SizedBox(height: 30),
                  UIInputForm.inputTextField(
                    focusNode: userNameNode,
                    controller: usernameCtr,
                    fillColor: UIColors.fillTextFieldColor,
                    placeHolder: 'Username*',
                    context: context,
                  ),
                  const SizedBox(height: 16),
                  UIInputForm.inputTextField(
                    focusNode: passwordNode,
                    obsecureText: true,
                    controller: passwordCtr,
                    fillColor: UIColors.fillTextFieldColor,
                    placeHolder: 'Password',
                    context: context,
                  ),
                  const SizedBox(height: 40),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      if (state is LoginFailed) {
                        return Text(
                          state.msg ?? '',
                          style: UIStyle.semiBoldQS(
                            color: UIColors.warningColor,
                            fontSize: 16,
                          ),
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                  const SizedBox(height: 15),
                  UIButton.primaryFull(
                    onTap: () {
                      HandlingWidget.loadingDialog(context: context);
                      context.read<LoginBloc>().add(StartLogin(
                            params: LoginParameter(
                              password: passwordCtr.text,
                              username: usernameCtr.text,
                            ),
                          ));
                    },
                    title: 'SIGN IN',
                    color: UIColors.loginButtonColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
