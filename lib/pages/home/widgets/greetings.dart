import 'package:flutter/material.dart';

class Greetings extends StatelessWidget {
  const Greetings({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Hello!",
            style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  color: Colors.white,
                  fontSize: 45,
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Matthew Durk",
            style: Theme.of(context).textTheme.displayMedium!.copyWith(
                  color: Colors.white,
                  fontSize: 30,
                ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            "Let's clean and manage your file's",
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.white.withOpacity(0.3), fontSize: 12),
          ),
        ],
      ),
    );
  }
}
