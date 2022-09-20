import 'package:flutter/material.dart';
import 'package:login_assignment/widgets/flip_card.dart';
import '../dummy_data.dart';
import 'package:provider/provider.dart';
import 'package:flip_card/flip_card.dart';

enum AuthState { Login, Signup }

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  AuthState _authState = AuthState.Login;
  late FocusNode myFocusNode;

  final Map<String, String?> _user = {
    "email": null,
    "password": null,
  };

  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    myFocusNode = FocusNode();
  }

  void _tryToLogin() {
    _formKey.currentState!.save();
    if (_formKey.currentState!.validate()) {
      final authProvider = Provider.of<DummyData>(context, listen: false);
      if (_authState == AuthState.Login) {
        authProvider.tryToLogin(_user['email']!, _user['password']!);
      } else {
        authProvider.addNewUser(_user['email']!, _user['password']!);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlipCardAnimation(),
                const SizedBox(
                  height: 50,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your email";
                      } else if (!value.contains("@")) {
                        return "Please enter a valid email";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _user['email'] = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Email",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.email),
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade50,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your password";
                      } else if (value.length < 5) {
                        return "Your Password should be at least 5 characters";
                      }
                      return null;
                    },
                    onSaved: (value) {
                      _user['password'] = value;
                    },
                    decoration: const InputDecoration(
                      hintText: "Password",
                      border: InputBorder.none,
                      prefixIcon: Icon(Icons.password),
                    ),
                    textInputAction: _authState == AuthState.Login
                        ? TextInputAction.done
                        : TextInputAction.next,
                    obscureText: true,
                  ),
                ),
                if (_authState == AuthState.Signup)
                  const SizedBox(
                    height: 10,
                  ),
                if (_authState == AuthState.Signup)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Fullname",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.person),
                      ),
                      textInputAction: TextInputAction.next,
                      //keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                if (_authState == AuthState.Signup)
                  const SizedBox(
                    height: 10,
                  ),
                if (_authState == AuthState.Signup)
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade50,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Phone Number",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.phone),
                      ),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                const SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          padding: const EdgeInsets.symmetric(vertical: 20),
                        ),
                        onPressed: _tryToLogin,
                        child: Text(
                          _authState == AuthState.Login ? "Login" : "Signup",
                          style: const TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                    ),
                  ],
                ),
                // const SizedBox(
                //   height: 10,
                // ),
                Row(
                  children: [
                    Text(_authState == AuthState.Login
                        ? "Don't have an account ? "
                        : "Already have an account"),
                    TextButton(
                      onPressed: () {
                        setState(() {
                          _authState = _authState == AuthState.Login
                              ? AuthState.Signup
                              : AuthState.Login;
                        });
                      },
                      child: Text(
                          _authState == AuthState.Login ? "Signup" : "Login"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
