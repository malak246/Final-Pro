class PaymentModel {
  final String paymentmethod;
  final String cost;

  const PaymentModel({
    required this.paymentmethod,
    required this.cost,
  });
  toJson() {
    return {
      "Paymentmethod": paymentmethod,
      "Cost": cost,
    };
  }
}
