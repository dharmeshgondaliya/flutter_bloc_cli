class CreateAuthScreensGenerator {
  static const String authTextFieldFileContent = """import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    this.autofocus = false,
    this.controller,
    this.enabled,
    this.focusNode,
    this.inputFormatters,
    this.keyboardType,
    this.maxLength,
    this.obscureText = false,
    this.onChanged,
    this.onEditingComplete,
    this.onFieldSubmitted,
    this.onSaved,
    this.onTap,
    this.readOnly = false,
    this.textInputAction,
    this.validator,
    this.hintText,
    this.prefix,
    this.prefixIcon,
    this.suffix,
    this.suffixIcon,
  });

  final bool autofocus;
  final TextEditingController? controller;
  final bool? enabled;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextInputType? keyboardType;
  final int? maxLength;
  final bool obscureText;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function()? onTap;
  final void Function(String?)? onSaved;
  final void Function(String)? onFieldSubmitted;
  final bool readOnly;
  final TextInputAction? textInputAction;
  final String? Function(String? value)? validator;
  final String? hintText;
  final Widget? prefix;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: autofocus,
      controller: controller,
      enabled: enabled,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      maxLength: maxLength,
      maxLines: 1,
      obscureText: obscureText,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onFieldSubmitted: onFieldSubmitted,
      onTap: onTap,
      readOnly: readOnly,
      cursorColor: Theme.of(context).colorScheme.primary,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
      textAlignVertical: TextAlignVertical.center,
      textInputAction: textInputAction,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        prefix: prefix,
        prefixIcon: prefixIcon,
        suffix: suffix,
        suffixIcon: suffixIcon,
        errorMaxLines: 2,
        constraints: const BoxConstraints(minWidth: double.maxFinite, maxWidth: double.maxFinite, maxHeight: 90, minHeight: 45),
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1)),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1)),
        disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide(width: 1.2, color: Theme.of(context).colorScheme.primary)),
        errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1, color: Colors.red)),
        focusedErrorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(width: 1.2, color: Colors.red)),
      ),
    );
  }
}""";

  static const String authSubmitButtonFileContent = """import 'package:flutter/material.dart';

class AuthSubmitButton extends StatelessWidget {
  const AuthSubmitButton({super.key, required this.text, required this.onPressed});
  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        maximumSize: const WidgetStatePropertyAll(Size(double.infinity, 40)),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 40)),
        shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
        backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.primary),
      ),
      onPressed: onPressed,
      child: Text(text, style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white)),
    );
  }
}""";

  static const String loginScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/login_screen/bloc/login_screen_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';

import '../../../core/utils/common.dart';
import '../../..//widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70, bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Log In",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              AuthTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                onEditingComplete: () {
                  focusNodePassword.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!isValidEmail(value!.trim())) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<LoginScreenBloc, LoginScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodePassword,
                    controller: passwordController,
                    hintText: "Enter password",
                    obscureText: state.showPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<LoginScreenBloc>().add(TogglePassword());
                      },
                    ),
                    onEditingComplete: login,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: navigateToForgotPasswordScreen,
                  child: Text(
                    "Forgot password",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Login",
                onPressed: login,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: "Don't have an account?  ",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: "Sign Up",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = navigateToRegisterScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToRegisterScreen() {
    
  }

  void navigateToForgotPasswordScreen() {
    
  }

  void login() {
    removeFocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    context.read<LoginScreenBloc>().add(LoginEvent(email: email, password: password));
  }
}""";

  static const String loginScreenRepositoryFileContent = "class LoginScreenRepository {}";

  static const String loginScreenBlocFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'login_screen_event.dart';

part 'login_screen_state.dart';

class LoginScreenBloc extends Bloc<LoginScreenEvent, LoginScreenState> {
  LoginScreenBloc() : super(LoginScreenState()) {
    on<TogglePassword>((event, emit) {
      state.showPassword = !state.showPassword;
      emit(state.copy());
    });
    on<LoginEvent>((event, emit) {});
  }
}""";
  static const String loginScreenEventFileContent = """part of 'login_screen_bloc.dart';

sealed class LoginScreenEvent {}

class TogglePassword extends LoginScreenEvent {}

class LoginEvent extends LoginScreenEvent {
  LoginEvent({required this.email, required this.password});
  final String email;
  final String password;
}""";
  static const String loginScreenStateFileContent = """part of 'login_screen_bloc.dart';

class LoginScreenState {
  LoginScreenState({
    this.currentState = ActivityState.initial,
    this.showPassword = true,
  });

  bool showPassword;
  ActivityState currentState;

  LoginScreenState copy() {
    return LoginScreenState(currentState: currentState, showPassword: showPassword);
  }
}""";

  static const String registerScreenFileContent = """import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/register_screen/bloc/register_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeUsername = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              AuthTextField(
                focusNode: focusNodeUsername,
                controller: usernameController,
                hintText: "Enter username",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_outline),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9_.]'))],
                onEditingComplete: () {
                  focusNodeEmail.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              AuthTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.email_outlined),
                onEditingComplete: () {
                  focusNodePassword.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!isValidEmail(value!.trim())) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<RegisterScreenBloc, RegisterScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodePassword,
                    controller: passwordController,
                    hintText: "Enter password",
                    obscureText: state.showPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<RegisterScreenBloc>().add(TogglePassword());
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeConfirmPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<RegisterScreenBloc, RegisterScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeConfirmPassword,
                    controller: confirmPasswordController,
                    hintText: "Enter confirm password",
                    obscureText: state.showConfirmPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<RegisterScreenBloc>().add(ToggleConfirmPassword());
                      },
                    ),
                    onEditingComplete: register,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter confirm password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
                        return "Password and confirmation password are not match";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Sign Up",
                onPressed: register,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: "Already have an account?  ",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: "Log In",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    removeFocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    String userName = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    context.read<RegisterScreenBloc>().add(RegisterEvent(
          userName: userName,
          email: email,
          password: password,
        ));
  }
}""";
  static const String registerScreenRepositoryFileContent = """class RegisterScreenRepository {}""";
  static const String registerScreenBlocFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'register_screen_event.dart';

part 'register_screen_state.dart';

