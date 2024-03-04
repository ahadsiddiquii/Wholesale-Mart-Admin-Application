import '../enums/order_card_status_enum.dart';

class OrderStepperService {
  OrderStepperService._();

  static final Map<int, OrderCardStatusEnum> orderStatus = {
    97: OrderCardStatusEnum.VerifyingOrder,
    94: OrderCardStatusEnum.OrderOnRoad,
    93: OrderCardStatusEnum.OrderDelivered,
    1: OrderCardStatusEnum.OrderDelivered,
    98: OrderCardStatusEnum.OrderReceived,
    99: OrderCardStatusEnum.OrderReceived,
  };

  static OrderCardStatusEnum getStatusFromIndex(int orderIndex) {
    OrderCardStatusEnum orderEnum = OrderCardStatusEnum.none;
    if (orderStatus[orderIndex] != null) {
      orderEnum = orderStatus[orderIndex]!;
    }
    return orderEnum;
  }

  static int getStepperNumberFromOrderStatus(
      OrderCardStatusEnum orderCardStatus) {
    if (orderCardStatus == OrderCardStatusEnum.VerifyingOrder) {
      return 1;
    }
    if (orderCardStatus == OrderCardStatusEnum.OrderOnRoad) {
      return 2;
    }
    if (orderCardStatus == OrderCardStatusEnum.OrderDelivered) {
      return 3;
    }
    return 0;
  }

  static int getStepperNumberFromIndex(int orderIndex) {
    return getStepperNumberFromOrderStatus(getStatusFromIndex(orderIndex));
  }
}
