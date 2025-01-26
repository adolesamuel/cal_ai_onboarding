import 'package:cal_ai/configs/constants.dart';
import 'package:flutter/material.dart';

class QuestionSelectionTab extends StatelessWidget {
  final String text;
  final bool isSelected;
  final void Function(String)? onSelect;
  const QuestionSelectionTab({
    super.key,
    required this.text,
    this.isSelected = false,
    this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Material(
        clipBehavior: Clip.antiAlias,
        color: isSelected ? Colors.black : const Color(0xFFF7F7FD),
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () {
            onSelect?.call(text);
          },
          borderRadius: BorderRadius.circular(16),
          child: Container(
            height: 60,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: Text(
              text.capitalize(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: isSelected ? Colors.white : null,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
