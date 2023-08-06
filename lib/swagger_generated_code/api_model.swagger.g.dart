// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

$400Serializer _$$400SerializerFromJson(Map<String, dynamic> json) =>
    $400Serializer(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$400SerializerToJson($400Serializer instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

$404Serializer _$$404SerializerFromJson(Map<String, dynamic> json) =>
    $404Serializer(
      message: json['message'] as String,
    );

Map<String, dynamic> _$$404SerializerToJson($404Serializer instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

AcademicUnit _$AcademicUnitFromJson(Map<String, dynamic> json) => AcademicUnit(
      id: json['id'] as int,
      name: json['name'] as String,
      sede: json['sede'] as String,
    );

Map<String, dynamic> _$AcademicUnitToJson(AcademicUnit instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'sede': instance.sede,
    };

AcademicUnitRequest _$AcademicUnitRequestFromJson(Map<String, dynamic> json) =>
    AcademicUnitRequest(
      name: json['name'] as String,
      sede: json['sede'] as String,
    );

Map<String, dynamic> _$AcademicUnitRequestToJson(
        AcademicUnitRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sede': instance.sede,
    };

AcademicYear _$AcademicYearFromJson(Map<String, dynamic> json) => AcademicYear(
      id: json['id'] as int,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$AcademicYearToJson(AcademicYear instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': _dateToJson(instance.start),
      'end': _dateToJson(instance.end),
    };

AcademicYearRequest _$AcademicYearRequestFromJson(Map<String, dynamic> json) =>
    AcademicYearRequest(
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$AcademicYearRequestToJson(
        AcademicYearRequest instance) =>
    <String, dynamic>{
      'start': _dateToJson(instance.start),
      'end': _dateToJson(instance.end),
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int,
      name: json['name'] as String,
      academicYear: json['academic_year'] as int,
      postulations: (json['postulations'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'academic_year': instance.academicYear,
      'postulations': instance.postulations,
      'users': instance.users,
    };

AreaRequest _$AreaRequestFromJson(Map<String, dynamic> json) => AreaRequest(
      name: json['name'] as String,
      academicYear: json['academic_year'] as int,
    );

Map<String, dynamic> _$AreaRequestToJson(AreaRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'academic_year': instance.academicYear,
    };

Career _$CareerFromJson(Map<String, dynamic> json) => Career(
      id: json['id'] as int,
      name: json['name'] as String,
      academicUnit: json['academic_unit'] as int,
      areas: (json['areas'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$CareerToJson(Career instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'academic_unit': instance.academicUnit,
      'areas': instance.areas,
      'users': instance.users,
    };

CareerRequest _$CareerRequestFromJson(Map<String, dynamic> json) =>
    CareerRequest(
      name: json['name'] as String,
      academicUnit: json['academic_unit'] as int,
    );

Map<String, dynamic> _$CareerRequestToJson(CareerRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'academic_unit': instance.academicUnit,
    };

CareerXArea _$CareerXAreaFromJson(Map<String, dynamic> json) => CareerXArea(
      id: json['id'] as int,
      career: json['career'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$CareerXAreaToJson(CareerXArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'career': instance.career,
      'area': instance.area,
    };

CareerXAreaRequest _$CareerXAreaRequestFromJson(Map<String, dynamic> json) =>
    CareerXAreaRequest(
      career: json['career'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$CareerXAreaRequestToJson(CareerXAreaRequest instance) =>
    <String, dynamic>{
      'career': instance.career,
      'area': instance.area,
    };

CareerXUser _$CareerXUserFromJson(Map<String, dynamic> json) => CareerXUser(
      id: json['id'] as int,
      career: json['career'] as int,
      user: json['user'] as int,
    );

Map<String, dynamic> _$CareerXUserToJson(CareerXUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'career': instance.career,
      'user': instance.user,
    };

CareerXUserRequest _$CareerXUserRequestFromJson(Map<String, dynamic> json) =>
    CareerXUserRequest(
      career: json['career'] as int,
      user: json['user'] as int,
    );

Map<String, dynamic> _$CareerXUserRequestToJson(CareerXUserRequest instance) =>
    <String, dynamic>{
      'career': instance.career,
      'user': instance.user,
    };

EmailLookUpRequest _$EmailLookUpRequestFromJson(Map<String, dynamic> json) =>
    EmailLookUpRequest(
      email: json['email'] as String,
    );

Map<String, dynamic> _$EmailLookUpRequestToJson(EmailLookUpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

NewUserRequest _$NewUserRequestFromJson(Map<String, dynamic> json) =>
    NewUserRequest(
      careers:
          (json['careers'] as List<dynamic>?)?.map((e) => e as int).toList() ??
              [],
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      uccKey: json['ucc_key'] as int,
      email: json['email'] as String,
      academicYear: json['academic_year'] as int,
    );

Map<String, dynamic> _$NewUserRequestToJson(NewUserRequest instance) =>
    <String, dynamic>{
      'careers': instance.careers,
      'roles': instance.roles,
      'name': instance.name,
      'last_name': instance.lastName,
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'academic_year': instance.academicYear,
    };

PatchedAcademicUnitRequest _$PatchedAcademicUnitRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedAcademicUnitRequest(
      name: json['name'] as String?,
      sede: json['sede'] as String?,
    );

Map<String, dynamic> _$PatchedAcademicUnitRequestToJson(
        PatchedAcademicUnitRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'sede': instance.sede,
    };

PatchedAcademicYearRequest _$PatchedAcademicYearRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedAcademicYearRequest(
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$PatchedAcademicYearRequestToJson(
        PatchedAcademicYearRequest instance) =>
    <String, dynamic>{
      'start': _dateToJson(instance.start),
      'end': _dateToJson(instance.end),
    };

PatchedAreaRequest _$PatchedAreaRequestFromJson(Map<String, dynamic> json) =>
    PatchedAreaRequest(
      name: json['name'] as String?,
      academicYear: json['academic_year'] as int?,
    );

Map<String, dynamic> _$PatchedAreaRequestToJson(PatchedAreaRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'academic_year': instance.academicYear,
    };

PatchedCareerRequest _$PatchedCareerRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedCareerRequest(
      name: json['name'] as String?,
      academicUnit: json['academic_unit'] as int?,
    );

Map<String, dynamic> _$PatchedCareerRequestToJson(
        PatchedCareerRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'academic_unit': instance.academicUnit,
    };

PatchedCareerXAreaRequest _$PatchedCareerXAreaRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedCareerXAreaRequest(
      career: json['career'] as int?,
      area: json['area'] as int?,
    );

Map<String, dynamic> _$PatchedCareerXAreaRequestToJson(
        PatchedCareerXAreaRequest instance) =>
    <String, dynamic>{
      'career': instance.career,
      'area': instance.area,
    };

PatchedCareerXUserRequest _$PatchedCareerXUserRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedCareerXUserRequest(
      career: json['career'] as int?,
      user: json['user'] as int?,
    );

Map<String, dynamic> _$PatchedCareerXUserRequestToJson(
        PatchedCareerXUserRequest instance) =>
    <String, dynamic>{
      'career': instance.career,
      'user': instance.user,
    };

PatchedPostulationRequest _$PatchedPostulationRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedPostulationRequest(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
      studentUser: json['student_user'] as int?,
      coordinatorUser: json['coordinator_user'] as int?,
    );

Map<String, dynamic> _$PatchedPostulationRequestToJson(
        PatchedPostulationRequest instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'student_user': instance.studentUser,
      'coordinator_user': instance.coordinatorUser,
    };

PatchedPostulationXAreaRequest _$PatchedPostulationXAreaRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedPostulationXAreaRequest(
      postulation: json['postulation'] as int?,
      area: json['area'] as int?,
    );

Map<String, dynamic> _$PatchedPostulationXAreaRequestToJson(
        PatchedPostulationXAreaRequest instance) =>
    <String, dynamic>{
      'postulation': instance.postulation,
      'area': instance.area,
    };

PatchedRoleRequest _$PatchedRoleRequestFromJson(Map<String, dynamic> json) =>
    PatchedRoleRequest(
      title: json['title'] as String?,
      type: json['type'] as String?,
      description: json['description'] as String?,
    );

Map<String, dynamic> _$PatchedRoleRequestToJson(PatchedRoleRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'description': instance.description,
    };

PatchedTutorUserReviewRequest _$PatchedTutorUserReviewRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedTutorUserReviewRequest(
      comment: json['comment'] as String?,
      occurred: json['occurred'] as bool?,
      absent: json['absent'] as bool?,
      utility: json['utility'] as int?,
      tutorUser: json['tutor_user'] as int?,
      studentUser: json['student_user'] as int?,
      tutorshipInstance: json['tutorship_instance'] as int?,
    );

Map<String, dynamic> _$PatchedTutorUserReviewRequestToJson(
        PatchedTutorUserReviewRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'occurred': instance.occurred,
      'absent': instance.absent,
      'utility': instance.utility,
      'tutor_user': instance.tutorUser,
      'student_user': instance.studentUser,
      'tutorship_instance': instance.tutorshipInstance,
    };

PatchedTutorUserScheduleRequest _$PatchedTutorUserScheduleRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedTutorUserScheduleRequest(
      modality: json['modality'] as String?,
      day: json['day'] as String?,
      begin: json['begin'] as String?,
      end: json['end'] as String?,
      capacity: json['capacity'] as int?,
      tutorUser: json['tutor_user'] as int?,
    );

Map<String, dynamic> _$PatchedTutorUserScheduleRequestToJson(
        PatchedTutorUserScheduleRequest instance) =>
    <String, dynamic>{
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
      'tutor_user': instance.tutorUser,
    };

PatchedTutorshipInstanceRequest _$PatchedTutorshipInstanceRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedTutorshipInstanceRequest(
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: json['status'] as String?,
      schedule: json['schedule'] as int?,
      area: json['area'] as int?,
    );

Map<String, dynamic> _$PatchedTutorshipInstanceRequestToJson(
        PatchedTutorshipInstanceRequest instance) =>
    <String, dynamic>{
      'date': instance.date?.toIso8601String(),
      'status': instance.status,
      'schedule': instance.schedule,
      'area': instance.area,
    };

PatchedTutorshipReportRequest _$PatchedTutorshipReportRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedTutorshipReportRequest(
      comment: json['comment'] as String?,
      subject: json['subject'] as String?,
      tutorshipInstance: json['tutorship_instance'] as int?,
      tutorUser: json['tutor_user'] as int?,
    );

Map<String, dynamic> _$PatchedTutorshipReportRequestToJson(
        PatchedTutorshipReportRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'subject': instance.subject,
      'tutorship_instance': instance.tutorshipInstance,
      'tutor_user': instance.tutorUser,
    };

PatchedUserRequest _$PatchedUserRequestFromJson(Map<String, dynamic> json) =>
    PatchedUserRequest(
      name: json['name'] as String?,
      lastName: json['last_name'] as String?,
      uccKey: json['ucc_key'] as int?,
      email: json['email'] as String?,
      academicYear: json['academic_year'] as int?,
    );

Map<String, dynamic> _$PatchedUserRequestToJson(PatchedUserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'academic_year': instance.academicYear,
    };

PatchedUserXAreaRequest _$PatchedUserXAreaRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedUserXAreaRequest(
      user: json['user'] as int?,
      area: json['area'] as int?,
    );

Map<String, dynamic> _$PatchedUserXAreaRequestToJson(
        PatchedUserXAreaRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'area': instance.area,
    };

PatchedUserXRoleRequest _$PatchedUserXRoleRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedUserXRoleRequest(
      user: json['user'] as int?,
      role: json['role'] as int?,
    );

Map<String, dynamic> _$PatchedUserXRoleRequestToJson(
        PatchedUserXRoleRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'role': instance.role,
    };

PatchedUserXTutorshipInstanceXRoleRequest
    _$PatchedUserXTutorshipInstanceXRoleRequestFromJson(
            Map<String, dynamic> json) =>
        PatchedUserXTutorshipInstanceXRoleRequest(
          user: json['user'] as int?,
          tutorshipInstance: json['tutorship_instance'] as int?,
          role: json['role'] as int?,
        );

Map<String, dynamic> _$PatchedUserXTutorshipInstanceXRoleRequestToJson(
        PatchedUserXTutorshipInstanceXRoleRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tutorship_instance': instance.tutorshipInstance,
      'role': instance.role,
    };

Postulation _$PostulationFromJson(Map<String, dynamic> json) => Postulation(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      studentUser: json['student_user'] as int,
      coordinatorUser: json['coordinator_user'] as int,
    );

Map<String, dynamic> _$PostulationToJson(Postulation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'student_user': instance.studentUser,
      'coordinator_user': instance.coordinatorUser,
    };

PostulationRequest _$PostulationRequestFromJson(Map<String, dynamic> json) =>
    PostulationRequest(
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      studentUser: json['student_user'] as int,
      coordinatorUser: json['coordinator_user'] as int,
    );

Map<String, dynamic> _$PostulationRequestToJson(PostulationRequest instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'student_user': instance.studentUser,
      'coordinator_user': instance.coordinatorUser,
    };

PostulationXArea _$PostulationXAreaFromJson(Map<String, dynamic> json) =>
    PostulationXArea(
      id: json['id'] as int,
      postulation: json['postulation'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$PostulationXAreaToJson(PostulationXArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'postulation': instance.postulation,
      'area': instance.area,
    };

PostulationXAreaRequest _$PostulationXAreaRequestFromJson(
        Map<String, dynamic> json) =>
    PostulationXAreaRequest(
      postulation: json['postulation'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$PostulationXAreaRequestToJson(
        PostulationXAreaRequest instance) =>
    <String, dynamic>{
      'postulation': instance.postulation,
      'area': instance.area,
    };

Role _$RoleFromJson(Map<String, dynamic> json) => Role(
      id: json['id'] as int,
      title: json['title'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$RoleToJson(Role instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'type': instance.type,
      'description': instance.description,
      'users': instance.users,
    };

RoleRequest _$RoleRequestFromJson(Map<String, dynamic> json) => RoleRequest(
      title: json['title'] as String,
      type: json['type'] as String,
      description: json['description'] as String,
    );

Map<String, dynamic> _$RoleRequestToJson(RoleRequest instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'description': instance.description,
    };

TutorUserReview _$TutorUserReviewFromJson(Map<String, dynamic> json) =>
    TutorUserReview(
      id: json['id'] as int,
      comment: json['comment'] as String,
      occurred: json['occurred'] as bool,
      absent: json['absent'] as bool,
      utility: json['utility'] as int,
      tutorUser: json['tutor_user'] as int,
      studentUser: json['student_user'] as int,
      tutorshipInstance: json['tutorship_instance'] as int,
    );

Map<String, dynamic> _$TutorUserReviewToJson(TutorUserReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'occurred': instance.occurred,
      'absent': instance.absent,
      'utility': instance.utility,
      'tutor_user': instance.tutorUser,
      'student_user': instance.studentUser,
      'tutorship_instance': instance.tutorshipInstance,
    };

TutorUserReviewRequest _$TutorUserReviewRequestFromJson(
        Map<String, dynamic> json) =>
    TutorUserReviewRequest(
      comment: json['comment'] as String,
      occurred: json['occurred'] as bool,
      absent: json['absent'] as bool,
      utility: json['utility'] as int,
      tutorUser: json['tutor_user'] as int,
      studentUser: json['student_user'] as int,
      tutorshipInstance: json['tutorship_instance'] as int,
    );

Map<String, dynamic> _$TutorUserReviewRequestToJson(
        TutorUserReviewRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'occurred': instance.occurred,
      'absent': instance.absent,
      'utility': instance.utility,
      'tutor_user': instance.tutorUser,
      'student_user': instance.studentUser,
      'tutorship_instance': instance.tutorshipInstance,
    };

TutorUserSchedule _$TutorUserScheduleFromJson(Map<String, dynamic> json) =>
    TutorUserSchedule(
      id: json['id'] as int,
      modality: json['modality'] as String,
      day: json['day'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
      capacity: json['capacity'] as int,
      tutorUser: json['tutor_user'] as int,
    );

Map<String, dynamic> _$TutorUserScheduleToJson(TutorUserSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
      'tutor_user': instance.tutorUser,
    };

TutorUserScheduleRequest _$TutorUserScheduleRequestFromJson(
        Map<String, dynamic> json) =>
    TutorUserScheduleRequest(
      modality: json['modality'] as String,
      day: json['day'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
      capacity: json['capacity'] as int,
      tutorUser: json['tutor_user'] as int,
    );

Map<String, dynamic> _$TutorUserScheduleRequestToJson(
        TutorUserScheduleRequest instance) =>
    <String, dynamic>{
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
      'tutor_user': instance.tutorUser,
    };

TutorshipInstance _$TutorshipInstanceFromJson(Map<String, dynamic> json) =>
    TutorshipInstance(
      id: json['id'] as int,
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      schedule: json['schedule'] as int,
      area: json['area'] as int,
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$TutorshipInstanceToJson(TutorshipInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'schedule': instance.schedule,
      'area': instance.area,
      'users': instance.users,
    };

TutorshipInstanceRequest _$TutorshipInstanceRequestFromJson(
        Map<String, dynamic> json) =>
    TutorshipInstanceRequest(
      date: DateTime.parse(json['date'] as String),
      status: json['status'] as String,
      schedule: json['schedule'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$TutorshipInstanceRequestToJson(
        TutorshipInstanceRequest instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'status': instance.status,
      'schedule': instance.schedule,
      'area': instance.area,
    };

TutorshipReport _$TutorshipReportFromJson(Map<String, dynamic> json) =>
    TutorshipReport(
      id: json['id'] as int,
      comment: json['comment'] as String,
      subject: json['subject'] as String,
      tutorshipInstance: json['tutorship_instance'] as int,
      tutorUser: json['tutor_user'] as int,
    );

Map<String, dynamic> _$TutorshipReportToJson(TutorshipReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'comment': instance.comment,
      'subject': instance.subject,
      'tutorship_instance': instance.tutorshipInstance,
      'tutor_user': instance.tutorUser,
    };

TutorshipReportRequest _$TutorshipReportRequestFromJson(
        Map<String, dynamic> json) =>
    TutorshipReportRequest(
      comment: json['comment'] as String,
      subject: json['subject'] as String,
      tutorshipInstance: json['tutorship_instance'] as int,
      tutorUser: json['tutor_user'] as int,
    );

Map<String, dynamic> _$TutorshipReportRequestToJson(
        TutorshipReportRequest instance) =>
    <String, dynamic>{
      'comment': instance.comment,
      'subject': instance.subject,
      'tutorship_instance': instance.tutorshipInstance,
      'tutor_user': instance.tutorUser,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      careers: (json['careers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      uccKey: json['ucc_key'] as int,
      email: json['email'] as String,
      academicYear: json['academic_year'] as int,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'careers': instance.careers,
      'roles': instance.roles,
      'name': instance.name,
      'last_name': instance.lastName,
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'academic_year': instance.academicYear,
    };

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      name: json['name'] as String,
      lastName: json['last_name'] as String,
      uccKey: json['ucc_key'] as int,
      email: json['email'] as String,
      academicYear: json['academic_year'] as int,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'last_name': instance.lastName,
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'academic_year': instance.academicYear,
    };

UserXArea _$UserXAreaFromJson(Map<String, dynamic> json) => UserXArea(
      id: json['id'] as int,
      user: json['user'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$UserXAreaToJson(UserXArea instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'area': instance.area,
    };

UserXAreaRequest _$UserXAreaRequestFromJson(Map<String, dynamic> json) =>
    UserXAreaRequest(
      user: json['user'] as int,
      area: json['area'] as int,
    );

Map<String, dynamic> _$UserXAreaRequestToJson(UserXAreaRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'area': instance.area,
    };

UserXRole _$UserXRoleFromJson(Map<String, dynamic> json) => UserXRole(
      id: json['id'] as int,
      user: json['user'] as int,
      role: json['role'] as int,
    );

Map<String, dynamic> _$UserXRoleToJson(UserXRole instance) => <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'role': instance.role,
    };

UserXRoleRequest _$UserXRoleRequestFromJson(Map<String, dynamic> json) =>
    UserXRoleRequest(
      user: json['user'] as int,
      role: json['role'] as int,
    );

Map<String, dynamic> _$UserXRoleRequestToJson(UserXRoleRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'role': instance.role,
    };

UserXTutorshipInstanceXRole _$UserXTutorshipInstanceXRoleFromJson(
        Map<String, dynamic> json) =>
    UserXTutorshipInstanceXRole(
      id: json['id'] as int,
      user: json['user'] as int,
      tutorshipInstance: json['tutorship_instance'] as int,
      role: json['role'] as int,
    );

Map<String, dynamic> _$UserXTutorshipInstanceXRoleToJson(
        UserXTutorshipInstanceXRole instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user': instance.user,
      'tutorship_instance': instance.tutorshipInstance,
      'role': instance.role,
    };

UserXTutorshipInstanceXRoleRequest _$UserXTutorshipInstanceXRoleRequestFromJson(
        Map<String, dynamic> json) =>
    UserXTutorshipInstanceXRoleRequest(
      user: json['user'] as int,
      tutorshipInstance: json['tutorship_instance'] as int,
      role: json['role'] as int,
    );

Map<String, dynamic> _$UserXTutorshipInstanceXRoleRequestToJson(
        UserXTutorshipInstanceXRoleRequest instance) =>
    <String, dynamic>{
      'user': instance.user,
      'tutorship_instance': instance.tutorshipInstance,
      'role': instance.role,
    };