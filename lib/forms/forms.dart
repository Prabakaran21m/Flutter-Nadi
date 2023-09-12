import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'theme.dart';

class TextInput extends StatefulWidget {
  final String label;
  final TextEditingController? controller;
  final MainAxisSize mainAxisSize;
  final MainAxisAlignment mainAxisAlignment;
  final double? height;
  final double? contentPaddingV;
  final String? hintText;
  final String? errorText;
  final bool obscureText;
  final bool margin;

  final bool isEntryField;
  final bool isSelected;
  final bool isMistake;
  final bool isCapital;
  final bool demoCar;
  final int? MaxLength;
  final bool isReadOnly;

  final Color textColor;
  final TextInputType? textInputType;
  final VoidCallback? onPressed;
  final String? icon;
  final void Function(String) onTextChange;
  final Icon? sufficIcon;

  const TextInput(
      {required this.label,
      required this.onTextChange,
      this.obscureText = false,
      this.isReadOnly = false,
      this.isEntryField = true,
      this.isSelected = false,
      this.isMistake = false,
      this.isCapital = false,
      this.demoCar = false,
      this.MaxLength,
      this.margin = true,
      this.controller,
      this.contentPaddingV,
      this.mainAxisSize = MainAxisSize.max,
      this.mainAxisAlignment = MainAxisAlignment.spaceEvenly,
      this.height,
      this.hintText,
      this.errorText,
      this.onPressed,
      this.textInputType,
      this.icon,
      this.sufficIcon,
      this.textColor = AppTheme.TextColor});

  @override
  State<TextInput> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  bool showPassword = false;
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    List<String> lines = widget.hintText!.split('\n');

