import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Provides the common text input field used in the app.
class AppTextFormField {
  /// Returns a text field used in the app.
  ///
  /// Text field controller can be specified in [controller] field.
  /// Optional title can be specified in [title] field.
  /// Optional hint can be specified in [hint] field.
  /// The error message that is to be displayed can be specified in [error] field.
  /// Auto focuses the text field if the [autoFocus] field is set to true.
  /// [validator] callback that is called whenever the text field is validated.
  /// [onEditingComplete] that is called whenever the text field editing is complete.
  /// [keyboardType] specifies a default keyboard that is to shown when the user taps on this text field.
  /// The form key can be specified in [formKey] field.
  /// The focus node for this widget can be specified in [focusNode] field.
  static Widget text({
    Key? key,
    @required TextEditingController? controller,
    String? hint,
    String? error,
    String? label,
    bool underlineBorder = false,
    bool passwordText = false,
    bool autoFocus = false,
    int? maxLength,
    bool autoValidate = true,
    Function(String?)? validator,
    Function(String)? onChange,
    bool isFocusableBorder = true,
    Function(String)? onFieldSubmit,
    Function()? onEditingComplete,
    TextInputType? keyboardType,
    TextInputAction? textInputActions,
    Key? formKey,
    FocusNode? focusNode,
    bool enabled = true,
    Widget? suffixIcon,
    Widget? prefixIcon,
    double? contentPadding,
    EdgeInsets? contentEdgeInsets,
    Color fillColor = Colors.transparent,
    List<TextInputFormatter>? inputFormatters,
    int minLines = 1,
    TextAlign textAlign = TextAlign.start,
    String? suffixText,
    Color errorColor = Colors.red,
    Color focusedColor = Colors.blueAccent,
    Color bColor = Colors.white24,
    TextStyle? style,
    TextStyle? labelStyle,
    double borderCircular = 10.0,
  })
  {
    return Container(
      key: key,
      child: Form(
        key: formKey,
        child: TextFormField(
          enabled: enabled,
          readOnly: !enabled,
          focusNode: focusNode,
          autofocus: autoFocus,
          controller: controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          textAlign: textAlign,
          obscureText: passwordText,
          obscuringCharacter: '*',
          textInputAction: (textInputActions == null)
              ? TextInputAction.done
              : textInputActions,
          validator: (value) {
            if (validator != null) {
              return validator(value);
            }
            return null;
          },
          onChanged: (value) {
            // Perform tasks

            if (onChange != null) {
              onChange(value);
            }
          },
          onFieldSubmitted: (value) {
            if (onFieldSubmit != null) {
              onFieldSubmit(value);
            }
          },
          style: style ??
              const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  height: 1,
                  color: Colors.black54),
              // AppTextStyles.buildStyles(
              //   AppTextScale.subTitle,
              //   params: AppTextParams(
              //       fontWeight: FontWeight.w400, color: Colors.black),
              // ),
          // onSubmitted: onSubmitted,
          onEditingComplete: onEditingComplete,
          maxLines: maxLength == null ? minLines : null,
          minLines: minLines,
          maxLengthEnforcement:
          MaxLengthEnforcement.truncateAfterCompositionEnds,
          maxLength: maxLength,
          keyboardType: keyboardType,
          // initialValue: hint,
          decoration: InputDecoration(
            fillColor: fillColor,
            filled: true,
            contentPadding: contentEdgeInsets != null
                ? contentEdgeInsets
                : EdgeInsets.all(contentPadding ?? 0),
            //TODO smart coding :D
            isDense: contentPadding != null,
            labelText: label,
            labelStyle: labelStyle ??
                const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1,
                    color: Colors.black54),
                // AppTextStyles.buildStyles(AppTextScale.title,
                //     params: AppTextParams(
                //       fontWeight: FontWeight.normal,
                //       lineHeight: 1,
                //       color: Colors.white24,
                //     )),
            errorText: error,
            errorMaxLines: error != null ? null : 5,
            hintText: label == null ? hint : null,
            hintStyle: labelStyle ??
                const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.normal,
                    height: 1,
                    color: Colors.black54),
                // AppTextStyles.buildStyles(AppTextScale.title,
                // params: AppTextParams(
                //   fontWeight: FontWeight.normal,
                //   lineHeight: 1,
                //   color: Colors.white24,
                // )),
            floatingLabelBehavior: FloatingLabelBehavior.always,
            enabledBorder: underlineBorder
                ? UnderlineInputBorder(
              borderSide: BorderSide(color: bColor, width: 1),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                borderCircular ,
              ),
              borderSide: BorderSide(color: bColor, width: 1),
            ),
            border: underlineBorder
                ? UnderlineInputBorder(
              borderSide: BorderSide(color: bColor, width: 1),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCircular),
              borderSide: BorderSide(color: bColor, width: 1),
            ),
            focusedBorder: underlineBorder
                ? UnderlineInputBorder(
              borderSide: BorderSide(color: bColor, width: 1),
            )
                : OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderCircular ),
              borderSide: BorderSide(color: bColor, width: 1),
            ),
            suffixIcon: suffixIcon,
            prefixIcon: prefixIcon,
            suffixText: suffixText,
          ),
          inputFormatters: inputFormatters, // Only numbers can be entered
        ),
      ),
    );
  }
}
