class CardModel {
  final num id;
  final String cardType;
  final String cardNumber;
  final String bankName;
  final String cardCurrency;
  final String expireDate;
  final String iconImage;
  final num moneyAmounts;
  final dynamic colors;

  CardModel(
      {required this.id,
      required this.cardType,
      required this.bankName,
      required this.cardCurrency,
      required this.cardNumber,
      required this.expireDate,
      required this.iconImage,
      required this.colors,
      required this.moneyAmounts});

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
        id: json["id"] as num? ?? 0,
        cardType: json["card_type"] as String? ?? "",
        bankName: json["bank_name"] as String? ?? "",
        cardCurrency: json["card_currency"] as String? ?? "SO'M",
        cardNumber: json["card_number"] as String? ?? "",
        expireDate: json["expire_date"] as String? ?? "",
        colors: json["colors"],
        moneyAmounts: json["money_amount"] as num? ?? 0,
        iconImage: json["icon_image"] as String? ?? "");
  }
}
