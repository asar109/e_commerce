import 'package:e_commerce/global_variables.dart';
import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({super.key, required this.onPressed, required this.label, required this.color});
final VoidCallback onPressed;
final String label;
final Color color;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(onPressed: onPressed , child: Container(
      height: MediaQuery.of(context).size.height * 0.05,
      width: MediaQuery.of(context).size.width * 0.24,
      decoration:  BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(
            width: 1,
            color: color,
            style:  BorderStyle.solid
          )
          ),
      child: Center(child: Text(label , style: appStyle(fw: FontWeight.w600, size: 13, color: color),)),
    ),);
  }
}