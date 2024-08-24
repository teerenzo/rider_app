import "package:rider_app/widgets/modal/addres.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

List<Address> addresses = [
  Address(name: 'Home', address: '2972 Westheimer Rd. Santa Ana, ', km: '2.5'),
  Address(name: 'Work', address: 'Kigali, Rwanda', km: '5.5'),
  Address(name: 'School', address: 'Kigali, Rwanda', km: '3.5'),
  Address(name: 'Gym', address: 'Kigali, Rwanda', km: '1.5'),
  Address(name: 'Church', address: 'Kigali, Rwanda', km: '4.5'),
  Address(name: 'Market', address: 'Kigali, Rwanda', km: '2.5'),
  Address(name: 'Hospital', address: 'Kigali, Rwanda', km: '3.5'),
  Address(name: 'Cafe', address: 'Kigali, Rwanda', km: '1.5'),
  Address(name: 'Library', address: 'Kigali, Rwanda', km: '4.5'),
  Address(name: 'Park', address: 'Kigali, Rwanda', km: '2.5'),
  Address(name: 'Stadium', address: 'Kigali, Rwanda', km: '3.5'),
  Address(name: 'Hotel', address: 'Kigali, Rwanda', km: '1.5'),
  Address(name: 'Restaurant', address: 'Kigali, Rwanda', km: '4.5'),
];

final addressesProvider = Provider((ref) {
  return addresses;
});
