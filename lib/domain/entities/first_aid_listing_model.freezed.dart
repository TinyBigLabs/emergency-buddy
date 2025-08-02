// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'first_aid_listing_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FirstAidListing {
  @JsonKey(name: 'listing_id')
  String get listingId;
  @JsonKey(name: 'first_aid_id')
  String get firstAidId;
  @JsonKey(name: 'pdf_id')
  String get pdfId;
  String get title;
  int get page;
  @JsonKey(name: 'default')
  int get defaultValue;

  /// Create a copy of FirstAidListing
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirstAidListingCopyWith<FirstAidListing> get copyWith =>
      _$FirstAidListingCopyWithImpl<FirstAidListing>(
          this as FirstAidListing, _$identity);

  /// Serializes this FirstAidListing to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FirstAidListing &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.firstAidId, firstAidId) ||
                other.firstAidId == firstAidId) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, listingId, firstAidId, pdfId, title, page, defaultValue);

  @override
  String toString() {
    return 'FirstAidListing(listingId: $listingId, firstAidId: $firstAidId, pdfId: $pdfId, title: $title, page: $page, defaultValue: $defaultValue)';
  }
}

/// @nodoc
abstract mixin class $FirstAidListingCopyWith<$Res> {
  factory $FirstAidListingCopyWith(
          FirstAidListing value, $Res Function(FirstAidListing) _then) =
      _$FirstAidListingCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'listing_id') String listingId,
      @JsonKey(name: 'first_aid_id') String firstAidId,
      @JsonKey(name: 'pdf_id') String pdfId,
      String title,
      int page,
      @JsonKey(name: 'default') int defaultValue});
}

/// @nodoc
class _$FirstAidListingCopyWithImpl<$Res>
    implements $FirstAidListingCopyWith<$Res> {
  _$FirstAidListingCopyWithImpl(this._self, this._then);

  final FirstAidListing _self;
  final $Res Function(FirstAidListing) _then;

  /// Create a copy of FirstAidListing
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? listingId = null,
    Object? firstAidId = null,
    Object? pdfId = null,
    Object? title = null,
    Object? page = null,
    Object? defaultValue = null,
  }) {
    return _then(_self.copyWith(
      listingId: null == listingId
          ? _self.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      firstAidId: null == firstAidId
          ? _self.firstAidId
          : firstAidId // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _self.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// Adds pattern-matching-related methods to [FirstAidListing].
extension FirstAidListingPatterns on FirstAidListing {
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
    TResult Function(_FirstAidListing value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidListing() when $default != null:
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
    TResult Function(_FirstAidListing value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListing():
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
    TResult? Function(_FirstAidListing value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListing() when $default != null:
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
            @JsonKey(name: 'listing_id') String listingId,
            @JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'pdf_id') String pdfId,
            String title,
            int page,
            @JsonKey(name: 'default') int defaultValue)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidListing() when $default != null:
        return $default(_that.listingId, _that.firstAidId, _that.pdfId,
            _that.title, _that.page, _that.defaultValue);
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
            @JsonKey(name: 'listing_id') String listingId,
            @JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'pdf_id') String pdfId,
            String title,
            int page,
            @JsonKey(name: 'default') int defaultValue)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListing():
        return $default(_that.listingId, _that.firstAidId, _that.pdfId,
            _that.title, _that.page, _that.defaultValue);
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
            @JsonKey(name: 'listing_id') String listingId,
            @JsonKey(name: 'first_aid_id') String firstAidId,
            @JsonKey(name: 'pdf_id') String pdfId,
            String title,
            int page,
            @JsonKey(name: 'default') int defaultValue)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListing() when $default != null:
        return $default(_that.listingId, _that.firstAidId, _that.pdfId,
            _that.title, _that.page, _that.defaultValue);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FirstAidListing implements FirstAidListing {
  const _FirstAidListing(
      {@JsonKey(name: 'listing_id') required this.listingId,
      @JsonKey(name: 'first_aid_id') required this.firstAidId,
      @JsonKey(name: 'pdf_id') required this.pdfId,
      required this.title,
      required this.page,
      @JsonKey(name: 'default') required this.defaultValue});
  factory _FirstAidListing.fromJson(Map<String, dynamic> json) =>
      _$FirstAidListingFromJson(json);

  @override
  @JsonKey(name: 'listing_id')
  final String listingId;
  @override
  @JsonKey(name: 'first_aid_id')
  final String firstAidId;
  @override
  @JsonKey(name: 'pdf_id')
  final String pdfId;
  @override
  final String title;
  @override
  final int page;
  @override
  @JsonKey(name: 'default')
  final int defaultValue;

  /// Create a copy of FirstAidListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FirstAidListingCopyWith<_FirstAidListing> get copyWith =>
      __$FirstAidListingCopyWithImpl<_FirstAidListing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FirstAidListingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirstAidListing &&
            (identical(other.listingId, listingId) ||
                other.listingId == listingId) &&
            (identical(other.firstAidId, firstAidId) ||
                other.firstAidId == firstAidId) &&
            (identical(other.pdfId, pdfId) || other.pdfId == pdfId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.defaultValue, defaultValue) ||
                other.defaultValue == defaultValue));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, listingId, firstAidId, pdfId, title, page, defaultValue);

  @override
  String toString() {
    return 'FirstAidListing(listingId: $listingId, firstAidId: $firstAidId, pdfId: $pdfId, title: $title, page: $page, defaultValue: $defaultValue)';
  }
}

