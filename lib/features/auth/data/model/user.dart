// ignore_for_file: prefer_const_declarations

final String usersTable = 'users';

class UsersField {
  static final List<String> values = [
    id,
    userName,
    walletAmount,
    lastUpdate,
    lastActivity,
    lastActivityDate,
  ];

  static final String id = '_id';
  static final String userName = 'userName';
  static final String walletAmount = 'walletAmount';
  static final String lastUpdate = 'lastUpdate';
  static final String lastActivity = 'lastActivity';
  static final String lastActivityDate = 'lastActivityDate';
}

class User {
  final int? id;
  final String? userName;
  final String? walletAmount;
  final String? lastUpdate;
  final String? lastActivity;
  final String? lastActivityDate;

  User({
    this.userName,
    this.walletAmount = '800.0',
    this.lastUpdate = '25/8',
    this.lastActivity = ' 200.0',
    this.lastActivityDate = '25/8',
    this.id,
  });

  static User fromJson(Map<String, Object?> json) => User(
        id: json[UsersField.id] as int?,
        userName: json[UsersField.userName] as String?,
        walletAmount: json[UsersField.walletAmount] as String?,
        lastUpdate: json[UsersField.lastUpdate] as String?,
        lastActivity: json[UsersField.lastActivity] as String?,
        lastActivityDate: json[UsersField.lastActivityDate] as String?,
        // taskRepeatTime: json[UsersField.taskRepeatTime] as String?,
        // isCompleted: json[UsersField.isCompleted] == 1,
        // isFavourite: json[UsersField.isFavourite] == 1,
      );

  Map<String, Object?> toJson() => {
        UsersField.userName: userName,
        UsersField.walletAmount: walletAmount,
        UsersField.lastUpdate: lastUpdate,
        UsersField.lastActivity: lastActivity,
        UsersField.lastActivityDate: lastActivityDate,
        UsersField.id: id,
      };

  User copy({
    int? id,
    final String? userName,
    final String? walletAmount,
    final String? lastUpdate,
    final String? lastActivity,
    final String? lastActivityDate,
  }) =>
      User(
        id: id ?? this.id,
        userName: userName ?? this.userName,
        walletAmount: walletAmount ?? this.walletAmount,
        lastUpdate: lastUpdate ?? this.lastUpdate,
        lastActivity: lastActivity ?? this.lastActivity,
        lastActivityDate: lastActivityDate ?? this.lastActivityDate,
        // taskTitle: taskTitle ?? this.taskTitle,
      );
}
