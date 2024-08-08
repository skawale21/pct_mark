import 'package:flutter/material.dart';
import 'package:pct_mark/core/common/widgets/complaint_widget/switch_button.dart';

class TenantNotifications extends StatefulWidget {
  const TenantNotifications({super.key});

  @override
  State<TenantNotifications> createState() => _TenantNotificationsState();
}

class _TenantNotificationsState extends State<TenantNotifications> {
  bool _status = false;

  void _handleStatusChange(bool newStatus) {
    setState(() {
      _status = newStatus;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: Center(
          child: Column(
            children: [
              const Text('hi'),
              Card(
                color: Colors.white,
                elevation: 4,
                margin: const EdgeInsets.all(8),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(5),
                      padding: const EdgeInsets.all(10),
                      child: const Text('Text'),
                    ),
                    Container(
                      padding: const EdgeInsets.only(
                          bottom: 20, left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SwitchButton(
                            onStatusChanged: _handleStatusChange,
                          ),
                          // Text(
                          //   widget.status,
                          //   style: TextStyle(
                          //       color: widget.status == "OPEN"
                          //           ? ColorManager.complainStatusTextOpenColor
                          //           : ColorManager.complainStatusTextResolvedColor,
                          //       fontSize: FontSize.s16,
                          //       fontWeight: FontWeight.w600),
                          // ),
                          const Text(
                            'text 2',
                            style: TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
