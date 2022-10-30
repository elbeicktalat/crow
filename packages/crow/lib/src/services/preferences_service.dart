//  Copyright (c) 2020-2022 Talat El Beick. All rights reserved.
//  Use of this source code is governed by a MIT-style license that can be
//  found in the LICENSE file.

import 'package:crow/src/contracts/domain/service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService extends Service {
  SharedPreferences get instance => _preferences;
  late SharedPreferences _preferences;

  @override
  void onInit() async {
    super.onInit();
    _preferences = await SharedPreferences.getInstance();
  }
}