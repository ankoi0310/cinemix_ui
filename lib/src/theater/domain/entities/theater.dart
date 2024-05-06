import 'package:cinemix_ui/core/common/entity/base_entity.dart';
import 'package:cinemix_ui/core/shared/enums/theater_enum.dart';

class Theater extends BaseEntity {
  const Theater({
    required this.name,
    required this.address,
    required this.hotline,
    required this.image,
    required this.state,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String name;
  final String address;
  final String hotline;
  final String image;
  final TheaterState state;

  @override
  List<Object?> get props => [
        ...super.props,
        name,
        address,
        hotline,
        image,
        state,
      ];
}
