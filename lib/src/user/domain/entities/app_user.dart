import 'package:cinemix_ui/core/common/entity/base_entity.dart';

class AppUser extends BaseEntity {
  const AppUser({
    required this.fullName,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  final String fullName;
}
