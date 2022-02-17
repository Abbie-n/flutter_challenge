import 'package:flutter_challenge/features/home/domain/entities/data.dart';

class DataModel extends Data {
  const DataModel({
    final int? page,
    final int? perPage,
    final List<PhotosModel>? photos,
    final int? totalResults,
    final String? nextPage,
    final String? prevPage,
  }) : super(
          nextPage: nextPage,
          page: page,
          perPage: perPage,
          photos: photos,
          prevPage: prevPage,
          totalResults: totalResults,
        );

  factory DataModel.fromJson(dynamic json) => DataModel(
        page: json['page'],
        perPage: json['per_page'],
        photos: json['photos'] != null
            ? List<PhotosModel>.from(
                json['photos']?.map((x) => PhotosModel.fromJson(x)))
            : <PhotosModel>[],
        totalResults: json['total_results'],
        nextPage: json['next_page'],
        prevPage: json['prev_page'],
      );
}

class PhotosModel extends Photos {
  const PhotosModel({
    final int? id,
    final int? width,
    final int? height,
    final String? url,
    final String? photographer,
    final String? photographerUrl,
    final int? photographerId,
    final String? avgColor,
    final Src? src,
    final bool? liked,
    final String? alt,
  }) : super(
          alt: alt,
          avgColor: avgColor,
          height: height,
          id: id,
          liked: liked,
          photographer: photographer,
          photographerId: photographerId,
          photographerUrl: photographerUrl,
          src: src,
          url: url,
          width: width,
        );

  factory PhotosModel.fromJson(dynamic json) => PhotosModel(
        id: json['id'],
        width: json['width'],
        height: json['height'],
        url: json['url'],
        photographer: json['photographer'],
        photographerUrl: json['photographer_url'],
        photographerId: json['photographer_id'],
        avgColor: json['avg_color'],
        src: json['src'] != null ? SrcModel.fromJson(json['src']) : null,
        liked: json['liked'],
        alt: json['alt'],
      );
}

class SrcModel extends Src {
  const SrcModel({
    final String? original,
    final String? large2x,
    final String? large,
    final String? medium,
    final String? small,
    final String? portrait,
    final String? landscape,
    final String? tiny,
  }) : super(
          landscape: landscape,
          large2x: large2x,
          large: large,
          medium: medium,
          original: original,
          portrait: portrait,
          small: small,
          tiny: tiny,
        );

  factory SrcModel.fromJson(dynamic json) => SrcModel(
        original: json['original'],
        large2x: json['large2x'],
        large: json['large'],
        medium: json['medium'],
        small: json['small'],
        portrait: json['portrait'],
        landscape: json['landscape'],
        tiny: json['tiny'],
      );
}
