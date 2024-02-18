// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
      year: json['year'] as int,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$AcademicYearToJson(AcademicYear instance) =>
    <String, dynamic>{
      'id': instance.id,
      'year': instance.year,
      'start': _dateToJson(instance.start),
      'end': _dateToJson(instance.end),
    };

AcademicYearRequest _$AcademicYearRequestFromJson(Map<String, dynamic> json) =>
    AcademicYearRequest(
      year: json['year'] as int,
      start: DateTime.parse(json['start'] as String),
      end: DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$AcademicYearRequestToJson(
        AcademicYearRequest instance) =>
    <String, dynamic>{
      'year': instance.year,
      'start': _dateToJson(instance.start),
      'end': _dateToJson(instance.end),
    };

Area _$AreaFromJson(Map<String, dynamic> json) => Area(
      id: json['id'] as int,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      name: json['name'] as String,
      postulations: (json['postulations'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$AreaToJson(Area instance) => <String, dynamic>{
      'id': instance.id,
      'tags': instance.tags,
      'name': instance.name,
      'postulations': instance.postulations,
      'users': instance.users,
    };

AreaRequest _$AreaRequestFromJson(Map<String, dynamic> json) => AreaRequest(
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      name: json['name'] as String,
    );

Map<String, dynamic> _$AreaRequestToJson(AreaRequest instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'name': instance.name,
    };

BadRefreshToken _$BadRefreshTokenFromJson(Map<String, dynamic> json) =>
    BadRefreshToken(
      detail: json['detail'] as String,
      code: json['code'] as String,
    );

Map<String, dynamic> _$BadRefreshTokenToJson(BadRefreshToken instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'code': instance.code,
    };

BadRequest _$BadRequestFromJson(Map<String, dynamic> json) => BadRequest();

Map<String, dynamic> _$BadRequestToJson(BadRequest instance) =>
    <String, dynamic>{};

BadRequestResponse _$BadRequestResponseFromJson(Map<String, dynamic> json) =>
    BadRequestResponse(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$BadRequestResponseToJson(BadRequestResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };

BadToken _$BadTokenFromJson(Map<String, dynamic> json) => BadToken(
      message: json['message'] as String,
    );

Map<String, dynamic> _$BadTokenToJson(BadToken instance) => <String, dynamic>{
      'message': instance.message,
    };

BusquedaTutoriaHorarios _$BusquedaTutoriaHorariosFromJson(
        Map<String, dynamic> json) =>
    BusquedaTutoriaHorarios(
      schedules: (json['schedules'] as List<dynamic>?)
              ?.map((e) =>
                  ReadTutorUserSchedule.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      tutorshipInstances: (json['tutorship_instances'] as List<dynamic>?)
              ?.map((e) => SearchTutorship.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BusquedaTutoriaHorariosToJson(
        BusquedaTutoriaHorarios instance) =>
    <String, dynamic>{
      'schedules': instance.schedules.map((e) => e.toJson()).toList(),
      'tutorship_instances':
          instance.tutorshipInstances.map((e) => e.toJson()).toList(),
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

ClosePostulationRequest _$ClosePostulationRequestFromJson(
        Map<String, dynamic> json) =>
    ClosePostulationRequest(
      approve: json['approve'] as bool,
      comment: json['comment'] as String?,
      areas:
          (json['areas'] as List<dynamic>?)?.map((e) => e as Object).toList() ??
              [],
    );

Map<String, dynamic> _$ClosePostulationRequestToJson(
        ClosePostulationRequest instance) =>
    <String, dynamic>{
      'approve': instance.approve,
      'comment': instance.comment,
      'areas': instance.areas,
    };

ConflictResponse _$ConflictResponseFromJson(Map<String, dynamic> json) =>
    ConflictResponse(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ConflictResponseToJson(ConflictResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };

CreateResponse _$CreateResponseFromJson(Map<String, dynamic> json) =>
    CreateResponse(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CreateResponseToJson(CreateResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };

CreateDeleteTutorUserSchedule _$CreateDeleteTutorUserScheduleFromJson(
        Map<String, dynamic> json) =>
    CreateDeleteTutorUserSchedule(
      id: json['id'] as int,
      modality: json['modality'] as String,
      day: json['day'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
      capacity: json['capacity'] as int,
      tutorUser: json['tutor_user'] as int,
    );

Map<String, dynamic> _$CreateDeleteTutorUserScheduleToJson(
        CreateDeleteTutorUserSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
      'tutor_user': instance.tutorUser,
    };

CreateDeleteTutorUserScheduleRequest
    _$CreateDeleteTutorUserScheduleRequestFromJson(Map<String, dynamic> json) =>
        CreateDeleteTutorUserScheduleRequest(
          modality: json['modality'] as String,
          day: json['day'] as String,
          begin: json['begin'] as String,
          end: json['end'] as String,
          capacity: json['capacity'] as int,
          tutorUser: json['tutor_user'] as int,
        );

Map<String, dynamic> _$CreateDeleteTutorUserScheduleRequestToJson(
        CreateDeleteTutorUserScheduleRequest instance) =>
    <String, dynamic>{
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
      'tutor_user': instance.tutorUser,
    };

CustomArea _$CustomAreaFromJson(Map<String, dynamic> json) => CustomArea(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$CustomAreaToJson(CustomArea instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

EmailNotValid _$EmailNotValidFromJson(Map<String, dynamic> json) =>
    EmailNotValid(
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
    );

Map<String, dynamic> _$EmailNotValidToJson(EmailNotValid instance) =>
    <String, dynamic>{
      'email': instance.email,
    };

EnrollRequest _$EnrollRequestFromJson(Map<String, dynamic> json) =>
    EnrollRequest(
      scheduleId: json['schedule_id'] as int,
      date: DateTime.parse(json['date'] as String),
      areaId: json['area_id'] as int,
    );

Map<String, dynamic> _$EnrollRequestToJson(EnrollRequest instance) =>
    <String, dynamic>{
      'schedule_id': instance.scheduleId,
      'date': _dateToJson(instance.date),
      'area_id': instance.areaId,
    };

ErrorResponse _$ErrorResponseFromJson(Map<String, dynamic> json) =>
    ErrorResponse(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ErrorResponseToJson(ErrorResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };

GoogleAccessTokenRequest _$GoogleAccessTokenRequestFromJson(
        Map<String, dynamic> json) =>
    GoogleAccessTokenRequest(
      token: json['token'] as String,
      origin: json['origin'] as String,
    );

Map<String, dynamic> _$GoogleAccessTokenRequestToJson(
        GoogleAccessTokenRequest instance) =>
    <String, dynamic>{
      'token': instance.token,
      'origin': instance.origin,
    };

PageUser _$PageUserFromJson(Map<String, dynamic> json) => PageUser(
      id: json['id'] as int,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      uccKey: json['ucc_key'] as int?,
      careers: (json['careers'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
    );

Map<String, dynamic> _$PageUserToJson(PageUser instance) => <String, dynamic>{
      'id': instance.id,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_picture': instance.profilePicture,
      'ucc_key': instance.uccKey,
      'careers': instance.careers,
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
      year: json['year'] as int?,
      start: json['start'] == null
          ? null
          : DateTime.parse(json['start'] as String),
      end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
    );

Map<String, dynamic> _$PatchedAcademicYearRequestToJson(
        PatchedAcademicYearRequest instance) =>
    <String, dynamic>{
      'year': instance.year,
      'start': _dateToJson(instance.start),
      'end': _dateToJson(instance.end),
    };

PatchedAreaRequest _$PatchedAreaRequestFromJson(Map<String, dynamic> json) =>
    PatchedAreaRequest(
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PatchedAreaRequestToJson(PatchedAreaRequest instance) =>
    <String, dynamic>{
      'tags': instance.tags,
      'name': instance.name,
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

PatchedCreateDeleteTutorUserScheduleRequest
    _$PatchedCreateDeleteTutorUserScheduleRequestFromJson(
            Map<String, dynamic> json) =>
        PatchedCreateDeleteTutorUserScheduleRequest(
          modality: json['modality'] as String?,
          day: json['day'] as String?,
          begin: json['begin'] as String?,
          end: json['end'] as String?,
          capacity: json['capacity'] as int?,
          tutorUser: json['tutor_user'] as int?,
        );

Map<String, dynamic> _$PatchedCreateDeleteTutorUserScheduleRequestToJson(
        PatchedCreateDeleteTutorUserScheduleRequest instance) =>
    <String, dynamic>{
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
      'tutor_user': instance.tutorUser,
    };

PatchedPostulationRequest _$PatchedPostulationRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedPostulationRequest(
      studentUser: json['student_user'] as int?,
      areas:
          (json['areas'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      status: json['status'],
      decisionDate: json['decision_date'] == null
          ? null
          : DateTime.parse(json['decision_date'] as String),
      comment: json['comment'] as String?,
      coordinatorUser: json['coordinator_user'] as int?,
    );

Map<String, dynamic> _$PatchedPostulationRequestToJson(
        PatchedPostulationRequest instance) =>
    <String, dynamic>{
      'student_user': instance.studentUser,
      'areas': instance.areas,
      'created_date': instance.createdDate?.toIso8601String(),
      'status': instance.status,
      'decision_date': instance.decisionDate?.toIso8601String(),
      'comment': instance.comment,
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

PatchedTagRequest _$PatchedTagRequestFromJson(Map<String, dynamic> json) =>
    PatchedTagRequest(
      name: json['name'] as String?,
      area: json['area'] as int?,
    );

Map<String, dynamic> _$PatchedTagRequestToJson(PatchedTagRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'area': instance.area,
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

PatchedTutorshipInstanceRequest _$PatchedTutorshipInstanceRequestFromJson(
        Map<String, dynamic> json) =>
    PatchedTutorshipInstanceRequest(
      area: json['area'] as String?,
      schedule: json['schedule'] as int?,
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      status: tutorshipInstanceStatusEnumFromJson(json['status']),
      zoomLink: json['zoom_link'] as String?,
    );

Map<String, dynamic> _$PatchedTutorshipInstanceRequestToJson(
        PatchedTutorshipInstanceRequest instance) =>
    <String, dynamic>{
      'area': instance.area,
      'schedule': instance.schedule,
      'date': _dateToJson(instance.date),
      'status': tutorshipInstanceStatusEnumToJson(instance.status),
      'zoom_link': instance.zoomLink,
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
      uccKey: json['ucc_key'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      academicYear: json['academic_year'] as int?,
    );

Map<String, dynamic> _$PatchedUserRequestToJson(PatchedUserRequest instance) =>
    <String, dynamic>{
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_picture': instance.profilePicture,
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
      studentUser: json['student_user'] as int,
      areas:
          (json['areas'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      status: json['status'],
      decisionDate: json['decision_date'] == null
          ? null
          : DateTime.parse(json['decision_date'] as String),
      comment: json['comment'] as String?,
      coordinatorUser: json['coordinator_user'] as int?,
    );

Map<String, dynamic> _$PostulationToJson(Postulation instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_user': instance.studentUser,
      'areas': instance.areas,
      'created_date': instance.createdDate?.toIso8601String(),
      'status': instance.status,
      'decision_date': instance.decisionDate?.toIso8601String(),
      'comment': instance.comment,
      'coordinator_user': instance.coordinatorUser,
    };

PostulationDetail _$PostulationDetailFromJson(Map<String, dynamic> json) =>
    PostulationDetail(
      id: json['id'] as int,
      studentUser:
          PageUser.fromJson(json['student_user'] as Map<String, dynamic>),
      areas: (json['areas'] as List<dynamic>?)
              ?.map((e) => CustomArea.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      status: json['status'],
      decisionDate: json['decision_date'] == null
          ? null
          : DateTime.parse(json['decision_date'] as String),
      comment: json['comment'] as String?,
      coordinatorUser: json['coordinator_user'] as int?,
    );

Map<String, dynamic> _$PostulationDetailToJson(PostulationDetail instance) =>
    <String, dynamic>{
      'id': instance.id,
      'student_user': instance.studentUser.toJson(),
      'areas': instance.areas.map((e) => e.toJson()).toList(),
      'created_date': instance.createdDate?.toIso8601String(),
      'status': instance.status,
      'decision_date': instance.decisionDate?.toIso8601String(),
      'comment': instance.comment,
      'coordinator_user': instance.coordinatorUser,
    };

PostulationList _$PostulationListFromJson(Map<String, dynamic> json) =>
    PostulationList(
      id: json['id'] as int,
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      status: json['status'],
      studentUser:
          PageUser.fromJson(json['student_user'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PostulationListToJson(PostulationList instance) =>
    <String, dynamic>{
      'id': instance.id,
      'created_date': instance.createdDate?.toIso8601String(),
      'status': instance.status,
      'student_user': instance.studentUser.toJson(),
    };

PostulationRequest _$PostulationRequestFromJson(Map<String, dynamic> json) =>
    PostulationRequest(
      studentUser: json['student_user'] as int,
      areas:
          (json['areas'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      createdDate: json['created_date'] == null
          ? null
          : DateTime.parse(json['created_date'] as String),
      status: json['status'],
      decisionDate: json['decision_date'] == null
          ? null
          : DateTime.parse(json['decision_date'] as String),
      comment: json['comment'] as String?,
      coordinatorUser: json['coordinator_user'] as int?,
    );

Map<String, dynamic> _$PostulationRequestToJson(PostulationRequest instance) =>
    <String, dynamic>{
      'student_user': instance.studentUser,
      'areas': instance.areas,
      'created_date': instance.createdDate?.toIso8601String(),
      'status': instance.status,
      'decision_date': instance.decisionDate?.toIso8601String(),
      'comment': instance.comment,
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

ReadTutorUserReview _$ReadTutorUserReviewFromJson(Map<String, dynamic> json) =>
    ReadTutorUserReview(
      id: json['id'] as int,
      tutorUser: PageUser.fromJson(json['tutor_user'] as Map<String, dynamic>),
      studentUser:
          PageUser.fromJson(json['student_user'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      occurred: json['occurred'] as bool,
      absent: json['absent'] as bool,
      utility: json['utility'] as int,
      tutorshipInstance: json['tutorship_instance'] as int,
    );

Map<String, dynamic> _$ReadTutorUserReviewToJson(
        ReadTutorUserReview instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutor_user': instance.tutorUser.toJson(),
      'student_user': instance.studentUser.toJson(),
      'comment': instance.comment,
      'occurred': instance.occurred,
      'absent': instance.absent,
      'utility': instance.utility,
      'tutorship_instance': instance.tutorshipInstance,
    };

ReadTutorUserSchedule _$ReadTutorUserScheduleFromJson(
        Map<String, dynamic> json) =>
    ReadTutorUserSchedule(
      id: json['id'] as int,
      tutorUser:
          TutorAreas.fromJson(json['tutor_user'] as Map<String, dynamic>),
      coincidence: json['coincidence'] as String?,
      modality: json['modality'] as String,
      day: json['day'] as String,
      begin: json['begin'] as String,
      end: json['end'] as String,
      capacity: json['capacity'] as int,
    );

Map<String, dynamic> _$ReadTutorUserScheduleToJson(
        ReadTutorUserSchedule instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutor_user': instance.tutorUser.toJson(),
      'coincidence': instance.coincidence,
      'modality': instance.modality,
      'day': instance.day,
      'begin': instance.begin,
      'end': instance.end,
      'capacity': instance.capacity,
    };

ReadTutorshipReport _$ReadTutorshipReportFromJson(Map<String, dynamic> json) =>
    ReadTutorshipReport(
      id: json['id'] as int,
      tutorUser: PageUser.fromJson(json['tutor_user'] as Map<String, dynamic>),
      comment: json['comment'] as String,
      subject: json['subject'] as String,
      tutorshipInstance: json['tutorship_instance'] as int,
    );

Map<String, dynamic> _$ReadTutorshipReportToJson(
        ReadTutorshipReport instance) =>
    <String, dynamic>{
      'id': instance.id,
      'tutor_user': instance.tutorUser.toJson(),
      'comment': instance.comment,
      'subject': instance.subject,
      'tutorship_instance': instance.tutorshipInstance,
    };

RefreshTokenRequest _$RefreshTokenRequestFromJson(Map<String, dynamic> json) =>
    RefreshTokenRequest(
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$RefreshTokenRequestToJson(
        RefreshTokenRequest instance) =>
    <String, dynamic>{
      'refresh': instance.refresh,
    };

ReportAndReview _$ReportAndReviewFromJson(Map<String, dynamic> json) =>
    ReportAndReview(
      reports: (json['reports'] as List<dynamic>?)
              ?.map((e) =>
                  ReadTutorshipReport.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      reviews: (json['reviews'] as List<dynamic>?)
              ?.map((e) =>
                  ReadTutorUserReview.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ReportAndReviewToJson(ReportAndReview instance) =>
    <String, dynamic>{
      'reports': instance.reports.map((e) => e.toJson()).toList(),
      'reviews': instance.reviews.map((e) => e.toJson()).toList(),
    };

ReturnAuthUser _$ReturnAuthUserFromJson(Map<String, dynamic> json) =>
    ReturnAuthUser(
      user: User.fromJson(json['user'] as Map<String, dynamic>),
      accessToken: json['access_token'] as String,
      refreshToken: json['refresh_token'] as String,
    );

Map<String, dynamic> _$ReturnAuthUserToJson(ReturnAuthUser instance) =>
    <String, dynamic>{
      'user': instance.user.toJson(),
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

ReturnRefreshToken _$ReturnRefreshTokenFromJson(Map<String, dynamic> json) =>
    ReturnRefreshToken(
      access: json['access'] as String,
      refresh: json['refresh'] as String,
    );

Map<String, dynamic> _$ReturnRefreshTokenToJson(ReturnRefreshToken instance) =>
    <String, dynamic>{
      'access': instance.access,
      'refresh': instance.refresh,
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

SearchTutorship _$SearchTutorshipFromJson(Map<String, dynamic> json) =>
    SearchTutorship(
      id: json['id'] as int,
      schedule: ReadTutorUserSchedule.fromJson(
          json['schedule'] as Map<String, dynamic>),
      date: DateTime.parse(json['date'] as String),
      area: CustomArea.fromJson(json['area'] as Map<String, dynamic>),
      status: tutorshipInstanceStatusEnumFromJson(json['status']),
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
      zoomLink: json['zoom_link'] as String?,
    );

Map<String, dynamic> _$SearchTutorshipToJson(SearchTutorship instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schedule': instance.schedule.toJson(),
      'date': _dateToJson(instance.date),
      'area': instance.area.toJson(),
      'status': tutorshipInstanceStatusEnumToJson(instance.status),
      'users': instance.users,
      'zoom_link': instance.zoomLink,
    };

SuccessResponse _$SuccessResponseFromJson(Map<String, dynamic> json) =>
    SuccessResponse(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SuccessResponseToJson(SuccessResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };

Tag _$TagFromJson(Map<String, dynamic> json) => Tag(
      id: json['id'] as int,
      name: json['name'] as String,
      area: json['area'] as int,
    );

Map<String, dynamic> _$TagToJson(Tag instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'area': instance.area,
    };

TagRequest _$TagRequestFromJson(Map<String, dynamic> json) => TagRequest(
      name: json['name'] as String,
      area: json['area'] as int,
    );

Map<String, dynamic> _$TagRequestToJson(TagRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
      'area': instance.area,
    };

TutorAreas _$TutorAreasFromJson(Map<String, dynamic> json) => TutorAreas(
      id: json['id'] as int,
      areas: (json['areas'] as List<dynamic>?)
              ?.map((e) => CustomArea.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      email: json['email'] as String,
    );

Map<String, dynamic> _$TutorAreasToJson(TutorAreas instance) =>
    <String, dynamic>{
      'id': instance.id,
      'areas': instance.areas.map((e) => e.toJson()).toList(),
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_picture': instance.profilePicture,
      'email': instance.email,
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

TutorshipInstance _$TutorshipInstanceFromJson(Map<String, dynamic> json) =>
    TutorshipInstance(
      id: json['id'] as int,
      area: json['area'] as String,
      schedule: json['schedule'] as int,
      date: DateTime.parse(json['date'] as String),
      status: tutorshipInstanceStatusEnumFromJson(json['status']),
      zoomLink: json['zoom_link'] as String?,
      users: (json['users'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$TutorshipInstanceToJson(TutorshipInstance instance) =>
    <String, dynamic>{
      'id': instance.id,
      'area': instance.area,
      'schedule': instance.schedule,
      'date': _dateToJson(instance.date),
      'status': tutorshipInstanceStatusEnumToJson(instance.status),
      'zoom_link': instance.zoomLink,
      'users': instance.users,
    };

TutorshipInstanceRequest _$TutorshipInstanceRequestFromJson(
        Map<String, dynamic> json) =>
    TutorshipInstanceRequest(
      area: json['area'] as String,
      schedule: json['schedule'] as int,
      date: DateTime.parse(json['date'] as String),
      status: tutorshipInstanceStatusEnumFromJson(json['status']),
      zoomLink: json['zoom_link'] as String?,
    );

Map<String, dynamic> _$TutorshipInstanceRequestToJson(
        TutorshipInstanceRequest instance) =>
    <String, dynamic>{
      'area': instance.area,
      'schedule': instance.schedule,
      'date': _dateToJson(instance.date),
      'status': tutorshipInstanceStatusEnumToJson(instance.status),
      'zoom_link': instance.zoomLink,
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

UnauthorizedResponse _$UnauthorizedResponseFromJson(
        Map<String, dynamic> json) =>
    UnauthorizedResponse(
      statusCode: json['status_code'] as int?,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UnauthorizedResponseToJson(
        UnauthorizedResponse instance) =>
    <String, dynamic>{
      'status_code': instance.statusCode,
      'message': instance.message,
    };

User _$UserFromJson(Map<String, dynamic> json) => User(
      id: json['id'] as int,
      uccKey: json['ucc_key'] as int?,
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      roles:
          (json['roles'] as List<dynamic>?)?.map((e) => e as String).toList() ??
              [],
      careers: (json['careers'] as List<dynamic>?)
              ?.map((e) => UserCareer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      academicYear: json['academic_year'] as int,
      areas: (json['areas'] as List<dynamic>?)?.map((e) => e as int).toList() ??
          [],
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_picture': instance.profilePicture,
      'roles': instance.roles,
      'careers': instance.careers.map((e) => e.toJson()).toList(),
      'academic_year': instance.academicYear,
      'areas': instance.areas,
    };

UserCareer _$UserCareerFromJson(Map<String, dynamic> json) => UserCareer(
      id: json['id'] as int,
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserCareerToJson(UserCareer instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

UserCareerRequest _$UserCareerRequestFromJson(Map<String, dynamic> json) =>
    UserCareerRequest(
      name: json['name'] as String,
    );

Map<String, dynamic> _$UserCareerRequestToJson(UserCareerRequest instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

UserRequest _$UserRequestFromJson(Map<String, dynamic> json) => UserRequest(
      uccKey: json['ucc_key'] as int?,
      email: json['email'] as String,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      profilePicture: json['profile_picture'] as String?,
      academicYear: json['academic_year'] as int,
    );

Map<String, dynamic> _$UserRequestToJson(UserRequest instance) =>
    <String, dynamic>{
      'ucc_key': instance.uccKey,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'profile_picture': instance.profilePicture,
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
