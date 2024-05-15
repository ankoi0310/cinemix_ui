import 'package:flutter/material.dart';

class ArtistInfo extends StatelessWidget {
  const ArtistInfo({
    required this.title,
    required this.artists,
    super.key,
  });

  final String title;
  final String artists;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(title, style: Theme.of(context).textTheme.headlineMedium),
        const SizedBox(height: 24),
        const SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: BouncingScrollPhysics(),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [],
            // children: artistList
            //     .map(
            //       (e) => Container(
            //         width: 150,
            //         margin: EdgeInsets.only(
            //           right: artistList.last == e ? 0 : 16,
            //         ),
            //         padding: const EdgeInsets.symmetric(
            //           horizontal: 12,
            //           vertical: 8,
            //         ),
            //         decoration: BoxDecoration(
            //           color: Theme.of(context).colorScheme.secondary,
            //           borderRadius: BorderRadius.circular(12),
            //         ),
            //         child: Row(
            //           children: [
            //             Flexible(
            //               child: Text(
            //                 e.name,
            //                 softWrap: true,
            //                 maxLines: 2,
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .bodyMedium!
            //                     .copyWith(fontWeight: FontWeight.w400),
            //               ),
            //             ),
            //           ],
            //         ),
            //       ),
            //     )
            //     .toList(),
          ),
        ),
      ],
    );
  }
}
