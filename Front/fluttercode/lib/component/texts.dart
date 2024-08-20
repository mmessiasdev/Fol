import 'dart:ui';

import 'package:Bloguee/component/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class PrimaryText extends StatelessWidget {
  PrimaryText({required this.text, required this.color, this.align});
  String text;
  Color color;
  TextAlign? align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: align == null ? TextAlign.start : align,
        style: GoogleFonts.montserrat(
          fontSize: 48,
          textStyle: TextStyle(
              color: color,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class SecundaryText extends StatelessWidget {
  SecundaryText({required this.text, required this.color, required this.align});
  String text;
  Color color;
  TextAlign align;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: align,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: color,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class ButtomText extends StatelessWidget {
  ButtomText({
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: Color.fromARGB(255, 0, 0, 0),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class ButtomSecundary extends StatelessWidget {
  ButtomSecundary({
    required this.text,
  });
  String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: GoogleFonts.montserrat(
          fontSize: 20,
          textStyle: TextStyle(
            color: Color.fromRGBO(0, 0, 0, 1),
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class SubText extends StatelessWidget {
  SubText({
    required this.text,
    required this.align,
    this.color,
  });
  String text;
  TextAlign align;
  Color? color;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: align,
        style: GoogleFonts.montserrat(
          fontSize: 16,
          color: color == null ? nightColor : color,
          textStyle: TextStyle(
            color: nightColor,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}

class SubTextSized extends StatelessWidget {
  SubTextSized(
      {required this.text,
      this.color,
      this.align,
      required this.size,
      required this.fontweight,
      this.tdeco});
  String text;
  Color? color;
  TextAlign? align;
  double size;
  FontWeight fontweight;
  TextDecoration? tdeco;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Text(
        text,
        textAlign: align == null ? TextAlign.start : align,
        style: GoogleFonts.montserrat(
          fontSize: size,
          textStyle: TextStyle(
            color: color == null ? nightColor : color,
            fontWeight: fontweight,
            decoration: tdeco == null ? TextDecoration.none : tdeco,
          ),
        ),
      ),
    );
  }
}

class RichDefaultText extends StatelessWidget {
  RichDefaultText(
      {required this.wid,
      required this.text,
      required this.align,
      required this.size,
      required this.fontweight});

  Widget wid;
  String text;
  TextAlign align;
  double size;
  FontWeight fontweight;

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text, // Texto antes do botão
        style: GoogleFonts.montserrat(
          fontSize: size,
          textStyle: TextStyle(
            color: nightColor,
            fontWeight: fontweight,
            decoration: TextDecoration.none,
          ),
        ),
        children: <InlineSpan>[
          WidgetSpan(alignment: PlaceholderAlignment.middle, child: wid),
        ],
      ),
    );
  }
}
