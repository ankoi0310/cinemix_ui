import 'package:cinemix_ui/core/common/entity/base_entity.dart';

class Genre extends BaseEntity {
  const Genre({
    required this.name,
    required this.description,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String name;
  final String description;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        description,
      ];
}
