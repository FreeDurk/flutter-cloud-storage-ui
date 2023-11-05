import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  final bool? isHomePage;
  const Header({super.key, this.isHomePage});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30, top: 50),
      height: 50,
      color: Colors.black,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (isHomePage == true) ...{
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),
          },
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white.withOpacity(
                0.2,
              ),
            ),
            child: Row(
              children: [
                Image.asset("assets/images/crown.png"),
                const SizedBox(
                  width: 15,
                ),
                Text(
                  "Upgrade Pro",
                  style: Theme.of(context).textTheme.titleSmall!.copyWith(
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Scaffold.of(context).openDrawer();
            },
            child: CircleAvatar(
              backgroundColor: Colors.amber,
              child: Image.asset("assets/images/profile.png"),
            ),
          )
        ],
      ),
    );
  }
}
