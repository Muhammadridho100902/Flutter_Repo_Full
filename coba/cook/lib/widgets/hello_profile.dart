import 'package:flutter/material.dart';

class Hello_Profile extends StatelessWidget {
  const Hello_Profile({Key? key, required this.user}) : super(key: key);

  final String user;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20 * 4, left: 20 * 2),
              child: Container(
                height: 100,
                width: 330,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Hello $user",
                        style: TextStyle(
                            fontSize: 36,
                            color: Colors.green[400],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "What you want to cook today?",
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.grey.shade500,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20 * 2, right: 20 * 2),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 70,
                  width: 70,
                  child: Image.asset(
                    "images/foto.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
