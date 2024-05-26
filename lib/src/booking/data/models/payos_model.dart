import 'package:cinemix_ui/core/shared/utils/typedefs.dart';

class LinkCreationRequest {
  LinkCreationRequest({
    required this.orderCode,
    required this.amount,
    required this.description,
    required this.cancelUrl,
    required this.returnUrl,
    required this.signature,
    this.buyerName,
    this.buyerEmail,
    this.buyerPhone,
    this.buyerAddress,
    this.items,
    this.expiredAt,
  });

  final int orderCode;
  final int amount;
  final String description;
  final String? buyerName;
  final String? buyerEmail;
  final String? buyerPhone;
  final String? buyerAddress;
  final List<LinkCreationItem>? items;
  final String cancelUrl;
  final String returnUrl;
  final int? expiredAt;
  final String signature;

  DataMap toMap() {
    return {
      'order_code': orderCode,
      'amount': amount,
      'description': description,
      'buyer_name': buyerName,
      'buyer_email': buyerEmail,
      'buyer_phone': buyerPhone,
      'buyer_address': buyerAddress,
      'items': items?.map((e) => e.toMap()).toList(),
      'cancel_url': cancelUrl,
      'return_url': returnUrl,
      'expired_at': expiredAt,
      'signature': signature,
    };
  }
}

class LinkCreationItem {
  LinkCreationItem({
    required this.name,
    required this.quantity,
    required this.price,
  });

  final String name;
  final int quantity;
  final int price;

  DataMap toMap() {
    return {
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}

class LinkCreationResponse {
  LinkCreationResponse({
    required this.bin,
    required this.accountNumber,
    required this.accountName,
    required this.amount,
    required this.description,
    required this.orderCode,
    required this.currency,
    required this.paymentLinkId,
    required this.status,
    required this.checkoutUrl,
    required this.qrCode,
  });

  factory LinkCreationResponse.fromMap(DataMap json) {
    return LinkCreationResponse(
      bin: json['bin'] as String,
      accountNumber: json['accountNumber'] as String,
      accountName: json['accountName'] as String,
      amount: json['amount'] as int,
      description: json['description'] as String,
      orderCode: json['orderCode'] as int,
      currency: json['currency'] as String,
      paymentLinkId: json['paymentLinkId'] as String,
      status: json['status'] as String,
      checkoutUrl: json['checkoutUrl'] as String,
      qrCode: json['qrCode'] as String,
    );
  }

  final String bin;
  final String accountNumber;
  final String accountName;
  final int amount;
  final String description;
  final int orderCode;
  final String currency;
  final String paymentLinkId;
  final String status;
  final String checkoutUrl;
  final String qrCode;
}

class PayOSResponse {
  PayOSResponse({
    required this.code,
    required this.desc,
  });

  factory PayOSResponse.fromMap(DataMap json) {
    if (json['code'] == '00') {
      return PayOSResponseSuccess.fromMap(json);
    } else {
      return PayOSResponseError.fromMap(json);
    }
  }

  final String code;
  final String desc;
}

class PayOSResponseError extends PayOSResponse {
  PayOSResponseError({
    required super.code,
    required super.desc,
  });

  factory PayOSResponseError.fromMap(DataMap json) {
    return PayOSResponseError(
      code: json['code'] as String,
      desc: json['desc'] as String,
    );
  }
}

class PayOSResponseSuccess extends PayOSResponse {
  PayOSResponseSuccess({
    required super.code,
    required super.desc,
    required this.data,
    required this.signature,
  });

  factory PayOSResponseSuccess.fromMap(DataMap json) {
    return PayOSResponseSuccess(
      code: json['code'] as String,
      desc: json['desc'] as String,
      data: json['data'] as DataMap,
      signature: json['signature'] as String,
    );
  }

  final DataMap data;
  final String signature;
}
