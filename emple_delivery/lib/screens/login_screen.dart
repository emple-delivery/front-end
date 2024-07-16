import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'sign_up_user_screen.dart';
import 'sign_up_driver_screen.dart';
import 'driver_home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isLogin = true;
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final List<Map<String, String>> dummyUsers = [
    {'phone': '0912345678', 'password': 'userpassword1', 'type': 'user'},
    {'phone': '0912345679', 'password': 'userpassword2', 'type': 'user'},
    {'phone': '0912345680', 'password': 'userpassword3', 'type': 'user'},
    {'phone': '0912345681', 'password': 'driverpassword1', 'type': 'driver'},
    {'phone': '0912345682', 'password': 'driverpassword2', 'type': 'driver'},
    {'phone': '0912345683', 'password': 'driverpassword3', 'type': 'driver'},
    {'phone': '0912345684', 'password': 'driverpassword4', 'type': 'driver'},
  ];

  void validateLogin() {
    final phone = phoneController.text;
    final password = passwordController.text;
    final user = dummyUsers.firstWhere(
      (user) => user['phone'] == phone && user['password'] == password,
      orElse: () => {},
    );

    if (user.isNotEmpty) {
      if (user['type'] == 'user') {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      } else {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const DriverHomeScreen()),
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Login Failed'),
          content: const Text('Invalid phone number or password.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF95D186),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'), // Add your logo image in the assets folder
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.0),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLogin ? Colors.black : Colors.white,
                          foregroundColor: isLogin ? Colors.white : Colors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            isLogin = true;
                          });
                        },
                        child: const Text('Log-in'),
                      ),
                      const SizedBox(width: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isLogin ? Colors.white : Colors.black,
                          foregroundColor: isLogin ? Colors.black : Colors.white,
                        ),
                        onPressed: () {
                          setState(() {
                            isLogin = false;
                          });
                        },
                        child: const Text('Sign-up'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  isLogin ? buildLoginForm() : buildSignUpOptions(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLoginForm() {
    return Column(
      children: [
        TextField(
          controller: phoneController,
          decoration: const InputDecoration(labelText: 'Phone Number'),
          keyboardType: TextInputType.phone,
        ),
        TextField(
          controller: passwordController,
          decoration: const InputDecoration(labelText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: validateLogin,
          child: const Text('Sign In'),
        ),
        TextButton(
          onPressed: () {},
          child: const Text('Forgot password?'),
        ),
      ],
    );
  }

  Widget buildSignUpOptions() {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpUserScreen()),
            );
          },
          child: const Text('Sign up as a User'),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SignUpDriverScreen()),
            );
          },
          child: const Text('Sign up as a Driver'),
        ),
      ],
    );
  }
}
