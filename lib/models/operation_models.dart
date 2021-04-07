class OperationModel {
  String name;
  String selectedIcon; // path to the selected icon asset
  String unselectedIcon;

  OperationModel(this.name, this.selectedIcon, this.unselectedIcon);
}

var operationsData = [
  {
    "name": 'Money\nTransfer',
    "selectedIcon": 'assets/images/transfer_white.svg',
    "unselectedIcon": 'assets/images/transfer_blue.svg',
  },
  {
    "name": 'Bank\nWithdraw',
    "selectedIcon": 'assets/images/withdraw_white.svg',
    "unselectedIcon": 'assets/images/withdraw_blue.svg',
  },
  {
    "name": 'Insight\nTracking',
    "selectedIcon": 'assets/images/track_finance_blue.svg',
    "unselectedIcon": 'assets/images/track_finance_white.svg',
  },
];

List<OperationModel> operations = operationsData
    .map((item) => OperationModel(
        item["name"], item["selectedIcon"], item["unselectedIcon"]))
    .toList();
