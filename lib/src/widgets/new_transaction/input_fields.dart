import 'package:budget_tracker/src/controllers/add_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../utils/colors.dart';

class InputFields extends StatefulWidget {
  const InputFields({super.key});

  @override
  State<InputFields> createState() => _InputFieldsState();
}

class _InputFieldsState extends State<InputFields> {
  final _controller = Get.find<AddController>();
  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  late TextEditingController _dateController;

  @override
  void initState() {
    super.initState();
    final date = DateFormat('dd.MM.yy').format(DateTime.now());
    _dateController = TextEditingController(text: date);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.sizeOf(context).width,
          margin: const EdgeInsets.all(20.0),
          padding: const EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: white,
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: TextField(
            controller: _nameController,
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: 'Название',
              hintStyle: TextStyle(
                color: black.withOpacity(.5),
              ),
              suffixIcon: Icon(
                MdiIcons.cashCheck,
                color: iconBlack,
              ),
            ),
            onChanged: (value) => _controller.setName(value),
          ),
        ),
        Row(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _priceController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Сумма',
                    hintStyle: TextStyle(
                      color: black.withOpacity(.5),
                    ),
                    suffixIcon: Icon(
                      MdiIcons.cashFast,
                      color: iconBlack,
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isEmpty) {
                      _controller.setPrice(0);
                    } else {
                      final price = double.tryParse(value);
                      _controller.setPrice(price ?? 0);
                    }
                  },
                ),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(right: 20.0),
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: TextField(
                  keyboardType: TextInputType.none,
                  controller: _dateController,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    suffixIcon: Icon(
                      MdiIcons.cashClock,
                      color: iconBlack,
                    ),
                  ),
                  onTap: () => _selectDate(),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }

  Future<void> _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now().subtract(
        const Duration(days: 30),
      ),
      lastDate: DateTime.now().add(
        const Duration(days: 3),
      ),
    );
    if (pickedDate != null) {
      _dateController.text = DateFormat('dd.MM.yy').format(pickedDate);
      _controller.setDate(pickedDate.toIso8601String());
    }
  }
}
