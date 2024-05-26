import 'package:cinemix_ui/core/res/color/color.dart';
import 'package:cinemix_ui/core/shared/utils/date_util.dart';
import 'package:cinemix_ui/src/invoice/domain/entities/invoice.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_plus/iconsax_plus.dart';
import 'package:intl/intl.dart';

class InvoiceInfoDetail extends StatelessWidget {
  const InvoiceInfoDetail({required this.invoice, super.key});

  final Invoice invoice;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: KAppColor.secondaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const FittedBox(
                      child: Padding(
                        padding: EdgeInsets.all(4),
                        child: Icon(
                          IconsaxPlusLinear.dollar_circle,
                          color: KAppColor.successColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tổng tiền',
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: KAppColor.textColor.withOpacity(0.5),
                                  ),
                        ),
                        const SizedBox(height: 2),
                        Text(
                          NumberFormat.currency(
                            locale: 'vi',
                            symbol: 'đ',
                          ).format(invoice.total),
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Trạng thái: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: invoice.canceled
                        ? KAppColor.errorColor.withOpacity(0.2)
                        : invoice.paid
                            ? KAppColor.successColor.withOpacity(0.2)
                            : KAppColor.warningColor.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Text(
                    invoice.canceled
                        ? 'Thất bại'
                        : invoice.paid
                            ? 'Thành công'
                            : 'Đang xử lý',
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: invoice.canceled
                              ? KAppColor.errorColor
                              : invoice.paid
                                  ? KAppColor.successColor
                                  : KAppColor.warningColor,
                        ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Thời gian: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  invoice.createdDate!.format('HH:mm - dd/MM/yyyy'),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Cập nhật cuối: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  invoice.modifiedDate!.format('HH:mm - dd/MM/yyyy'),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mã đơn hàng: ',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: KAppColor.textColor.withOpacity(0.5),
                      ),
                ),
                Text(
                  '${invoice.code}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: KAppColor.textColor),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
