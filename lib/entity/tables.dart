/**
 * Created by luhai on 2020/8/26
 */
import 'package:moor/ffi.dart';
import 'package:moor_flutter/moor_flutter.dart';

/// 已经添加的Affair 表：     名称，开始时间，结束时间，类型，备注
/// 常用事务 表：            图标，底色，名称，类型，备注
/// 目标 表：               名称，频次，目标量，时间，事务清单
/// 随笔 表：               标题，内容，背景，图片，关联的事务，关联的目标，是否在草稿箱，
/// 模版 表

// 已添加的affairs
class Affairs extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get icon => integer()();
  IntColumn get color => integer()();
  TextColumn get name => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  IntColumn get category => integer()();
  TextColumn get remark => text()();
  IntColumn get checked => integer()();
}

// 右侧常用affairs
class CommonAffairs extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get icon => integer()();
  IntColumn get color => integer()();
  TextColumn get name => text()();
  IntColumn get category => integer()();
  TextColumn get remark => text()();
}

// 目标
class Goals extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get frequency => integer()();   // 频次
  IntColumn get volumeType => integer()();
  IntColumn get volume => integer()();
  IntColumn get timeLimit => integer()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  TextColumn get affairs => text()();
}

// 随笔
class Essays extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  TextColumn get content => text()();
  // IntColumn get background => integer()();
  TextColumn get picture => text()();
  IntColumn get affair => integer()();
  // TextColumn get goal => text()();
  // IntColumn get isDraft => integer()();
  DateTimeColumn get time => dateTime()();
  RealColumn get WH => real()();
}

// 模版
class Templates extends Table{
  IntColumn get id => integer().autoIncrement()();
  IntColumn get icon => integer()();
  IntColumn get color => integer()();
  TextColumn get name => text()();
  DateTimeColumn get startTime => dateTime()();
  DateTimeColumn get endTime => dateTime()();
  IntColumn get category => integer()();
  TextColumn get remark => text()();
}