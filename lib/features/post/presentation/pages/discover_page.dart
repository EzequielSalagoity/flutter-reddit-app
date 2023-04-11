import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Text(
          "Oops!\nThere's nothing new to discover",
          textAlign: TextAlign.center, style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}