import 'package:flutter/material.dart';
import 'package:winwin/pages/constant.dart';

class PhoneNumberInput extends StatelessWidget {
  late TextEditingController controller = TextEditingController(text: '');
  late String hintText;
   PhoneNumberInput({TextEditingController? controller, String? hintText}) {
    this.controller = controller ?? TextEditingController(text: '');
    this.hintText = hintText ?? 'Phone Number';
  }
  
  Widget phoneNumberInput() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            decoration: BoxDecoration(
                color: appBarColor, borderRadius: BorderRadius.circular(10.0)),
            child: Center(
              child: Row(
                children: [
                  Image.asset(
                    'assets/icon_call.png',
                    width: 26,
                  ),
                  const SizedBox(
                    width: 14,
                  ),
                  Expanded(
                      child: TextFormField(
                        controller: controller,
                        style: textColor2TextStyle,
                        decoration: InputDecoration.collapsed(
                            hintText: hintText,
                            hintStyle: textColor2TextStyle.copyWith(
                                fontSize: 13, fontWeight: FontWeight.w500)),
                      )),
                ],
              ),
            ),
          )
        ],
      );
    }
  @override
  Widget build(BuildContext context) {
    return phoneNumberInput();
  }
}