    return Container(
      color: widget.isEntryField ? AppTheme.App_color : Colors.white,
      margin: widget.margin
          ? EdgeInsets.fromLTRB(12, 14, 12, 0)
          : EdgeInsets.only(top: 2),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            widget.isEntryField
                ? Material(
                    borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                    color: AppTheme.App_color,
                    child: TextFormField(
                      onTap: widget.onPressed,
                      // readOnly: widget.obscureText ? widget.isReadOnly ?  true:  true : false,
                      readOnly: widget.isReadOnly ? true : false,
                      keyboardType: widget.textInputType,
                      textCapitalization: widget.isCapital
                          ? TextCapitalization.characters
                          : TextCapitalization.sentences,
                      minLines: widget.textInputType == TextInputType.multiline
                          ? 3
                          : 1,
                      maxLines: widget.textInputType == TextInputType.multiline
                          ? 3
                          : 1,
                      inputFormatters:
                          widget.textInputType! == TextInputType.number ||
                                  widget.textInputType! == TextInputType.phone
                              ? [
                                  FilteringTextInputFormatter.deny(
                                      RegExp(r'[!@#$%^&*(),.?":{}|<>]')),
                                ]
                              : null,
                      maxLength: widget.MaxLength,
                      onChanged: widget.onTextChange,
                      controller: widget.controller,
                      style: TextStyle(
                          letterSpacing: 0.2,
                          color: widget.textColor,
                          fontWeight: FontWeight.w400,
                          fontSize: 14),
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: widget.label,
                        counter: Offstage(),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        labelStyle: TextStyle(
                            color: widget.controller.isNull
                                ? AppTheme.TextColor
                                : widget.controller!.value.text.isEmpty
                                    ? AppTheme.TextColor
                                    : AppTheme.lableColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        hintText: widget.hintText,
                        hintStyle: TextStyle(
                          color: AppTheme.lableColor,
                        ),
                        errorText: widget.errorText,
                        contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: widget.contentPaddingV.isNull
                                ? 16.0
                                : widget.contentPaddingV!),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: BorderSide(width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: widget.isMistake
                              ? BorderSide(
                                  color: Colors.deepOrangeAccent, width: 1.0)
                              : BorderSide(
                                  color: Color(0x4d252525), width: 1.0),
                        ),
                        suffixIcon: widget.obscureText
                            ? IconButton(
                                padding: EdgeInsets.all(15.0),
                                color: Color(0xff252525),
                                onPressed: widget.onPressed,
                                icon: widget.sufficIcon == null
                                    ? const Icon(Icons.keyboard_arrow_down)
                                    : widget.sufficIcon!,
                              )
                            : null,
                      ).copyWith(
                        focusedBorder:
                            FormThemes.inputOutlineBorder['focusedBorder'],
                        border: FormThemes.inputOutlineBorder['border'],
                        errorBorder:
                            FormThemes.inputOutlineBorder['errorBorder'],
                        disabledBorder:
                            FormThemes.inputOutlineBorder['disabledBorder'],
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: widget.isMistake
                              ? BorderSide(
                                  color: Colors.deepOrangeAccent, width: 1.0)
                              : BorderSide(
                                  color: Color(0x4d252525), width: 1.0),
                        ),
                      ),
                    ),
                  )
                : widget.demoCar
                    ? InkWell(
                        onTap: widget.onPressed,
                        child: Container(
                          margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
                          decoration: BoxDecoration(
                            color: widget.isSelected
                                ? AppTheme.SelectedOrange
                                : Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(10, 7, 10, 7),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  lines[0],
                                  style: TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      color: widget.isSelected
                                          ? Colors.deepOrangeAccent
                                          : Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  lines[1],
                                  style: TextStyle(
                                      color: widget.isSelected
                                          ? Colors.deepOrangeAccent
                                          : Colors.black,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    : Material(
                        color: widget.isSelected
                            ? AppTheme.SelectedOrange
                            : Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        child: TextFormField(
                          controller: _controller,
                          readOnly: true,
                          minLines: 1,
                          maxLines: 2,
                          maxLength: widget.MaxLength,
                          style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: widget.textColor,
                              fontWeight: FontWeight.w400,
                              fontSize: 14),
                          onTap: widget.onPressed,
                          inputFormatters: [
                            TextInputFormatter.withFunction(
                                (oldValue, newValue) {
                              final textLines = newValue.text.split('\n');
                              if (textLines.length > 1 &&
                                  textLines[1].isNotEmpty) {
                                final newText = textLines.join('\n');
                                final newValue = TextEditingValue(
                                  text: newText,
                                  selection: TextSelection.collapsed(
                                      offset: newText.length),
                                );
                                _controller.value = newValue;
                                setState(() {});
                                return newValue;
                              }
                              return newValue;
                            }),
                          ],
                          decoration: InputDecoration(
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            hintText: widget.hintText,
                            hintStyle: TextStyle(
                                color: widget.isSelected
                                    ? Colors.deepOrangeAccent
                                    : Colors.black),
                            errorText: widget.errorText,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 0.0),
                          ).copyWith(
                            border: FormThemes.inputOutlineBorder['border'],
                            errorBorder:
                                FormThemes.inputOutlineBorder['errorBorder'],
                            disabledBorder:
                                FormThemes.inputOutlineBorder['disabledBorder'],
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(
                                color: widget.isSelected
                                    ? Colors.white
                                    : Colors.white,
                                width: 1.0,
                              ),
                            ),
                          ),
                        ),
                      )
          ]),
    );
  }
}

class Button extends StatelessWidget {
  final Widget child;
  final double widthFactor;
  final double heightFactor;
  final VoidCallback? onPressed;
  final BorderSide borderColor;

  Button({
    Key? key,
    required this.child,
    this.onPressed,
    this.widthFactor = 0.4,
    this.heightFactor = 0.06,
    this.borderColor = BorderSide.none,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * heightFactor,
      width: widthFactor != 0 ? screenSize.width * widthFactor : null,
      decoration: BoxDecoration(
          color: AppTheme.AppBarColor,
          borderRadius: BorderRadius.circular(8.0)),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.transparent,
            shadowColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), side: borderColor)),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

class AppSnackBar {
  String title;
  String message;

  AppSnackBar({required this.title, required this.message}) {
    print("HERE");
  }

  AppSnackBar.error({
    required this.message,
    this.title = "Error",
  }) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        backgroundColor: Colors.redAccent,
        margin: const EdgeInsets.all(10.0),
        forwardAnimationCurve: Curves.easeOutBack);
  }

  AppSnackBar.success({required this.message, this.title = "Success"}) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        backgroundColor: Colors.greenAccent,
        margin: const EdgeInsets.all(10.0),
        forwardAnimationCurve: Curves.easeOutBack);
  }

  AppSnackBar.warning({required this.title, required this.message}) {
    Get.closeAllSnackbars();
    Get.snackbar(title, message,
        backgroundColor: Colors.orangeAccent,
        margin: const EdgeInsets.all(10.0),
        forwardAnimationCurve: Curves.easeOutBack);
  }
}
