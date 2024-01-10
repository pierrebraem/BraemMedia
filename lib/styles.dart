import 'package:flutter/material.dart';

@immutable
class ClassicText extends ThemeExtension<ClassicText>{
  const ClassicText({
    required this.color
  });

  final Color? color;

  @override
  ClassicText copyWith({Color? color}) {
    return ClassicText(color: color ?? this.color);
  }

  @override
  ClassicText lerp(ClassicText? other, double t){
    if(other is! ClassicText){
      return this;
    }
    return ClassicText(
      color: Color.lerp(color, other.color, t)
    );
  }
}

@immutable
class MediaTitle extends ThemeExtension<MediaTitle>{
  const MediaTitle({
    required this.color,
    required this.size
  });

  final Color? color;
  final TextStyle? size;

  @override
  MediaTitle copyWith({Color? color, TextStyle? size}){
    return MediaTitle(
      color: color ?? this.color,
      size: size ?? this.size
    );
  }

  @override
  MediaTitle lerp(MediaTitle? other, double t){
    if(other is! MediaTitle){
      return this;
    }
    return MediaTitle(
      color: Color.lerp(color, other.color, t),
      size: TextStyle.lerp(size, other.size, t)
    );
  }
}

@immutable
class SearchTitle extends ThemeExtension<SearchTitle>{
  const SearchTitle({
    required this.color,
    required this.size,
    required this.fontWeight
  });

  final Color? color;
  final TextStyle? size;
  final FontWeight? fontWeight;

  @override
  SearchTitle copyWith({Color? color, TextStyle? size, FontWeight? fontWeight}){
    return SearchTitle(
      color: color ?? this.color,
      size: size ?? this.size,
      fontWeight: fontWeight ?? this.fontWeight
    );
  }

  @override
  SearchTitle lerp(SearchTitle? other, double t){
    if(other is! SearchTitle){
      return this;
    }
    return SearchTitle(
      color: Color.lerp(color, other.color, t),
      size: TextStyle.lerp(size, other.size, t),
      fontWeight: FontWeight.lerp(fontWeight, other.fontWeight, t)
    );
  }
}