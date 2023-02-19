import 'package:cred/utils/emi_card.dart';

class CredCash {
  final String? creditAmount;
  final List<Plan>? plans;
  final String? emiAmount;
  final String? duration;

  CredCash({
    this.creditAmount,
    this.plans,
    this.emiAmount,
    this.duration,
  });
}
