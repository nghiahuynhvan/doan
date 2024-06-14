/// [APIConstants] file contains the variables default a path in url
/// to request API.
class APIConstants {
  APIConstants._();

  /// [baseDomain] is host domain using during request API in app.
  static String baseDomain = "http://192.168.4.156:8080/api";

  /// APIs versions
  static const apiVersions = 'v0.1';

  /// APIs versions v2
  static const apiVersions2 = 'v0.2';

  /// APIs key
  static const priority = 'priority';
  static const message = 'message';
  static const templateId = 'templateId';
  static const stories = 'stories';
  static const facilityId = 'facilityId';
  static const fireBaseId = 'fireBaseId';
  static const time = 'time';
  static const dateDisplay = 'dateDisplay';
  static const startTime = 'startTime';
  static const endTime = 'endTime';

  static const countryFlagUrl =
      'https://cdn.jsdelivr.net/npm/country-flag-emoji-json@2.0.0/dist/images/';
  static const facilityImageURL = 'https://sunwheel.page.link/29hQ';
  static const termsAndConditionsURL = 'https://sunwheel.page.link/amTC';

  // GET /apis/v0.1/mobile/user/{fireBaseId}/order
  // Get all orders based on fire base id
  // case userOrder(_ fireBaseId: String)
  static String pathUserOrder(String fireBaseId) {
    return "mobile/user/$fireBaseId/order";
  }

  static String getPathRegisterUser() {
    return "mobile/register";
  }

  static String getPathUpdateUser() {
    return "reviewer/device-update";
  }

  static String pathUserNotification(String fireBaseId) {
    return "mobile/user/$fireBaseId/notifications";
  }

  static String getFacilities() {
    return "mobile/facilities";
  }

  static String getPromotionsItem() {
    return "mobile/promotions";
  }

  static String getTimePicker() {
    return "mobile/times";
  }

  // GET /apis/v0.1/mobile/categories
  // Get all categories
  static String pathCategories() {
    return "mobile/categories";
  }

  // GET /apis/v0.1/mobile/templates
  // Get all categories
  static String pathGifs() {
    return "mobile/templates";
  }

  static String pathOrder(String fireBaseId, String orderId) {
    return "mobile/user/${fireBaseId}/order/${orderId}";
  }

  // GET /apis/v0.1/mobile/order
  // Request to order
  static String requestOrders() {
    return "mobile/orders";
  }

  // GET /apis/v0.1/mobile/user/{fireBaseId}/order/{orderId}
  // Get orders by order id and fire base id
  static String getOrderById(String fireBaseId, String orderId) {
    return "mobile/user/$fireBaseId/order/$orderId";
  }

  // POST /apis/v0.1/mobile/zalo-pay/create-order
  // Create zalo pay order
  static const zaloPayCreateOrder = "mobile/zalo-pay/create-order";

  // POST /apis/v0.1/mobile/zalo-pay/check-transaction-status
  // Check zalo pay transaction status
  static const zaloPayCheckTransactionStatus =
      "mobile/zalo-pay/check-transaction-status";

  // POST /apis/v0.1/mobile/vnpayhistories
  // Create history when call VN Pay
  static const vnPayHistories = "mobile/vnpayhistories";

  // POST /apis/v0.1/mobile/momo/basic-info
  // Send basic momo information
  static const momoBasicInfo = "mobile/momo/basic-info";

  // POST /apis/v0.1/mobile/shopee-pay/create-order
  // Create shopee pay order
  static const shopeeCreateOrder = "mobile/shopee-pay/create-order";

  // POST /apis/v0.1/mobile/shopee-pay/check-transaction-status
  // Check shopee pay transaction status
  static const shopeePayCheckTransactionStatus =
      "mobile/shopee-pay/check-transaction-status";

  // POST /apis/v0.1/mobile/one-pay/create-order
  // Create one pay order
  static const onePayCreateOrder = "mobile/one-pay/create-order";

  // POST /apis/v0.1/mobile/one-pay/check-transaction-status
  // Check one pay transaction status
  static const onePayCheckTransactionStatus =
      "mobile/one-pay/check-transaction-status";

  // POST /apis/v0.2/mobile/orders/vouchers
  // Check and update order by orderNo and voucherCode
  static const postVoucher = "mobile/orders/vouchers";
  //DELETE /apis/v0.1/mobile/user/{fireBaseId}
  static String deleteAccount(String fireBaseId)
  {
    return  "mobile/user/$fireBaseId";
  }
}
