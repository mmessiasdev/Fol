import 'package:Bloguee/component/inputdefault.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:Bloguee/extention/string_extention.dart';
import 'package:flutter/widgets.dart';

class InputRegister extends StatelessWidget {
  InputRegister(
      {super.key,
      required this.textController,
      required this.title,
      required this.subdesc,
      required this.ftitle,
      required this.padding,
      required this.borderRadius,
      this.aligh});
  TextEditingController textController;
  String title;
  String subdesc;
  TextAlign? aligh;
  EdgeInsetsGeometry padding;
  BorderRadiusGeometry borderRadius;

  bool ftitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 100),
      child: Column(
        children: [
          Padding(
            padding: padding,
            child: InputTextField(
              title: title,
              textEditingController: textController,
              validation: (String? value) {
                if (value == null || value.isEmpty) {
                  return "Esse campo não pode ficar vazio.";
                } else if (!value.isValidEmail) {
                  return "Insira os caracteres válido.";
                }
                return null;
              },
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          ftitle == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubTextSized(
                          align: aligh ?? TextAlign.end,
                          text: subdesc,
                          size: 14,
                          fontweight: FontWeight.w600,
                        ),
                      ),
                    ),
                    ClipRRect(
                      borderRadius: borderRadius,
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/illustrator/Illustrator4.png",
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 242,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: borderRadius,
                      child: Opacity(
                        opacity: 0.5,
                        child: Image.asset(
                          "assets/images/illustrator/Illustrator4.png",
                          width: MediaQuery.of(context).size.width * 0.5,
                          height: 242,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SubTextSized(
                          align: aligh ?? TextAlign.start,
                          text: subdesc,
                          size: 14,
                          fontweight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
