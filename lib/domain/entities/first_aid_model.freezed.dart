// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_aid_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirstAidData {
  @JsonKey(name: 'first_aid_id')
  String get firstAidId;
  @JsonKey(name: 'prompt_tag')
  String get promptTag;
  @JsonKey(name: 'age_group')
  String get ageGroup;
  String get category;
  String get language;
  int get sort;

  /// Create a copy of FirstAidData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirstAidDataCopyWith<FirstAidData> get copyWith =>
      _$FirstAidDataCopyWithImpl<FirstAidData>(
          this as FirstAidData, _$identity);

  /// Serializes this FirstAidData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FirstAidData &&
            (identical(other.firstAidId, firstAidId) ||
                other.firstAidId == firstAidId) &&
            (identical(other.promptTag, promptTag) ||
                other.promptTag == promptTag) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstAidId, promptTag, ageGroup, category, language, sort);

  @override
  String toString() {
    return 'FirstAidData(firstAidId: $firstAidId, promptTag: $promptTag, ageGroup: $ageGroup, category: $category, language: $language, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class $FirstAidDataCopyWith<$Res> {
  factory $FirstAidDataCopyWith(
          FirstAidData value, $Res Function(FirstAidData) _then) =
      _$FirstAidDataCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_aid_id') String firstAidId,
      @JsonKey(name: 'prompt_tag') String promptTag,
      @JsonKey(name: 'age_group') String ageGroup,
      String category,
      String language,
      int sort});
}

/// @nodoc
class _$FirstAidDataCopyWithImpl<$Res> implements $FirstAidDataCopyWith<$Res> {
  _$FirstAidDataCopyWithImpl(this._self, this._then);

  final FirstAidData _self;
  final $Res Function(FirstAidData) _then;

  /// Create a copy of FirstAidData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstAidId = null,
    Object? promptTag = null,
    Object? ageGroup = null,
    Object? category = null,
    Object? language = null,
    Object? sort = null,
  }) {
    return _then(_self.copyWith(
      firstAidId: null == firstAidId
          ? _self.firstAidId
          : firstAidId // ignore: cast_nullable_to_non_nullable
              as String,
      promptTag: null == promptTag
          ? _self.promptTag
          : promptTag // ignore: cast_nullable_to_non_nullable
              as String,
      ageGroup: null == ageGroup
          ? _self.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FirstAidData].
extension FirstAidDataPatterns on FirstAidData {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FirstAidData value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidData() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FirstAidData value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidData():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FirstAidData value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidData() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'prompt_tag') String promptTag,
            @JsonKey(name: 'age_group') String ageGroup,
            String category,
            String language,
            int sort)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidData() when $default != null:
        return $default(_that.firstAidId, _that.promptTag, _that.ageGroup,
            _that.category, _that.language, _that.sort);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'prompt_tag') String promptTag,
            @JsonKey(name: 'age_group') String ageGroup,
            String category,
            String language,
            int sort)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidData():
        return $default(_that.firstAidId, _that.promptTag, _that.ageGroup,
            _that.category, _that.language, _that.sort);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'prompt_tag') String promptTag,
            @JsonKey(name: 'age_group') String ageGroup,
            String category,
            String language,
            int sort)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidData() when $default != null:
        return $default(_that.firstAidId, _that.promptTag, _that.ageGroup,
            _that.category, _that.language, _that.sort);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FirstAidData implements FirstAidData {
  const _FirstAidData(
      {@JsonKey(name: 'first_aid_id') required this.firstAidId,
      @JsonKey(name: 'prompt_tag') required this.promptTag,
      @JsonKey(name: 'age_group') required this.ageGroup,
      required this.category,
      required this.language,
      required this.sort});
  factory _FirstAidData.fromJson(Map<String, dynamic> json) =>
      _$FirstAidDataFromJson(json);

  @override
  @JsonKey(name: 'first_aid_id')
  final String firstAidId;
  @override
  @JsonKey(name: 'prompt_tag')
  final String promptTag;
  @override
  @JsonKey(name: 'age_group')
  final String ageGroup;
  @override
  final String category;
  @override
  final String language;
  @override
  final int sort;

  /// Create a copy of FirstAidData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FirstAidDataCopyWith<_FirstAidData> get copyWith =>
      __$FirstAidDataCopyWithImpl<_FirstAidData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FirstAidDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirstAidData &&
            (identical(other.firstAidId, firstAidId) ||
                other.firstAidId == firstAidId) &&
            (identical(other.promptTag, promptTag) ||
                other.promptTag == promptTag) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup) &&
            (identical(other.category, category) ||
                other.category == category) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.sort, sort) || other.sort == sort));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, firstAidId, promptTag, ageGroup, category, language, sort);

  @override
  String toString() {
    return 'FirstAidData(firstAidId: $firstAidId, promptTag: $promptTag, ageGroup: $ageGroup, category: $category, language: $language, sort: $sort)';
  }
}

/// @nodoc
abstract mixin class _$FirstAidDataCopyWith<$Res>
    implements $FirstAidDataCopyWith<$Res> {
  factory _$FirstAidDataCopyWith(
          _FirstAidData value, $Res Function(_FirstAidData) _then) =
      __$FirstAidDataCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_aid_id') String firstAidId,
      @JsonKey(name: 'prompt_tag') String promptTag,
      @JsonKey(name: 'age_group') String ageGroup,
      String category,
      String language,
      int sort});
}

