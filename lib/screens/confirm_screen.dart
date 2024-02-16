import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

class ConfirmScreen extends StatefulWidget {
  const ConfirmScreen({super.key});

  @override
  State<ConfirmScreen> createState() => _ConfirmScreenState();
}

class _ConfirmScreenState extends State<ConfirmScreen> {
  final TextEditingController _pinCodeController = TextEditingController();
  bool btnReady = false;
  Timer? _timer;
  int _secondsRemaining = 59;
  bool _timerRunning = true;

  @override
  void initState() {
    _pinCodeController.addListener(_btnSwitcher);
    startTimer();
    super.initState();
  }

  @override
  void dispose() {
    _pinCodeController.dispose();
    _timer!.cancel();
    super.dispose();
  }

  void _btnSwitcher() {
    setState(() {
      btnReady = _pinCodeController.text.isNotEmpty;
    });
  }

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        setState(() {
          if (_secondsRemaining < 1) {
            _timerRunning = false;
            timer.cancel();
            // Здесь можно обработать ситуацию, когда таймер истек
          } else {
            _secondsRemaining--;
          }
        });
      },
    );
  }

  void resetTimer() {
    setState(() {
      _secondsRemaining = 60;
      _timerRunning = true;
      startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    var hasError = true;
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
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              const Text(
                'Введи 4-значный код,\n высланный на \n example@gmail.com',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 38),
              PinCodeTextField(
                controller: _pinCodeController,
                autofocus: true,
                highlight: false,
                keyboardType: TextInputType.number,
                errorBorderColor: Colors.red,
                hasError: hasError,
                pinTextStyle: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                ),
                pinBoxRadius: 12,
                pinBoxBorderWidth: 0,
                pinBoxWidth: 56,
                pinBoxHeight: 64,
                pinBoxColor: Color(0xffF4F4F4),
                pinBoxDecoration:
                    ProvidedPinBoxDecoration.defaultPinBoxDecoration,
                pinTextAnimatedSwitcherDuration: Duration(milliseconds: 300),
                highlightAnimation: true,
                highlightAnimationBeginColor: Colors.black,
                highlightAnimationEndColor: Colors.white12,
              ),
              Visibility(
                visible: hasError,
                child: const Text(
                  "Неверный код",
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(
                height: 38,
              ),
              _timerRunning
                  ? Text(
                      'Выслать код еще раз через 0:$_secondsRemaining',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  : TextButton(
                      onPressed: () {
                        resetTimer();
                      },
                      child: const Text('Выслать код повторно',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: Colors.black)),
                    ),
              Container(
                margin: EdgeInsets.only(top: 18),
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
                          Navigator.of(context).pushNamed('/home');
                        }
                      : null,
                  child: Text(
                    'Подтвердить',
                    style: TextStyle(
                        color:
                            btnReady ? Colors.white : const Color(0xff767676)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
