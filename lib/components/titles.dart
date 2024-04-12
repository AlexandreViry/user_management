import 'package:flutter/material.dart';

/// component pour titre h1, gros titre
class H1 extends StatelessWidget {
/// jolie constructeur avec le text à afficher
  const H1({
    required this.h1, super.key,
  });

  /// le text à afficher
  final String h1;

  @override
  Widget build(BuildContext context) {
    final double h = MediaQuery.of(context).size.height;
    return Text(
      h1,
      style: TextStyle(
        fontSize: h * 0.06,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

/// component pour titre h2, un peu moins gros titre
class H2 extends StatelessWidget {
/// jolie constructeur avec le text à afficher
  const H2({
    required this.h2, super.key,
  });
  
  /// le text à afficher
  final String h2;

  @override
  Widget build(BuildContext context) {
    return Text(
      h2,
      style: TextStyle(
        fontSize: 18,
        color: Colors.grey[600],
      ),
    );
  }
}
