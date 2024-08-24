import 'package:rider_app/widgets/modal/addres.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class _AddressItemState {
  Address? fromAddress;
  Address? toAddress;

  _AddressItemState({
    this.fromAddress,
    this.toAddress,
  });

  _AddressItemState copyWith({
    Address? fromAddress,
    Address? toAddress,
  }) {
    return _AddressItemState(
      fromAddress: fromAddress ?? this.fromAddress,
      toAddress: toAddress ?? this.toAddress,
    );
  }
}

class _AddressItemStateNotifier extends StateNotifier<_AddressItemState> {
  _AddressItemStateNotifier({required this.ref}) : super(_AddressItemState());

  final Ref ref;

  void setFromAddress(Address address) {
    state = state.copyWith(fromAddress: address);
  }

  void setToAddress(Address address) {
    state = state.copyWith(toAddress: address);
  }
}

final addressItemProvider =
    StateNotifierProvider<_AddressItemStateNotifier, _AddressItemState>(
  (ref) => _AddressItemStateNotifier(ref: ref),
);
