import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../gen/strings.g.dart';

class InstagramStyleLogo extends StatelessWidget {
  const InstagramStyleLogo({
    super.key,
    this.fontSize = 40,
  });

  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Text(
      t.title,
      style: GoogleFonts.grandHotel(
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}
