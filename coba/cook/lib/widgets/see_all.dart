import 'package:flutter/material.dart';

class See_Container extends StatelessWidget {
  const See_Container({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20, left: 20 * 2, right: 20 * 2),
      child: Container(
        height: 120,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.green[50],
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Container(
                height: 100,
                width: 100,
                child: Image.asset(
                  'images/salad.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                              color: Colors.indigo[200]),
                          children: <TextSpan>[
                            TextSpan(text: "You have 12 recipes that\n"),
                            TextSpan(text: "you haven't tried yet"),
                          ]),
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, 'see_all');
                    },
                    child: Text(
                      "See All",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline
                      ),
                      textAlign: TextAlign.left,
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }
}