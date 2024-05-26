import 'package:cinemix_ui/core/common/widgets/back_button.dart';
import 'package:flutter/material.dart';

class KAppBar extends StatelessWidget implements PreferredSizeWidget {
  const KAppBar({
    this.title,
    this.centerTitle = false,
    this.hasBackButton = true,
    this.onBackPressed,
    this.hasCloseButton = false,
    this.onClosePressed,
    super.key,
  });

  final String? title;
  final bool centerTitle;
  final bool hasBackButton;
  final VoidCallback? onBackPressed;
  final bool hasCloseButton;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: hasBackButton ? KBackButton(onPressed: onBackPressed) : null,
      automaticallyImplyLeading: hasBackButton,
      title: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleSmall,
      ),
      centerTitle: centerTitle,
      actions: hasCloseButton
          ? [
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: onClosePressed ?? () => Navigator.of(context).pop(),
              ),
            ]
          : null,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
