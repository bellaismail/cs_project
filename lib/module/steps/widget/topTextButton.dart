import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class topText extends StatelessWidget {
  String text;
  bool isActive;
  bool visi;
  Function onTap;

  topText(this.text, this.isActive, this.onTap, {this.visi = true , Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsetsDirectional.all(5),
          child: Column(
            children: [
              Text(
                text,
                style: GoogleFonts.aBeeZee(
                  color: isActive ? Colors.teal : Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: isActive ? 25 : 20,
                  letterSpacing: 2,
                ),
              ),
              Visibility(
                visible: isActive,
                child: Container(
                  height: visi?3:0.0,
                  width: 70,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
