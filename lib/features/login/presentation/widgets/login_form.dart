import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/shared_prefs.dart';
import '../../../../di/injection.dart';
import '../../data/datasources/remote/login.dart';
import '../bloc/login_bloc.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  // Creates a global key that uniquely identifies the Login Form widget
  // and allows validation of the form.
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  // initial value for form autovalidation.
  // set to diabled and enable after first attempt to submit form
  // validate with userInteraction
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  bool _obsurePasswordText = true;

  @override
  void dispose() {
    // dispose state variables from widget tree when no longer being shown
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // AuthProvider _auth = Provider.of<AuthProvider>(context);

    return Form(
      key: _formKey,
      autovalidateMode: _autoValidateMode,
      child: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          if (state is LoginError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  state.error,
                  style: const TextStyle(color: Colors.white),
                ),
                backgroundColor: Colors.red,
              ),
            );
          }
          if (state is LoginSuccess) {
            /// login was a success.
            ///
            /// check if db has initial data loaded.
            Future<bool?> initialDataLoaded =
                Future.value(UserPrefences().initialDataLoaded());

            initialDataLoaded.then((value) {
              /// Initial data is loaded
              if (value != null && value) {
                return Navigator.pushNamedAndRemoveUntil(
                  context,
                  '/dashboard',
                  (route) => false,
                );
              }

              UserPrefences().setInitialDataLoaded(false);

              /// initialdata resolved with false
              return Navigator.pushNamedAndRemoveUntil(
                context,
                '/initial-data-dump',
                (route) => false,
              );
            });
          }
        },
        child: Column(
          children: [
            // username text field
            TextFormField(
              keyboardType: TextInputType.name,
              controller: _usernameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person_outline),
                hintText: 'Enter your username',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter username';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            // password textfield
            TextFormField(
              controller: _passwordController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline),
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _obsurePasswordText = !_obsurePasswordText;
                    });
                  },
                  icon: const Icon(Icons.visibility),
                ),
                hintText: 'Enter your password',
              ),
              obscureText: _obsurePasswordText,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 24.0,
            ),
            _buildLoginButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        if (state is LoginLoading) {
          return const CircularProgressIndicator();
        }
        return SizedBox(
          // fills available width
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              // checks is provided values on form are valid.
              // temporarily allow user to login with just a button click
              // when provided values are valid
              if (_formKey.currentState!.validate()) {
                context.read<LoginBloc>().add(
                      LoginButtonPressedEvent(
                          username: _usernameController.text,
                          password: _passwordController.text),
                    );
              } else {
                setState(() {
                  // validate input on user interaction
                  _autoValidateMode = AutovalidateMode.onUserInteraction;
                });
              }
            },
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                'Submit',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Theme.of(context).primaryColor),
            ),
          ),
        );
      },
    );
  }
}
