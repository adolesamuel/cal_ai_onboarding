import 'package:cal_ai/configs/constants.dart';
import 'package:cal_ai/models/question_model.dart';
import 'package:cal_ai/screens/state/onboarding_controller.dart';
import 'package:cal_ai/screens/widget/question_selection_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuestionPage extends ConsumerStatefulWidget {
  final Question question;
  final void Function(String?, Map<String, dynamic>?)? onOptionSelected;
  const QuestionPage({
    super.key,
    required this.question,
    this.onOptionSelected,
  });

  @override
  ConsumerState<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends ConsumerState<QuestionPage> {
  String? selection;
  Map<String, dynamic> inputMap = {};
  List<TextEditingController> textEditingCtrls = [];

  bool evaluate() {
    if (widget.question.type == QuestionType.input) {
      return inputMap.length == widget.question.options.length &&
          inputMap.values.every((element) => element.toString().isNotEmpty && (int.tryParse(element) ?? 0) != 0);
    } else if (widget.question.type == QuestionType.selection) {
      return selection != null;
    }
    return true;
  }

  @override
  void initState() {
    super.initState();
    getPreviousData();
  }

  void getPreviousData() {
    final onboardingCTRL = ref.read(onboardingControllerProvider);
    if (widget.question.type == QuestionType.selection) {
      selection = onboardingCTRL.onboardingData.getAnswer(widget.question.questions).$1;
    } else {
      inputMap = onboardingCTRL.onboardingData.getAnswer(widget.question.questions).$2 ?? {};
      for (var element in widget.question.options) {
        textEditingCtrls.add(TextEditingController(text: inputMap[element]));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final onboardingCTRL = ref.read(onboardingControllerProvider);
    return ListenableBuilder(
        listenable: onboardingCTRL,
        builder: (context, _) {
          return LayoutBuilder(
            builder: (context, contraints) {
              return SizedBox(
                height: contraints.maxHeight,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.question.question,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                    ),
                    32.verticalSpace,
                    const Text(
                      'This will be used to calibrate your custom plan.',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                    ),
                    32.verticalSpace,
                    if (widget.question.type == QuestionType.selection)
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: ListView(
                            children: [
                              ...List.generate(
                                widget.question.options.length,
                                (index) => QuestionSelectionTab(
                                    text: widget.question.options[index],
                                    isSelected: widget.question.options[index] == selection,
                                    onSelect: (value) {
                                      selection = value;
                                      setState(() {});
                                    }),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (widget.question.type == QuestionType.input)
                      Expanded(
                        child: ListView(
                          children: [
                            ...List.generate(
                              widget.question.options.length,
                              (index) => Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                  controller: textEditingCtrls[index],
                                  decoration: InputDecoration(
                                    hintText: widget.question.options[index].capitalize(),
                                  ),
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly,
                                  ],
                                  onChanged: (value) {
                                    inputMap[widget.question.options[index]] = value;

                                    setState(() {});
                                  },
                                  onTapOutside: (_) => FocusScope.of(context).unfocus(),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    24.verticalSpace,
                    ElevatedButton(
                      onPressed: !evaluate()
                          ? null
                          : () {
                              widget.onOptionSelected?.call(selection, inputMap);
                              onboardingCTRL.nextPage();
                            },
                      child: const Text('Next'),
                    ),
                    32.verticalSpace,
                  ],
                ),
              );
            },
          );
        });
  }
}
