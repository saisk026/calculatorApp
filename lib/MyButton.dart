import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Mybutton extends StatelessWidget {
  final color;
  final textcolor;
  final String buttontext;
  final buttontapped;

  Mybutton({this.color, this.textcolor, this.buttontext, this.buttontapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: Container(
            color: color,
            child: Center(
              child: Text(buttontext,
                  style: GoogleFonts.montserrat(
                    fontSize: 22,
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
