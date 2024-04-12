import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';

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
        IconsaxPlusLinear.search_normal_1,
        color: Colors.grey,
      ),
      hintText: 'Tìm kiếm phim, diễn viên, đạo diễn...',
      hintStyle: MaterialStatePropertyAll(
        TextStyle(
          color: Colors.grey[600],
        ),
      ),
    );
  }
}
