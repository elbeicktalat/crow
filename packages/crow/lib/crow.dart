//  Copyright (c) 2020-2022 Talat El Beick. All rights reserved.
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

/// Crow gives you util widgets interfaces to apply separation of concerns.
///
/// To use, import `package:crow/crow.dart`.
///
/// See also:
///
/// * [Examples](https://github.com/elbeicktalat/crow)
library crow;

import 'package:crow/src/_internal/internal.dart';
import 'package:crow/src/contracts/presentation/view_model.dart';
import 'package:crow/src/services/connectivity_service.dart';
import 'package:crow/src/services/preferences_service.dart';
import 'package:crow/src/services/theme_mode_service.dart';
import 'package:get/get.dart';

export 'package:crow/src/contracts/binding.dart';
export 'package:crow/src/contracts/crud_operation.dart';
export 'package:crow/src/contracts/data/data_sources/local_data_source.dart';
export 'package:crow/src/contracts/data/data_sources/remote_data_source.dart';
export 'package:crow/src/contracts/data/model.dart';
export 'package:crow/src/contracts/domain/entity.dart';
export 'package:crow/src/contracts/domain/service.dart';
export 'package:crow/src/contracts/domain/usecase.dart';
export 'package:crow/src/contracts/params.dart';
export 'package:crow/src/contracts/presentation/middleware.dart';
export 'package:crow/src/contracts/presentation/page.dart';
export 'package:crow/src/contracts/presentation/screen.dart';
export 'package:crow/src/contracts/presentation/view.dart';
export 'package:crow/src/contracts/presentation/view_model.dart';
export 'package:crow/src/contracts/repository.dart';
export 'package:crow/src/services/connectivity_service.dart';
export 'package:crow/src/services/preferences_service.dart';
export 'package:crow/src/services/theme_mode_service.dart';

/// A pre registered [ViewModel], this allows [View] and [Screen] to non specify something custom.
class _ViewModel extends ViewModel {}

/// The glue between the crow widgets and your app.
class Crow {
  const Crow._internal();

  /// The current [Crow], if one has been created.
  static Crow get instance => _instance;
  static const Crow _instance = Crow._internal();

  /// The place in where preregistered dependencies get registered.
  void initDependencies() {
    Get.put<BaseViewModel>(_ViewModel());
    Get.put(ThemeModeService());
  }

  Future<void> initAsyncServices() async {
    await Get.putAsync(() => ConnectivityService().init());
    await Get.putAsync(() => PreferencesService().init());
  }
}
