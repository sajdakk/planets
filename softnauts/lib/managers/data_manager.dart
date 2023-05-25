import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

abstract class DataManager<T> {
  @protected
  final BehaviorSubject<List< T>> _data = BehaviorSubject<List< T>>.seeded(< T>[]);

  Stream<List<T>> get data$ => _data.stream.map((List< T> data) => data);

  Stream<List< T>> get dataMap$ => _data.stream;

  List<T> get lastKnownValues => _data.value.toList();


  Future<bool> fetchData(
   {
    bool forceFetching = true,
    bool showErrorToast = true,
  }) async {
    try {
      _data.add(await fetch());

      return true;
    } catch (e) {
      return false;
    }
  }

  /// deleteWhere is using to delete old values which doesn't exists.
  /// For example when you delete something and fetch again data, value still exists in map so we need to delete
  /// it first if we update stream with using current value.
  void updateStreamWith(List< T?> updatedData, {bool Function(T item)? deleteWhere}) {
    final List< T> currentValues = _data.value;
    if (deleteWhere != null) {
      currentValues.removeWhere((T value) => deleteWhere(value));
    }

    for (T? item in updatedData) {

      if (item == null) {
        currentValues.remove(item);
      } else {
        currentValues.add(item);
      }
    }

    _data.add(currentValues);
  }

  @protected
  Future<List< T>> fetch();
}