class RegisterScreenBloc extends Bloc<RegisterScreenEvent, RegisterScreenState> {
  RegisterScreenBloc() : super(RegisterScreenState()) {
    on<TogglePassword>((event, emit) {
      state.showPassword = !state.showPassword;
      emit(state.copy());
    });
    on<ToggleConfirmPassword>((event, emit) {
      state.showConfirmPassword = !state.showConfirmPassword;
      emit(state.copy());
    });
    on<RegisterEvent>((event, emit) {
      state.showPassword = !state.showPassword;
      emit(state.copy());
    });
  }
}""";
  static const String registerScreenEventFileContent = """part of 'register_screen_bloc.dart';

sealed class RegisterScreenEvent {}

class RegisterEvent extends RegisterScreenEvent {
  RegisterEvent({
    required this.userName,
    required this.email,
    required this.password,
  });
  final String userName;
  final String email;
  final String password;
}

class TogglePassword extends RegisterScreenEvent {}

class ToggleConfirmPassword extends RegisterScreenEvent {}""";

  static const String registerScreenStateFileContent = """part of 'register_screen_bloc.dart';

class RegisterScreenState {
  RegisterScreenState({
    this.currentState = ActivityState.initial,
    this.showPassword = true,
    this.showConfirmPassword = true,
  });

  bool showPassword;
  bool showConfirmPassword;
  ActivityState currentState;

  RegisterScreenState copy() {
    return RegisterScreenState(
      currentState: currentState,
      showPassword: showPassword,
      showConfirmPassword: showConfirmPassword,
    );
  }
}""";

  static const String forgotPasswordScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/forgot_password_screen/bloc/forgot_password_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Forgot password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              Text(
                "We will send you link to your Email Address to reset your password. You can come back to App after resetting password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 25),
              AuthTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                onEditingComplete: sendEmail,
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!isValidEmail(value!.trim())) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Send Email",
                onPressed: sendEmail,
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail() {
    removeFocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<ForgotPasswordScreenBloc>().add(ForgotPasswordEvent(email: emailController.text.trim()));
  }
}""";
  static const String forgotPasswordScreenRepositoryFileContent = """class ForgotPasswordScreenRepository {}""";
  static const String forgotPasswordScreenBlocFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'forgot_password_screen_event.dart';

part 'forgot_password_screen_state.dart';

class ForgotPasswordScreenBloc extends Bloc<ForgotPasswordScreenEvent, ForgotPasswordScreenState> {
  ForgotPasswordScreenBloc() : super(ForgotPasswordScreenState()) {
    on<ForgotPasswordScreenEvent>((event, emit) => null);
  }
}""";
  static const String forgotPasswordScreenEventFileContent = """part of 'forgot_password_screen_bloc.dart';

sealed class ForgotPasswordScreenEvent {}

class ForgotPasswordEvent extends ForgotPasswordScreenEvent {
  ForgotPasswordEvent({required this.email});
  final String email;
}""";
  static const String forgotPasswordScreenStateFileContent = """part of 'forgot_password_screen_bloc.dart';

class ForgotPasswordScreenState {
  ForgotPasswordScreenState({this.currentState = ActivityState.initial});

  ActivityState currentState;

  ForgotPasswordScreenState copy() {
    return ForgotPasswordScreenState(currentState: currentState);
  }
}""";

  static const String resetPasswordScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/reset_password_screen/bloc/reset_password_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.clear();
    confirmPasswordController.clear();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Reset password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              Text(
                "Enter and confirm your new password below to complete the change. After updating, use your new password to log in to the app.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              BlocBuilder<ResetPasswordScreenBloc, ResetPasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodePassword,
                    controller: passwordController,
                    hintText: "Enter new password",
                    obscureText: state.showPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ResetPasswordScreenBloc>().add(TogglePassword());
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeConfirmPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter new password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<ResetPasswordScreenBloc, ResetPasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeConfirmPassword,
                    controller: confirmPasswordController,
                    hintText: "Enter confirm password",
                    obscureText: state.showConfirmPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ResetPasswordScreenBloc>().add(ToggleConfirmPassword());
                      },
                    ),
                    onEditingComplete: changePassword,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter confirm password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
                        return "Password and confirmation password are not match";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Send Email",
                onPressed: changePassword,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<ResetPasswordScreenBloc>().add(ChangePasswordEvent(password: passwordController.text.trim()));
  }
}""";

  static const String resetPasswordScreenRepositoryFileContent = """class ResetPasswordScreenRepository {}""";

  static const String resetPasswordScreenBlocFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'reset_password_screen_event.dart';

part 'reset_password_screen_state.dart';

class ResetPasswordScreenBloc extends Bloc<ResetPasswordScreenEvent, ResetPasswordScreenState> {
  ResetPasswordScreenBloc() : super(ResetPasswordScreenState()) {
    on<TogglePassword>((event, emit) {
      state.showPassword = !state.showPassword;
      emit(state.copy());
    });
    on<ToggleConfirmPassword>((event, emit) {
      state.showConfirmPassword = !state.showConfirmPassword;
      emit(state.copy());
    });
    on<ChangePasswordEvent>((event, emit) {});
  }
}
""";

  static const String resetPasswordScreenEventFileContent = """part of 'reset_password_screen_bloc.dart';

sealed class ResetPasswordScreenEvent {}

class ChangePasswordEvent extends ResetPasswordScreenEvent {
  ChangePasswordEvent({required this.password});
  final String password;
}

class TogglePassword extends ResetPasswordScreenEvent {}

class ToggleConfirmPassword extends ResetPasswordScreenEvent {}""";

  static const String resetPasswordScreenStateFileContent = """part of 'reset_password_screen_bloc.dart';

class ResetPasswordScreenState {
  ResetPasswordScreenState({
    this.currentState = ActivityState.initial,
    this.showPassword = true,
    this.showConfirmPassword = true,
  });

  bool showPassword;
  bool showConfirmPassword;
  ActivityState currentState;

