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
      createdDate:
          DateFormat('dd/MM/yyyy HH:mm:ss').parse(map['createdDate'] as String),
      modifiedDate: DateFormat('dd/MM/yyyy HH:mm:ss')
          .parse(map['modifiedDate'] as String),
    );
  }

  MovieModel.empty()
      : this(
          name: '',
          description: '',
          directors: '',
          actors: '',
          genres: [],
          releasedDate: DateTime.now(),
          duration: 0,
          country: '',
          language: '',
          localizations: '',
          format: '',
          rating: '',
          posterUrl: '',
          trailerUrl: '',
          state: '',
        );

  DataMap toMap() {
    return {
      'name': name,
      'description': description,
      'directors': directors,
      'actors': actors,
      'genres': (genres as List<GenreModel>).map((e) => e.toMap()).toList(),
      'releasedDate': releasedDate,
      'duration': duration,
      'language': language,
      'localizations': localizations,
      'format': format,
      'rating': rating,
      'posterUrl': posterUrl,
      'trailerUrl': trailerUrl,
      'state': state,
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
