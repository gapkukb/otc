// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pagination.model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PaginationModel<T> {
  int get size => throw _privateConstructorUsedError;
  int get current => throw _privateConstructorUsedError;
  int get pages => throw _privateConstructorUsedError;
  int get total => throw _privateConstructorUsedError;
  List<T> get records => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaginationModelCopyWith<T, PaginationModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaginationModelCopyWith<T, $Res> {
  factory $PaginationModelCopyWith(
          PaginationModel<T> value, $Res Function(PaginationModel<T>) then) =
      _$PaginationModelCopyWithImpl<T, $Res, PaginationModel<T>>;
  @useResult
  $Res call({int size, int current, int pages, int total, List<T> records});
}

/// @nodoc
class _$PaginationModelCopyWithImpl<T, $Res, $Val extends PaginationModel<T>>
    implements $PaginationModelCopyWith<T, $Res> {
  _$PaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? current = null,
    Object? pages = null,
    Object? total = null,
    Object? records = null,
  }) {
    return _then(_value.copyWith(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      records: null == records
          ? _value.records
          : records // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PaginationModelCopyWith<T, $Res>
    implements $PaginationModelCopyWith<T, $Res> {
  factory _$$_PaginationModelCopyWith(_$_PaginationModel<T> value,
          $Res Function(_$_PaginationModel<T>) then) =
      __$$_PaginationModelCopyWithImpl<T, $Res>;
  @override
  @useResult
  $Res call({int size, int current, int pages, int total, List<T> records});
}

/// @nodoc
class __$$_PaginationModelCopyWithImpl<T, $Res>
    extends _$PaginationModelCopyWithImpl<T, $Res, _$_PaginationModel<T>>
    implements _$$_PaginationModelCopyWith<T, $Res> {
  __$$_PaginationModelCopyWithImpl(
      _$_PaginationModel<T> _value, $Res Function(_$_PaginationModel<T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? size = null,
    Object? current = null,
    Object? pages = null,
    Object? total = null,
    Object? records = null,
  }) {
    return _then(_$_PaginationModel<T>(
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      current: null == current
          ? _value.current
          : current // ignore: cast_nullable_to_non_nullable
              as int,
      pages: null == pages
          ? _value.pages
          : pages // ignore: cast_nullable_to_non_nullable
              as int,
      total: null == total
          ? _value.total
          : total // ignore: cast_nullable_to_non_nullable
              as int,
      records: null == records
          ? _value._records
          : records // ignore: cast_nullable_to_non_nullable
              as List<T>,
    ));
  }
}

/// @nodoc

class _$_PaginationModel<T> extends _PaginationModel<T> {
  const _$_PaginationModel(
      {required this.size,
      required this.current,
      required this.pages,
      required this.total,
      final List<T> records = const []})
      : _records = records,
        super._();

  @override
  final int size;
  @override
  final int current;
  @override
  final int pages;
  @override
  final int total;
  final List<T> _records;
  @override
  @JsonKey()
  List<T> get records {
    if (_records is EqualUnmodifiableListView) return _records;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_records);
  }

  @override
  String toString() {
    return 'PaginationModel<$T>(size: $size, current: $current, pages: $pages, total: $total, records: $records)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PaginationModel<T> &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.current, current) || other.current == current) &&
            (identical(other.pages, pages) || other.pages == pages) &&
            (identical(other.total, total) || other.total == total) &&
            const DeepCollectionEquality().equals(other._records, _records));
  }

  @override
  int get hashCode => Object.hash(runtimeType, size, current, pages, total,
      const DeepCollectionEquality().hash(_records));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PaginationModelCopyWith<T, _$_PaginationModel<T>> get copyWith =>
      __$$_PaginationModelCopyWithImpl<T, _$_PaginationModel<T>>(
          this, _$identity);
}

abstract class _PaginationModel<T> extends PaginationModel<T> {
  const factory _PaginationModel(
      {required final int size,
      required final int current,
      required final int pages,
      required final int total,
      final List<T> records}) = _$_PaginationModel<T>;
  const _PaginationModel._() : super._();

  @override
  int get size;
  @override
  int get current;
  @override
  int get pages;
  @override
  int get total;
  @override
  List<T> get records;
  @override
  @JsonKey(ignore: true)
  _$$_PaginationModelCopyWith<T, _$_PaginationModel<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
