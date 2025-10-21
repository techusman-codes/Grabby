import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:grabby_app/core/constant/app_colors.dart';

/// Phone number input field with country code selector
///
/// Usage:
/// ```dart
/// PhoneNumberField(
///   controller: _phoneController,
///   onCountryChanged: (code) => print(code),
/// )
/// ```
class PhoneNumberField extends StatefulWidget {
  /// Text controller for phone number
  final TextEditingController controller;

  /// Label text
  final String label;

  /// Validation function
  final String? Function(String?)? validator;

  /// Initial country code
  final String initialCountryCode;

  /// Called when country code changes
  final Function(String)? onCountryChanged;

  const PhoneNumberField({
    super.key,
    required this.controller,
    this.label = 'Phone Number',
    this.validator,
    this.initialCountryCode = '+',
    this.onCountryChanged,
  });

  @override
  State<PhoneNumberField> createState() => _PhoneNumberFieldState();
}

class _PhoneNumberFieldState extends State<PhoneNumberField> {
  late String _selectedCountryCode;

  // List of common country codes
  final List<CountryCode> _countryCodes = [
    CountryCode(code: '+234', flag: '🇳🇬', name: 'Nigeria'),
    CountryCode(code: '+1', flag: '🇺🇸', name: 'USA'),
    CountryCode(code: '+44', flag: '🇬🇧', name: 'UK'),
    CountryCode(code: '+91', flag: '🇮🇳', name: 'India'),
    CountryCode(code: '+233', flag: '🇬🇭', name: 'Ghana'),
    CountryCode(code: '+254', flag: '🇰🇪', name: 'Kenya'),
  ];

  @override
  void initState() {
    super.initState();
    _selectedCountryCode = widget.initialCountryCode;
  }

  void _showCountryPicker() {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Container(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Select Country Code',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textPrimary,
                ),
              ),
              const SizedBox(height: 16),
              Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: _countryCodes.length,
                  itemBuilder: (context, index) {
                    final country = _countryCodes[index];
                    return ListTile(
                      leading: Text(
                        country.flag,
                        style: TextStyle(fontSize: 28),
                      ),
                      title: Text(country.name),
                      trailing: Text(
                        country.code,
                        style: TextStyle(
                          color: AppColors.textSecondary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      onTap: () {
                        setState(() {
                          _selectedCountryCode = country.code;
                        });
                        widget.onCountryChanged?.call(country.code);
                        Navigator.pop(context);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimary,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            // Country code selector
            InkWell(
              onTap: _showCountryPicker,
              borderRadius: BorderRadius.circular(12),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Text(
                      _countryCodes
                          .firstWhere((c) => c.code == _selectedCountryCode)
                          .flag,
                      style: TextStyle(fontSize: 24),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      _selectedCountryCode,
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(width: 4),
                    Icon(Icons.arrow_drop_down, color: AppColors.textSecondary),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 12),

            // Phone number input
            Expanded(
              child: TextFormField(
                controller: widget.controller,
                keyboardType: TextInputType.phone,
                validator: widget.validator,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(10),
                ],

                // Fixed: Text style
                style: TextStyle(
                  fontSize: 15,
                  color: AppColors.textPrimary,
                  height: 1.2,
                ),

                
                cursorHeight: 20, 
                cursorColor: AppColors.primary, 

                decoration: InputDecoration(
                  hintText: 'Phone Number',
                  hintStyle: TextStyle(
                    color: AppColors.textHint,
                    fontSize: 14,
                    height: 1.2, 
                  ),
                  filled: true,
                  fillColor: Color(0xFFF5F5F5),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: AppColors.primary,
                      width: 1.5,
                    ),
                  ),
                  errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.error, width: 1.5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: AppColors.error, width: 1.5),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 20,
                  ),
                  isDense: true,
                  alignLabelWithHint: true, 
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

/// Country code model
class CountryCode {
  final String code;
  final String flag;
  final String name;

  CountryCode({required this.code, required this.flag, required this.name});
}
