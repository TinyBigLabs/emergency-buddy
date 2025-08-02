// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pdf_reference_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PdfReference {
  @JsonKey(name: 'pdf_id')
  String get pdfId;
  @JsonKey(name: 'pdf_filename')
  String get pdfFilename;

  /// Create a copy of PdfReference
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PdfReferenceCopyWith<PdfReference> get copyWith =>
      _$PdfReferenceCopyWithImpl<PdfReference>(
          this as PdfReference, _$identity);

  /// Serializes this PdfReference to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PdfReference &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.pdfFilename, pdfFilename) ||
                other.pdfFilename == pdfFilename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pdfId, pdfFilename);

  @override
  String toString() {
    return 'PdfReference(pdfId: $pdfId, pdfFilename: $pdfFilename)';
  }
}

/// @nodoc
abstract mixin class $PdfReferenceCopyWith<$Res> {
  factory $PdfReferenceCopyWith(
          PdfReference value, $Res Function(PdfReference) _then) =
      _$PdfReferenceCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'pdf_id') String pdfId,
      @JsonKey(name: 'pdf_filename') String pdfFilename});
}

/// @nodoc
class _$PdfReferenceCopyWithImpl<$Res> implements $PdfReferenceCopyWith<$Res> {
  _$PdfReferenceCopyWithImpl(this._self, this._then);

  final PdfReference _self;
  final $Res Function(PdfReference) _then;

  /// Create a copy of PdfReference
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfId = null,
    Object? pdfFilename = null,
  }) {
    return _then(_self.copyWith(
      pdfId: null == pdfId
          ? _self.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      pdfFilename: null == pdfFilename
          ? _self.pdfFilename
          : pdfFilename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [PdfReference].
extension PdfReferencePatterns on PdfReference {
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
    TResult Function(_PdfReference value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PdfReference() when $default != null:
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
    TResult Function(_PdfReference value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReference():
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
    TResult? Function(_PdfReference value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReference() when $default != null:
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
    TResult Function(@JsonKey(name: 'pdf_id') String pdfId,
            @JsonKey(name: 'pdf_filename') String pdfFilename)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PdfReference() when $default != null:
        return $default(_that.pdfId, _that.pdfFilename);
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
    TResult Function(@JsonKey(name: 'pdf_id') String pdfId,
            @JsonKey(name: 'pdf_filename') String pdfFilename)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReference():
        return $default(_that.pdfId, _that.pdfFilename);
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
    TResult? Function(@JsonKey(name: 'pdf_id') String pdfId,
            @JsonKey(name: 'pdf_filename') String pdfFilename)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReference() when $default != null:
        return $default(_that.pdfId, _that.pdfFilename);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PdfReference implements PdfReference {
  const _PdfReference(
      {@JsonKey(name: 'pdf_id') required this.pdfId,
      @JsonKey(name: 'pdf_filename') required this.pdfFilename});
  factory _PdfReference.fromJson(Map<String, dynamic> json) =>
      _$PdfReferenceFromJson(json);

  @override
  @JsonKey(name: 'pdf_id')
  final String pdfId;
  @override
  @JsonKey(name: 'pdf_filename')
  final String pdfFilename;

  /// Create a copy of PdfReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PdfReferenceCopyWith<_PdfReference> get copyWith =>
      __$PdfReferenceCopyWithImpl<_PdfReference>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PdfReferenceToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PdfReference &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.pdfFilename, pdfFilename) ||
                other.pdfFilename == pdfFilename));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, pdfId, pdfFilename);

  @override
  String toString() {
    return 'PdfReference(pdfId: $pdfId, pdfFilename: $pdfFilename)';
  }
}

/// @nodoc
abstract mixin class _$PdfReferenceCopyWith<$Res>
    implements $PdfReferenceCopyWith<$Res> {
  factory _$PdfReferenceCopyWith(
          _PdfReference value, $Res Function(_PdfReference) _then) =
      __$PdfReferenceCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pdf_id') String pdfId,
      @JsonKey(name: 'pdf_filename') String pdfFilename});
}

/// @nodoc
class __$PdfReferenceCopyWithImpl<$Res>
    implements _$PdfReferenceCopyWith<$Res> {
  __$PdfReferenceCopyWithImpl(this._self, this._then);

  final _PdfReference _self;
  final $Res Function(_PdfReference) _then;

  /// Create a copy of PdfReference
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pdfId = null,
    Object? pdfFilename = null,
  }) {
    return _then(_PdfReference(
      pdfId: null == pdfId
          ? _self.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      pdfFilename: null == pdfFilename
          ? _self.pdfFilename
          : pdfFilename // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PdfReferencesResponse {
  @JsonKey(name: 'pdf_references')
  List<PdfReference> get pdfReferences;

  /// Create a copy of PdfReferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PdfReferencesResponseCopyWith<PdfReferencesResponse> get copyWith =>
      _$PdfReferencesResponseCopyWithImpl<PdfReferencesResponse>(
          this as PdfReferencesResponse, _$identity);

  /// Serializes this PdfReferencesResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PdfReferencesResponse &&
            const DeepCollectionEquality()
                .equals(other.pdfReferences, pdfReferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(pdfReferences));

  @override
  String toString() {
    return 'PdfReferencesResponse(pdfReferences: $pdfReferences)';
  }
}

/// @nodoc
abstract mixin class $PdfReferencesResponseCopyWith<$Res> {
  factory $PdfReferencesResponseCopyWith(PdfReferencesResponse value,
          $Res Function(PdfReferencesResponse) _then) =
      _$PdfReferencesResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'pdf_references') List<PdfReference> pdfReferences});
}

