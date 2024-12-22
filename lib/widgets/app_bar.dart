import 'package:flutter/material.dart';

class NewsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const NewsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text.rich(
        TextSpan(
            text: 'News',
            style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
            children: [
              TextSpan(
                  text: 'Cloud', style: TextStyle(color: Color(0xFFCBDF1A)))
            ]),
      ),
      centerTitle: true,
      toolbarHeight: 60,
      backgroundColor: const Color.fromARGB(209, 255, 255, 255),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
