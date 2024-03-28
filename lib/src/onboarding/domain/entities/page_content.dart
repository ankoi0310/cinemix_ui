import 'package:equatable/equatable.dart';

class PageContent extends Equatable {
  const PageContent({
    required this.title,
    required this.description,
    required this.imagePath,
  });

  const PageContent.first()
      : this(
          title: 'Welcome to the app',
          description: 'This is a simple onboarding screen',
          imagePath: 'assets/images/onboarding1.png',
        );

  final String title;
  final String description;
  final String imagePath;

  @override
  List<Object?> get props => [title, description, imagePath];
}
