import 'package:driving_license/backend/shared_preferences/share_preferences_provider.dart';
import 'package:driving_license/features/licenses/domain/license.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'user_selected_license_provider.g.dart';

@riverpod
class UserSelectedLicense extends _$UserSelectedLicense {
  final _prefsLicenseKey = 'selected_license';

  SharedPreferences get _prefs =>
      ref.read(sharedPreferencesProvider).requireValue;

  @override
  FutureOr<License> build() async {
    final selectedLicense = _prefs.getString(_prefsLicenseKey);

    if (selectedLicense == null) {
      return License.all;
    }
    return License.values.byName(selectedLicense);
  }

  Future<void> selectLicense(License license) async {
    await _prefs.setString(_prefsLicenseKey, license.name);
    ref.invalidateSelf();
  }
}
