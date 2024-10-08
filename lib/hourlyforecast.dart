import 'package:flutter/material.dart';

class HourlyforecastItem extends StatelessWidget {
  final String time;
  final String temparture;
  final IconData icon;
  const HourlyforecastItem({super.key, required this.time, required this.temparture, required this.icon,});

 


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      child: Container(
        width: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        padding: const EdgeInsets.all(8),
        child:  Column(
          children: [
            Text(
              time,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 8,
            ),
            Icon(
             icon,
              size: 32,
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              temparture,
              style: TextStyle(fontSize: 14),
            )
          ],
        ),
      ),
    );
  }
}