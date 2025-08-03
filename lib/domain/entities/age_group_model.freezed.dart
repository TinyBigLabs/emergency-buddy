// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'age_group_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AgeGroup {
  @JsonKey(name: 'first_aid_id')
  String get firstAidId;
  @JsonKey(name: 'age_group')
  String get ageGroup;

  /// Create a copy of AgeGroup
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgeGroupCopyWith<AgeGroup> get copyWith =>
      _$AgeGroupCopyWithImpl<AgeGroup>(this as AgeGroup, _$identity);

  /// Serializes this AgeGroup to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AgeGroup &&
            (identical(other.firstAidId, firstAidId) ||
                other.firstAidId == firstAidId) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstAidId, ageGroup);

  @override
  String toString() {
    return 'AgeGroup(firstAidId: $firstAidId, ageGroup: $ageGroup)';
  }
}

/// @nodoc
abstract mixin class $AgeGroupCopyWith<$Res> {
  factory $AgeGroupCopyWith(AgeGroup value, $Res Function(AgeGroup) _then) =
      _$AgeGroupCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_aid_id') String firstAidId,
      @JsonKey(name: 'age_group') String ageGroup});
}

/// @nodoc
class _$AgeGroupCopyWithImpl<$Res> implements $AgeGroupCopyWith<$Res> {
  _$AgeGroupCopyWithImpl(this._self, this._then);

  final AgeGroup _self;
  final $Res Function(AgeGroup) _then;

  /// Create a copy of AgeGroup
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstAidId = null,
    Object? ageGroup = null,
  }) {
    return _then(_self.copyWith(
      firstAidId: null == firstAidId
          ? _self.firstAidId
          : firstAidId // ignore: cast_nullable_to_non_nullable
              as String,
      ageGroup: null == ageGroup
          ? _self.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [AgeGroup].
extension AgeGroupPatterns on AgeGroup {
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
    TResult Function(_AgeGroup value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AgeGroup() when $default != null:
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
    TResult Function(_AgeGroup value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroup():
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
    TResult? Function(_AgeGroup value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroup() when $default != null:
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
    TResult Function(@JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'age_group') String ageGroup)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AgeGroup() when $default != null:
        return $default(_that.firstAidId, _that.ageGroup);
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
    TResult Function(@JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'age_group') String ageGroup)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroup():
        return $default(_that.firstAidId, _that.ageGroup);
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
    TResult? Function(@JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'age_group') String ageGroup)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroup() when $default != null:
        return $default(_that.firstAidId, _that.ageGroup);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AgeGroup implements AgeGroup {
  const _AgeGroup(
      {@JsonKey(name: 'first_aid_id') required this.firstAidId,
      @JsonKey(name: 'age_group') required this.ageGroup});
  factory _AgeGroup.fromJson(Map<String, dynamic> json) =>
      _$AgeGroupFromJson(json);

  @override
  @JsonKey(name: 'first_aid_id')
  final String firstAidId;
  @override
  @JsonKey(name: 'age_group')
  final String ageGroup;

  /// Create a copy of AgeGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AgeGroupCopyWith<_AgeGroup> get copyWith =>
      __$AgeGroupCopyWithImpl<_AgeGroup>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AgeGroupToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AgeGroup &&
            (identical(other.firstAidId, firstAidId) ||
                other.firstAidId == firstAidId) &&
            (identical(other.ageGroup, ageGroup) ||
                other.ageGroup == ageGroup));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, firstAidId, ageGroup);

  @override
  String toString() {
    return 'AgeGroup(firstAidId: $firstAidId, ageGroup: $ageGroup)';
  }
}

/// @nodoc
abstract mixin class _$AgeGroupCopyWith<$Res>
    implements $AgeGroupCopyWith<$Res> {
  factory _$AgeGroupCopyWith(_AgeGroup value, $Res Function(_AgeGroup) _then) =
      __$AgeGroupCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_aid_id') String firstAidId,
      @JsonKey(name: 'age_group') String ageGroup});
}

/// @nodoc
class __$AgeGroupCopyWithImpl<$Res> implements _$AgeGroupCopyWith<$Res> {
  __$AgeGroupCopyWithImpl(this._self, this._then);

  final _AgeGroup _self;
  final $Res Function(_AgeGroup) _then;

