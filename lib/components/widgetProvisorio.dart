import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Plano extends StatelessWidget {
  final String title;
  final String description;
  const Plano({super.key, required this.title, required this.description});

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: GestureDetector(
        child: Container(
          width: 170,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            gradient: const LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color.fromARGB(255, 70, 70, 70),
                Color.fromARGB(255, 12, 12, 12),
              ],
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Text(
                  'Crítica:',
                  style: TextStyle(color: Colors.white, fontSize: 17),
                ),
                Text(
                  description,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
        onLongPress: () {},
      ),
    );
  }
}
