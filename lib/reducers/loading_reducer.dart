// Copyright 2018 The Flutter Architecture Sample Authors. All rights reserved.
// Use of this source code is governed by the MIT license that can be found
// in the LICENSE file.

import 'package:redux/redux.dart';
import 'package:spending_tracker/actions/actions.dart';

final loadingReducer = combineReducers<bool>([
  new TypedReducer<bool, TodosLoadedAction>(_setLoaded),
  new TypedReducer<bool, TodosNotLoadedAction>(_setLoaded),
]);

bool _setLoaded(bool state, action) {
  return false;
}
