import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SearchBar(
      padding: const MaterialStatePropertyAll(
        EdgeInsets.symmetric(
          horizontal: 12,
        ),
      ),
      leading: const Icon(
        Iconsax.search_normal,
        color: Colors.grey,
      ),
      hintText: 'Search',
      hintStyle: MaterialStatePropertyAll(
        TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
