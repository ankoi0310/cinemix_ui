import 'package:cinemix_ui/core/common/entity/base_entity.dart';

class Genre extends BaseEntity {
  const Genre({
    required this.name,
    super.id,
  });

  const Genre.demo1() : this(name: 'Action');

  const Genre.demo2() : this(name: 'Adventure');

  const Genre.demo3() : this(name: 'Comedy');

  final String name;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
      ];
}