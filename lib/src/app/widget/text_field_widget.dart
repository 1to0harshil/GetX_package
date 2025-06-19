import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../core/theme/custom_text_style.dart';

class CustomTextFieldWidget extends StatefulWidget {
  const CustomTextFieldWidget({
    required this.obscureText,
    required this.inputAction,
    Key? key,
    this.textEditingController,
    this.isPassword,
    this.title,
    this.textFieldType,
    this.preIcon,
    this.labelText,
    this.inputFormat,
    this.suffixIcon,
    this.readOnlyVal = false,
    this.labelTextColor,
    this.focusNodeSelf,
    this.focusNodeNext,
  }) : super(key: key);
  final TextEditingController? textEditingController;
  final bool? isPassword;
  final TextInputType? textFieldType;
  final IconData? preIcon;
  final String? title;
  final String? labelText;
  final Color? labelTextColor;
  final List<TextInputFormatter>? inputFormat;
  final bool obscureText;
  final TextInputAction inputAction;
  final IconButton? suffixIcon;
  final bool readOnlyVal;
  final FocusNode? focusNodeSelf;
  final FocusNode? focusNodeNext;

  @override
  State<StatefulWidget> createState() => _CustomTextFieldWidgetState();
}

class _CustomTextFieldWidgetState extends State<CustomTextFieldWidget> {
  bool textEditHasFocus = false;

  @override
  void initState() {
    super.initState();

    widget.focusNodeSelf?.addListener(_observerMethod);
  }

  void _observerMethod() {
    if (textEditHasFocus) {
      if (widget.textEditingController!.text.isEmpty) {
        setState(() {
          textEditHasFocus = widget.focusNodeSelf?.hasFocus ?? false;
        });
      }
    } else {
      setState(() {
        textEditHasFocus = widget.focusNodeSelf?.hasFocus ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (widget.textEditingController!.text.isNotEmpty) {
      setState(() {
        textEditHasFocus = true;
      });
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          focusNode: widget.focusNodeSelf,
          style: CustomTextStyles.bodyMediumWhiteA70001,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textInputAction: widget.inputAction,
          obscureText: widget.obscureText,
          controller: widget.textEditingController,
          keyboardType: widget.textFieldType,
          inputFormatters: widget.inputFormat,
          readOnly: widget.readOnlyVal,
          decoration: InputDecoration(
            hintText: widget.labelText,
            suffixIcon: widget.suffixIcon,
          ),
          onFieldSubmitted: (_) => widget.focusNodeNext != null
              ? FocusScope.of(context).requestFocus(widget.focusNodeNext)
              : widget.focusNodeSelf?.unfocus(),
        ),
      ],
    );
  }
}
