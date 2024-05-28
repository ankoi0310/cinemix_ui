import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/domain/entities/genre.dart';

class GenreModel extends Genre {
  const GenreModel({
    required super.name,
    required super.description,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  factory GenreModel.fromMap(DataMap map) {
    return GenreModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }

  GenreModel copyWith({
    int? id,
    String? name,
    String? description,
    DateTime? createdDate,
    DateTime? modifiedDate,
  }) {
    return GenreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      createdDate: createdDate ?? this.createdDate,
      modifiedDate: modifiedDate ?? this.modifiedDate,
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'createdDate': createdDate?.format(),
      'modifiedDate': modifiedDate?.format()
    };
  }
}
