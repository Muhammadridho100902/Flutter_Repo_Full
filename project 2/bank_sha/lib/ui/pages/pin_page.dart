import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/custom_pin_button.dart';
import 'package:flutter/material.dart';

class PinPage extends StatefulWidget {
  const PinPage({Key? key}) : super(key: key);

  @override
  State<PinPage> createState() => _PinPageState();
}

class _PinPageState extends State<PinPage> {
  final TextEditingController pinController = TextEditingController();

  addPin(String number) {
    if (pinController.text.length < 6) {
      setState(() {
        pinController.text = pinController.text + number;
      });
    }
    if (pinController.text == '123123') {
      Navigator.pushNamedAndRemoveUntil(context, '/totalAmount', (route) => false);
    }
  }

  deletePin() {
    if (pinController.text.isNotEmpty) {
      setState(() {
        pinController.text =
            pinController.text.substring(0, pinController.text.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 58),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Sha PIN',
              style:
                  whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
            ),
            const SizedBox(
              height: 72,
            ),
            SizedBox(
              width: 200,
              child: TextFormField(
                controller: pinController,
                obscureText: true,
                obscuringCharacter: '*',
                enabled: false,
                style: whiteTextStyle.copyWith(
                    fontSize: 36, fontWeight: medium, letterSpacing: 16),
                decoration: InputDecoration(
                    disabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: greyColor))),
              ),
            ),
            const SizedBox(
              height: 66,
            ),
            Wrap(
              spacing: 40,
              runSpacing: 40,
              children: [
                CustomPinButton(
                  title: '1',
                  onTap: () => addPin('1'),
                ),
                CustomPinButton(
                  title: '2',
                  onTap: () => addPin('2'),
                ),
                CustomPinButton(
                  title: '3',
                  onTap: () => addPin('3'),
                ),
                CustomPinButton(
                  title: '4',
                  onTap: () => addPin('4'),
                ),
                CustomPinButton(
                  title: '5',
                  onTap: () => addPin('5'),
                ),
                CustomPinButton(
                  title: '6',
                  onTap: () => addPin('6'),
                ),
                CustomPinButton(
                  title: '7',
                  onTap: () => addPin('7'),
                ),
                CustomPinButton(
                  title: '8',
                  onTap: () => addPin('8'),
                ),
                CustomPinButton(
                  title: '9',
                  onTap: () => addPin('9'),
                ),
                const SizedBox(
                  width: 60,
                  height: 60,
                ),
                CustomPinButton(
                  title: '0',
                  onTap: () => addPin('0'),
                ),
                GestureDetector(
                  onTap: () {
                    deletePin();
                  },
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: greyColor.withOpacity(0.2),
                    ),
                    child: Center(
                        child: Icon(
                      Icons.arrow_back,
                      color: whiteColor,
                    )),
                  ),
                ),
              ],
            )
          ],
        ),
      )),
    );
  }
}


