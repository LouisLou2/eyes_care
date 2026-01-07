import 'package:eyescare/features/piazza/page/new_post_screen.dart';
import 'package:eyescare/features/workplace/entity/rencent_record.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:wolt_modal_sheet/wolt_modal_sheet.dart';

import 'new_project_page.dart';

class WorkplaceWelcomePage extends StatefulWidget {
  const WorkplaceWelcomePage({super.key});

  @override
  State<WorkplaceWelcomePage> createState() => _WorkplaceWelcomePageState();
}

class _WorkplaceWelcomePageState extends State<WorkplaceWelcomePage> {

  final List<RecentRecord> _projects = [
    RecentRecord(
      id: '#41423J',
      name: 'John Doe',
      result: 'Normal',
      createdAt: DateTime(2025, 2, 10),
      status: RecordStatus.completed,
    ),
    RecentRecord(
      id: '#41423J',
      name: 'John Doe',
      result: 'Normal',
      createdAt: DateTime(2025, 2, 10),
      status: RecordStatus.inProgress,
    ),
    RecentRecord(
      id: '#41423J',
      name: 'John Doe',
      result: 'Normal',
      createdAt: DateTime(2025, 2, 10),
      status: RecordStatus.inProgress,
    ),
    RecentRecord(
      id: '#41423J',
      name: 'John Doe',
      result: 'Normal',
      createdAt: DateTime(2025, 2, 10),
      status: RecordStatus.cancelled,
    ),
    RecentRecord(
      id: '#41423J',
      name: 'John Doe',
      result: 'Normal',
      createdAt: DateTime(2025, 2, 10),
      status: RecordStatus.onHold,
    ),
  ];


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 60, top: 100),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                flex: 2,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '已准备好开始分析任务',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                      ),
                    ),
                    ShadButton(
                      onPressed: () {
                        WoltModalSheet.show<void>(
                          context: context,
                          pageListBuilder: (modalSheetContext) {
                            return [
                              page1(modalSheetContext),
                              page2(modalSheetContext, context),
                              page3(modalSheetContext, context),
                            ];
                          },
                          modalTypeBuilder: (context) {
                            final size = MediaQuery.sizeOf(context).width;
                            if (size < 1000) {
                              return WoltModalType.bottomSheet();
                            } else {
                              return WoltModalType.dialog();
                            }
                          },
                          onModalDismissedWithBarrierTap: () {
                            debugPrint('Closed modal sheet with barrier tap');
                            Navigator.of(context).pop();
                          },
                        );
                      },
                      child: const Text('新建任务'),
                    ),
                  ],
                ),
              ),
              const Flexible(
                flex: 1,
                child: SizedBox(),
              ),
            ],
          ),
          const SizedBox(height: 40),
          const Text(
            '最近项目',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: ShadTable(
                    columnCount: 5, // For id, name, result, createdAt, status
                    rowCount: _projects.length,
                    rowSpanBackgroundDecoration: (index) {
                      return SpanDecoration(
                        border: SpanBorder(
                          leading: BorderSide(
                            color: Colors.white24,
                            width: 0.8,
                          ),
                        ),
                      );
                    },
                    header: (context, column) {
                      final headings = ['ID', '名称', '结果', '创建时间', '状态'];
                      final isLast = column == headings.length - 1;
                      return ShadTableCell.header(
                        alignment: isLast ? Alignment.centerRight : null,
                        child: Text(headings[column]),
                      );
                    },
                    columnSpanExtent: (index) {
                      if (index == 0) return const FixedTableSpanExtent(100); // ID column
                      if (index == 1) return const FixedTableSpanExtent(150); // Name column
                      if (index == 2) return const FixedTableSpanExtent(120); // Result column
                      if (index == 3) return const FixedTableSpanExtent(150); // Created At column
                      if (index == 4) {
                        // Status column - take remaining space but have minimum width
                        return const MaxTableSpanExtent(
                          FixedTableSpanExtent(120),
                          RemainingTableSpanExtent(),
                        );
                      }
                      return null;
                    },
                    builder: (context, index) {
                      final record = _projects[index.row];
                      // Display different content based on the column
                      Widget content;
                      Alignment alignment = Alignment.centerLeft;
                      switch (index.column) {
                        case 0: // ID
                          content = Text(
                            record.id,
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          );
                          break;
                        case 1: // Name
                          content = Text(record.name);
                          break;
                        case 2: // Result
                          content = Text(record.result);
                          break;
                        case 3: // Created At
                          content = Text(
                            DateFormat('MMM d, yyyy').format(record.createdAt),
                          );
                          break;
                        case 4: // Status
                          content = _buildStatusChip(context,record.status);
                          alignment = Alignment.centerRight;
                          break;
                        default:
                          content = const SizedBox();
                      }
                      return ShadTableCell(
                        alignment: alignment,
                        child: content,
                      );
                    },
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  ShadBadge _buildStatusChip(BuildContext context, RecordStatus status) {
    switch (status) {
      case RecordStatus.completed:
        return ShadBadge(
          child: Text('完成'),
        );
      case RecordStatus.inProgress:
        return ShadBadge(
          backgroundColor: Colors.blue,
          child: Text('进行中'),
        );
      case RecordStatus.cancelled:
        return ShadBadge(
          backgroundColor: Colors.red,
          child: Text('已取消'),
        );
      case RecordStatus.onHold:
        return ShadBadge(
          backgroundColor: Colors.orange,
          child: Text('推迟'),
        );
    }
  }
}