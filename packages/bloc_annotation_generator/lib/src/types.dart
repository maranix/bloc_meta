/// Properties described in [BaseAnnotaion] from `bloc_annotation` package
typedef BaseAnnotationProperties = ({
  String name,
  bool copyWith,
  bool overrideEquality,
  bool overrideToString,
});

/// Properties described in [CubitClass] annotaion from `bloc_annotation` package
typedef CubitClassAnnotationProperties = ({
  String name,
  bool copyWith,
  bool overrideEquality,
  bool overrideToString,
  String state,
});

/// Record type for describing a attributes of a Class
///
/// ```dart
/// class Some {
///   final String attribute1;
///   final int attribute2;
///   final double attribute3;
/// }
/// ```
typedef ElementAttribute = ({String type, String name});