  ResetPasswordScreenState copy() {
    return ResetPasswordScreenState(
      currentState: currentState,
      showPassword: showPassword,
      showConfirmPassword: showConfirmPassword,
    );
  }
}""";

  static const String changePasswordScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/change_password_screen/bloc/change_password_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode focusNodeCurrentPassword = FocusNode();
  final FocusNode focusNodeNewPassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    focusNodeCurrentPassword.dispose();
    focusNodeNewPassword.dispose();
    focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                "Enter your current password, then set and confirm your new password below. After updating, use your new password to log in to the app.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ChangePasswordScreenBloc, ChangePasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeCurrentPassword,
                    controller: currentPasswordController,
                    hintText: "Enter Current password",
                    obscureText: state.showCurrentPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showCurrentPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ChangePasswordScreenBloc>().add(ToggleCurrentPassword());
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeNewPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter current password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<ChangePasswordScreenBloc, ChangePasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeNewPassword,
                    controller: newPasswordController,
                    hintText: "Enter new password",
                    obscureText: state.showNewPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showNewPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ChangePasswordScreenBloc>().add(ToggleNewPassword());
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeConfirmPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter new password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<ChangePasswordScreenBloc, ChangePasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeConfirmPassword,
                    controller: confirmPasswordController,
                    hintText: "Enter confirm password",
                    obscureText: state.showConfirmPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ChangePasswordScreenBloc>().add(ToggleConfirmPassword());
                      },
                    ),
                    onEditingComplete: changePassword,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter confirm password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      } else if (newPasswordController.text.trim() != confirmPasswordController.text.trim()) {
                        return "Password and confirmation password are not match";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Submit",
                onPressed: changePassword,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() {
    if (!formKey.currentState!.validate()) return;
    context.read<ChangePasswordScreenBloc>().add(ChangePassword(
          currentPassword: currentPasswordController.text.trim(),
          newPassword: newPasswordController.text.trim(),
        ));
  }
}""";
  static const String changePasswordScreenRepositoryFileContent = """class ChangePasswordScreenRepository {}""";
  static const String changePasswordScreenBlocFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'change_password_screen_event.dart';

part 'change_password_screen_state.dart';

class ChangePasswordScreenBloc extends Bloc<ChangePasswordScreenEvent, ChangePasswordScreenState> {
  ChangePasswordScreenBloc() : super(ChangePasswordScreenState()) {
    on<ToggleCurrentPassword>((event, emit) {
      state.showCurrentPassword = !state.showCurrentPassword;
      emit(state.copy());
    });
    on<ToggleNewPassword>((event, emit) {
      state.showNewPassword = !state.showNewPassword;
      emit(state.copy());
    });
    on<ToggleConfirmPassword>((event, emit) {
      state.showConfirmPassword = !state.showConfirmPassword;
      emit(state.copy());
    });
    on<ChangePassword>((event, emit) => null);
  }
}""";
  static const String changePasswordScreenEventFileContent = """part of 'change_password_screen_bloc.dart';

sealed class ChangePasswordScreenEvent {}

class ToggleCurrentPassword extends ChangePasswordScreenEvent {}

class ToggleNewPassword extends ChangePasswordScreenEvent {}

class ToggleConfirmPassword extends ChangePasswordScreenEvent {}

class ChangePassword extends ChangePasswordScreenEvent {
  ChangePassword({required this.currentPassword, required this.newPassword});
  final String currentPassword;
  final String newPassword;
}""";
  static const String changePasswordScreenStateFileContent = """part of 'change_password_screen_bloc.dart';

class ChangePasswordScreenState {
  ChangePasswordScreenState({
    this.showCurrentPassword = true,
    this.showNewPassword = true,
    this.showConfirmPassword = true,
    this.currentState = ActivityState.initial,
  });

  bool showCurrentPassword;
  bool showNewPassword;
  bool showConfirmPassword;
  ActivityState currentState;

  ChangePasswordScreenState copy() {
    return ChangePasswordScreenState(
      showCurrentPassword: showCurrentPassword,
      showNewPassword: showNewPassword,
      showConfirmPassword: showConfirmPassword,
      currentState: currentState,
    );
  }
}""";

  static const String otpVerificationScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/otp_verification_screen/bloc/otp_verification_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BaseScreen(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70, bottom: 50),
              child: Hero(
                tag: "title",
                child: FlutterLogo(size: 80),
              ),
            ),
            Text(
              "OTP Verification",
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),
            Text(
              "Enter 6 digit OTP that has been sent to",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            Text(
              "someone@example.com",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: OtpTextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: BorderRadius.circular(5),
                contentPadding: EdgeInsets.zero,
                alignment: Alignment.center,
                showFieldAsBox: true,
                numberOfFields: 6,
                fieldHeight: 60,
                styles: [
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                ],
                onCodeChanged: (value) {
                  otp = value.trim();
                },
                onSubmit: (value) {
                  if (value.trim().length == 6) {
                    otp = value.trim();
                    submitOtp();
                  }
                },
              ),
            ),
            const SizedBox(height: 25),
            AuthSubmitButton(
              text: "Verify",
              onPressed: submitOtp,
            )
          ],
        ),
      ),
    );
  }

  void submitOtp() {
    removeFocus();
    context.read<OtpVerificationScreenBloc>().add(OTPSubmitEvent(otp: otp));
  }
}""";

  static const String otpVerificationScreenRepositoryFileContent = """class OtpVerificationScreenRepository {}""";

  static const String otpVerificationScreenBlocFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'otp_verification_screen_event.dart';

part 'otp_verification_screen_state.dart';

class OtpVerificationScreenBloc extends Bloc<OtpVerificationScreenEvent, OtpVerificationScreenState> {
  OtpVerificationScreenBloc() : super(OtpVerificationScreenState()) {
    on<OTPSubmitEvent>((event, emit) {});
  }
}""";

  static const String otpVerificationScreenEventFileContent = """part of 'otp_verification_screen_bloc.dart';

sealed class OtpVerificationScreenEvent {}

class OTPSubmitEvent extends OtpVerificationScreenEvent {
  OTPSubmitEvent({required this.otp});
  final String otp;
}""";

  static const String otpVerificationScreenStateFileContent = """part of 'otp_verification_screen_bloc.dart';

class OtpVerificationScreenState {
  OtpVerificationScreenState({this.currentState = ActivityState.initial});

  ActivityState currentState;

  OtpVerificationScreenState copy() {
    return OtpVerificationScreenState(currentState: currentState);
  }
}""";

  static const String profileSetupScreenFileContent = """import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/profile_setup_screen/bloc/profile_setup_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../core/utils/media_utils.dart';
