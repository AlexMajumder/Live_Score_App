import 'package:flutter/material.dart';

class display_card extends StatelessWidget {
  const display_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      elevation: 30,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Set the corner radius
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bangladesh Vs England',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.green,
                      //_indicatorColor(cricketMatchScore.isMatchRunning),
                      radius: 8,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Live',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        'https://shorturl.at/r7SI8',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'Bangladesh',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: '130-3',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      TextSpan(
                        text: '(12/5)',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Vs',
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.green,
                      fontSize: 20),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Image.network(
                        'https://shorturl.at/jutAF',
                        height: 50,
                        width: 50,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    const Text(
                      'England',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Yet to Bol',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Bolling :-  ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Anderson, JM',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.green),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            RichText(
              text: const TextSpan(
                children: [
                  TextSpan(
                    text: 'Batting on :-  ',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.black),
                  ),
                  TextSpan(
                    text: 'Sakib Al Hasan',
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.green),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _indicatorColor(bool isMatchRunning) {
    return isMatchRunning ? Colors.green : Colors.grey;
  }
}
