import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/authentication/birthday_screen.dart';
import 'package:dart_tiktok/features/authentication/widgets/form_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController _passwordController = TextEditingController();
  String _password = "";
  bool _obscureText = true;
  final _regExp = RegExp(
    r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&^])[A-Za-z\d@$!%*#?&^]{8,20}$",
  );

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(
      () {
        setState(() {
          _password = _passwordController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  String? _isPasswordValid() {
    if (_password.isEmpty) return null;
    if (!_regExp.hasMatch(_password)) return "Password not valid";
    return null;
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_password.isEmpty || _isPasswordValid() != null) return;
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            const BirthdayScreen(),
      ),
    );
  }

  void _onClearTap() {
    _passwordController.clear();
  }

  void _toggleObscureTap() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Sign up"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gaps.v32,
              const Text(
                "Password",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _passwordController,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                obscureText: _obscureText,
                decoration: InputDecoration(
                  errorText: _isPasswordValid(),
                  suffix: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      GestureDetector(
                        onTap: _onClearTap,
                        child: const FaIcon(
                          FontAwesomeIcons.solidCircleXmark,
                          size: Sizes.size16,
                          color: Colors.black54,
                        ),
                      ),
                      Gaps.h20,
                      GestureDetector(
                        onTap: _toggleObscureTap,
                        child: FaIcon(
                          _obscureText
                              ? FontAwesomeIcons.eye
                              : FontAwesomeIcons.eyeSlash,
                          size: Sizes.size16,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                  hintText: "Password",
                  enabledBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                  focusedBorder: const UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black26,
                    ),
                  ),
                ),
                cursorColor: Theme.of(context).primaryColor,
              ),
              Gaps.v10,
              const Text(
                "Your password must have:",
                style: TextStyle(
                  fontSize: Sizes.size16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Gaps.v12,
              Column(
                children: [
                  Row(
                    children: [
                      FaIcon(
                        8 <= _password.length && _password.length <= 20
                            ? FontAwesomeIcons.circleCheck
                            : FontAwesomeIcons.circleXmark,
                        color: 8 <= _password.length && _password.length <= 20
                            ? Colors.green.shade600
                            : Colors.red,
                        size: Sizes.size16,
                      ),
                      Gaps.h5,
                      const Text(
                        "8 to 20 characters",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Gaps.v5,
                  Row(
                    children: [
                      FaIcon(
                        _regExp.hasMatch(_password)
                            ? FontAwesomeIcons.circleCheck
                            : FontAwesomeIcons.circleXmark,
                        color: _regExp.hasMatch(_password)
                            ? Colors.green.shade600
                            : Colors.red,
                        size: Sizes.size16,
                      ),
                      Gaps.h5,
                      const Text(
                        "Letters, numbers, and special characters",
                        style: TextStyle(
                          fontSize: Sizes.size16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: _password.isEmpty || _isPasswordValid() != null,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