  /// Create a copy of AgeGroup
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstAidId = null,
    Object? ageGroup = null,
  }) {
    return _then(_AgeGroup(
      firstAidId: null == firstAidId
          ? _self.firstAidId
          : firstAidId // ignore: cast_nullable_to_non_nullable
              as String,
      ageGroup: null == ageGroup
          ? _self.ageGroup
          : ageGroup // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$AgeGroupResponse {
  @JsonKey(name: 'pdf_references')
  List<AgeGroup> get ageGroups;

  /// Create a copy of AgeGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $AgeGroupResponseCopyWith<AgeGroupResponse> get copyWith =>
      _$AgeGroupResponseCopyWithImpl<AgeGroupResponse>(
          this as AgeGroupResponse, _$identity);

  /// Serializes this AgeGroupResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AgeGroupResponse &&
            const DeepCollectionEquality().equals(other.ageGroups, ageGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(ageGroups));

  @override
  String toString() {
    return 'AgeGroupResponse(ageGroups: $ageGroups)';
  }
}

/// @nodoc
abstract mixin class $AgeGroupResponseCopyWith<$Res> {
  factory $AgeGroupResponseCopyWith(
          AgeGroupResponse value, $Res Function(AgeGroupResponse) _then) =
      _$AgeGroupResponseCopyWithImpl;
  @useResult
  $Res call({@JsonKey(name: 'pdf_references') List<AgeGroup> ageGroups});
}

/// @nodoc
class _$AgeGroupResponseCopyWithImpl<$Res>
    implements $AgeGroupResponseCopyWith<$Res> {
  _$AgeGroupResponseCopyWithImpl(this._self, this._then);

  final AgeGroupResponse _self;
  final $Res Function(AgeGroupResponse) _then;

  /// Create a copy of AgeGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ageGroups = null,
  }) {
    return _then(_self.copyWith(
      ageGroups: null == ageGroups
          ? _self.ageGroups
          : ageGroups // ignore: cast_nullable_to_non_nullable
              as List<AgeGroup>,
    ));
  }
}

/// Adds pattern-matching-related methods to [AgeGroupResponse].
extension AgeGroupResponsePatterns on AgeGroupResponse {
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
    TResult Function(_AgeGroupResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AgeGroupResponse() when $default != null:
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
    TResult Function(_AgeGroupResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroupResponse():
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
    TResult? Function(_AgeGroupResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroupResponse() when $default != null:
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
    TResult Function(@JsonKey(name: 'pdf_references') List<AgeGroup> ageGroups)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _AgeGroupResponse() when $default != null:
        return $default(_that.ageGroups);
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
    TResult Function(@JsonKey(name: 'pdf_references') List<AgeGroup> ageGroups)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroupResponse():
        return $default(_that.ageGroups);
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
            @JsonKey(name: 'pdf_references') List<AgeGroup> ageGroups)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _AgeGroupResponse() when $default != null:
        return $default(_that.ageGroups);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _AgeGroupResponse implements AgeGroupResponse {
  const _AgeGroupResponse(
      {@JsonKey(name: 'pdf_references')
      required final List<AgeGroup> ageGroups})
      : _ageGroups = ageGroups;
  factory _AgeGroupResponse.fromJson(Map<String, dynamic> json) =>
      _$AgeGroupResponseFromJson(json);

  final List<AgeGroup> _ageGroups;
  @override
  @JsonKey(name: 'pdf_references')
  List<AgeGroup> get ageGroups {
    if (_ageGroups is EqualUnmodifiableListView) return _ageGroups;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ageGroups);
  }

  /// Create a copy of AgeGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AgeGroupResponseCopyWith<_AgeGroupResponse> get copyWith =>
      __$AgeGroupResponseCopyWithImpl<_AgeGroupResponse>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$AgeGroupResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AgeGroupResponse &&
            const DeepCollectionEquality()
                .equals(other._ageGroups, _ageGroups));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_ageGroups));

  @override
  String toString() {
    return 'AgeGroupResponse(ageGroups: $ageGroups)';
  }
}

/// @nodoc
abstract mixin class _$AgeGroupResponseCopyWith<$Res>
    implements $AgeGroupResponseCopyWith<$Res> {
  factory _$AgeGroupResponseCopyWith(
          _AgeGroupResponse value, $Res Function(_AgeGroupResponse) _then) =
      __$AgeGroupResponseCopyWithImpl;
  @override
  @useResult
  $Res call({@JsonKey(name: 'pdf_references') List<AgeGroup> ageGroups});
}

/// @nodoc
class __$AgeGroupResponseCopyWithImpl<$Res>
    implements _$AgeGroupResponseCopyWith<$Res> {
  __$AgeGroupResponseCopyWithImpl(this._self, this._then);

  final _AgeGroupResponse _self;
  final $Res Function(_AgeGroupResponse) _then;

  /// Create a copy of AgeGroupResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ageGroups = null,
  }) {
    return _then(_AgeGroupResponse(
      ageGroups: null == ageGroups
          ? _self._ageGroups
          : ageGroups // ignore: cast_nullable_to_non_nullable
              as List<AgeGroup>,
    ));
  }
}

// dart format on
