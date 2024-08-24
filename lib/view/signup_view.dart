import 'package:flutter/material.dart';
import 'package:mvvm/resources/components/round_button.dart';
import 'package:mvvm/utils/routes/routes_name.dart';
import 'package:mvvm/utils/utils.dart';
import 'package:mvvm/veiw_model/auth_view_model.dart';
import 'package:provider/provider.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<SignupView> createState() => _SignupViewState();
}

class _SignupViewState extends State<SignupView> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  ValueNotifier<bool> _obsecureText = ValueNotifier<bool>(true);

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    emailController.dispose();
    passwordController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    _obsecureText.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;

    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Signup Screen'),
        ),
        body: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              focusNode: emailFocusNode,
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'email',
                labelText: 'Email',
                prefixIcon: Icon(Icons.alternate_email),
              ),
              onFieldSubmitted: (value) {
                Utils.fieldFocusChange(
                    context, emailFocusNode, passwordFocusNode);
              },
            ),
            const SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
                valueListenable: _obsecureText,
                builder: (context, value, child) {
                  return TextFormField(
                    controller: passwordController,
                    focusNode: passwordFocusNode,
                    obscureText: _obsecureText.value,
                    obscuringCharacter: '*',
                    decoration: InputDecoration(
                      hintText: 'password',
                      labelText: 'Password',
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: InkWell(
                          onTap: () {
                            _obsecureText.value = !_obsecureText.value;
                          },
                          child: Icon(_obsecureText.value
                              ? Icons.visibility
                              : Icons.visibility_off_outlined)),
                    ),
                  );
                }),
            SizedBox(
              height: height * .1,
            ),
            RoundButton(
              title: 'Signup',
              loading: authViewModel.signupLoading,
              onPress: () {
                if (emailController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please Entre Email', context);
                } else if (passwordController.text.isEmpty) {
                  Utils.flushBarErrorMessage('Please Entre Password', context);
                } else if (passwordController.text.length < 6) {
                  Utils.flushBarErrorMessage(
                      'Password should be greater than 6 characters', context);
                } else {
                  Map data = {
                    'email': emailController.text.toString(),
                    'password': passwordController.text.toString()
                  };
                  authViewModel.signupApi(data, context);
                }
              },
            ),
            SizedBox(
              height: height * 0.02,
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, RouteName.LoginScreen);
              },
              child: const Text('Already have an account? Login'),
            )
          ],
        )));
  }
}
