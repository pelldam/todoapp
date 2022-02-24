import 'package:flutter/material.dart';
import 'package:todoapp/utills/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField(
      {this.hint,
      this.label,
      this.pretext,
      this.sufText,
      this.maxLength,
      this.initialValue,
      this.icon,
      this.enabled,
      this.prefixIcon,
      this.suffixIcon,
      this.keyType,
      this.keyAction,
      this.textEditingController,
      this.onSubmited,
      this.validate,
      this.onChanged,
      this.colors,
      // ignore: non_constant_identifier_names
      this.AllowClickable = false,
      this.validatorText,
      this.onClick,
      this.height=50});
  final VoidCallback? onClick;
  final Color? colors;
  // ignore: non_conant_identifier_names
  final bool? AllowClickable;
  final String? hint;
  final String? label;
  final String? pretext;
  final String? sufText;
  final String? initialValue;
  final int? maxLength;
  final bool? enabled;
  final Widget? icon, prefixIcon, suffixIcon;
  final TextInputType? keyType;
  final TextEditingController? textEditingController;
  final TextInputAction? keyAction;
  final ValueChanged<String>? validate;
  final ValueChanged<String>? onSubmited;
  final ValueChanged<String>? onChanged;
  final String? validatorText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(left: 0, right: 0, top: 9),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    label!,
                    style: TextStyle(color: Colors.black, fontSize: 12),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  (validatorText != null && validatorText!.isNotEmpty)
                      ? Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Text(
                            "*",
                            style: TextStyle(color: Colors.red, fontSize: 12),
                          ))
                      : Container()
                ],
              )),
          GestureDetector(
            onTap: () {
              if (AllowClickable!) onClick!();
            },
            child: Container(
              height: height,
              margin: EdgeInsets.only(top: 10),
              child: TextFormField(
          
               minLines: null,
               maxLines: null,
               textAlignVertical: TextAlignVertical.top,
                    expands: true,
                  autofocus: true,
                  onChanged: this.onChanged,
                  // maxLength: this.maxLength,
                  controller: textEditingController,
                  enabled: enabled,
                  keyboardType: this.keyType,
                  textInputAction: this.keyAction,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return validatorText;
                    }
                    return null;
                  },
                  initialValue: this.initialValue,
                  decoration: InputDecoration(
                    isDense: true,
                    prefixText: this.pretext,
                    suffixText: this.sufText,
                    fillColor: text_field_bg,
                    // contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                    focusedBorder:const OutlineInputBorder(
                      
                        borderSide: BorderSide(
                            color:text_field_bg, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    enabledBorder:const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: text_field_bg, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color:text_field_bg, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    // labelText: label,
                    hintText: hint,
                    prefixIcon: prefixIcon,
                    suffixIcon: suffixIcon,
                    // labelStyle: Theme.of(context).textTheme.headline4!.copyWith(
                    //     color: AppColors.secondary,
                    //     fontFamily: FontFamily.sofiaPro,
                    //     fontSize: 14),
                    hintStyle: Theme.of(context).textTheme.headline4!.copyWith(
                          color: colors ?? Colors.black26,
                          fontFamily: 'DMSans',
                          fontSize: 14,
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  // validator: validate,
                  onFieldSubmitted: onSubmited),
            ),
          )
        ],
      ),
    );
  }
}