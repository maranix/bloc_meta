import 'dart:convert';

final class Fact {
  const Fact({
    required this.id,
    required this.text,
    required this.source,
    required this.sourceUrl,
    required this.language,
    required this.permaLink,
  });

  final String id;
  final String text;
  final String source;
  final String sourceUrl;
  final String language;
  final String permaLink;

  factory Fact.from(dynamic body) {
    Map<String, dynamic> json = {};

    if (body is String) {
      json = jsonDecode(body);
    }

    if (json case {
      'id': String id,
      'text': String text,
      'source': String source,
      'source_url': String sourceUrl,
      'language': String language,
      'permalink': String permaLink,
    }) {
      return Fact(
        id: id,
        text: text,
        source: source,
        sourceUrl: sourceUrl,
        language: language,
        permaLink: permaLink,
      );
    }

    throw FormatException(
      'Invalid server response, Unable to decode body into Fact model.\nExpected: Map<String, dynamic>\tGot: ${body.runtimeType}',
      body,
    );
  }
}