import '../../../core/utils/date_picker_utils.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final FocusNode focusNodeFirstName = FocusNode();
  final FocusNode focusNodeLastName = FocusNode();
  final FocusNode focusNodeDOB = FocusNode();

  DateTime? dob;

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    focusNodeFirstName.dispose();
    focusNodeLastName.dispose();
    focusNodeDOB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: Text(
          "Complete profile",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Skip"),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 35),
              BlocBuilder<ProfileSetupScreenBloc, ProfileSetupScreenState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: state.profilePicture == null
                        ? GestureDetector(
                            onTap: selectProfilePicture,
                            child: Column(
                              children: [
                                Container(
                                  width: 125,
                                  height: 125,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black12,
                                  ),
                                  child: const Icon(Icons.person, color: Colors.white70, size: 50),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Select a profile picture",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 125,
                            height: 125,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    state.profilePicture!,
                                    width: 125,
                                    height: 125,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 2,
                                  child: GestureDetector(
                                    onTap: selectProfilePicture,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      focusNode: focusNodeFirstName,
                      controller: firstNameController,
                      hintText: "First Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeLastName.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AuthTextField(
                      focusNode: focusNodeLastName,
                      controller: lastNameController,
                      hintText: "Last Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeDOB.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AuthTextField(
                focusNode: focusNodeDOB,
                controller: dobController,
                hintText: "Select Date of Birth",
                keyboardType: TextInputType.text,
                readOnly: true,
                prefixIcon: const Icon(Icons.calendar_month_outlined),
                onEditingComplete: () {},
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please select birth date";
                  }
                  return null;
                },
                onTap: selectDOB,
              ),
              const SizedBox(height: 25),
              AuthSubmitButton(
                text: "Submit",
                onPressed: onClickSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectDOB() async {
    DateTime? dt = await context.selectDate(
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 12)),
    );
    if (dt == null) return;
    dob = dt;
    dobController.text = DateFormat("dd/MM/yyyy").format(dt);
  }

  void selectProfilePicture() async {
    File? file = await MediaUtil.selectImage();
    if (file == null) return;
    context.read<ProfileSetupScreenBloc>().add(ProfilePictureChange(file: file));
  }

  void onClickSubmit() {
    removeFocus();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<ProfileSetupScreenBloc>().add(SubmitForm(firstName: firstName, lastName: lastName, dateOfBirth: dob!));
  }
}""";

  static const String profileSetupScreenRepositoryFileContent = """class ProfileSetupScreenRepository {}""";

  static const String profileSetupScreenBlocFileContent = """import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'profile_setup_screen_event.dart';

part 'profile_setup_screen_state.dart';

class ProfileSetupScreenBloc extends Bloc<ProfileSetupScreenEvent, ProfileSetupScreenState> {
  ProfileSetupScreenBloc() : super(ProfileSetupScreenState()) {
    on<ProfilePictureChange>((event, emit) {
      state.profilePicture = event.file;
      emit(state.copy());
    });
    on<SubmitForm>((event, emit) {});
  }
}""";

  static const String profileSetupScreenEventFileContent = """part of 'profile_setup_screen_bloc.dart';

sealed class ProfileSetupScreenEvent {}

class ProfilePictureChange extends ProfileSetupScreenEvent {
  ProfilePictureChange({required this.file});
  final File file;
}

class SubmitForm extends ProfileSetupScreenEvent {
  SubmitForm({required this.firstName, required this.lastName, required this.dateOfBirth});
  String firstName;
  String lastName;
  DateTime dateOfBirth;
}""";

  static const String profileSetupScreenStateFileContent = """part of 'profile_setup_screen_bloc.dart';

class ProfileSetupScreenState {
  ProfileSetupScreenState({
    this.currentState = ActivityState.initial,
    this.firstName = "",
    this.lastName = "",
    this.dateOfBirth,
    this.profilePicture,
  });

  File? profilePicture;
  String firstName;
  String lastName;
  DateTime? dateOfBirth;
  ActivityState currentState;

  ProfileSetupScreenState copy() {
    return ProfileSetupScreenState(
      currentState: currentState,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      profilePicture: profilePicture,
    );
  }
}""";

  static const String editProfileScreenFileContent = """import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/edit_profile_screen/bloc/edit_profile_screen_bloc.dart';

import '../../../core/utils/common.dart';
import '../../../core/utils/date_picker_utils.dart';
import '../../../core/utils/media_utils.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/back_arrow.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final FocusNode focusNodeUsername = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeFirstName = FocusNode();
  final FocusNode focusNodeLastName = FocusNode();

  DateTime? dob;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    focusNodeUsername.dispose();
    focusNodeEmail.dispose();
    focusNodeFirstName.dispose();
    focusNodeLastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 35),
              BlocBuilder<EditProfileScreenBloc, EditProfileScreenState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: state.editProfileFile == null
                        ? GestureDetector(
                            onTap: chooseImage,
                            child: Column(
                              children: [
                                Container(
                                  width: 125,
                                  height: 125,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black12,
                                  ),
                                  child: const Icon(Icons.person, color: Colors.white70, size: 50),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Select a profile picture",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 125,
                            height: 125,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    state.editProfileFile!,
                                    width: 125,
                                    height: 125,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 2,
                                  child: GestureDetector(
                                    onTap: chooseImage,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      focusNode: focusNodeFirstName,
                      controller: firstNameController,
                      hintText: "First Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeLastName.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      focusNode: focusNodeLastName,
                      controller: lastNameController,
                      hintText: "Last Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeUsername.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppTextField(
                focusNode: focusNodeUsername,
                controller: usernameController,
                hintText: "Enter username",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_outline),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9_.]'))],
                onEditingComplete: () {
                  focusNodeEmail.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 20),
              AppTextField(
                controller: dobController,
                hintText: "Select Date of Birth",
                keyboardType: TextInputType.text,
                readOnly: true,
                prefixIcon: const Icon(Icons.calendar_month_outlined),
                onEditingComplete: () {},
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please select birth date";
                  }
                  return null;
                },
                onTap: selectDOB,
              ),
              const SizedBox(height: 20),
              AuthSubmitButton(
                text: "Update",
                onPressed: update,
              )
            ],
          ),
        ),
      ),
    );
  }

  void update() {
    removeFocus();
  }

  void chooseImage() async {
    File? file = await MediaUtil.selectImage();
    if (file == null) return;
    context.read<EditProfileScreenBloc>().add(ChangeProfileFile(file: file));
  }

  void selectDOB() async {
    DateTime? dt = await context.selectDate(
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 12)),
    );
    if (dt == null) return;
    dob = dt;
    dobController.text = DateFormat("dd/MM/yyyy").format(dt);
  }
}""";

  static const String editProfileScreenRepositoryFileContent = """class EditProfileScreenRepository {}""";

  static const String editProfileScreenBlocFileContent = """import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'edit_profile_screen_event.dart';

part 'edit_profile_screen_state.dart';

