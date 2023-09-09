// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employee_schedule_vm.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$employeeScheduleVmHash() =>
    r'f931503672f0fb7d4e30f27c171b85992c236edf';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

abstract class _$EmployeeScheduleVm
    extends BuildlessAutoDisposeAsyncNotifier<List<ScheculeModel>> {
  late final int userId;
  late final DateTime date;

  Future<List<ScheculeModel>> build({
    required int userId,
    required DateTime date,
  });
}

/// See also [EmployeeScheduleVm].
@ProviderFor(EmployeeScheduleVm)
const employeeScheduleVmProvider = EmployeeScheduleVmFamily();

/// See also [EmployeeScheduleVm].
class EmployeeScheduleVmFamily extends Family<AsyncValue<List<ScheculeModel>>> {
  /// See also [EmployeeScheduleVm].
  const EmployeeScheduleVmFamily();

  /// See also [EmployeeScheduleVm].
  EmployeeScheduleVmProvider call({
    required int userId,
    required DateTime date,
  }) {
    return EmployeeScheduleVmProvider(
      userId: userId,
      date: date,
    );
  }

  @override
  EmployeeScheduleVmProvider getProviderOverride(
    covariant EmployeeScheduleVmProvider provider,
  ) {
    return call(
      userId: provider.userId,
      date: provider.date,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'employeeScheduleVmProvider';
}

/// See also [EmployeeScheduleVm].
class EmployeeScheduleVmProvider extends AutoDisposeAsyncNotifierProviderImpl<
    EmployeeScheduleVm, List<ScheculeModel>> {
  /// See also [EmployeeScheduleVm].
  EmployeeScheduleVmProvider({
    required this.userId,
    required this.date,
  }) : super.internal(
          () => EmployeeScheduleVm()
            ..userId = userId
            ..date = date,
          from: employeeScheduleVmProvider,
          name: r'employeeScheduleVmProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$employeeScheduleVmHash,
          dependencies: EmployeeScheduleVmFamily._dependencies,
          allTransitiveDependencies:
              EmployeeScheduleVmFamily._allTransitiveDependencies,
        );

  final int userId;
  final DateTime date;

  @override
  bool operator ==(Object other) {
    return other is EmployeeScheduleVmProvider &&
        other.userId == userId &&
        other.date == date;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);
    hash = _SystemHash.combine(hash, date.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  Future<List<ScheculeModel>> runNotifierBuild(
    covariant EmployeeScheduleVm notifier,
  ) {
    return notifier.build(
      userId: userId,
      date: date,
    );
  }
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member
