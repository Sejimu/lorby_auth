import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  bool _obscurepass = true;
  bool _obscurepassConfirm = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userloginController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfirmController =
      TextEditingController();
  bool btnReady = false;

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_btnSwitcher);
    _passwordController.addListener(_btnSwitcher);
    _userloginController.addListener(_btnSwitcher);
    _passwordConfirmController.addListener(_btnSwitcher);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfirmController.dispose();
    _userloginController.dispose();
    super.dispose();
  }

  void _btnSwitcher() {
    setState(() {
      btnReady = _emailController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _userloginController.text.isNotEmpty &&
          _passwordConfirmController.text.isNotEmpty;
    });
  }

  Color _passwordConfirmColor() {
    String password = _passwordController.text;
    String passwordConfirm = _passwordConfirmController.text;
    if (password == passwordConfirm) {
      return Colors.black;
    } else if (passwordConfirm.isNotEmpty) {
      return Colors.red;
    }
    return Colors.black;
  }

  Color _passwordTextColor() {
    String password = _passwordController.text;

    if (password.length >= 8 &&
        password.length <= 15 &&
        password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[A-Z]')) &&
        password.contains(RegExp(r'[0-9]')) &&
        password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return Colors.black;
    } else if (password.isNotEmpty) {
      return Colors.red;
    }
    return Colors.black;
  }

  Color _firstTextColor() {
    String password = _passwordController.text;

    if (password.length >= 8 && password.length <= 15) {
      return Colors.green;
    } else if (password.isNotEmpty) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Color _secondTextColor() {
    String password = _passwordController.text;

    if (password.contains(RegExp(r'[a-z]')) &&
        password.contains(RegExp(r'[A-Z]'))) {
      return Colors.green;
    } else if (password.isNotEmpty) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Color _thirdTextColor() {
    String password = _passwordController.text;

    if (password.contains(RegExp(r'[0-9]'))) {
      return Colors.green;
    } else if (password.isNotEmpty) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  Color _fourthTextColor() {
    String password = _passwordController.text;
    if (password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'))) {
      return Colors.green;
    } else if (password.isNotEmpty) {
      return Colors.red;
    } else {
      return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Регистрация',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 40,
            ),
            const Center(
              child: Text(
                "Создать аккаунт \n Lorby ",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Center(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    width: 366,
                    height: 52,
                    padding: EdgeInsets.fromLTRB(13, 16, 13, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF8F8F8),
                    ),
                    child: TextField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Введи адрес почты',
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 14),
                    width: 366,
                    height: 52,
                    padding: EdgeInsets.fromLTRB(13, 16, 13, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF8F8F8),
                    ),
                    child: TextField(
                      controller: _userloginController,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Придумай логин',
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 14, 0, 24),
                    width: 366,
                    height: 52,
                    padding: const EdgeInsets.fromLTRB(13, 16, 13, 16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color(0xFFF8F8F8),
                    ),
                    child: TextField(
                      style: TextStyle(color: _passwordTextColor()),
                      controller: _passwordController,
                      obscureText: _obscurepass,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                _obscurepass = !_obscurepass;
                              });
                            },
                            icon: Icon(Icons.visibility)),
                        border: InputBorder.none,
                        hintText: 'Создай пароль',
                        contentPadding: EdgeInsets.symmetric(vertical: 8),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "· От 8 до 15 символов",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _firstTextColor()),
                  ),
                  Text(
                    "· Строчные и прописные буквы",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _secondTextColor()),
                  ),
                  Text(
                    "· Минимум 1 цифра",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _thirdTextColor()),
                  ),
                  Text(
                    "· Минимум 1 спецсимвол (!, '', #, \$...)",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: _fourthTextColor()),
                  ),
                ],
              ),
            ),
            Center(
              child: Container(
                margin: const EdgeInsets.fromLTRB(0, 14, 0, 5),
                width: 366,
                height: 52,
                padding: const EdgeInsets.fromLTRB(13, 16, 13, 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color(0xFFF8F8F8),
                ),
                child: TextField(
                  style: TextStyle(color: _passwordConfirmColor()),
                  controller: _passwordConfirmController,
                  obscureText: _obscurepassConfirm,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            _obscurepassConfirm = !_obscurepassConfirm;
                          });
                        },
                        icon: Icon(Icons.visibility)),
                    border: InputBorder.none,
                    hintText: 'Повтори пароль',
                    contentPadding: EdgeInsets.symmetric(vertical: 8),
                  ),
                ),
              ),
            ),
            _passwordConfirmColor() == Colors.red
                ? const Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Text(
                      "Пароли не совпадают",
                      style: TextStyle(color: Colors.red),
                    ),
                  )
                : SizedBox(),
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 24),
                width: 366,
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
                          Navigator.of(context).pushNamed('/confirm');
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
            ),
          ],
        ),
      ),
    );
  }
}
