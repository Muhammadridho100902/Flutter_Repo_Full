import 'package:bank_sha/shared/theme.dart';
import 'package:bank_sha/ui/widgets/buttons.dart';
import 'package:bank_sha/ui/widgets/custom_pin_button.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class TotalAmount extends StatefulWidget {
  const TotalAmount({Key? key}) : super(key: key);

  @override
  State<TotalAmount> createState() => _TotalAmountState();
}

class _TotalAmountState extends State<TotalAmount> {
  final TextEditingController amountController =
      TextEditingController(text: '0');

  addAmount(String number) {
    if (amountController.text == '0') {
      amountController.text = '';
    }
    setState(() {
      amountController.text = amountController.text + number;
    });
  }

  deleteAmount() {
    if (amountController.text.isNotEmpty) {
      setState(() {
        amountController.text = amountController.text
            .substring(0, amountController.text.length - 1);
        if (amountController.text == '') {
          amountController.text = '0';
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();

    amountController.addListener(() {
      final text = amountController.text;

      amountController.value = amountController.value.copyWith(
        text: NumberFormat.currency(
          locale: 'id',
          symbol: '',
          decimalDigits: 0,
        ).format(
          int.parse(
            text.replaceAll('.', ''),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blackBackgroundColor,
      body: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 58, vertical: 20),
        child: Column(
          children: [
            SafeArea(
              child: Text(
                'Total Amount',
                style:
                    whiteTextStyle.copyWith(fontSize: 20, fontWeight: semiBold),
              ),
            ),
            const SizedBox(
              height: 72,
            ),
            Align(
              child: SizedBox(
                width: 300,
                child: TextFormField(
                  controller: amountController,
                  enabled: false,
                  style: whiteTextStyle.copyWith(
                    fontSize: 26,
                    fontWeight: medium,
                    letterSpacing: 3,
                  ),
                  decoration: InputDecoration(
                    prefixIcon: Text(
                      "Rp.",
                      style: whiteTextStyle.copyWith(
                        fontSize: 26,
                        fontWeight: medium,
                      ),
                    ),
                    disabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: greyColor,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Wrap(
              spacing: 40,
              runSpacing: 30,
              children: [
                CustomPinButton(
                  title: '1',
                  onTap: () => addAmount('1'),
                ),
                CustomPinButton(
                  title: '2',
                  onTap: () => addAmount('2'),
                ),
                CustomPinButton(
                  title: '3',
                  onTap: () => addAmount('3'),
                ),
                CustomPinButton(
                  title: '4',
                  onTap: () => addAmount('4'),
                ),
                CustomPinButton(
                  title: '5',
                  onTap: () => addAmount('5'),
                ),
                CustomPinButton(
                  title: '6',
                  onTap: () => addAmount('6'),
                ),
                CustomPinButton(
                  title: '7',
                  onTap: () => addAmount('7'),
                ),
                CustomPinButton(
                  title: '8',
                  onTap: () => addAmount('8'),
                ),
                CustomPinButton(
                  title: '9',
                  onTap: () => addAmount('9'),
                ),
                const SizedBox(
                  width: 60,
                  height: 60,
                ),
                CustomPinButton(
                  title: '0',
                  onTap: () => addAmount('0'),
                ),
                GestureDetector(
                  onTap: () {
                    deleteAmount();
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
            ),
            const SizedBox(
              height: 50,
            ),
            CustomeFilledButton(
              title: "Checkout Now",
              width: double.infinity,
              onPressed: () async {
                if (await Navigator.pushNamed(context, '/topUpSuccess') ==
                    true) {
                  // await launchUrl(
                  //   Uri.parse("https://demo.midtrans.com/"),
                  //   mode: LaunchMode.inAppWebView,
                  //   webViewConfiguration: const WebViewConfiguration(),
                  // );

                  Navigator.pushNamedAndRemoveUntil(
                      context, 'topUpSuccess', (route) => false);
                }
              },
            ),
          ],
        ),
      )),
    );
  }
}
