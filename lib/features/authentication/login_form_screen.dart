import 'package:dart_tiktok/constants/gaps.dart';
import 'package:dart_tiktok/constants/sizes.dart';
import 'package:dart_tiktok/features/authentication/widgets/form_button.dart';
import 'package:dart_tiktok/features/onboarding/interests_screen.dart';
import 'package:flutter/material.dart';

class LoginFormScreen extends StatefulWidget {
  const LoginFormScreen({super.key});

  @override
  State<LoginFormScreen> createState() => _LoginFormScreenState();
}

class _LoginFormScreenState extends State<LoginFormScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Map<String, String> formData = {};

// 1. GlobalKey를 사용하여 Form의 currentState 에 엑세스하여 validate를 호출하여
  // 여러 TextField 위젯에 대한 유효성 검사를 한 번에 실행할 수 있다.
// 2. currentState.validate() 는 모든 하위 TextFormField 위젯의 유효성 검사를 실행하고
  // 모든 유효성 검사가 통과되면 true 를 반환한다.
  void _onSubmitTap() {
    if (_formKey.currentState != null) {
      if (_formKey.currentState!.validate()) {
        _formKey.currentState!.save();
        Navigator.of(context).pushAndRemoveUntil(
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                const InterestsScreen(),
          ),
          (route) => false,
        );
      }
    }
  }

  void _onScaffoldTap() {
    FocusScope.of(context).unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onScaffoldTap,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Log in"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  decoration: const InputDecoration(
                    hintText: "Email",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  validator: (value) {
                    //TextFormFiled에 입력한 텍스트 값
                    if (value != null && value.isEmpty) {
                      return "Plese write your email";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    // currentState.save() 에 저장된 순간의 값
                    if (newValue != null) {
                      formData["email"] = newValue;
                    }
                  },
                ),
                Gaps.v16,
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    hintText: "Password",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black26,
                      ),
                    ),
                  ),
                  cursorColor: Theme.of(context).primaryColor,
                  validator: (value) {
                    // String? value 이기에 value != null 을 설정
                    if (value != null && value.isEmpty) {
                      return "Plase write your password";
                    }
                    return null;
                  },
                  onSaved: (newValue) {
                    if (newValue != null) {
                      // String? newValue 이기에 newValue != null 을 설정
                      formData["password"] = newValue;
                    }
                  },
                ),
                Gaps.v28,
                GestureDetector(
                  onTap: _onSubmitTap,
                  child: const FormButton(
                    disabled: false,
                    text: "Log in",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
