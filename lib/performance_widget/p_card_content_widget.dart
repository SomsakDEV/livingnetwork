import 'package:flutter/material.dart';
import 'package:living_network/performance_widget/p_example_model.dart';

class CardContentWidget extends StatefulWidget {
  final List<PerformanceModel> contentList;
  const CardContentWidget({
    super.key,
    required this.contentList,
  });

  @override
  State<CardContentWidget> createState() => _CardContentWidgetState();
}

class _CardContentWidgetState extends State<CardContentWidget> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: widget.contentList.length,
        itemBuilder: (context, index) {
          return Card(
            shadowColor: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 16),
                        child: Image.asset(
                          widget.contentList[index].iconImage,
                          width: 40,
                          height: 40,
                        ),
                      ),
                      widget.contentList[index].text
                    ],
                  ),
                ),
                Image.asset(
                  widget.contentList[index].qualityImage,
                  width: 60,
                ),
                const SizedBox(height: 65)
              ],
            ),
          );
        },
      ),
    );
  }
}
