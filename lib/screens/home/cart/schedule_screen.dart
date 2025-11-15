// ============================================================================
// FILE: lib/screens/cart/schedule_screen.dart
// PURPOSE: Fixed version with month dropdown and 7-day week view
// ============================================================================

import 'package:flutter/material.dart';
import '../../../core/constant/app_colors.dart';
import 'package:intl/intl.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  DateTime selectedDate = DateTime.now();
  String? selectedTime;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  // Available time slots (30-minute intervals from 8:00 AM to 6:00 PM)
  final List<String> timeSlots = [
    '8:00 AM',
    '8:30 AM',
    '9:00 AM',
    '9:30 AM',
    '10:00 AM',
    '10:30 AM',
    '11:00 AM',
    '11:30 AM',
    '12:00 PM',
    '12:30 PM',
    '1:00 PM',
    '1:30 PM',
    '2:00 PM',
    '2:30 PM',
    '3:00 PM',
    '3:30 PM',
    '4:00 PM',
    '4:30 PM',
    '5:00 PM',
    '5:30 PM',
    '6:00 PM',
  ];

  // Get all months
  List<Map<String, dynamic>> get availableMonths {
    final List<Map<String, dynamic>> months = [];
    final currentDate = DateTime.now();

    // Get next 12 months
    for (int i = 0; i < 12; i++) {
      final date = DateTime(currentDate.year, currentDate.month + i);
      months.add({
        'month': date.month,
        'year': date.year,
        'display': DateFormat('MMMM yyyy').format(date),
      });
    }
    return months;
  }

  // Current week number (to track which week to display)
  int currentWeekOffset = 0;

  // Get current week (7 days: Mon-Sun)
  List<DateTime> get currentWeekDates {
    // Start from first day of selected month
    final firstDayOfMonth = DateTime(selectedYear, selectedMonth, 1);

    // Find the Monday of the first week (might be in previous month)
    final firstMonday = firstDayOfMonth.subtract(
      Duration(days: firstDayOfMonth.weekday - 1),
    );

    // Calculate the Monday of the current week offset
    final weekStart = firstMonday.add(Duration(days: 7 * currentWeekOffset));

    // Generate 7 days starting from that Monday
    return List.generate(7, (index) => weekStart.add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Schedule Delivery',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Date Selection Container
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.grey[300]!),
                    ),
                    child: Column(
                      children: [
                        // Date header with month dropdown
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Date',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                // Previous week button
                                IconButton(
                                  icon: Icon(
                                    Icons.chevron_left,
                                    color: AppColors.softblue,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      currentWeekOffset--;
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                ),
                                // Small month dropdown
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                    vertical: 6,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton<String>(
                                      value: '${selectedMonth}_$selectedYear',
                                      isDense: true,
                                      icon: Icon(
                                        Icons.keyboard_arrow_down,
                                        color: AppColors.softblue,
                                        size: 18,
                                      ),
                                      style: const TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
                                      ),
                                      onChanged: (String? newValue) {
                                        if (newValue != null) {
                                          final parts = newValue.split('_');
                                          setState(() {
                                            selectedMonth = int.parse(parts[0]);
                                            selectedYear = int.parse(parts[1]);
                                            currentWeekOffset =
                                                0; // Reset to first week
                                            selectedDate = DateTime(
                                              selectedYear,
                                              selectedMonth,
                                              1,
                                            );
                                          });
                                        }
                                      },
                                      items: availableMonths.map((monthData) {
                                        return DropdownMenuItem<String>(
                                          value:
                                              '${monthData['month']}_${monthData['year']}',
                                          child: Text(
                                            monthData['display'],
                                            style: const TextStyle(
                                              fontSize: 13,
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                                // Next week button
                                IconButton(
                                  icon: Icon(
                                    Icons.chevron_right,
                                    color: AppColors.softblue,
                                    size: 20,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      currentWeekOffset++;
                                    });
                                  },
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(
                                    minWidth: 32,
                                    minHeight: 32,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),

                        // 7-Day Week View (No scrolling, fits screen)
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: currentWeekDates.map((date) {
                            final isSelected = _isSameDay(date, selectedDate);
                            final isToday = _isToday(date);
                            final isPastDate = date.isBefore(
                              DateTime.now().subtract(const Duration(days: 1)),
                            );

                            return Expanded(
                              child: GestureDetector(
                                onTap: isPastDate
                                    ? null
                                    : () {
                                        setState(() {
                                          selectedDate = date;
                                        });
                                      },
                                child: Container(
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 3,
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 12,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? AppColors.softblue
                                        : Colors.transparent,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: isPastDate
                                          ? Colors.grey[300]!
                                          : isSelected
                                          ? AppColors.softblue
                                          : Colors.transparent,
                                      width: 2,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Day abbreviation
                                      Text(
                                        DateFormat('EEE').format(date),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: isPastDate
                                              ? Colors.grey[400]
                                              : isSelected
                                              ? Colors.white
                                              : Colors.grey[600],
                                          fontWeight: FontWeight.w600,
                                        ),
                                      ),
                                      const SizedBox(height: 6),

                                      // Date number
                                      Text(
                                        DateFormat('dd').format(date),
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: isPastDate
                                              ? Colors.grey[400]
                                              : isSelected
                                              ? Colors.white
                                              : Colors.black,
                                        ),
                                      ),
                                      const SizedBox(height: 4),

                                      // Today badge or month
                                      if (isToday)
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 4,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: isSelected
                                                ? Colors.white.withOpacity(0.3)
                                                : AppColors.softblue
                                                      .withOpacity(0.1),
                                            borderRadius: BorderRadius.circular(
                                              6,
                                            ),
                                          ),
                                          child: Text(
                                            'Today',
                                            style: TextStyle(
                                              fontSize: 8,
                                              fontWeight: FontWeight.bold,
                                              color: isSelected
                                                  ? Colors.white
                                                  : AppColors.softblue,
                                            ),
                                          ),
                                        )
                                      else
                                        Text(
                                          DateFormat('MMM').format(date),
                                          style: TextStyle(
                                            fontSize: 9,
                                            color: isPastDate
                                                ? Colors.grey[400]
                                                : isSelected
                                                ? Colors.white.withOpacity(0.8)
                                                : Colors.grey[500],
                                          ),
                                        ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),

                  // Section Title: Select Time
                  const Text(
                    'Select Delivery Time',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),

                  // Time Slots (4 per row)
                  GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, // 4 items per row
                          childAspectRatio: 1.8, // Width to height ratio
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                        ),
                    itemCount: timeSlots.length,
                    itemBuilder: (context, index) {
                      final time = timeSlots[index];
                      final isSelected = selectedTime == time;

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedTime = time;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.softblue
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.softblue
                                  : Colors.grey[300]!,
                              width: 1.5,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              time,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: isSelected
                                    ? FontWeight.bold
                                    : FontWeight.w500,
                                color: isSelected
                                    ? Colors.white
                                    : Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Bottom Buttons
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              child: Row(
                children: [
                  // Cancel Button
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => Navigator.pop(context),
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.grey),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  // Confirm Button
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: selectedTime != null
                          ? () {
                              // Return selected date and time
                              Navigator.pop(context, {
                                'date': selectedDate,
                                'time': selectedTime,
                              });
                            }
                          : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.softblue,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: const Text(
                        'Confirm',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  bool _isToday(DateTime date) {
    final now = DateTime.now();
    return _isSameDay(date, now);
  }
}
