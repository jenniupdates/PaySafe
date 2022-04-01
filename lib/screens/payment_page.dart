// make payment via normal such as google pay, apple pay, etc
// will lead to text-to-voice services
import 'dart:io' show Platform;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:square_in_app_payments/models.dart';
import 'package:square_in_app_payments/in_app_payments.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({ Key? key }) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
 void _pay() {
    InAppPayments.setSquareApplicationId('sandbox-sq0idb-wqRkWt8HYuGJvNwAgH-Evg');
    InAppPayments.startCardEntryFlow(
      onCardNonceRequestSuccess: _cardNonceRequestSuccess,
      onCardEntryCancel: _cardEntryCancel,
    );
  }

  void _cardEntryCancel() {
    // failure
  }

  void _cardNonceRequestSuccess(CardDetails result) {
    print(result.nonce);
    InAppPayments.completeCardEntry(
      onCardEntryComplete: _cardEntryComplete,
    );
  }

  void _cardEntryComplete() {
    // successful
  }
  // bool _applePayEnabled = false;

  // Future<void> _initSquarePayment() async {
  //   var canUseApplePay = false;
  //   if (Platform.isIOS) {
  //     // initialize the apple pay with apple pay merchant id
  //     await InAppPayments.initializeApplePay('APPLE_PAY_MERCHANT_ID');
  //     // always check if apple pay supported on that device
  //     // before enable apple pay
  //     canUseApplePay = await InAppPayments.canUseApplePay;
  //   }
    
  //   setState(() {
  //     _applePayEnabled = canUseApplePay;
  //   });
  // }

  // void _onStartApplePay() async {
  //   try {
  //     await InAppPayments.requestApplePayNonce(
  //         price: '1.00',
  //         summaryLabel: 'Cookie',
  //         countryCode: 'US',
  //         currencyCode: 'USD',
  //         paymentType: ApplePayPaymentType.finalPayment,
  //         onApplePayNonceRequestSuccess: _onApplePayNonceRequestSuccess,
  //         onApplePayNonceRequestFailure: _onApplePayNonceRequestFailure,
  //         onApplePayComplete: _onApplePayEntryComplete);
  //   } on PlatformException catch (ex) {
  //     // handle the failure of starting apple pay
  //   }
  // }


  // void _onApplePayNonceRequestSuccess(CardDetails result) async {
  //   try {
  //     // take payment with the card nonce details
  //     // you can take a charge
  //     // await chargeCard(result);

  //     // you must call completeApplePayAuthorization to close apple pay sheet
  //     await InAppPayments.completeApplePayAuthorization(isSuccess: true);
  //   } on Exception catch (ex) {
  //     // handle card nonce processing failure

  //     // you must call completeApplePayAuthorization to close apple pay sheet
  //     await InAppPayments.completeApplePayAuthorization(
  //       isSuccess: false,
  //       errorMessage: ex.message);
  //   }
  // }

  // void _onApplePayNonceRequestFailure(ErrorInfo errorInfo) async {
  //   // handle this error before close the apple pay sheet

  //   // you must call completeApplePayAuthorization to close apple pay sheet
  //   await InAppPayments.completeApplePayAuthorization(
  //     isSuccess: false,
  //     errorMessage: errorInfo.message);
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton.icon(
              onPressed: _pay,
              icon:  Icon(Icons.payment, size: 24.0), 
              label: Text('Card Payment'),
            ),
            ElevatedButton.icon(
              onPressed: _pay,
              icon:  Icon(Icons.payment, size: 24.0), 
              label: Text('Apple Pay (Coming Soon)'),
              style: ElevatedButton.styleFrom(
                primary: Colors.black,
              )              
            ),
            ElevatedButton.icon(
              onPressed: _pay,
              icon:  Icon(Icons.payment, size: 24.0), 
              label: Text('Google Pay (Coming Soon)'),
            ),
          ]
        )
      )
    );
  }
}

