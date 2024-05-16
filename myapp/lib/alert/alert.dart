import 'package:flutter/material.dart';

AlertDialog alertLoading = AlertDialog(
  content: Row(
    children: [
      const CircularProgressIndicator(),
      Container(
          height: 20,
          width: 60,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          child: const Center(child: Text('Loading.....')))
    ],
  ),
);
AlertDialog alertSuccess = AlertDialog(
  content: Row(
    children: [
      const Icon(
        Icons.check,
        color: Colors.green,
      ),
      Container(
          margin: const EdgeInsets.only(left: 10),
          child: const Center(child: Text('Successful purchase!!!')))
    ],
  ),
);
