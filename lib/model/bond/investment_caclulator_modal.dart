// To parse this JSON data, do
//
//     final investmentCalculatorModal = investmentCalculatorModalFromJson(jsonString);

import 'dart:convert';

InvestmentCalculatorModal investmentCalculatorModalFromJson(String str) => InvestmentCalculatorModal.fromJson(json.decode(str));

String investmentCalculatorModalToJson(InvestmentCalculatorModal data) => json.encode(data.toJson());

class InvestmentCalculatorModal {
  InvestmentCalculatorModal({
  required this.accruedInterest,
  required this.faceValue,
  required this.marketValue,
  required this.principalAmount,
  required this.totalInvestment,
  required this.yieldValue,
  });

  int accruedInterest;
  String faceValue;
  String marketValue;
  int principalAmount;
  int totalInvestment;
  double yieldValue;

  factory InvestmentCalculatorModal.fromJson(Map<String, dynamic> json) => InvestmentCalculatorModal(
    accruedInterest: json["accrued_interest"],
    faceValue: json["face_value"],
    marketValue: json["market_value"],
    principalAmount: json["principal_amount"],
    totalInvestment: json["total_investment"],
    yieldValue: json["yield_value"].toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "accrued_interest": accruedInterest,
    "face_value": faceValue,
    "market_value": marketValue,
    "principal_amount": principalAmount,
    "total_investment": totalInvestment,
    "yield_value": yieldValue,
  };
}