/// @nodoc
class _$PdfReferencesResponseCopyWithImpl<$Res>
    implements $PdfReferencesResponseCopyWith<$Res> {
  _$PdfReferencesResponseCopyWithImpl(this._self, this._then);

  final PdfReferencesResponse _self;
  final $Res Function(PdfReferencesResponse) _then;

  /// Create a copy of PdfReferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? pdfReferences = null,
  }) {
    return _then(_self.copyWith(
      pdfReferences: null == pdfReferences
          ? _self.pdfReferences
          : pdfReferences // ignore: cast_nullable_to_non_nullable
              as List<PdfReference>,
    ));
  }
}

/// Adds pattern-matching-related methods to [PdfReferencesResponse].
extension PdfReferencesResponsePatterns on PdfReferencesResponse {
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
    TResult Function(_PdfReferencesResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PdfReferencesResponse() when $default != null:
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
    TResult Function(_PdfReferencesResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReferencesResponse():
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
    TResult? Function(_PdfReferencesResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReferencesResponse() when $default != null:
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
            @JsonKey(name: 'pdf_references') List<PdfReference> pdfReferences)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _PdfReferencesResponse() when $default != null:
        return $default(_that.pdfReferences);
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
            @JsonKey(name: 'pdf_references') List<PdfReference> pdfReferences)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReferencesResponse():
        return $default(_that.pdfReferences);
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
            @JsonKey(name: 'pdf_references') List<PdfReference> pdfReferences)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _PdfReferencesResponse() when $default != null:
        return $default(_that.pdfReferences);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _PdfReferencesResponse implements PdfReferencesResponse {
  const _PdfReferencesResponse(
      {@JsonKey(name: 'pdf_references')
      required final List<PdfReference> pdfReferences})
      : _pdfReferences = pdfReferences;
  factory _PdfReferencesResponse.fromJson(Map<String, dynamic> json) =>
      _$PdfReferencesResponseFromJson(json);

  final List<PdfReference> _pdfReferences;
  @override
  @JsonKey(name: 'pdf_references')
  List<PdfReference> get pdfReferences {
    if (_pdfReferences is EqualUnmodifiableListView) return _pdfReferences;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pdfReferences);
  }

  /// Create a copy of PdfReferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PdfReferencesResponseCopyWith<_PdfReferencesResponse> get copyWith =>
      __$PdfReferencesResponseCopyWithImpl<_PdfReferencesResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PdfReferencesResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PdfReferencesResponse &&
            const DeepCollectionEquality()
                .equals(other._pdfReferences, _pdfReferences));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_pdfReferences));

  @override
  String toString() {
    return 'PdfReferencesResponse(pdfReferences: $pdfReferences)';
  }
}

/// @nodoc
abstract mixin class _$PdfReferencesResponseCopyWith<$Res>
    implements $PdfReferencesResponseCopyWith<$Res> {
  factory _$PdfReferencesResponseCopyWith(_PdfReferencesResponse value,
          $Res Function(_PdfReferencesResponse) _then) =
      __$PdfReferencesResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'pdf_references') List<PdfReference> pdfReferences});
}

/// @nodoc
class __$PdfReferencesResponseCopyWithImpl<$Res>
    implements _$PdfReferencesResponseCopyWith<$Res> {
  __$PdfReferencesResponseCopyWithImpl(this._self, this._then);

  final _PdfReferencesResponse _self;
  final $Res Function(_PdfReferencesResponse) _then;

  /// Create a copy of PdfReferencesResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pdfReferences = null,
  }) {
    return _then(_PdfReferencesResponse(
      pdfReferences: null == pdfReferences
          ? _self._pdfReferences
          : pdfReferences // ignore: cast_nullable_to_non_nullable
              as List<PdfReference>,
    ));
  }
}

// dart format on
