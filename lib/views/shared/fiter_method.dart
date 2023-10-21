import 'package:e_commerce/global_variables.dart';
import 'package:e_commerce/views/shared/filter_button.dart';
import 'package:flutter/material.dart';

double _value = 100;
Future<dynamic> filter(BuildContext context) {
  return showModalBottomSheet(
    isDismissible: true,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    context: context,
    builder: (context) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.85,
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(32), topRight: Radius.circular(32))),
        child: Column(children: [
          const CustomSpacer(),
          Container(
            height: MediaQuery.of(context).size.height * 0.008,
            width: MediaQuery.of(context).size.width * 0.10,
            decoration: const BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.all(Radius.circular(32)),
            ),
          ),
          const CustomSpacer(),
          const Text('Filter',
              style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold)),
          const CustomSpacer(),
          const Text('Gender',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const CustomSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterButton(
                  onPressed: () {}, label: "Male", color: Colors.black),
              FilterButton(
                  onPressed: () {}, label: "Female", color: Colors.grey),
              FilterButton(onPressed: () {}, label: "Kids", color: Colors.grey),
            ],
          ),
          const CustomSpacer(),
          const Text('Category',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const CustomSpacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FilterButton(
                  onPressed: () {}, label: "Shoes", color: Colors.black),
              FilterButton(
                  onPressed: () {}, label: "Apparies", color: Colors.grey),
              FilterButton(
                  onPressed: () {}, label: "Accessories", color: Colors.grey),
            ],
          ),
          const CustomSpacer(),
          Slider(
            activeColor: Colors.black,
            divisions: 50,
            max: 500,
            inactiveColor: Colors.grey,
            thumbColor: Colors.black,
            secondaryTrackValue: 200,
            label: _value.toString(),
            value: _value,
            onChanged: (value) {
              _value = value;
            },
          ),
          const CustomSpacer(),
          const Text('Brand',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const CustomSpacer(),
          Wrap(
            children: [
              FilterButton(
                  onPressed: () {}, label: "Adidas", color: Colors.black),
              FilterButton(
                  onPressed: () {}, label: "Gucci", color: Colors.grey),
              FilterButton(
                  onPressed: () {}, label: "Jordan", color: Colors.grey),
              FilterButton(onPressed: () {}, label: "Nike", color: Colors.grey),
              FilterButton(
                  onPressed: () {}, label: "Service", color: Colors.grey),
              FilterButton(onPressed: () {}, label: "Bata", color: Colors.grey),
            ],
          ),
        ]),
      );
    },
  );
}
