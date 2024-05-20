import 'package:cinemix_ui/src/movie/presentation/views/movie_search_screen.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MovieSearchForm extends StatefulWidget {
  const MovieSearchForm({
    super.key,
  });

  @override
  State<MovieSearchForm> createState() => _MovieSearchFormState();
}

class _MovieSearchFormState extends State<MovieSearchForm> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SearchBar(
        controller: _searchController,
        onSubmitted: (value) {
          Navigator.of(context)
              .pushNamed(
            MovieSearchScreen.routeName,
            arguments: value,
          )
              .then((_) {
            _searchController.clear();
          });
        },
        backgroundColor: MaterialStatePropertyAll(
          Theme.of(context).colorScheme.secondary,
        ),
        padding: const MaterialStatePropertyAll(
          EdgeInsets.symmetric(horizontal: 12),
        ),
        trailing: [
          InkWell(
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            onTap: () {
              Navigator.of(context)
                  .pushNamed(
                MovieSearchScreen.routeName,
                arguments: _searchController.text,
              )
                  .then((_) {
                _searchController.clear();
              });
            },
            child: const Icon(IconsaxPlusLinear.search_normal_1),
          ),
          const SizedBox(width: 8),
        ],
        hintText: 'Nhập tên phim bạn muốn tìm kiếm...',
        hintStyle: MaterialStatePropertyAll(
          TextStyle(
            color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
          ),
        ),
        textStyle: MaterialStatePropertyAll(
          Theme.of(context).textTheme.bodyMedium,
        ),
      ),
    );
  }
}