class EditProfileScreenBloc extends Bloc<EditProfileScreenEvent, EditProfileScreenState> {
  EditProfileScreenBloc() : super(EditProfileScreenState()) {
    on<ChangeProfileFile>((event, emit) {
      state.editProfileFile = event.file;
      emit(state.copy());
    });
  }
}""";

  static const String editProfileScreenEventFileContent = """part of 'edit_profile_screen_bloc.dart';

sealed class EditProfileScreenEvent {}

class ChangeProfileFile extends EditProfileScreenEvent {
  ChangeProfileFile({required this.file});
  final File file;
}""";

  static const String editProfileScreenStateFileContent = """part of 'edit_profile_screen_bloc.dart';

class EditProfileScreenState {
  EditProfileScreenState({
    this.currentState = ActivityState.initial,
    this.editProfileFile,
  });

  File? editProfileFile;
  ActivityState currentState;

  EditProfileScreenState copy() {
    return EditProfileScreenState(
      currentState: currentState,
      editProfileFile: editProfileFile,
    );
  }
}""";

  static const String cubitLoginScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/login_screen/cubit/login_screen_cubit.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';

import '../../../core/utils/common.dart';
import '../../..//widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 70, bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Log In",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              AuthTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                onEditingComplete: () {
                  focusNodePassword.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!isValidEmail(value!.trim())) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<LoginScreenCubit, LoginScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodePassword,
                    controller: passwordController,
                    hintText: "Enter password",
                    obscureText: state.showPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<LoginScreenCubit>().togglePassword();
                      },
                    ),
                    onEditingComplete: login,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: navigateToForgotPasswordScreen,
                  child: Text(
                    "Forgot password",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ),
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Login",
                onPressed: login,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: "Don't have an account?  ",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: "Sign Up",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()..onTap = navigateToRegisterScreen,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void navigateToRegisterScreen() {}

  void navigateToForgotPasswordScreen() {}

  void login() {
    removeFocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    context.read<LoginScreenCubit>().login(email: email, password: password);
  }
}""";

  static const String cubitLoginScreenCubitFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'login_screen_state.dart';

class LoginScreenCubit extends Cubit<LoginScreenState> {
  LoginScreenCubit() : super(LoginScreenState());

  void togglePassword() {
    state.showPassword = !state.showPassword;
    emit(state.copy());
  }

  void login({required String email, required String password}) {}
}""";

  static const String cubitLoginScreenStateFileContent = """part of 'login_screen_cubit.dart';

class LoginScreenState {
  LoginScreenState({
    this.currentState = ActivityState.initial,
    this.showPassword = true,
  });

  bool showPassword;
  ActivityState currentState;

  LoginScreenState copy() {
    return LoginScreenState(currentState: currentState, showPassword: showPassword);
  }
}""";

  static const String cubitRegisterScreenFileContent = """import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/register_screen/cubit/register_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final FocusNode focusNodeUsername = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    focusNodeEmail.dispose();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    focusNodeUsername.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Sign Up",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              AuthTextField(
                focusNode: focusNodeUsername,
                controller: usernameController,
                hintText: "Enter username",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_outline),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9_.]'))],
                onEditingComplete: () {
                  focusNodeEmail.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              AuthTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.email_outlined),
                onEditingComplete: () {
                  focusNodePassword.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!isValidEmail(value!.trim())) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodePassword,
                    controller: passwordController,
                    hintText: "Enter password",
                    obscureText: state.showPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<RegisterScreenCubit>().togglePassword();
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeConfirmPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<RegisterScreenCubit, RegisterScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeConfirmPassword,
                    controller: confirmPasswordController,
                    hintText: "Enter confirm password",
                    obscureText: state.showConfirmPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<RegisterScreenCubit>().toggleConfirmPassword();
                      },
                    ),
                    onEditingComplete: register,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter confirm password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
                        return "Password and confirmation password are not match";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Sign Up",
                onPressed: register,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 60,
        alignment: Alignment.center,
        child: RichText(
          text: TextSpan(
            text: "Already have an account?  ",
            style: Theme.of(context).textTheme.bodyMedium,
            children: [
              TextSpan(
                text: "Log In",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    Navigator.pop(context);
                  },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void register() {
    removeFocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    String userName = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    context.read<RegisterScreenCubit>().register(
          userName: userName,
          email: email,
          password: password,
        );
  }
}""";

  static const String cubitRegisterScreenCubitFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'register_screen_state.dart';

class RegisterScreenCubit extends Cubit<RegisterScreenState> {
  RegisterScreenCubit() : super(RegisterScreenState());

  void togglePassword() {
    state.showPassword = !state.showPassword;
    emit(state.copy());
  }

  void toggleConfirmPassword() {
    state.showConfirmPassword = !state.showConfirmPassword;
    emit(state.copy());
  }

  void register({required String userName, required String email, required String password}) {}
}""";

  static const String cubitRegisterScreenStateFileContent = """part of 'register_screen_cubit.dart';

class RegisterScreenState {
  RegisterScreenState({
    this.currentState = ActivityState.initial,
    this.showPassword = true,
    this.showConfirmPassword = true,
  });

  bool showPassword;
  bool showConfirmPassword;
  ActivityState currentState;

  RegisterScreenState copy() {
    return RegisterScreenState(
      currentState: currentState,
      showPassword: showPassword,
      showConfirmPassword: showConfirmPassword,
    );
  }
}""";

  static const String cubitForgotPasswordScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/forgot_password_screen/cubit/forgot_password_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final FocusNode focusNodeEmail = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    focusNodeEmail.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Forgot password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              Text(
                "We will send you link to your Email Address to reset your password. You can come back to App after resetting password",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 25),
              AuthTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                onEditingComplete: sendEmail,
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter email address";
                  } else if (!isValidEmail(value!.trim())) {
                    return "Please enter valid email address";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Send Email",
                onPressed: sendEmail,
              )
            ],
          ),
        ),
      ),
    );
  }

  void sendEmail() {
    removeFocus();
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<ForgotPasswordScreenCubit>().sendEmail(email: emailController.text.trim());
  }
}""";

  static const String cubitForgotPasswordScreenCubitFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'forgot_password_screen_state.dart';

class ForgotPasswordScreenCubit extends Cubit<ForgotPasswordScreenState> {
  ForgotPasswordScreenCubit() : super(ForgotPasswordScreenState());
  void sendEmail({required String email}) {}
}""";

  static const String cubitForgotPasswordScreenStateFileContent = """part of 'forgot_password_screen_cubit.dart';

class ForgotPasswordScreenState {
  ForgotPasswordScreenState({this.currentState = ActivityState.initial});

  ActivityState currentState;

  ForgotPasswordScreenState copy() {
    return ForgotPasswordScreenState(currentState: currentState);
  }
}""";

  static const String cubitResetPasswordScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/reset_password_screen/cubit/reset_password_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final FocusNode focusNodePassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    passwordController.clear();
    confirmPasswordController.clear();
    focusNodePassword.dispose();
    focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leadingWidth: 60,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Hero(
                  tag: "title",
                  child: FlutterLogo(size: 80),
                ),
              ),
              Text(
                "Reset password",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 25),
              Text(
                "Enter and confirm your new password below to complete the change. After updating, use your new password to log in to the app.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 15),
              BlocBuilder<ResetPasswordScreenCubit, ResetPasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodePassword,
                    controller: passwordController,
                    hintText: "Enter new password",
                    obscureText: state.showPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ResetPasswordScreenCubit>().togglePassword();
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeConfirmPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter new password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<ResetPasswordScreenCubit, ResetPasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeConfirmPassword,
                    controller: confirmPasswordController,
                    hintText: "Enter confirm password",
                    obscureText: state.showConfirmPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ResetPasswordScreenCubit>().toggleConfirmPassword();
                      },
                    ),
                    onEditingComplete: changePassword,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter confirm password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      } else if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
                        return "Password and confirmation password are not match";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Send Email",
                onPressed: changePassword,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() {
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<ResetPasswordScreenCubit>().changePassword(password: passwordController.text.trim());
  }
}""";

  static const String cubitResetPasswordScreenCubitFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'reset_password_screen_state.dart';

class ResetPasswordScreenCubit extends Cubit<ResetPasswordScreenState> {
  ResetPasswordScreenCubit() : super(ResetPasswordScreenState());

  void togglePassword() {
    state.showPassword = !state.showPassword;
    emit(state.copy());
  }

  void toggleConfirmPassword() {
    state.showConfirmPassword = !state.showConfirmPassword;
    emit(state.copy());
  }

  void changePassword({required String password}) {}
}""";
  static const String cubitResetPasswordScreenStateFileContent = """part of 'reset_password_screen_cubit.dart';

class ResetPasswordScreenState {
  ResetPasswordScreenState({
    this.currentState = ActivityState.initial,
    this.showPassword = true,
    this.showConfirmPassword = true,
  });

  bool showPassword;
  bool showConfirmPassword;
  ActivityState currentState;

  ResetPasswordScreenState copy() {
    return ResetPasswordScreenState(
      currentState: currentState,
      showPassword: showPassword,
      showConfirmPassword: showConfirmPassword,
    );
  }
}""";

  static const String cubitChangePasswordScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/change_password_screen/cubit/change_password_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';
