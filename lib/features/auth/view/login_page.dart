import 'package:antidrugs/core/utils/constants.dart';
import 'package:antidrugs/core/widgets/cusom_button.dart';
import 'package:antidrugs/core/widgets/custom_text_field.dart';
import 'package:antidrugs/core/widgets/snackbar_messages.dart';
import 'package:antidrugs/features/auth/bloc/auth_bloc.dart';
import 'package:antidrugs/features/auth/widgets/remmember_me.dart';
import 'package:antidrugs/gen/colors.gen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:loading_overlay/loading_overlay.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _authLogin = GetIt.I<AuthBloc>();
  bool? _checkBox = false;
  bool _isLoading = false;
  late TextEditingController _fioController;
  late TextEditingController _phoneController;
  late TextEditingController _passwordController;

  @override
  void initState() {
    super.initState();
    _fioController = TextEditingController();
    _phoneController = TextEditingController();
    _passwordController = TextEditingController();

    //_loginBloc.add(LoginAuthCheck());
  }

  @override
  void dispose() {
    _fioController.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: ColorName.lightWhite,
      body: SafeArea(
        child: BlocProvider.value(
          value: _authLogin,
          child: BlocListener<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is LoginLoading) {
                setState(() {
                  _isLoading = true;
                });
              } else if (state is LoginFailed) {
                showErrorMessage(
                    title: 'Ошибка!',
                    desc: 'Неверный лоигн или пароль!',
                    context: context);
              } else if (state is LoginSuccess) {
                context.go('/');
              }
            },
            child: LoadingOverlay(
              color: ColorName.lightWhite,
              opacity: 0.5,
              isLoading: _isLoading,
              progressIndicator: CircularProgressIndicator(
                color: ColorName.blue.withOpacity(0.75),
              ),
              child: ListView(
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text(
                          'Anti Drugs',
                          style: theme.textTheme.titleMedium?.copyWith(
                              fontSize: 42, fontWeight: FontWeight.w300),
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 50),
                          child: CustomTextField(
                            hint: 'ФИО',
                            isPhone: false,
                            isObscure: false,
                            onChange: (value) {},
                            textEditingController: _fioController,
                            theme: theme,
                          ),),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 50),
                          child: CustomTextField(
                            hint: 'Номер телефона',
                            isPhone: true,
                            isObscure: false,
                            onChange: (value) {},
                            textEditingController: _phoneController,
                            theme: theme,
                          ),),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 20, right: 20, top: 50),
                          child: CustomTextField(
                            hint: 'Пароль',
                            isPhone: false,
                            isObscure: true,
                            onChange: (value) {},
                            textEditingController: _passwordController,
                            theme: theme,
                          ),),

                      Padding(
                          padding: const EdgeInsets.only(left: 40, top: 12),
                          child: RememberMe(
                            theme: theme,
                            onChanged: (value) {
                              setState(() {
                                _checkBox = value;
                              });
                            },
                            value: _checkBox,
                          )),
                      Padding(
                        padding:
                            const EdgeInsets.only(left: 20, right: 20, top: 24),
                        child: CustomTextButton(
                          theme: theme,
                          text: 'Войти',
                          onTap: () {
                            if (_checkBox ?? false) {
                              _authLogin.add(LoginEvent(
                                _fioController.value.text,
                                  _phoneController.value.text,
                                  _passwordController.value.text,
                                  true));
                            } else {
                              _authLogin.add(LoginEvent(
                                  _fioController.value.text,
                                  _phoneController.value.text,
                                  _passwordController.value.text,
                                  false));
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding:
                        const EdgeInsets.only(left: 20, right: 20, top: 24),
                        child: CustomTextButton(
                          theme: theme,
                          text: 'Войти как гость',
                          onTap: () {
                            _authLogin.add(GuestLoginEvent());
                          },
                        ),
                      )
                    ],
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
