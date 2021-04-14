class TransactionModel {
  String name;
  String photo;
  String date;
  String amount;

  TransactionModel(this.name, this.photo, this.date, this.amount);
}

List<TransactionModel> transactions = transactionData
    .map((item) => TransactionModel(
        item['name'], item['photo'], item['date'], item['amount']))
    .toList();

var transactionData = [
  {
    "name": "Uber Ride",
    "photo": "assets/images/uber_logo.png",
    "date": "1st Apr 2020",
    "amount": "-\u20A6 4,500.00"
  },
  {
    "name": "Nike Outlet",
    "photo": "assets/images/nike_logo.png",
    "date": "30th Mar 2020",
    "amount": "-\u20A6 15,100.00"
  },
  {
    "name": "Payment",
    "photo": "assets/images/user_photo.png",
    "date": "15th Mar 2020",
    "amount": "+\u20A6 9,500.00"
  }
];
