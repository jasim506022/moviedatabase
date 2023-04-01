 import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

SizedBox buttonWidgetStyle(
      {required BuildContext context,
      required String text,
      required Function function}) {
    return SizedBox(
      height: kBottomNavigationBarHeight,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            function();
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  const Color.fromRGBO(39, 43, 48, 1))),
          child: Text(
            text,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ),
    );
      }

      Container circularBox() {
    return Container(
      height: 10,
      width: 10,
      padding: const EdgeInsets.only(left: 5),
      decoration:
          const BoxDecoration(color: Colors.white60, shape: BoxShape.circle),
    );
  }

  ReadMoreText readMoreTextFunction({required String text}) {
    return ReadMoreText(
                      text,
                      textAlign: TextAlign.justify,
                      trimLines: 4,
                      colorClickableText: Colors.pink,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Show more',
                      trimExpandedText: ' Show less',
                      style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          height: 1.2,
                          wordSpacing: 1.3,
                          fontWeight: FontWeight.w500),
                      moreStyle: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          height: 1.2,
                          wordSpacing: 1.3,
                          fontWeight: FontWeight.bold),
                      lessStyle: const TextStyle(
                          color: Colors.yellow,
                          fontSize: 14,
                          height: 1.2,
                          wordSpacing: 1.3,
                          fontWeight: FontWeight.bold),
                    );
  }