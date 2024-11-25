import 'package:flutter/material.dart';

class display_card extends StatelessWidget {
  const display_card({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white70,
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      elevation: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0), // Set the corner radius
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Bangladesh Vs England',style: TextStyle(fontWeight: FontWeight.w600,),),
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
                    Text('Live'),
                  ],
                ),
              ],
            ),
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
                const Text('Bangladesh',style: TextStyle(fontWeight: FontWeight.w600,),),
              ],
            ),
            const SizedBox(height: 10,),
             const Text('Vs',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green),),
            const SizedBox(height: 10,),
            Row(
              children: [
                ClipRRect(
                  borderRadius:
                      BorderRadius.circular(30.0), // Set the radius here
                  child: Image.network(
                    'https://shorturl.at/jutAF',
                    height: 50,
                    width: 50,
                    fit: BoxFit
                        .cover,
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                const Text('England',style: TextStyle(fontWeight: FontWeight.w600,),),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Text('England Bat yet',style: TextStyle(fontWeight: FontWeight.w600,color: Colors.green),),
            const Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Text('250/5'),
                SizedBox(
                  height: 12,
                ),
                Text('250/5'),
                Text('yet to bat'),
              ],
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