import '../../../widgets/back_arrow.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController currentPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final FocusNode focusNodeCurrentPassword = FocusNode();
  final FocusNode focusNodeNewPassword = FocusNode();
  final FocusNode focusNodeConfirmPassword = FocusNode();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    focusNodeCurrentPassword.dispose();
    focusNodeNewPassword.dispose();
    focusNodeConfirmPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text("Change Password"),
        centerTitle: true,
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 25),
              Text(
                "Enter your current password, then set and confirm your new password below. After updating, use your new password to log in to the app.",
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(fontSize: 13),
              ),
              const SizedBox(height: 30),
              BlocBuilder<ChangePasswordScreenCubit, ChangePasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeCurrentPassword,
                    controller: currentPasswordController,
                    hintText: "Enter Current password",
                    obscureText: state.showCurrentPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showCurrentPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ChangePasswordScreenCubit>().toggleCurrentPassword();
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeNewPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter current password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<ChangePasswordScreenCubit, ChangePasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeNewPassword,
                    controller: newPasswordController,
                    hintText: "Enter new password",
                    obscureText: state.showNewPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showNewPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ChangePasswordScreenCubit>().toggleNewPassword();
                      },
                    ),
                    onEditingComplete: () {
                      focusNodeConfirmPassword.requestFocus();
                    },
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter new password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              BlocBuilder<ChangePasswordScreenCubit, ChangePasswordScreenState>(
                builder: (context, state) {
                  return AuthTextField(
                    focusNode: focusNodeConfirmPassword,
                    controller: confirmPasswordController,
                    hintText: "Enter confirm password",
                    obscureText: state.showConfirmPassword,
                    keyboardType: TextInputType.text,
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: InkWell(
                      child: Icon(state.showConfirmPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined),
                      onTap: () {
                        context.read<ChangePasswordScreenCubit>().toggleConfirmPassword();
                      },
                    ),
                    onEditingComplete: changePassword,
                    validator: (value) {
                      if ((value ?? "").trim().isEmpty) {
                        return "Please enter confirm password";
                      } else if (!isValidPassword(value!.trim())) {
                        return "Password must be at least 6 characters long, contain at least one letter, and one number";
                      } else if (newPasswordController.text.trim() != confirmPasswordController.text.trim()) {
                        return "Password and confirmation password are not match";
                      }
                      return null;
                    },
                  );
                },
              ),
              const SizedBox(height: 15),
              AuthSubmitButton(
                text: "Submit",
                onPressed: changePassword,
              )
            ],
          ),
        ),
      ),
    );
  }

  void changePassword() {
    if (!formKey.currentState!.validate()) return;
    context.read<ChangePasswordScreenCubit>().changePassword(
          currentPassword: currentPasswordController.text.trim(),
          newPassword: newPasswordController.text.trim(),
        );
  }
}""";

  static const String cubitChangePasswordScreenCubitFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'change_password_screen_state.dart';

class ChangePasswordScreenCubit extends Cubit<ChangePasswordScreenState> {
  ChangePasswordScreenCubit() : super(ChangePasswordScreenState());

  void toggleCurrentPassword() {
    state.showCurrentPassword = !state.showCurrentPassword;
    emit(state.copy());
  }

  void toggleNewPassword() {
    state.showNewPassword = !state.showNewPassword;
    emit(state.copy());
  }

  void toggleConfirmPassword() {
    state.showConfirmPassword = !state.showConfirmPassword;
    emit(state.copy());
  }

  void changePassword({required String currentPassword, required String newPassword}) {}
}""";
  static const String cubitChangePasswordScreenStateFileContent = """part of 'change_password_screen_cubit.dart';

class ChangePasswordScreenState {
  ChangePasswordScreenState({
    this.showCurrentPassword = true,
    this.showNewPassword = true,
    this.showConfirmPassword = true,
    this.currentState = ActivityState.initial,
  });

  bool showCurrentPassword;
  bool showNewPassword;
  bool showConfirmPassword;
  ActivityState currentState;

  ChangePasswordScreenState copy() {
    return ChangePasswordScreenState(
      showCurrentPassword: showCurrentPassword,
      showNewPassword: showNewPassword,
      showConfirmPassword: showConfirmPassword,
      currentState: currentState,
    );
  }
}""";

  static const String cubitOtpVerificationScreenFileContent = """import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/otp_verification_screen/cubit/otp_verification_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../widgets/auth_submit_button.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  String otp = "";

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return BaseScreen(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 70, bottom: 50),
              child: Hero(
                tag: "title",
                child: FlutterLogo(size: 80),
              ),
            ),
            Text(
              "OTP Verification",
              style: theme.textTheme.headlineMedium,
            ),
            const SizedBox(height: 15),
            Text(
              "Enter 6 digit OTP that has been sent to",
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: 5),
            Text(
              "someone@example.com",
              style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            SizedBox(
              child: OtpTextField(
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                borderRadius: BorderRadius.circular(5),
                contentPadding: EdgeInsets.zero,
                alignment: Alignment.center,
                showFieldAsBox: true,
                numberOfFields: 6,
                fieldHeight: 60,
                styles: [
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                  theme.textTheme.titleLarge,
                ],
                onCodeChanged: (value) {
                  otp = value.trim();
                },
                onSubmit: (value) {
                  if (value.trim().length == 6) {
                    otp = value.trim();
                    submitOtp();
                  }
                },
              ),
            ),
            const SizedBox(height: 25),
            AuthSubmitButton(
              text: "Verify",
              onPressed: submitOtp,
            )
          ],
        ),
      ),
    );
  }

  void submitOtp() {
    removeFocus();
    context.read<OtpVerificationScreenCubit>().otpSubmit(otp: otp);
  }
}""";

  static const String cubitOtpVerificationScreenCubitFileContent = """import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'otp_verification_screen_state.dart';

class OtpVerificationScreenCubit extends Cubit<OtpVerificationScreenState> {
  OtpVerificationScreenCubit() : super(OtpVerificationScreenState());

  void otpSubmit({required String otp}) {}
}""";

  static const String cubitOtpVerificationScreenStateFileContent = """part of 'otp_verification_screen_cubit.dart';

class OtpVerificationScreenState {
  OtpVerificationScreenState({this.currentState = ActivityState.initial});

  ActivityState currentState;

  OtpVerificationScreenState copy() {
    return OtpVerificationScreenState(currentState: currentState);
  }
}""";

  static const String cubitProfileSetupScreenFileContent = """import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/profile_setup_screen/cubit/profile_setup_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../core/utils/media_utils.dart';
import '../../../core/utils/date_picker_utils.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/auth_textfield.dart';

class ProfileSetupScreen extends StatefulWidget {
  const ProfileSetupScreen({super.key});

  @override
  State<ProfileSetupScreen> createState() => _ProfileSetupScreenState();
}

class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final FocusNode focusNodeFirstName = FocusNode();
  final FocusNode focusNodeLastName = FocusNode();
  final FocusNode focusNodeDOB = FocusNode();

  DateTime? dob;

  late GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    focusNodeFirstName.dispose();
    focusNodeLastName.dispose();
    focusNodeDOB.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: Text(
          "Complete profile",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontSize: 24),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text("Skip"),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 35),
              BlocBuilder<ProfileSetupScreenCubit, ProfileSetupScreenState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: state.profilePicture == null
                        ? GestureDetector(
                            onTap: selectProfilePicture,
                            child: Column(
                              children: [
                                Container(
                                  width: 125,
                                  height: 125,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black12,
                                  ),
                                  child: const Icon(Icons.person, color: Colors.white70, size: 50),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Select a profile picture",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 125,
                            height: 125,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    state.profilePicture!,
                                    width: 125,
                                    height: 125,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 2,
                                  child: GestureDetector(
                                    onTap: selectProfilePicture,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AuthTextField(
                      focusNode: focusNodeFirstName,
                      controller: firstNameController,
                      hintText: "First Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeLastName.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: AuthTextField(
                      focusNode: focusNodeLastName,
                      controller: lastNameController,
                      hintText: "Last Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeDOB.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              AuthTextField(
                focusNode: focusNodeDOB,
                controller: dobController,
                hintText: "Select Date of Birth",
                keyboardType: TextInputType.text,
                readOnly: true,
                prefixIcon: const Icon(Icons.calendar_month_outlined),
                onEditingComplete: () {},
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please select birth date";
                  }
                  return null;
                },
                onTap: selectDOB,
              ),
              const SizedBox(height: 25),
              AuthSubmitButton(
                text: "Submit",
                onPressed: onClickSubmit,
              )
            ],
          ),
        ),
      ),
    );
  }

  void selectDOB() async {
    DateTime? dt = await context.selectDate(
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 12)),
    );
    if (dt == null) return;
    dob = dt;
    dobController.text = DateFormat("dd/MM/yyyy").format(dt);
  }

  void selectProfilePicture() async {
    File? file = await MediaUtil.selectImage();
    if (file == null) return;
    context.read<ProfileSetupScreenCubit>().changeProfilePicture(profilePicture: file);
  }

  void onClickSubmit() {
    removeFocus();
    String firstName = firstNameController.text.trim();
    String lastName = lastNameController.text.trim();
    if (!(formKey.currentState?.validate() ?? false)) return;
    context.read<ProfileSetupScreenCubit>().submitProfile(firstName: firstName, lastName: lastName, dateOfBirth: dob!);
  }
}""";

  static const String cubitProfileSetupScreenCubitFileContent = """import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'profile_setup_screen_state.dart';

class ProfileSetupScreenCubit extends Cubit<ProfileSetupScreenState> {
  ProfileSetupScreenCubit() : super(ProfileSetupScreenState());

  void changeProfilePicture({required File? profilePicture}) {
    state.profilePicture = profilePicture;
    emit(state.copy());
  }

  void submitProfile({required String firstName, required String lastName, required DateTime? dateOfBirth}) {}
}""";

  static const String cubitProfileSetupScreenStateFileContent = """part of 'profile_setup_screen_cubit.dart';

class ProfileSetupScreenState {
  ProfileSetupScreenState({
    this.currentState = ActivityState.initial,
    this.firstName = "",
    this.lastName = "",
    this.dateOfBirth,
    this.profilePicture,
  });

  File? profilePicture;
  String firstName;
  String lastName;
  DateTime? dateOfBirth;
  ActivityState currentState;

  ProfileSetupScreenState copy() {
    return ProfileSetupScreenState(
      currentState: currentState,
      firstName: firstName,
      lastName: lastName,
      dateOfBirth: dateOfBirth,
      profilePicture: profilePicture,
    );
  }
}""";

  static const String cubitEditProfileScreenFileContent = """import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:<app_name>/App/screens/base_screen/view/base_screen.dart';
import 'package:<app_name>/App/screens/edit_profile_screen/cubit/edit_profile_screen_cubit.dart';

import '../../../core/utils/common.dart';
import '../../../core/utils/date_picker_utils.dart';
import '../../../core/utils/media_utils.dart';
import '../../../widgets/app_textfield.dart';
import '../../../widgets/auth_submit_button.dart';
import '../../../widgets/back_arrow.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController dobController = TextEditingController();

  final FocusNode focusNodeUsername = FocusNode();
  final FocusNode focusNodeEmail = FocusNode();
  final FocusNode focusNodeFirstName = FocusNode();
  final FocusNode focusNodeLastName = FocusNode();

  DateTime? dob;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    usernameController.dispose();
    emailController.dispose();
    firstNameController.dispose();
    lastNameController.dispose();
    dobController.dispose();
    focusNodeUsername.dispose();
    focusNodeEmail.dispose();
    focusNodeFirstName.dispose();
    focusNodeLastName.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      appBar: AppBar(
        title: const Text("Edit Profile"),
        leading: const BackArrow(),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: 35),
              BlocBuilder<EditProfileScreenCubit, EditProfileScreenState>(
                builder: (context, state) {
                  return AnimatedSwitcher(
                    duration: const Duration(seconds: 1),
                    child: state.editProfileFile == null
                        ? GestureDetector(
                            onTap: chooseImage,
                            child: Column(
                              children: [
                                Container(
                                  width: 125,
                                  height: 125,
                                  alignment: Alignment.center,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.black12,
                                  ),
                                  child: const Icon(Icons.person, color: Colors.white70, size: 50),
                                ),
                                const SizedBox(height: 20),
                                Text(
                                  "Select a profile picture",
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ],
                            ),
                          )
                        : SizedBox(
                            width: 125,
                            height: 125,
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(60),
                                  child: Image.file(
                                    state.editProfileFile!,
                                    width: 125,
                                    height: 125,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Positioned(
                                  right: 5,
                                  bottom: 2,
                                  child: GestureDetector(
                                    onTap: chooseImage,
                                    child: Container(
                                      width: 30,
                                      height: 30,
                                      decoration: const BoxDecoration(color: Colors.black38, shape: BoxShape.circle),
                                      child: const Icon(
                                        Icons.edit,
                                        size: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                  );
                },
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: AppTextField(
                      focusNode: focusNodeFirstName,
                      controller: firstNameController,
                      hintText: "First Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeLastName.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your first name";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: AppTextField(
                      focusNode: focusNodeLastName,
                      controller: lastNameController,
                      hintText: "Last Name",
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: const Icon(Icons.person_outline),
                      onEditingComplete: () {
                        focusNodeUsername.requestFocus();
                      },
                      validator: (value) {
                        if ((value ?? "").trim().isEmpty) {
                          return "Please enter your last name";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              AppTextField(
                focusNode: focusNodeUsername,
                controller: usernameController,
                hintText: "Enter username",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.person_outline),
                inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-z0-9_.]'))],
                onEditingComplete: () {
                  focusNodeEmail.requestFocus();
                },
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please enter username";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              AppTextField(
                focusNode: focusNodeEmail,
                controller: emailController,
                hintText: "Enter email address",
                keyboardType: TextInputType.text,
                prefixIcon: const Icon(Icons.email_outlined),
              ),
              const SizedBox(height: 20),
              AppTextField(
                controller: dobController,
                hintText: "Select Date of Birth",
                keyboardType: TextInputType.text,
                readOnly: true,
                prefixIcon: const Icon(Icons.calendar_month_outlined),
                onEditingComplete: () {},
                validator: (value) {
                  if ((value ?? "").trim().isEmpty) {
                    return "Please select birth date";
                  }
                  return null;
                },
                onTap: selectDOB,
              ),
              const SizedBox(height: 20),
              AuthSubmitButton(
                text: "Update",
                onPressed: update,
              )
            ],
          ),
        ),
      ),
    );
  }

  void update() {
    removeFocus();
  }

  void chooseImage() async {
    File? file = await MediaUtil.selectImage();
    if (file == null) return;
    context.read<EditProfileScreenCubit>().changeProfilePicture(profileFile: file);
  }

  void selectDOB() async {
    DateTime? dt = await context.selectDate(
      firstDate: DateTime.now().subtract(const Duration(days: 365 * 100)),
      lastDate: DateTime.now().subtract(const Duration(days: 365 * 12)),
    );
    if (dt == null) return;
    dob = dt;
    dobController.text = DateFormat("dd/MM/yyyy").format(dt);
  }
}""";

  static const String cubitEditProfileScreenCubitFileContent = """import 'dart:io';

import 'package:bloc/bloc.dart';

import '../../../core/enums/enums.dart';

part 'edit_profile_screen_state.dart';

class EditProfileScreenCubit extends Cubit<EditProfileScreenState> {
  EditProfileScreenCubit() : super(EditProfileScreenState()) {}
  void changeProfilePicture({required File? profileFile}) {
    state.editProfileFile = profileFile;
    emit(state.copy());
  }
}""";
  static const String cubitEditProfileScreenStateFileContent = """part of 'edit_profile_screen_cubit.dart';

class EditProfileScreenState {
  EditProfileScreenState({
    this.currentState = ActivityState.initial,
    this.editProfileFile,
  });

  File? editProfileFile;
  ActivityState currentState;

  EditProfileScreenState copy() {
    return EditProfileScreenState(
      currentState: currentState,
      editProfileFile: editProfileFile,
    );
  }
}""";
}
