import 'package:flutter/material.dart';

class ListHeaderShow extends StatelessWidget {
  const ListHeaderShow({
    super.key,
    required this.name,
    required this.movieListItem,
    required this.function,
  });

  final String name;
  final String movieListItem;
  final Function function;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 16, right: 6, bottom: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          InkWell(
            onTap: () {
              function();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Transform.translate(
                  offset: const Offset(1, 0),
                  child: const Text(
                    "see all",
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white60,
                  size: 20,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
