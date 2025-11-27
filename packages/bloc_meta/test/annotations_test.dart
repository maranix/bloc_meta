import 'package:bloc_meta/bloc_meta.dart';
import 'package:test/test.dart';

void main() {
  group('BlocClass', () {
    test('default values', () {
      const annotation = BlocMeta<dynamic, dynamic>();
      expect(annotation.name, '');
      expect(annotation.copyWith, true);
      expect(annotation.overrideEquality, true);
      expect(annotation.overrideToString, true);
    });

    test('custom values', () {
      const annotation = BlocMeta<dynamic, dynamic>(
        name: 'MyBloc',
        copyWith: false,
        overrideEquality: false,
        overrideToString: false,
      );
      expect(annotation.name, 'MyBloc');
      expect(annotation.copyWith, false);
      expect(annotation.overrideEquality, false);
      expect(annotation.overrideToString, false);
    });
  });

  group('CubitMeta', () {
    test('default values', () {
      const annotation = CubitMeta<dynamic>();
      expect(annotation.name, '');
      expect(annotation.copyWith, true);
      expect(annotation.overrideEquality, true);
      expect(annotation.overrideToString, true);
    });

    test('custom values', () {
      const annotation = CubitMeta<dynamic>(
        name: 'MyCubit',
        copyWith: false,
        overrideEquality: false,
        overrideToString: false,
      );
      expect(annotation.name, 'MyCubit');
      expect(annotation.copyWith, false);
      expect(annotation.overrideEquality, false);
      expect(annotation.overrideToString, false);
    });
  });

  group('EventMeta', () {
    test('default values', () {
      const annotation = EventMeta();
      expect(annotation.name, '');
      expect(annotation.copyWith, true);
      expect(annotation.overrideEquality, true);
      expect(annotation.overrideToString, true);
    });

    test('custom values', () {
      const annotation = EventMeta(
        name: 'MyEvent',
        copyWith: false,
        overrideEquality: false,
        overrideToString: false,
      );
      expect(annotation.name, 'MyEvent');
      expect(annotation.copyWith, false);
      expect(annotation.overrideEquality, false);
      expect(annotation.overrideToString, false);
    });
  });
}
