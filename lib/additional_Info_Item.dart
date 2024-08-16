import 'package:flutter/material.dart';


class additionalinfoitem extends StatelessWidget {
  final IconData icon ;
  final String label ;
  final String value ;
  const additionalinfoitem({
    super.key,
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          size: 32,
        ),
        SizedBox(
          height: 8,
        ),
        
        Text(
          label,
          // style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 8,),
        Text(
          value,
          style:
              TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
