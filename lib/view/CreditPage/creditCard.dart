import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:flutter/material.dart';

class CreditCardPage extends StatefulWidget {
  String tutar = "100";

  CreditCardPage({super.key});
  @override
  State<CreditCardPage> createState() => _CreditCardPageState();
}

class _CreditCardPageState extends State<CreditCardPage> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String cardNumber = "";
  String expiryDate = "";
  String cardHolderName = "";
  String cvvCode = "";
  bool isCvvFocused = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CreditCardWidget(
                cardBgColor: Colors.orange,
                cardNumber: cardNumber,
                expiryDate: expiryDate,
                cardHolderName: cardHolderName,
                cvvCode: cvvCode,
                showBackView: isCvvFocused,
                onCreditCardWidgetChange:
                    (CreditCardBrand) {}, //true when you want to show cvv(back) view
              ),
              SizedBox(
                height: size.height / 3,
                width: size.width / 1.2,
                child: CreditCardForm(
                  formKey: formKey, // Required
                  cardNumber: cardNumber,
                  expiryDate: expiryDate,
                  cardHolderName: cardHolderName,
                  cvvCode: cvvCode,
                  onCreditCardModelChange: (CreditCardModel data) {
                    setState(() {
                      cardHolderName = data.cardHolderName;
                      cardNumber = data.cardNumber;
                      expiryDate = data.expiryDate;
                      cvvCode = data.cvvCode;
                    });
                    isCvvFocused = data.isCvvFocused;
                  }, // Required
                  themeColor: Colors.red,
                  obscureCvv: true,
                  obscureNumber: true,
                  isHolderNameVisible: true,
                  isCardNumberVisible: true,
                  isExpiryDateVisible: true,
                  enableCvv: true,
                  cardNumberValidator: (String? cardNumber) {
                    return null;
                  },
                  expiryDateValidator: (String? expiryDate) {
                    return null;
                  },
                  cvvValidator: (String? cvv) {
                    return null;
                  },
                  cardHolderValidator: (String? cardHolderName) {
                    return null;
                  },
                  onFormComplete: () {
                    // callback to execute at the end of filling card data
                  },
                  cardNumberDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Number',
                    hintText: 'XXXX XXXX XXXX XXXX',
                  ),
                  expiryDateDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Expired Date',
                    hintText: 'XX/XX',
                  ),
                  cvvCodeDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'CVV',
                    hintText: 'XXX',
                  ),
                  cardHolderDecoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Card Holder',
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: GestureDetector(
                  onTap: () async {
                    if (cardNumber.length == 19 &&
                        (cvvCode.length <= 4 && cvvCode.length >= 3) &&
                        cardHolderName != "" &&
                        expiryDate.length == 5) {
                      cardNumber = cardNumber.replaceAll(" ", "");
                      var expiryMonth = expiryDate.split("/")[0];
                      var expiryYear = "20${expiryDate.split("/")[1]}";
                      print(
                          "Başarılı $cardNumber,$cvvCode,$cardHolderName,$expiryMonth,$expiryYear");

                      var body = {
                        "cardHolderName": cardHolderName,
                        "cardNumber": cardNumber,
                        "expiryMonth": expiryMonth,
                        "expiryYear": expiryYear,
                        "cvc": cvvCode,
                        "price": widget.tutar
                      };
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text("Please fill in all values"),
                          duration: Duration(seconds: 3),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: Container(
                    width: size.width,
                    height: size.height * 0.06,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.purple),
                    child: const Text("Pay"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
