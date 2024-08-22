import 'package:Bloguee/component/colors.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DefaultTitle extends StatelessWidget {
  DefaultTitle({super.key, this.title, this.subtitle, this.subbuttom});

  String? title;
  String? subtitle;
  Widget? subbuttom;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(top: 25),
            child: PrimaryText(text: title, color: nightColor)),
        const SizedBox(
          height: 15,
        ),
        RichDefaultText(
            text: subtitle,
            align: TextAlign.start,
            size: 20,
            fontweight: FontWeight.w300,
            wid: subbuttom),
        SizedBox(
          height: 70,
        ),
      ],
    );
  }
}
