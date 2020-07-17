import 'package:flutter/cupertino.dart';
import 'package:track/data/affair_bean.dart';
import 'package:track/data/affair_icon_bean.dart';

/**
 * Created by luhai on 2020/7/17
 */

class AffairInfoWidget extends StatelessWidget {
  final int index;
  final AffairBean affairBean;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  AffairInfoWidget(
      this.index, {
        this.affairBean,
        this.onEdit,
        this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final affairIconData = IconBean.fromBean(affairBean.affairIconBean.iconBean);

    return Column(
      children: [
        Icon(affairIconData),
        Text('${affairBean.name}'),
      ],
    );
  }
}






