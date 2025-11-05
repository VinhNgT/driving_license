// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'env_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EnvDataImpl _$$EnvDataImplFromJson(Map<String, dynamic> json) =>
    _$EnvDataImpl(
      loggerLevel: $enumDecode(_$LevelEnumMap, json['loggerLevel']),
      showDetailedError: json['showDetailedError'] as bool,
      enableRemoteConfig: json['enableRemoteConfig'] as bool,
      treatGoogleIapNonConsumableAsConsumable:
          json['treatGoogleIapNonConsumableAsConsumable'] as bool,
    );

Map<String, dynamic> _$$EnvDataImplToJson(_$EnvDataImpl instance) =>
    <String, dynamic>{
      'loggerLevel': _$LevelEnumMap[instance.loggerLevel]!,
      'showDetailedError': instance.showDetailedError,
      'enableRemoteConfig': instance.enableRemoteConfig,
      'treatGoogleIapNonConsumableAsConsumable':
          instance.treatGoogleIapNonConsumableAsConsumable,
    };

const _$LevelEnumMap = {
  Level.all: 'all',
  Level.verbose: 'verbose',
  Level.trace: 'trace',
  Level.debug: 'debug',
  Level.info: 'info',
  Level.warning: 'warning',
  Level.error: 'error',
  Level.wtf: 'wtf',
  Level.fatal: 'fatal',
  Level.nothing: 'nothing',
  Level.off: 'off',
};
