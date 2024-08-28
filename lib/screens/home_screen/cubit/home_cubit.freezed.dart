// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeStateData {
  List<Movie> get moviesNewUpdate => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateDataCopyWith<HomeStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateDataCopyWith<$Res> {
  factory $HomeStateDataCopyWith(
          HomeStateData value, $Res Function(HomeStateData) then) =
      _$HomeStateDataCopyWithImpl<$Res, HomeStateData>;
  @useResult
  $Res call({List<Movie> moviesNewUpdate, bool isLoading});
}

/// @nodoc
class _$HomeStateDataCopyWithImpl<$Res, $Val extends HomeStateData>
    implements $HomeStateDataCopyWith<$Res> {
  _$HomeStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moviesNewUpdate = null,
    Object? isLoading = null,
  }) {
    return _then(_value.copyWith(
      moviesNewUpdate: null == moviesNewUpdate
          ? _value.moviesNewUpdate
          : moviesNewUpdate // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateDataImplCopyWith<$Res>
    implements $HomeStateDataCopyWith<$Res> {
  factory _$$HomeStateDataImplCopyWith(
          _$HomeStateDataImpl value, $Res Function(_$HomeStateDataImpl) then) =
      __$$HomeStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Movie> moviesNewUpdate, bool isLoading});
}

/// @nodoc
class __$$HomeStateDataImplCopyWithImpl<$Res>
    extends _$HomeStateDataCopyWithImpl<$Res, _$HomeStateDataImpl>
    implements _$$HomeStateDataImplCopyWith<$Res> {
  __$$HomeStateDataImplCopyWithImpl(
      _$HomeStateDataImpl _value, $Res Function(_$HomeStateDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? moviesNewUpdate = null,
    Object? isLoading = null,
  }) {
    return _then(_$HomeStateDataImpl(
      moviesNewUpdate: null == moviesNewUpdate
          ? _value._moviesNewUpdate
          : moviesNewUpdate // ignore: cast_nullable_to_non_nullable
              as List<Movie>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HomeStateDataImpl implements _HomeStateData {
  const _$HomeStateDataImpl(
      {final List<Movie> moviesNewUpdate = const [], this.isLoading = false})
      : _moviesNewUpdate = moviesNewUpdate;

  final List<Movie> _moviesNewUpdate;
  @override
  @JsonKey()
  List<Movie> get moviesNewUpdate {
    if (_moviesNewUpdate is EqualUnmodifiableListView) return _moviesNewUpdate;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_moviesNewUpdate);
  }

  @override
  @JsonKey()
  final bool isLoading;

  @override
  String toString() {
    return 'HomeStateData(moviesNewUpdate: $moviesNewUpdate, isLoading: $isLoading)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateDataImpl &&
            const DeepCollectionEquality()
                .equals(other._moviesNewUpdate, _moviesNewUpdate) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_moviesNewUpdate), isLoading);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateDataImplCopyWith<_$HomeStateDataImpl> get copyWith =>
      __$$HomeStateDataImplCopyWithImpl<_$HomeStateDataImpl>(this, _$identity);
}

abstract class _HomeStateData implements HomeStateData {
  const factory _HomeStateData(
      {final List<Movie> moviesNewUpdate,
      final bool isLoading}) = _$HomeStateDataImpl;

  @override
  List<Movie> get moviesNewUpdate;
  @override
  bool get isLoading;
  @override
  @JsonKey(ignore: true)
  _$$HomeStateDataImplCopyWith<_$HomeStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  HomeStateData get data => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStateData data) initial,
    required TResult Function(HomeStateData data) getMoviesNewUpdate,
    required TResult Function(HomeStateData data) isLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStateData data)? initial,
    TResult? Function(HomeStateData data)? getMoviesNewUpdate,
    TResult? Function(HomeStateData data)? isLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStateData data)? initial,
    TResult Function(HomeStateData data)? getMoviesNewUpdate,
    TResult Function(HomeStateData data)? isLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetMoviesNewUpdate value) getMoviesNewUpdate,
    required TResult Function(IsLoading value) isLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult? Function(IsLoading value)? isLoading,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult Function(IsLoading value)? isLoading,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call({HomeStateData data});

  $HomeStateDataCopyWith<$Res> get data;
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeStateData,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $HomeStateDataCopyWith<$Res> get data {
    return $HomeStateDataCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStateData data});

  @override
  $HomeStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$InitialImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeStateData,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(this.data);

  @override
  final HomeStateData data;

  @override
  String toString() {
    return 'HomeState.initial(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStateData data) initial,
    required TResult Function(HomeStateData data) getMoviesNewUpdate,
    required TResult Function(HomeStateData data) isLoading,
  }) {
    return initial(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStateData data)? initial,
    TResult? Function(HomeStateData data)? getMoviesNewUpdate,
    TResult? Function(HomeStateData data)? isLoading,
  }) {
    return initial?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStateData data)? initial,
    TResult Function(HomeStateData data)? getMoviesNewUpdate,
    TResult Function(HomeStateData data)? isLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetMoviesNewUpdate value) getMoviesNewUpdate,
    required TResult Function(IsLoading value) isLoading,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult? Function(IsLoading value)? isLoading,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult Function(IsLoading value)? isLoading,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial(final HomeStateData data) = _$InitialImpl;

  @override
  HomeStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetMoviesNewUpdateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$GetMoviesNewUpdateImplCopyWith(_$GetMoviesNewUpdateImpl value,
          $Res Function(_$GetMoviesNewUpdateImpl) then) =
      __$$GetMoviesNewUpdateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStateData data});

  @override
  $HomeStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$GetMoviesNewUpdateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$GetMoviesNewUpdateImpl>
    implements _$$GetMoviesNewUpdateImplCopyWith<$Res> {
  __$$GetMoviesNewUpdateImplCopyWithImpl(_$GetMoviesNewUpdateImpl _value,
      $Res Function(_$GetMoviesNewUpdateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$GetMoviesNewUpdateImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeStateData,
    ));
  }
}

