import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/authentication/password_screen.dart';
import 'package:dart_tiktok/features/authentication/widgets/form_button.dart';
import 'package:flutter/material.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController _emailController = TextEditingController();
  String _email = "";
  final _regExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );

  @override
  void initState() {
    super.initState(); // 구조 중요. 해당 코드가 최상단
    _emailController.addListener(
      () {
        setState(() {
          _email = _emailController.text;
        });
      },
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose(); // 구조 중요. 해당 코드가 최하단
    // _emailController와 이와 관련된 이벤트 리스너들을 모두 지운다.
  }

  bool _isEmailValid() => _email.isNotEmpty && _regExp.hasMatch(_email);

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  void _onSubmit() {
    if (_isEmailValid()) {
      Navigator.of(context).push(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              const PasswordScreen(),
        ),
      );
    }
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
                "What is your email?",
                style: TextStyle(
                  fontSize: Sizes.size24,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Gaps.v16,
              TextField(
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                onEditingComplete: _onSubmit,
                decoration: InputDecoration(
                  hintText: "Email",
                  errorText: _isEmailValid() ? null : "Email not valid",
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
              Gaps.v16,
              GestureDetector(
                onTap: _onSubmit,
                child: FormButton(
                  disabled: !_isEmailValid(),
                  text: "Next",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
