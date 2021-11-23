import 'package:flutter/material.dart';
import 'package:flutter_cupertino_date_picker_fork/flutter_cupertino_date_picker_fork.dart';
import 'package:intl/intl.dart';

class AppDatePicker extends StatefulWidget {
  final String title;
  final DateTime? minDateTime;
  final Function(DateTime) onDateSelected;
  const AppDatePicker(
      {Key? key,
      required this.title,
      this.minDateTime,
      required this.onDateSelected})
      : super(key: key);

  @override
  State<AppDatePicker> createState() => _AppDatePickerState();
}

class _AppDatePickerState extends State<AppDatePicker> {
  DateTime? selectedDate;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        DatePicker.showDatePicker(
          context,
          initialDateTime: selectedDate ?? DateTime.now(),
          minDateTime: widget.minDateTime ?? DateTime.now(),
          locale: DateTimePickerLocale.ar,
          onChange: (date, _) {},
          onConfirm: (date, _) {
            setState(() {
              selectedDate = date;
            });
            widget.onDateSelected(date);
          },
          pickerMode: DateTimePickerMode.date,
        );
      },
      child: Container(
        height: 50,
        width: (MediaQuery.of(context).size.width / 2) - 20,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 0),
                  blurRadius: 4,
                  color: Colors.grey.withOpacity(0.5)),
            ]),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.calendar_today,
              color: Theme.of(context).colorScheme.primary,
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.title),
                if (selectedDate != null)
                  Text(
                    DateFormat('d/M/yy ,E').format(selectedDate!),
                  )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
