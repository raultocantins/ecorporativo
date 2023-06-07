class HelpDeskEntity {
  final int id;
  final HelpDeskStatusEntity status;
  final List<HelpDeskHistoricEntity>? historicList;
  final HelpDeskPrognosticEntity prognostic;
  final HelpDeskDatesEntity dates;

  HelpDeskEntity(
      {required this.dates,
      required this.id,
      required this.prognostic,
      required this.status,
      this.historicList});
}

class HelpDeskStatusEntity {
  final String? description;
  final String? code;
  HelpDeskStatusEntity({this.description, this.code});
}

class HelpDeskHistoricEntity {
  final int? id;
  final String? historicAttendant;
  final DateTime? historicDate;
  final String? historicDescription;
  final String? historicHours;

  HelpDeskHistoricEntity(
      {this.id,
      this.historicAttendant,
      this.historicDate,
      this.historicDescription,
      this.historicHours});
}

class HelpDeskPrognosticEntity {
  final String? description;
  final int? code;
  HelpDeskPrognosticEntity({this.description, this.code});
}

class HelpDeskDatesEntity {
  final DateTime? openingDate;
  final DateTime? serviceDate;
  final DateTime? finishDate;
  HelpDeskDatesEntity({this.openingDate, this.serviceDate, this.finishDate});
}
