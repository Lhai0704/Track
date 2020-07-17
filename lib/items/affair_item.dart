import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/model/global_model.dart';
import 'package:track/widgets/affair_info_widget.dart';

/**
 * Created by luhai on 2020/7/17
 */

class AffairItem extends StatelessWidget {
  final int index;
  final AffairBean affairBean;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  AffairItem(this.index, this.affairBean, {this.onEdit, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final globalModel = Provider.of<GlobalModel>(context);

    final widget = AffairInfoWidget(
      index,
      affairBean: affairBean,
      onDelete: onDelete,
      onEdit: onEdit,
    );

    return Container(
      child: widget,
    );
  }
}



















