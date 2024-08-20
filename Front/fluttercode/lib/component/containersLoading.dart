import 'package:Bloguee/component/padding.dart';
import 'package:Bloguee/component/texts.dart';
import 'package:flutter/material.dart';
import 'package:Bloguee/component/colors.dart';
import 'package:shimmer/shimmer.dart';

class PostsLoading extends StatelessWidget {
  const PostsLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 480,
      child: Center(
        child: Shimmer.fromColors(
          direction: ShimmerDirection.ltr,
          period: Duration(milliseconds: 2500),
          baseColor: SixthColor,
          highlightColor: TerciaryColor,
          child: ListView.builder(
              itemCount: 3,
              // separatorBuilder: (_, __) => const SizedBox(
              //       height: 15,
              //     ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 50),
                  child: Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: PrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}

class ErrorPost extends StatelessWidget {
  ErrorPost({super.key, required this.text});

  String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: defaultPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Shimmer.fromColors(
                direction: ShimmerDirection.ltr,
                period: Duration(milliseconds: 2500),
                baseColor: OffColor,
                highlightColor: nightColor,
                child: SubTextSized(
                    text: text,
                    align: TextAlign.end,
                    size: 15,
                    fontweight: FontWeight.w500),
              )),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.35,
            child: Center(
              child: CircularProgressIndicator(
                color: OffColor,
              ),
            ),
          )
        ],
      ),
    );
  }
}
