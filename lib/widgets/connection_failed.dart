import 'package:flutter/material.dart';

class ConnectionError extends StatelessWidget {
  const ConnectionError({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox(
      width: MediaQuery.sizeOf(context).width / 2,
      height: MediaQuery.sizeOf(context).height / 2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            'assets/no-wifi.png',
            fit: BoxFit.cover,
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            'Oops!....',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 40,
            ),
          ),
          const Text(
            'Something wrong with your connection. Please try again after a moment.',
            style: TextStyle(
              fontWeight: FontWeight.w200,
              color: Colors.grey,
            ),
          )
        ],
      ),
    ));
  }
}
