import 'package:flutter/material.dart';
class Checker extends StatelessWidget {
  const Checker({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final bool value;
  final ValueChanged<bool?> onChanged;
   
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color.fromARGB(255, 12, 75, 47)),
      ),
      child: Checkbox(
        value: value,
        checkColor: Colors.white,
        onChanged: onChanged,
      ),
    );
  }
}
