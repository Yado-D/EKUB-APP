class CardModel {
  String cardNumber;
  String ExpiredDate;
  String CVCCode;
  String cardHolderName;
  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.CVCCode,
    required this.ExpiredDate,
  });
}