/// @nodoc
abstract mixin class _$FirstAidListingCopyWith<$Res>
    implements $FirstAidListingCopyWith<$Res> {
  factory _$FirstAidListingCopyWith(
          _FirstAidListing value, $Res Function(_FirstAidListing) _then) =
      __$FirstAidListingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'listing_id') String listingId,
      @JsonKey(name: 'first_aid_id') String firstAidId,
      @JsonKey(name: 'pdf_id') String pdfId,
      String title,
      int page,
      @JsonKey(name: 'default') int defaultValue});
}

/// @nodoc
class __$FirstAidListingCopyWithImpl<$Res>
    implements _$FirstAidListingCopyWith<$Res> {
  __$FirstAidListingCopyWithImpl(this._self, this._then);

  final _FirstAidListing _self;
  final $Res Function(_FirstAidListing) _then;

  /// Create a copy of FirstAidListing
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? listingId = null,
    Object? firstAidId = null,
    Object? pdfId = null,
    Object? title = null,
    Object? page = null,
    Object? defaultValue = null,
  }) {
    return _then(_FirstAidListing(
      listingId: null == listingId
          ? _self.listingId
          : listingId // ignore: cast_nullable_to_non_nullable
              as String,
      firstAidId: null == firstAidId
          ? _self.firstAidId
          : firstAidId // ignore: cast_nullable_to_non_nullable
              as String,
      pdfId: null == pdfId
          ? _self.pdfId
          : pdfId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      page: null == page
          ? _self.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      defaultValue: null == defaultValue
          ? _self.defaultValue
          : defaultValue // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$FirstAidListingsResponse {
  @JsonKey(name: 'first_aid_listings')
  List<FirstAidListing> get firstAidListings;

  /// Create a copy of FirstAidListingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FirstAidListingsResponseCopyWith<FirstAidListingsResponse> get copyWith =>
      _$FirstAidListingsResponseCopyWithImpl<FirstAidListingsResponse>(
          this as FirstAidListingsResponse, _$identity);

  /// Serializes this FirstAidListingsResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FirstAidListingsResponse &&
            const DeepCollectionEquality()
                .equals(other.firstAidListings, firstAidListings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(firstAidListings));

  @override
  String toString() {
    return 'FirstAidListingsResponse(firstAidListings: $firstAidListings)';
  }
}

/// @nodoc
abstract mixin class $FirstAidListingsResponseCopyWith<$Res> {
  factory $FirstAidListingsResponseCopyWith(FirstAidListingsResponse value,
          $Res Function(FirstAidListingsResponse) _then) =
      _$FirstAidListingsResponseCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'first_aid_listings')
      List<FirstAidListing> firstAidListings});
}

