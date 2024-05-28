import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/core/shared/utils/typedefs.dart';
import 'package:cinemix_ui/src/movie/data/models/genre_model.dart';
import 'package:cinemix_ui/src/movie/domain/entities/movie.dart';
import 'package:intl/intl.dart';

class MovieModel extends Movie {
  const MovieModel({
    required super.name,
    required super.description,
    required super.directors,
    required super.actors,
    required super.genres,
    required super.releasedDate,
    required super.duration,
    required super.country,
    required super.language,
    required super.localizations,
    required super.format,
    required super.rating,
    required super.posterUrl,
    required super.trailerUrl,
    required super.state,
    super.id,
    super.createdDate,
    super.modifiedDate,
  });

  MovieModel.demo()
      : this(
          id: 1,
          name: 'Lật mặt 7: Một điều ước',
          description: 'Một câu chuyện lần đầu được kể bằng tất cả tình yêu, '
              'và từ tất cả những hồi ức xao xuyến nhất của đấng sinh thành.',
          directors: 'Lý Hải',
          actors: 'Thanh Hiền, Trương Minh Cường, Đinh Y Nhung, Quách Ngọc '
              'Tuyên, Trâm Anh, Trần Kim Hải',
          genres: [
            GenreModel(
              id: 4,
              name: 'Phim hài',
              description: 'Phim có mục đích chính là làm cho khán giả cười '
                  'thông qua các tình huống hài hước và lời nói hóm hỉnh',
              createdDate: '26/05/2024 18:09:33'.toDateTime(),
              modifiedDate: '26/05/2024 18:09:33'.toDateTime(),
            ),
            GenreModel(
              id: 25,
              name: 'Tình cảm',
              description: 'Tập trung vào các mối quan hệ tình cảm giữa các '
                  'nhân vật chính, thường có yếu tố lãng mạn và tình yêu.',
              createdDate: '26/05/2024 18:09:33'.toDateTime(),
              modifiedDate: '26/05/2024 18:09:33'.toDateTime(),
            ),
          ],
          releasedDate: '26/04/2024'.toDateTime(format: 'dd/MM/yyyy'),
          duration: 138,
          country: '',
          language: '',
          localizations: '',
          format: '2D',
          rating: 'K',
          posterUrl:
              'https://firebasestorage.googleapis.com/v0/b/cinemix-7dffb.appspot.com/o/images%2Fmovies%2Fposter-lat-mat-7.jpg?alt=media&token=2949e81e-e5d5-4851-8440-53eac7c98780',
          trailerUrl: '',
          state: 'SHOWING',
          createdDate: '26/05/2024 18:09:34'.toDateTime(),
          modifiedDate: '26/05/2024 18:09:34'.toDateTime(),
        );

  factory MovieModel.fromMap(DataMap map) {
    return MovieModel(
      id: map['id'] as int,
      name: map['name'] as String,
      description: map['description'] as String,
      directors: map['directors'] as String,
      actors: map['actors'] as String,
      genres: (map['genres'] as List)
          .map((e) => GenreModel.fromMap(e as DataMap))
          .toList(),
      releasedDate:
          DateFormat('dd/MM/yyyy').parse(map['releasedDate'] as String),
      duration: map['duration'] as int,
      country: map['country'] as String,
      language: map['language'] as String,
      localizations: map['localizations'] as String,
      format: map['format'] as String,
      rating: map['rating'] as String,
      posterUrl: map['posterUrl'] as String,
      trailerUrl: map['trailerUrl'] as String,
      state: map['state'] as String,
      createdDate: (map['createdDate'] as String).toDateTime(),
      modifiedDate: (map['modifiedDate'] as String).toDateTime(),
    );
  }

  DataMap toMap() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'directors': directors,
      'actors': actors,
      'genres': genres.map((e) => (e as GenreModel).toMap()).toList(),
      'releasedDate': releasedDate.format('dd/MM/yyyy'),
      'duration': duration,
      'country': country,
      'language': language,
      'localizations': localizations,
      'format': format,
      'rating': rating,
      'posterUrl': posterUrl,
      'trailerUrl': trailerUrl,
      'state': state,
      'createdDate': createdDate?.format(),
      'modifiedDate': modifiedDate?.format()
    };
  }

  MovieModel copyWith({
    int? id,
    String? name,
    String? description,
    String? directors,
    String? actors,
    List<GenreModel>? genres,
    DateTime? releasedDate,
    int? duration,
    String? country,
    String? language,
    String? localizations,
    String? format,
    String? rating,
    String? posterUrl,
    String? trailerUrl,
    String? state,
  }) {
    return MovieModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      directors: directors ?? this.directors,
      actors: actors ?? this.actors,
      genres: genres ?? this.genres,
      releasedDate: releasedDate ?? this.releasedDate,
      duration: duration ?? this.duration,
      country: country ?? this.country,
      language: language ?? this.language,
      localizations: localizations ?? this.localizations,
      format: format ?? this.format,
      rating: rating ?? this.rating,
      posterUrl: posterUrl ?? this.posterUrl,
      trailerUrl: trailerUrl ?? this.trailerUrl,
      state: state ?? this.state,
    );
  }
}
