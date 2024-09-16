import 'package:blooddoman_clean/constante.dart';
import 'package:blooddoman_clean/core/utils/styles.dart';
import 'package:blooddoman_clean/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class CustomDropDownMenu extends StatefulWidget {
  final TextEditingController controller;
  final List<String> items;
  final String text;

  const CustomDropDownMenu({
    super.key,
    required this.controller,
    required this.items,
    required this.text,
  });

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  bool showDropdown = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextFormField(
          controller: widget.controller,
          textHint: widget.text,
          readOnly: true,
          onTap: () {
            setState(() {
              showDropdown = !showDropdown;
            });
          },
        ),
        showDropdown
            ? Column(
                children: [
                  const SizedBox(height: 6),
                  Container(
                    height: 200,
                    decoration: BoxDecoration(
                        color: primaryColor,
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 3,
                          color: Colors.white,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            color: primaryColor,
                            blurRadius: 3,
                          ),
                        ]),
                    child: ListView.builder(
                      itemCount: widget.items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          onTap: () {
                            widget.controller.text =
                                widget.items[index].toString();
                            setState(() {
                              showDropdown = false;
                            });
                          },
                          title: Text(
                            widget.items[index].toString(),
                            style: Styles.textStyle17,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