/// @nodoc

class _$GetMoviesNewUpdateImpl implements GetMoviesNewUpdate {
  const _$GetMoviesNewUpdateImpl(this.data);

  @override
  final HomeStateData data;

  @override
  String toString() {
    return 'HomeState.getMoviesNewUpdate(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetMoviesNewUpdateImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GetMoviesNewUpdateImplCopyWith<_$GetMoviesNewUpdateImpl> get copyWith =>
      __$$GetMoviesNewUpdateImplCopyWithImpl<_$GetMoviesNewUpdateImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStateData data) initial,
    required TResult Function(HomeStateData data) getMoviesNewUpdate,
    required TResult Function(HomeStateData data) isLoading,
  }) {
    return getMoviesNewUpdate(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStateData data)? initial,
    TResult? Function(HomeStateData data)? getMoviesNewUpdate,
    TResult? Function(HomeStateData data)? isLoading,
  }) {
    return getMoviesNewUpdate?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStateData data)? initial,
    TResult Function(HomeStateData data)? getMoviesNewUpdate,
    TResult Function(HomeStateData data)? isLoading,
    required TResult orElse(),
  }) {
    if (getMoviesNewUpdate != null) {
      return getMoviesNewUpdate(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetMoviesNewUpdate value) getMoviesNewUpdate,
    required TResult Function(IsLoading value) isLoading,
  }) {
    return getMoviesNewUpdate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult? Function(IsLoading value)? isLoading,
  }) {
    return getMoviesNewUpdate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult Function(IsLoading value)? isLoading,
    required TResult orElse(),
  }) {
    if (getMoviesNewUpdate != null) {
      return getMoviesNewUpdate(this);
    }
    return orElse();
  }
}

abstract class GetMoviesNewUpdate implements HomeState {
  const factory GetMoviesNewUpdate(final HomeStateData data) =
      _$GetMoviesNewUpdateImpl;

  @override
  HomeStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$GetMoviesNewUpdateImplCopyWith<_$GetMoviesNewUpdateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IsLoadingImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$IsLoadingImplCopyWith(
          _$IsLoadingImpl value, $Res Function(_$IsLoadingImpl) then) =
      __$$IsLoadingImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({HomeStateData data});

  @override
  $HomeStateDataCopyWith<$Res> get data;
}

/// @nodoc
class __$$IsLoadingImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$IsLoadingImpl>
    implements _$$IsLoadingImplCopyWith<$Res> {
  __$$IsLoadingImplCopyWithImpl(
      _$IsLoadingImpl _value, $Res Function(_$IsLoadingImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$IsLoadingImpl(
      null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as HomeStateData,
    ));
  }
}

/// @nodoc

class _$IsLoadingImpl implements IsLoading {
  const _$IsLoadingImpl(this.data);

  @override
  final HomeStateData data;

  @override
  String toString() {
    return 'HomeState.isLoading(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IsLoadingImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IsLoadingImplCopyWith<_$IsLoadingImpl> get copyWith =>
      __$$IsLoadingImplCopyWithImpl<_$IsLoadingImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(HomeStateData data) initial,
    required TResult Function(HomeStateData data) getMoviesNewUpdate,
    required TResult Function(HomeStateData data) isLoading,
  }) {
    return isLoading(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(HomeStateData data)? initial,
    TResult? Function(HomeStateData data)? getMoviesNewUpdate,
    TResult? Function(HomeStateData data)? isLoading,
  }) {
    return isLoading?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(HomeStateData data)? initial,
    TResult Function(HomeStateData data)? getMoviesNewUpdate,
    TResult Function(HomeStateData data)? isLoading,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(GetMoviesNewUpdate value) getMoviesNewUpdate,
    required TResult Function(IsLoading value) isLoading,
  }) {
    return isLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult? Function(IsLoading value)? isLoading,
  }) {
    return isLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(GetMoviesNewUpdate value)? getMoviesNewUpdate,
    TResult Function(IsLoading value)? isLoading,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading(this);
    }
    return orElse();
  }
}

abstract class IsLoading implements HomeState {
  const factory IsLoading(final HomeStateData data) = _$IsLoadingImpl;

  @override
  HomeStateData get data;
  @override
  @JsonKey(ignore: true)
  _$$IsLoadingImplCopyWith<_$IsLoadingImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