/// @nodoc
class __$FirstAidDataCopyWithImpl<$Res>
    implements _$FirstAidDataCopyWith<$Res> {
  __$FirstAidDataCopyWithImpl(this._self, this._then);

  final _FirstAidData _self;
  final $Res Function(_FirstAidData) _then;

  /// Create a copy of FirstAidData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstAidId = null,
    Object? promptTag = null,
    Object? ageGroup = null,
    Object? category = null,
    Object? language = null,
    Object? sort = null,
  }) {
    return _then(_FirstAidData(
      firstAidId: null == firstAidId
          ? _self.firstAidId
          : firstAidId // ignore: cast_nullable_to_non_nullable
              as String,
      promptTag: null == promptTag
          ? _self.promptTag
          : promptTag // ignore: cast_nullable_to_non_nullable
              as String,
      ageGroup: null == ageGroup
          ? _self.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
      category: null == category
          ? _self.category
          : category // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      sort: null == sort
          ? _self.sort
          : sort // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$FirstAidDataResponse {
  @JsonKey(name: 'first_aid_data')
  List<FirstAidData> get firstAidData;

  /// Create a copy of FirstAidDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirstAidDataResponseCopyWith<FirstAidDataResponse> get copyWith =>
      _$FirstAidDataResponseCopyWithImpl<FirstAidDataResponse>(
          this as FirstAidDataResponse, _$identity);

  /// Serializes this FirstAidDataResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FirstAidDataResponse &&
            const DeepCollectionEquality()
                .equals(other.firstAidData, firstAidData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(firstAidData));

  @override
  String toString() {
    return 'FirstAidDataResponse(firstAidData: $firstAidData)';
  }
}

/// @nodoc
abstract mixin class $FirstAidDataResponseCopyWith<$Res> {
  factory $FirstAidDataResponseCopyWith(FirstAidDataResponse value,
          $Res Function(FirstAidDataResponse) _then) =
      _$FirstAidDataResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'first_aid_data') List<FirstAidData> firstAidData});
}

/// @nodoc
class _$FirstAidDataResponseCopyWithImpl<$Res>
    implements $FirstAidDataResponseCopyWith<$Res> {
  _$FirstAidDataResponseCopyWithImpl(this._self, this._then);

  final FirstAidDataResponse _self;
  final $Res Function(FirstAidDataResponse) _then;

  /// Create a copy of FirstAidDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstAidData = null,
  }) {
    return _then(_self.copyWith(
      firstAidData: null == firstAidData
          ? _self.firstAidData
          : firstAidData // ignore: cast_nullable_to_non_nullable
              as List<FirstAidData>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FirstAidDataResponse].
extension FirstAidDataResponsePatterns on FirstAidDataResponse {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_FirstAidDataResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidDataResponse() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_FirstAidDataResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidDataResponse():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_FirstAidDataResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidDataResponse() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'first_aid_data') List<FirstAidData> firstAidData)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidDataResponse() when $default != null:
        return $default(_that.firstAidData);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            @JsonKey(name: 'first_aid_data') List<FirstAidData> firstAidData)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidDataResponse():
        return $default(_that.firstAidData);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            @JsonKey(name: 'first_aid_data') List<FirstAidData> firstAidData)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidDataResponse() when $default != null:
        return $default(_that.firstAidData);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FirstAidDataResponse implements FirstAidDataResponse {
  const _FirstAidDataResponse(
      {@JsonKey(name: 'first_aid_data')
      required final List<FirstAidData> firstAidData})
      : _firstAidData = firstAidData;
  factory _FirstAidDataResponse.fromJson(Map<String, dynamic> json) =>
      _$FirstAidDataResponseFromJson(json);

  final List<FirstAidData> _firstAidData;
  @override
  @JsonKey(name: 'first_aid_data')
  List<FirstAidData> get firstAidData {
    if (_firstAidData is EqualUnmodifiableListView) return _firstAidData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstAidData);
  }

  /// Create a copy of FirstAidDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FirstAidDataResponseCopyWith<_FirstAidDataResponse> get copyWith =>
      __$FirstAidDataResponseCopyWithImpl<_FirstAidDataResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FirstAidDataResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirstAidDataResponse &&
            const DeepCollectionEquality()
                .equals(other._firstAidData, _firstAidData));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_firstAidData));

  @override
  String toString() {
    return 'FirstAidDataResponse(firstAidData: $firstAidData)';
  }
}

/// @nodoc
abstract mixin class _$FirstAidDataResponseCopyWith<$Res>
    implements $FirstAidDataResponseCopyWith<$Res> {
  factory _$FirstAidDataResponseCopyWith(_FirstAidDataResponse value,
          $Res Function(_FirstAidDataResponse) _then) =
      __$FirstAidDataResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'first_aid_data') List<FirstAidData> firstAidData});
}

/// @nodoc
class __$FirstAidDataResponseCopyWithImpl<$Res>
    implements _$FirstAidDataResponseCopyWith<$Res> {
  __$FirstAidDataResponseCopyWithImpl(this._self, this._then);

  final _FirstAidDataResponse _self;
  final $Res Function(_FirstAidDataResponse) _then;

  /// Create a copy of FirstAidDataResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstAidData = null,
  }) {
    return _then(_FirstAidDataResponse(
      firstAidData: null == firstAidData
          ? _self._firstAidData
          : firstAidData // ignore: cast_nullable_to_non_nullable
              as List<FirstAidData>,
    ));
  }
}

// dart format on
