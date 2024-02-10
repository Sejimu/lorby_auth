import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  var btnReady = false;
  bool _obscurepass = true;
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Screen'),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Image.asset("assets/globus.png"),
              const SizedBox(
                height: 36,
              ),
              const Text(
                "Велком бэк!",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500),
              ),
              Container(
                margin: EdgeInsets.only(top: 28),
                width: 328,
                height: 52,
                padding: EdgeInsets.fromLTRB(13, 16, 13, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF8F8F8),
                ),
                child: TextField(
                  controller: _usernameController,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Введи логин',
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 14, 0, 24),
                width: 328,
                height: 52,
                padding: const EdgeInsets.fromLTRB(13, 16, 13, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF8F8F8),
                ),
                child: TextField(
                  obscureText: _obscurepass,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurepass = !_obscurepass;
                          });
                        },
                        icon: Icon(Icons.visibility)),
                    border: InputBorder.none,
                    hintText: 'Введи пароль',
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
              Container(
                width: 343,
                height: 50,
                decoration: BoxDecoration(
                  color: btnReady ? Color(0xff292929) : Color(0xffD7D7D7),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                  onPressed: btnReady
                      ? () {
                          print(_usernameController.text);
                          print(_passwordController.text);
                        }
                      : null,
                  child: Text(
                    'Войти',
                    style: TextStyle(
                        color:
                            btnReady ? Colors.white : const Color(0xff767676)),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed("/register");
                  },
                  child: const Text(
                    "У меня еще нет аккаунта",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
