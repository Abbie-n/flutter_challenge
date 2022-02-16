import 'package:equatable/equatable.dart';

class Data extends Equatable {
  final int? page;
  final int? perPage;
  final List<Photos>? photos;
  final int? totalResults;
  final String? nextPage;
  final String? prevPage;

  const Data({
    this.page,
    this.perPage,
    this.photos,
    this.totalResults,
    this.nextPage,
    this.prevPage,
  });

  @override
  List<Object?> get props {
    return [
      page,
      perPage,
      photos,
      totalResults,
      nextPage,
      prevPage,
    ];
  }
}

class Photos extends Equatable {
  final int? id;
  final int? width;
  final int? height;
  final String? url;
  final String? photographer;
  final String? photographerUrl;
  final int? photographerId;
  final String? avgColor;
  final Src? src;
  final bool? liked;
  final String? alt;

  const Photos({
    this.id,
    this.width,
    this.height,
    this.url,
    this.photographer,
    this.photographerUrl,
    this.photographerId,
    this.avgColor,
    this.src,
    this.liked,
    this.alt,
  });

  @override
  List<Object?> get props {
    return [
      id,
      width,
      height,
      url,
      photographer,
      photographerUrl,
      photographerId,
      avgColor,
      src,
      liked,
      alt,
    ];
  }
}

class Src extends Equatable {
  final String? original;
  final String? large2x;
  final String? large;
  final String? medium;
  final String? small;
  final String? portrait;
  final String? landscape;
  final String? tiny;

  const Src({
    this.original,
    this.large2x,
    this.large,
    this.medium,
    this.small,
    this.portrait,
    this.landscape,
    this.tiny,
  });

  @override
  List<Object?> get props {
    return [
      original,
      large2x,
      large,
      medium,
      small,
      portrait,
      landscape,
      tiny,
    ];
  }
}
