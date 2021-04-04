class CardModel {
  String user;
  String cardNumber;
  String cardExpired;
  String cardType;
  int cardBackground;
  String cardElementTop;
  String cardElementBottom;

  CardModel(this.user, this.cardNumber, this.cardExpired, this.cardType,
      this.cardBackground, this.cardElementTop, this.cardElementBottom);
}

var cardData = [
  {
    "user": "Lanre Tolu",
    "cardNumber": "**** **** **** 3427",
    "cardExpired": "05-12-2023",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFF1E1E99,
    "cardElementTop": "assets/images/ellipse_top_pink.svg",
    "cardElementBottom": "assets/images/ellipse_bottom_pink.svg"
  },
  {
    "user": "Lanre Tolu",
    "cardNumber": "**** **** **** 8541",
    "cardExpired": "03-06-2024",
    "cardType": "assets/images/mastercard_logo.png",
    "cardBackground": 0xFFFF70A3,
    "cardElementTop": "assets/images/ellipse_top_blue.svg",
    "cardElementBottom": "assets/images/ellipse_bottom_blue.svg"
  }
];

List<CardModel> cards = cardData.map((item) => CardModel(
    item["user"],
    item["cardNumber"],
    item["cardExpired"],
    item["cardType"],
    item["cardBackground"],
    item["cardElementTop"],
    item["cardElementBottom"])).toList();
