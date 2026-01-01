import 'package:desktop_test/widgets/big_text.dart';
import 'package:desktop_test/widgets/custom_button.dart';
import 'package:desktop_test/widgets/custom_text_filed.dart';
import 'package:desktop_test/widgets/generic_drop_down.dart';
import 'package:flutter/material.dart';

class QueryPage extends StatefulWidget {
  const QueryPage({super.key});

  @override
  State<QueryPage> createState() => _QueryPageState();
}

class _QueryPageState extends State<QueryPage> {
  QueryType? _selectedQueryType;
  final TextEditingController _travelDateController = TextEditingController();
  final TextEditingController _returnDateController = TextEditingController();

  /// Date picker function
  Future<void> _pickDate(TextEditingController controller) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      controller.text =
          '${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}';
    }
  }

  @override
  void dispose() {
    _travelDateController.dispose();
    _returnDateController.dispose();
    super.dispose();
  }

  // Helper method to determine column width based on screen size
  double _getColumnWidth(double screenWidth) {
    if (screenWidth > 1200) {
      return (screenWidth - 48) / 2; // 2 columns for large screens
    } else if (screenWidth > 600) {
      return (screenWidth - 48) / 2; // 2 columns for medium screens
    } else {
      return screenWidth - 32; // Full width for small screens
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    final isSmallScreen = screenWidth < 600;
    final isMediumScreen = screenWidth >= 600 && screenWidth < 1200;

    // Responsive spacing
    final gap = SizedBox(height: isSmallScreen ? 8 : 10);
    final sectionGap = SizedBox(height: isSmallScreen ? 12 : 16);

    // Responsive padding
    final horizontalPadding = isSmallScreen
        ? 12.0
        : (isMediumScreen ? 16.0 : 24.0);
    final verticalPadding = isSmallScreen ? 12.0 : 16.0;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Query Page',
          style: TextStyle(fontSize: isSmallScreen ? 18 : 20),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'This is the Query Page',
              style: TextStyle(fontSize: isSmallScreen ? 14 : 16),
            ),
            sectionGap,

            // Header Container - Responsive height and padding
            Container(
              width: double.infinity,
              constraints: BoxConstraints(minHeight: isSmallScreen ? 100 : 120),
              padding: EdgeInsets.all(isSmallScreen ? 12 : 16),
              decoration: BoxDecoration(
                color: const Color(0xff113c7c),
                border: Border.all(color: Colors.blueAccent),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(
                    text: "New Query",
                    color: Colors.white,
                    size: _getResponsiveFontSize(
                      screenWidth,
                      small: 14,
                      medium: 18,
                      large: 20,
                    ),
                  ),
                  SizedBox(height: isSmallScreen ? 8 : 12),
                  BigText(
                    text: "Query Manager",
                    color: Colors.white,
                    size: _getResponsiveFontSize(
                      screenWidth,
                      small: 20,
                      medium: 24,
                      large: 28,
                    ),
                  ),
                ],
              ),
            ),

            sectionGap,

            // Purpose and Agent Row
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: screenWidth > 600
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth,
                      child: AppDropdown<QueryType>(
                        value: _selectedQueryType,
                        items: QueryType.values,
                        title: "Select Purpose",
                        hint: 'Select query type',
                        labelBuilder: (q) => q.label,
                        onChanged: (val) =>
                            setState(() => _selectedQueryType = val),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth > 600
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth,
                      child: AppDropdown<QueryType>(
                        title: "Select Agent",
                        value: _selectedQueryType,
                        items: QueryType.values,
                        hint: 'Select query type',
                        labelBuilder: (q) => q.label,
                        onChanged: (val) =>
                            setState(() => _selectedQueryType = val),
                      ),
                    ),
                  ],
                );
              },
            ),

            sectionGap,

            // Travel and Return Date Row
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: screenWidth > 600
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth,
                      child: CustomTextField(
                        title: 'Enter Travel Date',
                        hintText: 'YYYY-MM-DD',
                        controller: _travelDateController,
                        onSuffixPressed: () => _pickDate(_travelDateController),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth > 600
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth,
                      child: CustomTextField(
                        title: 'Enter Return Date',
                        hintText: 'YYYY-MM-DD',
                        controller: _returnDateController,
                        onSuffixPressed: () => _pickDate(_returnDateController),
                      ),
                    ),
                  ],
                );
              },
            ),

            sectionGap,

            // PNR and Ticket Status Row
            LayoutBuilder(
              builder: (context, constraints) {
                return Wrap(
                  spacing: 16,
                  runSpacing: 12,
                  children: [
                    SizedBox(
                      width: screenWidth > 600
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth,
                      child: CustomTextField(title: "PNR", hintText: "pnr"),
                    ),
                    SizedBox(
                      width: screenWidth > 600
                          ? (constraints.maxWidth - 16) / 2
                          : constraints.maxWidth,
                      child: AppDropdown<QueryType>(
                        title: "Ticket Status",
                        value: _selectedQueryType,
                        items: QueryType.values,
                        hint: 'Select query type',
                        labelBuilder: (q) => q.label,
                        onChanged: (val) =>
                            setState(() => _selectedQueryType = val),
                      ),
                    ),
                  ],
                );
              },
            ),

            sectionGap,

            // Full-width fields
            CustomTextField(title: "Pax Name", hintText: 'Enter Pax Name'),
            gap,
            CustomTextField(
              title: "Ticket Number",
              hintText: 'Enter Ticket Number',
            ),
            gap,
            CustomTextField(
              title: "PAX names",
              hintText: 'Enter PAX names',
              maxLines: isSmallScreen ? 2 : 3,
            ),

            // Bottom padding for scrolling comfort
            SizedBox(height: isSmallScreen ? 16 : 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton(
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(color: Color(0xff113c7c)),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Cancel'),
                ),
                SizedBox(width: isSmallScreen ? 4 : 16),
                CustomButton(onPressed: () {}, buttonText: 'Save'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Helper method for responsive font sizes
  double _getResponsiveFontSize(
    double screenWidth, {
    required double small,
    required double medium,
    required double large,
  }) {
    if (screenWidth < 600) {
      return small;
    } else if (screenWidth < 1200) {
      return medium;
    } else {
      return large;
    }
  }
}

enum QueryType { bug, feature, support }

extension QueryTypeLabel on QueryType {
  String get label {
    switch (this) {
      case QueryType.bug:
        return 'Bug';
      case QueryType.feature:
        return 'Feature Request';
      case QueryType.support:
        return 'Support';
    }
  }
}
