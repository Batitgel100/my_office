import 'package:flutter/material.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:sms_autofill/sms_autofill.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Screen'),
      ),
      body: Center(
        child: OTPTextField(
          length: 6, // Specify the length of the OTP code
          width: MediaQuery.of(context).size.width,
          fieldWidth: 50,
          style: const TextStyle(fontSize: 17),
          textFieldAlignment: MainAxisAlignment.spaceAround,
          fieldStyle: FieldStyle.underline,
          onCompleted: (pin) {
            // This callback is triggered when the OTP code is entered completely
            print("Entered OTP: $pin");
            // You can perform further actions, such as validating the OTP
          },
        ),
      ),
    );
  }
}

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});

  @override
  _OTPVerificationScreenState createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  String _otpCode = '';

  @override
  void initState() {
    super.initState();
    _listenForOTP();
  }

  Future<void> _listenForOTP() async {
    SmsAutoFill().listenForCode;
    String code = await SmsAutoFill().getAppSignature;
    setState(() {
      _otpCode = code;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('OTP Verification'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Auto-filled OTP: $_otpCode',
              style: const TextStyle(fontSize: 20),
            ),
            ElevatedButton(
              child: const Text('Verify OTP'),
              onPressed: () {
                // Perform verification logic here
                // Compare the entered OTP with the auto-filled OTP (_otpCode)
              },
            ),
          ],
        ),
      ),
    );
  }
}
