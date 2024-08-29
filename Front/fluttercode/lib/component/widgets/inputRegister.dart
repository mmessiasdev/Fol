import 'package:Bloguee/component/inputdefault.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:Bloguee/extention/string_extention.dart';

class InputRegister extends StatelessWidget {
  InputRegister(
      {super.key,
      required this.textController,
      required this.title,
      required this.subdesc,
      required this.ftitle,
      this.aligh});
  TextEditingController textController;
  String title;
  String subdesc;
  TextAlign? aligh;

  bool ftitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          InputTextField(
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
          ftitle == true
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: SubTextSized(
                        align: aligh ?? TextAlign.end,
                        text: subdesc,
                        size: 14,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        "assets/images/preto.png",
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Image.asset(
                        "assets/images/preto.png",
                        width: MediaQuery.of(context).size.width * 0.4,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: SubTextSized(
                        align: TextAlign.end,
                        text: subdesc,
                        size: 14,
                        fontweight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
        ],
      ),
    );
  }
}
