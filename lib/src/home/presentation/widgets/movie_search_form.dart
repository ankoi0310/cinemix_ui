import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

class MovieSearchForm extends StatelessWidget {
  const MovieSearchForm({required this.onSubmitted, super.key});

  final void Function(String) onSubmitted;

  @override
  Widget build(BuildContext context) {
    // 2. The application focuses on the search bar
    // When the user taps on the search bar, the application will focus on it
    final searchFocusNode = FocusNode();

    // 3. User types keyword related to the movie's name in the search bar
    // When the user types a keyword related to the movie's name in the search
    // bar, this controller will store the keyword
    final searchController = TextEditingController();

    return SearchBar(
      controller: searchController,
      focusNode: searchFocusNode,
      // 4. User clicks Enter to submit the search bar
      onSubmitted: (value) {
        // 5. The application unfocuses the search bar
        searchFocusNode.unfocus();
        // 6. The application clears the search bar
        searchController.clear();
        onSubmitted(value);
      },
      backgroundColor: WidgetStatePropertyAll(
        Theme.of(context).colorScheme.secondary,
      ),
      padding: const WidgetStatePropertyAll(
        EdgeInsets.symmetric(horizontal: 12),
      ),
      trailing: [
        // 4. User clicks on the search icon to submit the search bar
        InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () => onSubmitted(searchController.text),
          child: const Icon(IconsaxPlusLinear.search_normal_1),
        ),
        const SizedBox(width: 8),
      ],
      hintText: 'Nhập tên phim bạn muốn tìm kiếm...',
      hintStyle: WidgetStatePropertyAll(
        TextStyle(
          color: Theme.of(context).colorScheme.onSecondary.withOpacity(0.5),
        ),
      ),
      textStyle: WidgetStatePropertyAll(
        Theme.of(context).textTheme.bodyMedium,
      ),
    );
  }
}
