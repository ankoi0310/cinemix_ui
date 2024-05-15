import 'package:cinemix_ui/core/common/entity/base_entity.dart';

class Genre extends BaseEntity {
  const Genre({
    required this.name,
    super.id,
  });

  const Genre.empty() : this(name: '');

  final String name;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
      ];
}
