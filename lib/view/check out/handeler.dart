


// import 'dart:convert';
part of 'check_out_screen.dart';

class PaymentResponseHandler {
  final String language;
  final Map<String, String> messagesEn = {
    'A': 'Transaction authorized successfully.',
    'H': 'Transaction on hold for further review.',
    'P': 'Transaction pending.',
    'V': 'Transaction voided.',
    'E': 'An error occurred.',
    'D': 'Transaction declined.',
    'X': 'Authorization expired.',
    'default': 'Unknown status.'
  };

  final Map<String, String> messagesAr = {
    'A': 'تمت الموافقة على المعاملة بنجاح.',
    'H': 'المعاملة قيد المراجعة لمزيد من التحقق.',
    'P': 'المعاملة قيد الانتظار.',
    'V': 'تم إلغاء المعاملة.',
    'E': 'حدث خطأ ما.',
    'D': 'تم رفض المعاملة.',
    'X': 'انتهت صلاحية التفويض.',
    'default': 'حالة غير معروفة.'
  };

  PaymentResponseHandler({required this.language});

  String handleResponse(String responseStatus, String responseCode) {
    String message = _getMessage(responseStatus);

    // Additional handling for declined/error statuses
    if (responseStatus == 'E' || responseStatus == 'D') {
      message += '\n' + _getDetailedMessage(responseCode);
    }

    return message;
  }

  String _getMessage(String status) {
    if (language == 'ar') {
      return messagesAr[status] ?? messagesAr['default']!;
    } else {
      return messagesEn[status] ?? messagesEn['default']!;
    }
  }

  String _getDetailedMessage(String code) {
    if (language == 'ar') {
      return _detailedMessagesAr[code] ?? _detailedMessagesAr['default']!;
    } else {
      return _detailedMessagesEn[code] ?? _detailedMessagesEn['default']!;
    }
  }

  final Map<String, String> _detailedMessagesEn = {
    'G31822': 'Authorized transaction.',
    '4': 'Duplicate request: The same details were submitted within less than 2 minutes.',
    '200': 'Invalid card number.',
    '201': 'Invalid card expiry date.',
    '202': 'Invalid card security code (CVV).',
    // Add more detailed messages as needed
    'default': 'An unspecified error occurred.'
  };

  final Map<String, String> _detailedMessagesAr = {
    'G31822': 'المعاملة معتمدة.',
    '4': 'طلب مكرر: تم إرسال نفس التفاصيل في أقل من دقيقتين.',
    '200': 'رقم البطاقة غير صالح.',
    '201': 'تاريخ انتهاء صلاحية البطاقة غير صالح.',
    '202': 'رمز أمان البطاقة (CVV) غير صالح.',
    // Add more detailed messages as needed
    'default': 'حدث خطأ غير محدد.'
  };
}

void main() {
  // Example usage
  PaymentResponseHandler handlerEn = PaymentResponseHandler(language: 'en');
  PaymentResponseHandler handlerAr = PaymentResponseHandler(language: 'ar');

  String responseStatus = 'E';
  String responseCode = '200';

  print('English: ${handlerEn.handleResponse(responseStatus, responseCode)}');
  print('Arabic: ${handlerAr.handleResponse(responseStatus, responseCode)}');
}
