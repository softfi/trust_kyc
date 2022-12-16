import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DropDownContainer extends StatelessWidget {
  const DropDownContainer(
      {Key? key,
      required this.dropdownHeading,
      required this.dropDownList,
      required this.on_drop_down_change,
      required this.dropDownInitialValue})
      : super(key: key);
  final String dropdownHeading;
  final RxString dropDownInitialValue;
  final List dropDownList;
  final Function on_drop_down_change;

  @override
  Widget build(BuildContext context) {
    RxDouble filedHeight = 100.0.obs;
    RxDouble widt = 10.0.obs;
    filedHeight.value = MediaQuery.of(context).size.width / 9;
    widt.value = MediaQuery.of(context).size.width;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${dropdownHeading}",
          style: TextStyle(
              color: Colors.black, fontSize: 18, fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5,
        ),
        Obx(() => Container(
            padding: EdgeInsets.only(left: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)),
            width: widt / 3,
            height: filedHeight.value,
            child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    isExpanded: true,
                    value: dropDownInitialValue.value,
                    hint: Text(
                      "Select value.",
                      style: TextStyle(color: Colors.black),
                    ),
                    items: dropDownList.map((e) {
                      return DropdownMenuItem(
                          value: e.toString(), child: Text(e.toString()));
                    }).toList(),
                    onChanged: (val) {
                      on_drop_down_change(val.toString());
                      dropDownInitialValue.value = val.toString();
                    })))),
      ],
    );
  }
}