/// @nodoc
class _$FirstAidListingsResponseCopyWithImpl<$Res>
    implements $FirstAidListingsResponseCopyWith<$Res> {
  _$FirstAidListingsResponseCopyWithImpl(this._self, this._then);

  final FirstAidListingsResponse _self;
  final $Res Function(FirstAidListingsResponse) _then;

  /// Create a copy of FirstAidListingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstAidListings = null,
  }) {
    return _then(_self.copyWith(
      firstAidListings: null == firstAidListings
          ? _self.firstAidListings
          : firstAidListings // ignore: cast_nullable_to_non_nullable
              as List<FirstAidListing>,
    ));
  }
}

/// Adds pattern-matching-related methods to [FirstAidListingsResponse].
extension FirstAidListingsResponsePatterns on FirstAidListingsResponse {
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
    TResult Function(_FirstAidListingsResponse value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidListingsResponse() when $default != null:
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
    TResult Function(_FirstAidListingsResponse value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListingsResponse():
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
    TResult? Function(_FirstAidListingsResponse value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListingsResponse() when $default != null:
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
            @JsonKey(name: 'first_aid_listings')
            List<FirstAidListing> firstAidListings)?
        $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _FirstAidListingsResponse() when $default != null:
        return $default(_that.firstAidListings);
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
            @JsonKey(name: 'first_aid_listings')
            List<FirstAidListing> firstAidListings)
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListingsResponse():
        return $default(_that.firstAidListings);
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
            @JsonKey(name: 'first_aid_listings')
            List<FirstAidListing> firstAidListings)?
        $default,
  ) {
    final _that = this;
    switch (_that) {
      case _FirstAidListingsResponse() when $default != null:
        return $default(_that.firstAidListings);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _FirstAidListingsResponse implements FirstAidListingsResponse {
  const _FirstAidListingsResponse(
      {@JsonKey(name: 'first_aid_listings')
      required final List<FirstAidListing> firstAidListings})
      : _firstAidListings = firstAidListings;
  factory _FirstAidListingsResponse.fromJson(Map<String, dynamic> json) =>
      _$FirstAidListingsResponseFromJson(json);

  final List<FirstAidListing> _firstAidListings;
  @override
  @JsonKey(name: 'first_aid_listings')
  List<FirstAidListing> get firstAidListings {
    if (_firstAidListings is EqualUnmodifiableListView)
      return _firstAidListings;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_firstAidListings);
  }

  /// Create a copy of FirstAidListingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FirstAidListingsResponseCopyWith<_FirstAidListingsResponse> get copyWith =>
      __$FirstAidListingsResponseCopyWithImpl<_FirstAidListingsResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FirstAidListingsResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FirstAidListingsResponse &&
            const DeepCollectionEquality()
                .equals(other._firstAidListings, _firstAidListings));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_firstAidListings));

  @override
  String toString() {
    return 'FirstAidListingsResponse(firstAidListings: $firstAidListings)';
  }
}

/// @nodoc
abstract mixin class _$FirstAidListingsResponseCopyWith<$Res>
    implements $FirstAidListingsResponseCopyWith<$Res> {
  factory _$FirstAidListingsResponseCopyWith(_FirstAidListingsResponse value,
          $Res Function(_FirstAidListingsResponse) _then) =
      __$FirstAidListingsResponseCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'first_aid_listings')
      List<FirstAidListing> firstAidListings});
}

/// @nodoc
class __$FirstAidListingsResponseCopyWithImpl<$Res>
    implements _$FirstAidListingsResponseCopyWith<$Res> {
  __$FirstAidListingsResponseCopyWithImpl(this._self, this._then);

  final _FirstAidListingsResponse _self;
  final $Res Function(_FirstAidListingsResponse) _then;

  /// Create a copy of FirstAidListingsResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? firstAidListings = null,
  }) {
    return _then(_FirstAidListingsResponse(
      firstAidListings: null == firstAidListings
          ? _self._firstAidListings
          : firstAidListings // ignore: cast_nullable_to_non_nullable
              as List<FirstAidListing>,
    ));
  }
}

// dart format on
