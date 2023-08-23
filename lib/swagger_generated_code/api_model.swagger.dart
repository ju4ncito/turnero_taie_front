// ignore_for_file: type=lint

import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';
import 'dart:convert';

import 'package:chopper/chopper.dart';

import 'client_mapping.dart';
import 'dart:async';
import 'package:chopper/chopper.dart' as chopper;
import 'api_model.enums.swagger.dart' as enums;
export 'api_model.enums.swagger.dart';

part 'api_model.swagger.chopper.dart';
part 'api_model.swagger.g.dart';

// **************************************************************************
// SwaggerChopperGenerator
// **************************************************************************

@ChopperApi()
abstract class ApiModel extends ChopperService {
  static ApiModel create({
    ChopperClient? client,
    Authenticator? authenticator,
    Converter? converter,
    Uri? baseUrl,
    Iterable<dynamic>? interceptors,
  }) {
    if (client != null) {
      return _$ApiModel(client);
    }

    final newClient = ChopperClient(
        services: [_$ApiModel()],
        converter: converter ?? $JsonSerializableConverter(),
        interceptors: interceptors ?? [],
        authenticator: authenticator,
        baseUrl: baseUrl ?? Uri.parse('http://'));
    return _$ApiModel(newClient);
  }

  ///
  Future<chopper.Response<List<AcademicUnit>>> apiAcademicUnitsGet() {
    generatedMapping.putIfAbsent(
        AcademicUnit, () => AcademicUnit.fromJsonFactory);

    return _apiAcademicUnitsGet();
  }

  ///
  @Get(path: '/api/academic-units/')
  Future<chopper.Response<List<AcademicUnit>>> _apiAcademicUnitsGet();

  ///
  Future<chopper.Response<AcademicUnit>> apiAcademicUnitsPost(
      {required AcademicUnitRequest? body}) {
    generatedMapping.putIfAbsent(
        AcademicUnit, () => AcademicUnit.fromJsonFactory);

    return _apiAcademicUnitsPost(body: body);
  }

  ///
  @Post(
    path: '/api/academic-units/',
    optionalBody: true,
  )
  Future<chopper.Response<AcademicUnit>> _apiAcademicUnitsPost(
      {@Body() required AcademicUnitRequest? body});

  ///
  ///@param id A unique integer value identifying this academic unit.
  Future<chopper.Response<AcademicUnit>> apiAcademicUnitsIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        AcademicUnit, () => AcademicUnit.fromJsonFactory);

    return _apiAcademicUnitsIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this academic unit.
  @Get(path: '/api/academic-units/{id}/')
  Future<chopper.Response<AcademicUnit>> _apiAcademicUnitsIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this academic unit.
  Future<chopper.Response<AcademicUnit>> apiAcademicUnitsIdPut({
    required int? id,
    required AcademicUnitRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        AcademicUnit, () => AcademicUnit.fromJsonFactory);

    return _apiAcademicUnitsIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this academic unit.
  @Put(
    path: '/api/academic-units/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<AcademicUnit>> _apiAcademicUnitsIdPut({
    @Path('id') required int? id,
    @Body() required AcademicUnitRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this academic unit.
  Future<chopper.Response<AcademicUnit>> apiAcademicUnitsIdPatch({
    required int? id,
    required PatchedAcademicUnitRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        AcademicUnit, () => AcademicUnit.fromJsonFactory);

    return _apiAcademicUnitsIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this academic unit.
  @Patch(
    path: '/api/academic-units/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<AcademicUnit>> _apiAcademicUnitsIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedAcademicUnitRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this academic unit.
  Future<chopper.Response> apiAcademicUnitsIdDelete({required int? id}) {
    return _apiAcademicUnitsIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this academic unit.
  @Delete(path: '/api/academic-units/{id}/')
  Future<chopper.Response> _apiAcademicUnitsIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<AcademicYear>>> apiAcademicYearsGet() {
    generatedMapping.putIfAbsent(
        AcademicYear, () => AcademicYear.fromJsonFactory);

    return _apiAcademicYearsGet();
  }

  ///
  @Get(path: '/api/academic-years/')
  Future<chopper.Response<List<AcademicYear>>> _apiAcademicYearsGet();

  ///
  Future<chopper.Response<AcademicYear>> apiAcademicYearsPost(
      {required AcademicYearRequest? body}) {
    generatedMapping.putIfAbsent(
        AcademicYear, () => AcademicYear.fromJsonFactory);

    return _apiAcademicYearsPost(body: body);
  }

  ///
  @Post(
    path: '/api/academic-years/',
    optionalBody: true,
  )
  Future<chopper.Response<AcademicYear>> _apiAcademicYearsPost(
      {@Body() required AcademicYearRequest? body});

  ///
  ///@param year
  Future<chopper.Response<AcademicYear>> apiAcademicYearsYearGet(
      {required int? year}) {
    generatedMapping.putIfAbsent(
        AcademicYear, () => AcademicYear.fromJsonFactory);

    return _apiAcademicYearsYearGet(year: year);
  }

  ///
  ///@param year
  @Get(path: '/api/academic-years/{year}/')
  Future<chopper.Response<AcademicYear>> _apiAcademicYearsYearGet(
      {@Path('year') required int? year});

  ///
  ///@param year
  Future<chopper.Response<AcademicYear>> apiAcademicYearsYearPut({
    required int? year,
    required AcademicYearRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        AcademicYear, () => AcademicYear.fromJsonFactory);

    return _apiAcademicYearsYearPut(year: year, body: body);
  }

  ///
  ///@param year
  @Put(
    path: '/api/academic-years/{year}/',
    optionalBody: true,
  )
  Future<chopper.Response<AcademicYear>> _apiAcademicYearsYearPut({
    @Path('year') required int? year,
    @Body() required AcademicYearRequest? body,
  });

  ///
  ///@param year
  Future<chopper.Response<AcademicYear>> apiAcademicYearsYearPatch({
    required int? year,
    required PatchedAcademicYearRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        AcademicYear, () => AcademicYear.fromJsonFactory);

    return _apiAcademicYearsYearPatch(year: year, body: body);
  }

  ///
  ///@param year
  @Patch(
    path: '/api/academic-years/{year}/',
    optionalBody: true,
  )
  Future<chopper.Response<AcademicYear>> _apiAcademicYearsYearPatch({
    @Path('year') required int? year,
    @Body() required PatchedAcademicYearRequest? body,
  });

  ///
  ///@param year
  Future<chopper.Response> apiAcademicYearsYearDelete({required int? year}) {
    return _apiAcademicYearsYearDelete(year: year);
  }

  ///
  ///@param year
  @Delete(path: '/api/academic-years/{year}/')
  Future<chopper.Response> _apiAcademicYearsYearDelete(
      {@Path('year') required int? year});

  ///
  Future<chopper.Response<List<Area>>> apiAreasGet() {
    generatedMapping.putIfAbsent(Area, () => Area.fromJsonFactory);

    return _apiAreasGet();
  }

  ///
  @Get(path: '/api/areas/')
  Future<chopper.Response<List<Area>>> _apiAreasGet();

  ///
  Future<chopper.Response<Area>> apiAreasPost({required AreaRequest? body}) {
    generatedMapping.putIfAbsent(Area, () => Area.fromJsonFactory);

    return _apiAreasPost(body: body);
  }

  ///
  @Post(
    path: '/api/areas/',
    optionalBody: true,
  )
  Future<chopper.Response<Area>> _apiAreasPost(
      {@Body() required AreaRequest? body});

  ///
  ///@param id A unique integer value identifying this area.
  Future<chopper.Response<Area>> apiAreasIdGet({required int? id}) {
    generatedMapping.putIfAbsent(Area, () => Area.fromJsonFactory);

    return _apiAreasIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this area.
  @Get(path: '/api/areas/{id}/')
  Future<chopper.Response<Area>> _apiAreasIdGet({@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this area.
  Future<chopper.Response<Area>> apiAreasIdPut({
    required int? id,
    required AreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(Area, () => Area.fromJsonFactory);

    return _apiAreasIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this area.
  @Put(
    path: '/api/areas/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<Area>> _apiAreasIdPut({
    @Path('id') required int? id,
    @Body() required AreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this area.
  Future<chopper.Response<Area>> apiAreasIdPatch({
    required int? id,
    required PatchedAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(Area, () => Area.fromJsonFactory);

    return _apiAreasIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this area.
  @Patch(
    path: '/api/areas/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<Area>> _apiAreasIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this area.
  Future<chopper.Response> apiAreasIdDelete({required int? id}) {
    return _apiAreasIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this area.
  @Delete(path: '/api/areas/{id}/')
  Future<chopper.Response> _apiAreasIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<CareerXArea>>> apiCareerXAreaGet() {
    generatedMapping.putIfAbsent(
        CareerXArea, () => CareerXArea.fromJsonFactory);

    return _apiCareerXAreaGet();
  }

  ///
  @Get(path: '/api/career-x-area/')
  Future<chopper.Response<List<CareerXArea>>> _apiCareerXAreaGet();

  ///
  Future<chopper.Response<CareerXArea>> apiCareerXAreaPost(
      {required CareerXAreaRequest? body}) {
    generatedMapping.putIfAbsent(
        CareerXArea, () => CareerXArea.fromJsonFactory);

    return _apiCareerXAreaPost(body: body);
  }

  ///
  @Post(
    path: '/api/career-x-area/',
    optionalBody: true,
  )
  Future<chopper.Response<CareerXArea>> _apiCareerXAreaPost(
      {@Body() required CareerXAreaRequest? body});

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  Future<chopper.Response<CareerXArea>> apiCareerXAreaIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        CareerXArea, () => CareerXArea.fromJsonFactory);

    return _apiCareerXAreaIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  @Get(path: '/api/career-x-area/{id}/')
  Future<chopper.Response<CareerXArea>> _apiCareerXAreaIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  Future<chopper.Response<CareerXArea>> apiCareerXAreaIdPut({
    required int? id,
    required CareerXAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        CareerXArea, () => CareerXArea.fromJsonFactory);

    return _apiCareerXAreaIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  @Put(
    path: '/api/career-x-area/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<CareerXArea>> _apiCareerXAreaIdPut({
    @Path('id') required int? id,
    @Body() required CareerXAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  Future<chopper.Response<CareerXArea>> apiCareerXAreaIdPatch({
    required int? id,
    required PatchedCareerXAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        CareerXArea, () => CareerXArea.fromJsonFactory);

    return _apiCareerXAreaIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  @Patch(
    path: '/api/career-x-area/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<CareerXArea>> _apiCareerXAreaIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedCareerXAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  Future<chopper.Response> apiCareerXAreaIdDelete({required int? id}) {
    return _apiCareerXAreaIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ area.
  @Delete(path: '/api/career-x-area/{id}/')
  Future<chopper.Response> _apiCareerXAreaIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<CareerXUser>>> apiCareerXUserGet() {
    generatedMapping.putIfAbsent(
        CareerXUser, () => CareerXUser.fromJsonFactory);

    return _apiCareerXUserGet();
  }

  ///
  @Get(path: '/api/career-x-user/')
  Future<chopper.Response<List<CareerXUser>>> _apiCareerXUserGet();

  ///
  Future<chopper.Response<CareerXUser>> apiCareerXUserPost(
      {required CareerXUserRequest? body}) {
    generatedMapping.putIfAbsent(
        CareerXUser, () => CareerXUser.fromJsonFactory);

    return _apiCareerXUserPost(body: body);
  }

  ///
  @Post(
    path: '/api/career-x-user/',
    optionalBody: true,
  )
  Future<chopper.Response<CareerXUser>> _apiCareerXUserPost(
      {@Body() required CareerXUserRequest? body});

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  Future<chopper.Response<CareerXUser>> apiCareerXUserIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        CareerXUser, () => CareerXUser.fromJsonFactory);

    return _apiCareerXUserIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  @Get(path: '/api/career-x-user/{id}/')
  Future<chopper.Response<CareerXUser>> _apiCareerXUserIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  Future<chopper.Response<CareerXUser>> apiCareerXUserIdPut({
    required int? id,
    required CareerXUserRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        CareerXUser, () => CareerXUser.fromJsonFactory);

    return _apiCareerXUserIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  @Put(
    path: '/api/career-x-user/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<CareerXUser>> _apiCareerXUserIdPut({
    @Path('id') required int? id,
    @Body() required CareerXUserRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  Future<chopper.Response<CareerXUser>> apiCareerXUserIdPatch({
    required int? id,
    required PatchedCareerXUserRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        CareerXUser, () => CareerXUser.fromJsonFactory);

    return _apiCareerXUserIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  @Patch(
    path: '/api/career-x-user/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<CareerXUser>> _apiCareerXUserIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedCareerXUserRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  Future<chopper.Response> apiCareerXUserIdDelete({required int? id}) {
    return _apiCareerXUserIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this career_ x_ user.
  @Delete(path: '/api/career-x-user/{id}/')
  Future<chopper.Response> _apiCareerXUserIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<Career>>> apiCareersGet() {
    generatedMapping.putIfAbsent(Career, () => Career.fromJsonFactory);

    return _apiCareersGet();
  }

  ///
  @Get(path: '/api/careers/')
  Future<chopper.Response<List<Career>>> _apiCareersGet();

  ///
  Future<chopper.Response<Career>> apiCareersPost(
      {required CareerRequest? body}) {
    generatedMapping.putIfAbsent(Career, () => Career.fromJsonFactory);

    return _apiCareersPost(body: body);
  }

  ///
  @Post(
    path: '/api/careers/',
    optionalBody: true,
  )
  Future<chopper.Response<Career>> _apiCareersPost(
      {@Body() required CareerRequest? body});

  ///
  ///@param id A unique integer value identifying this career.
  Future<chopper.Response<Career>> apiCareersIdGet({required int? id}) {
    generatedMapping.putIfAbsent(Career, () => Career.fromJsonFactory);

    return _apiCareersIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this career.
  @Get(path: '/api/careers/{id}/')
  Future<chopper.Response<Career>> _apiCareersIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this career.
  Future<chopper.Response<Career>> apiCareersIdPut({
    required int? id,
    required CareerRequest? body,
  }) {
    generatedMapping.putIfAbsent(Career, () => Career.fromJsonFactory);

    return _apiCareersIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this career.
  @Put(
    path: '/api/careers/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<Career>> _apiCareersIdPut({
    @Path('id') required int? id,
    @Body() required CareerRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this career.
  Future<chopper.Response<Career>> apiCareersIdPatch({
    required int? id,
    required PatchedCareerRequest? body,
  }) {
    generatedMapping.putIfAbsent(Career, () => Career.fromJsonFactory);

    return _apiCareersIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this career.
  @Patch(
    path: '/api/careers/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<Career>> _apiCareersIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedCareerRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this career.
  Future<chopper.Response> apiCareersIdDelete({required int? id}) {
    return _apiCareersIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this career.
  @Delete(path: '/api/careers/{id}/')
  Future<chopper.Response> _apiCareersIdDelete({@Path('id') required int? id});

  ///
  Future<chopper.Response<List<PostulationXArea>>> apiPostulationXAreaGet() {
    generatedMapping.putIfAbsent(
        PostulationXArea, () => PostulationXArea.fromJsonFactory);

    return _apiPostulationXAreaGet();
  }

  ///
  @Get(path: '/api/postulation-x-area/')
  Future<chopper.Response<List<PostulationXArea>>> _apiPostulationXAreaGet();

  ///
  Future<chopper.Response<PostulationXArea>> apiPostulationXAreaPost(
      {required PostulationXAreaRequest? body}) {
    generatedMapping.putIfAbsent(
        PostulationXArea, () => PostulationXArea.fromJsonFactory);

    return _apiPostulationXAreaPost(body: body);
  }

  ///
  @Post(
    path: '/api/postulation-x-area/',
    optionalBody: true,
  )
  Future<chopper.Response<PostulationXArea>> _apiPostulationXAreaPost(
      {@Body() required PostulationXAreaRequest? body});

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  Future<chopper.Response<PostulationXArea>> apiPostulationXAreaIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        PostulationXArea, () => PostulationXArea.fromJsonFactory);

    return _apiPostulationXAreaIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  @Get(path: '/api/postulation-x-area/{id}/')
  Future<chopper.Response<PostulationXArea>> _apiPostulationXAreaIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  Future<chopper.Response<PostulationXArea>> apiPostulationXAreaIdPut({
    required int? id,
    required PostulationXAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        PostulationXArea, () => PostulationXArea.fromJsonFactory);

    return _apiPostulationXAreaIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  @Put(
    path: '/api/postulation-x-area/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<PostulationXArea>> _apiPostulationXAreaIdPut({
    @Path('id') required int? id,
    @Body() required PostulationXAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  Future<chopper.Response<PostulationXArea>> apiPostulationXAreaIdPatch({
    required int? id,
    required PatchedPostulationXAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        PostulationXArea, () => PostulationXArea.fromJsonFactory);

    return _apiPostulationXAreaIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  @Patch(
    path: '/api/postulation-x-area/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<PostulationXArea>> _apiPostulationXAreaIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedPostulationXAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  Future<chopper.Response> apiPostulationXAreaIdDelete({required int? id}) {
    return _apiPostulationXAreaIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this postulation_ x_ area.
  @Delete(path: '/api/postulation-x-area/{id}/')
  Future<chopper.Response> _apiPostulationXAreaIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<Postulation>>> apiPostulationsGet() {
    generatedMapping.putIfAbsent(
        Postulation, () => Postulation.fromJsonFactory);

    return _apiPostulationsGet();
  }

  ///
  @Get(path: '/api/postulations/')
  Future<chopper.Response<List<Postulation>>> _apiPostulationsGet();

  ///
  Future<chopper.Response<Postulation>> apiPostulationsPost(
      {required PostulationRequest? body}) {
    generatedMapping.putIfAbsent(
        Postulation, () => Postulation.fromJsonFactory);

    return _apiPostulationsPost(body: body);
  }

  ///
  @Post(
    path: '/api/postulations/',
    optionalBody: true,
  )
  Future<chopper.Response<Postulation>> _apiPostulationsPost(
      {@Body() required PostulationRequest? body});

  ///
  ///@param id A unique integer value identifying this postulation.
  Future<chopper.Response<Postulation>> apiPostulationsIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        Postulation, () => Postulation.fromJsonFactory);

    return _apiPostulationsIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this postulation.
  @Get(path: '/api/postulations/{id}/')
  Future<chopper.Response<Postulation>> _apiPostulationsIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this postulation.
  Future<chopper.Response<Postulation>> apiPostulationsIdPut({
    required int? id,
    required PostulationRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        Postulation, () => Postulation.fromJsonFactory);

    return _apiPostulationsIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this postulation.
  @Put(
    path: '/api/postulations/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<Postulation>> _apiPostulationsIdPut({
    @Path('id') required int? id,
    @Body() required PostulationRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this postulation.
  Future<chopper.Response<Postulation>> apiPostulationsIdPatch({
    required int? id,
    required PatchedPostulationRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        Postulation, () => Postulation.fromJsonFactory);

    return _apiPostulationsIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this postulation.
  @Patch(
    path: '/api/postulations/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<Postulation>> _apiPostulationsIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedPostulationRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this postulation.
  Future<chopper.Response> apiPostulationsIdDelete({required int? id}) {
    return _apiPostulationsIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this postulation.
  @Delete(path: '/api/postulations/{id}/')
  Future<chopper.Response> _apiPostulationsIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<Role>>> apiRolesGet() {
    generatedMapping.putIfAbsent(Role, () => Role.fromJsonFactory);

    return _apiRolesGet();
  }

  ///
  @Get(path: '/api/roles/')
  Future<chopper.Response<List<Role>>> _apiRolesGet();

  ///
  Future<chopper.Response<Role>> apiRolesPost({required RoleRequest? body}) {
    generatedMapping.putIfAbsent(Role, () => Role.fromJsonFactory);

    return _apiRolesPost(body: body);
  }

  ///
  @Post(
    path: '/api/roles/',
    optionalBody: true,
  )
  Future<chopper.Response<Role>> _apiRolesPost(
      {@Body() required RoleRequest? body});

  ///
  ///@param type
  Future<chopper.Response<Role>> apiRolesTypeGet({required String? type}) {
    generatedMapping.putIfAbsent(Role, () => Role.fromJsonFactory);

    return _apiRolesTypeGet(type: type);
  }

  ///
  ///@param type
  @Get(path: '/api/roles/{type}/')
  Future<chopper.Response<Role>> _apiRolesTypeGet(
      {@Path('type') required String? type});

  ///
  ///@param type
  Future<chopper.Response<Role>> apiRolesTypePut({
    required String? type,
    required RoleRequest? body,
  }) {
    generatedMapping.putIfAbsent(Role, () => Role.fromJsonFactory);

    return _apiRolesTypePut(type: type, body: body);
  }

  ///
  ///@param type
  @Put(
    path: '/api/roles/{type}/',
    optionalBody: true,
  )
  Future<chopper.Response<Role>> _apiRolesTypePut({
    @Path('type') required String? type,
    @Body() required RoleRequest? body,
  });

  ///
  ///@param type
  Future<chopper.Response<Role>> apiRolesTypePatch({
    required String? type,
    required PatchedRoleRequest? body,
  }) {
    generatedMapping.putIfAbsent(Role, () => Role.fromJsonFactory);

    return _apiRolesTypePatch(type: type, body: body);
  }

  ///
  ///@param type
  @Patch(
    path: '/api/roles/{type}/',
    optionalBody: true,
  )
  Future<chopper.Response<Role>> _apiRolesTypePatch({
    @Path('type') required String? type,
    @Body() required PatchedRoleRequest? body,
  });

  ///
  ///@param type
  Future<chopper.Response> apiRolesTypeDelete({required String? type}) {
    return _apiRolesTypeDelete(type: type);
  }

  ///
  ///@param type
  @Delete(path: '/api/roles/{type}/')
  Future<chopper.Response> _apiRolesTypeDelete(
      {@Path('type') required String? type});

  ///
  ///@param lang
  Future<chopper.Response<Object>> apiSchemaJsonGet(
      {enums.ApiSchemaJsonGetLang? lang}) {
    return _apiSchemaJsonGet(lang: lang?.value?.toString());
  }

  ///
  ///@param lang
  @Get(path: '/api/schema/json')
  Future<chopper.Response<Object>> _apiSchemaJsonGet(
      {@Query('lang') String? lang});

  ///
  ///@param lang
  Future<chopper.Response<Object>> apiSchemaYamlGet(
      {enums.ApiSchemaYamlGetLang? lang}) {
    return _apiSchemaYamlGet(lang: lang?.value?.toString());
  }

  ///
  ///@param lang
  @Get(path: '/api/schema/yaml')
  Future<chopper.Response<Object>> _apiSchemaYamlGet(
      {@Query('lang') String? lang});

  ///
  Future<chopper.Response<List<TutorUserReview>>> apiTutorUserReviewGet() {
    generatedMapping.putIfAbsent(
        TutorUserReview, () => TutorUserReview.fromJsonFactory);

    return _apiTutorUserReviewGet();
  }

  ///
  @Get(path: '/api/tutor-user-review/')
  Future<chopper.Response<List<TutorUserReview>>> _apiTutorUserReviewGet();

  ///
  Future<chopper.Response<TutorUserReview>> apiTutorUserReviewPost(
      {required TutorUserReviewRequest? body}) {
    generatedMapping.putIfAbsent(
        TutorUserReview, () => TutorUserReview.fromJsonFactory);

    return _apiTutorUserReviewPost(body: body);
  }

  ///
  @Post(
    path: '/api/tutor-user-review/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorUserReview>> _apiTutorUserReviewPost(
      {@Body() required TutorUserReviewRequest? body});

  ///
  ///@param id A unique integer value identifying this tutor user review.
  Future<chopper.Response<TutorUserReview>> apiTutorUserReviewIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        TutorUserReview, () => TutorUserReview.fromJsonFactory);

    return _apiTutorUserReviewIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutor user review.
  @Get(path: '/api/tutor-user-review/{id}/')
  Future<chopper.Response<TutorUserReview>> _apiTutorUserReviewIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this tutor user review.
  Future<chopper.Response<TutorUserReview>> apiTutorUserReviewIdPut({
    required int? id,
    required TutorUserReviewRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorUserReview, () => TutorUserReview.fromJsonFactory);

    return _apiTutorUserReviewIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutor user review.
  @Put(
    path: '/api/tutor-user-review/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorUserReview>> _apiTutorUserReviewIdPut({
    @Path('id') required int? id,
    @Body() required TutorUserReviewRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutor user review.
  Future<chopper.Response<TutorUserReview>> apiTutorUserReviewIdPatch({
    required int? id,
    required PatchedTutorUserReviewRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorUserReview, () => TutorUserReview.fromJsonFactory);

    return _apiTutorUserReviewIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutor user review.
  @Patch(
    path: '/api/tutor-user-review/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorUserReview>> _apiTutorUserReviewIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedTutorUserReviewRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutor user review.
  Future<chopper.Response> apiTutorUserReviewIdDelete({required int? id}) {
    return _apiTutorUserReviewIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutor user review.
  @Delete(path: '/api/tutor-user-review/{id}/')
  Future<chopper.Response> _apiTutorUserReviewIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<TutorUserSchedule>>> apiTutorUserSchedulesGet() {
    generatedMapping.putIfAbsent(
        TutorUserSchedule, () => TutorUserSchedule.fromJsonFactory);

    return _apiTutorUserSchedulesGet();
  }

  ///
  @Get(path: '/api/tutor-user-schedules/')
  Future<chopper.Response<List<TutorUserSchedule>>> _apiTutorUserSchedulesGet();

  ///
  Future<chopper.Response<TutorUserSchedule>> apiTutorUserSchedulesPost(
      {required TutorUserScheduleRequest? body}) {
    generatedMapping.putIfAbsent(
        TutorUserSchedule, () => TutorUserSchedule.fromJsonFactory);

    return _apiTutorUserSchedulesPost(body: body);
  }

  ///
  @Post(
    path: '/api/tutor-user-schedules/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorUserSchedule>> _apiTutorUserSchedulesPost(
      {@Body() required TutorUserScheduleRequest? body});

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  Future<chopper.Response<TutorUserSchedule>> apiTutorUserSchedulesIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        TutorUserSchedule, () => TutorUserSchedule.fromJsonFactory);

    return _apiTutorUserSchedulesIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  @Get(path: '/api/tutor-user-schedules/{id}/')
  Future<chopper.Response<TutorUserSchedule>> _apiTutorUserSchedulesIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  Future<chopper.Response<TutorUserSchedule>> apiTutorUserSchedulesIdPut({
    required int? id,
    required TutorUserScheduleRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorUserSchedule, () => TutorUserSchedule.fromJsonFactory);

    return _apiTutorUserSchedulesIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  @Put(
    path: '/api/tutor-user-schedules/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorUserSchedule>> _apiTutorUserSchedulesIdPut({
    @Path('id') required int? id,
    @Body() required TutorUserScheduleRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  Future<chopper.Response<TutorUserSchedule>> apiTutorUserSchedulesIdPatch({
    required int? id,
    required PatchedTutorUserScheduleRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorUserSchedule, () => TutorUserSchedule.fromJsonFactory);

    return _apiTutorUserSchedulesIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  @Patch(
    path: '/api/tutor-user-schedules/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorUserSchedule>> _apiTutorUserSchedulesIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedTutorUserScheduleRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  Future<chopper.Response> apiTutorUserSchedulesIdDelete({required int? id}) {
    return _apiTutorUserSchedulesIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutor user schedule.
  @Delete(path: '/api/tutor-user-schedules/{id}/')
  Future<chopper.Response> _apiTutorUserSchedulesIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<TutorshipInstance>>> apiTutorshipInstancesGet() {
    generatedMapping.putIfAbsent(
        TutorshipInstance, () => TutorshipInstance.fromJsonFactory);

    return _apiTutorshipInstancesGet();
  }

  ///
  @Get(path: '/api/tutorship-instances/')
  Future<chopper.Response<List<TutorshipInstance>>> _apiTutorshipInstancesGet();

  ///
  Future<chopper.Response<TutorshipInstance>> apiTutorshipInstancesPost(
      {required TutorshipInstanceRequest? body}) {
    generatedMapping.putIfAbsent(
        TutorshipInstance, () => TutorshipInstance.fromJsonFactory);

    return _apiTutorshipInstancesPost(body: body);
  }

  ///
  @Post(
    path: '/api/tutorship-instances/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorshipInstance>> _apiTutorshipInstancesPost(
      {@Body() required TutorshipInstanceRequest? body});

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  Future<chopper.Response<TutorshipInstance>> apiTutorshipInstancesIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        TutorshipInstance, () => TutorshipInstance.fromJsonFactory);

    return _apiTutorshipInstancesIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  @Get(path: '/api/tutorship-instances/{id}/')
  Future<chopper.Response<TutorshipInstance>> _apiTutorshipInstancesIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  Future<chopper.Response<TutorshipInstance>> apiTutorshipInstancesIdPut({
    required int? id,
    required TutorshipInstanceRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorshipInstance, () => TutorshipInstance.fromJsonFactory);

    return _apiTutorshipInstancesIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  @Put(
    path: '/api/tutorship-instances/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorshipInstance>> _apiTutorshipInstancesIdPut({
    @Path('id') required int? id,
    @Body() required TutorshipInstanceRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  Future<chopper.Response<TutorshipInstance>> apiTutorshipInstancesIdPatch({
    required int? id,
    required PatchedTutorshipInstanceRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorshipInstance, () => TutorshipInstance.fromJsonFactory);

    return _apiTutorshipInstancesIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  @Patch(
    path: '/api/tutorship-instances/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorshipInstance>> _apiTutorshipInstancesIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedTutorshipInstanceRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  Future<chopper.Response> apiTutorshipInstancesIdDelete({required int? id}) {
    return _apiTutorshipInstancesIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutorship instance.
  @Delete(path: '/api/tutorship-instances/{id}/')
  Future<chopper.Response> _apiTutorshipInstancesIdDelete(
      {@Path('id') required int? id});

  ///
  ///@param role_id The Role ID to filter the TutorshipInstance
  ///@param user_id The User ID to filter the TutorshipInstance
  Future<chopper.Response<TutorshipInstance>> apiTutorshipInstancesByUserGet({
    required int? roleId,
    required int? userId,
  }) {
    generatedMapping.putIfAbsent(
        TutorshipInstance, () => TutorshipInstance.fromJsonFactory);

    return _apiTutorshipInstancesByUserGet(roleId: roleId, userId: userId);
  }

  ///
  ///@param role_id The Role ID to filter the TutorshipInstance
  ///@param user_id The User ID to filter the TutorshipInstance
  @Get(path: '/api/tutorship-instances/by-user/')
  Future<chopper.Response<TutorshipInstance>> _apiTutorshipInstancesByUserGet({
    @Query('role_id') required int? roleId,
    @Query('user_id') required int? userId,
  });

  ///
  Future<chopper.Response<List<TutorshipReport>>> apiTutorshipReportsGet() {
    generatedMapping.putIfAbsent(
        TutorshipReport, () => TutorshipReport.fromJsonFactory);

    return _apiTutorshipReportsGet();
  }

  ///
  @Get(path: '/api/tutorship-reports/')
  Future<chopper.Response<List<TutorshipReport>>> _apiTutorshipReportsGet();

  ///
  Future<chopper.Response<TutorshipReport>> apiTutorshipReportsPost(
      {required TutorshipReportRequest? body}) {
    generatedMapping.putIfAbsent(
        TutorshipReport, () => TutorshipReport.fromJsonFactory);

    return _apiTutorshipReportsPost(body: body);
  }

  ///
  @Post(
    path: '/api/tutorship-reports/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorshipReport>> _apiTutorshipReportsPost(
      {@Body() required TutorshipReportRequest? body});

  ///
  ///@param id A unique integer value identifying this tutorship report.
  Future<chopper.Response<TutorshipReport>> apiTutorshipReportsIdGet(
      {required int? id}) {
    generatedMapping.putIfAbsent(
        TutorshipReport, () => TutorshipReport.fromJsonFactory);

    return _apiTutorshipReportsIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutorship report.
  @Get(path: '/api/tutorship-reports/{id}/')
  Future<chopper.Response<TutorshipReport>> _apiTutorshipReportsIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this tutorship report.
  Future<chopper.Response<TutorshipReport>> apiTutorshipReportsIdPut({
    required int? id,
    required TutorshipReportRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorshipReport, () => TutorshipReport.fromJsonFactory);

    return _apiTutorshipReportsIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutorship report.
  @Put(
    path: '/api/tutorship-reports/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorshipReport>> _apiTutorshipReportsIdPut({
    @Path('id') required int? id,
    @Body() required TutorshipReportRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutorship report.
  Future<chopper.Response<TutorshipReport>> apiTutorshipReportsIdPatch({
    required int? id,
    required PatchedTutorshipReportRequest? body,
  }) {
    generatedMapping.putIfAbsent(
        TutorshipReport, () => TutorshipReport.fromJsonFactory);

    return _apiTutorshipReportsIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this tutorship report.
  @Patch(
    path: '/api/tutorship-reports/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<TutorshipReport>> _apiTutorshipReportsIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedTutorshipReportRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this tutorship report.
  Future<chopper.Response> apiTutorshipReportsIdDelete({required int? id}) {
    return _apiTutorshipReportsIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this tutorship report.
  @Delete(path: '/api/tutorship-reports/{id}/')
  Future<chopper.Response> _apiTutorshipReportsIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<UserXArea>>> apiUserXAreaGet() {
    generatedMapping.putIfAbsent(UserXArea, () => UserXArea.fromJsonFactory);

    return _apiUserXAreaGet();
  }

  ///
  @Get(path: '/api/user-x-area/')
  Future<chopper.Response<List<UserXArea>>> _apiUserXAreaGet();

  ///
  Future<chopper.Response<UserXArea>> apiUserXAreaPost(
      {required UserXAreaRequest? body}) {
    generatedMapping.putIfAbsent(UserXArea, () => UserXArea.fromJsonFactory);

    return _apiUserXAreaPost(body: body);
  }

  ///
  @Post(
    path: '/api/user-x-area/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXArea>> _apiUserXAreaPost(
      {@Body() required UserXAreaRequest? body});

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  Future<chopper.Response<UserXArea>> apiUserXAreaIdGet({required int? id}) {
    generatedMapping.putIfAbsent(UserXArea, () => UserXArea.fromJsonFactory);

    return _apiUserXAreaIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  @Get(path: '/api/user-x-area/{id}/')
  Future<chopper.Response<UserXArea>> _apiUserXAreaIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  Future<chopper.Response<UserXArea>> apiUserXAreaIdPut({
    required int? id,
    required UserXAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(UserXArea, () => UserXArea.fromJsonFactory);

    return _apiUserXAreaIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  @Put(
    path: '/api/user-x-area/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXArea>> _apiUserXAreaIdPut({
    @Path('id') required int? id,
    @Body() required UserXAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  Future<chopper.Response<UserXArea>> apiUserXAreaIdPatch({
    required int? id,
    required PatchedUserXAreaRequest? body,
  }) {
    generatedMapping.putIfAbsent(UserXArea, () => UserXArea.fromJsonFactory);

    return _apiUserXAreaIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  @Patch(
    path: '/api/user-x-area/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXArea>> _apiUserXAreaIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedUserXAreaRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  Future<chopper.Response> apiUserXAreaIdDelete({required int? id}) {
    return _apiUserXAreaIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ area.
  @Delete(path: '/api/user-x-area/{id}/')
  Future<chopper.Response> _apiUserXAreaIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<UserXRole>>> apiUserXRoleGet() {
    generatedMapping.putIfAbsent(UserXRole, () => UserXRole.fromJsonFactory);

    return _apiUserXRoleGet();
  }

  ///
  @Get(path: '/api/user-x-role/')
  Future<chopper.Response<List<UserXRole>>> _apiUserXRoleGet();

  ///
  Future<chopper.Response<UserXRole>> apiUserXRolePost(
      {required UserXRoleRequest? body}) {
    generatedMapping.putIfAbsent(UserXRole, () => UserXRole.fromJsonFactory);

    return _apiUserXRolePost(body: body);
  }

  ///
  @Post(
    path: '/api/user-x-role/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXRole>> _apiUserXRolePost(
      {@Body() required UserXRoleRequest? body});

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  Future<chopper.Response<UserXRole>> apiUserXRoleIdGet({required int? id}) {
    generatedMapping.putIfAbsent(UserXRole, () => UserXRole.fromJsonFactory);

    return _apiUserXRoleIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  @Get(path: '/api/user-x-role/{id}/')
  Future<chopper.Response<UserXRole>> _apiUserXRoleIdGet(
      {@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  Future<chopper.Response<UserXRole>> apiUserXRoleIdPut({
    required int? id,
    required UserXRoleRequest? body,
  }) {
    generatedMapping.putIfAbsent(UserXRole, () => UserXRole.fromJsonFactory);

    return _apiUserXRoleIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  @Put(
    path: '/api/user-x-role/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXRole>> _apiUserXRoleIdPut({
    @Path('id') required int? id,
    @Body() required UserXRoleRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  Future<chopper.Response<UserXRole>> apiUserXRoleIdPatch({
    required int? id,
    required PatchedUserXRoleRequest? body,
  }) {
    generatedMapping.putIfAbsent(UserXRole, () => UserXRole.fromJsonFactory);

    return _apiUserXRoleIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  @Patch(
    path: '/api/user-x-role/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXRole>> _apiUserXRoleIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedUserXRoleRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  Future<chopper.Response> apiUserXRoleIdDelete({required int? id}) {
    return _apiUserXRoleIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ role.
  @Delete(path: '/api/user-x-role/{id}/')
  Future<chopper.Response> _apiUserXRoleIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<UserXTutorshipInstanceXRole>>>
      apiUserXTutorshipInstanceXRoleGet() {
    generatedMapping.putIfAbsent(UserXTutorshipInstanceXRole,
        () => UserXTutorshipInstanceXRole.fromJsonFactory);

    return _apiUserXTutorshipInstanceXRoleGet();
  }

  ///
  @Get(path: '/api/user-x-tutorship-instance-x-role/')
  Future<chopper.Response<List<UserXTutorshipInstanceXRole>>>
      _apiUserXTutorshipInstanceXRoleGet();

  ///
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      apiUserXTutorshipInstanceXRolePost(
          {required UserXTutorshipInstanceXRoleRequest? body}) {
    generatedMapping.putIfAbsent(UserXTutorshipInstanceXRole,
        () => UserXTutorshipInstanceXRole.fromJsonFactory);

    return _apiUserXTutorshipInstanceXRolePost(body: body);
  }

  ///
  @Post(
    path: '/api/user-x-tutorship-instance-x-role/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRolePost(
          {@Body() required UserXTutorshipInstanceXRoleRequest? body});

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      apiUserXTutorshipInstanceXRoleIdGet({required int? id}) {
    generatedMapping.putIfAbsent(UserXTutorshipInstanceXRole,
        () => UserXTutorshipInstanceXRole.fromJsonFactory);

    return _apiUserXTutorshipInstanceXRoleIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  @Get(path: '/api/user-x-tutorship-instance-x-role/{id}/')
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRoleIdGet({@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      apiUserXTutorshipInstanceXRoleIdPut({
    required int? id,
    required UserXTutorshipInstanceXRoleRequest? body,
  }) {
    generatedMapping.putIfAbsent(UserXTutorshipInstanceXRole,
        () => UserXTutorshipInstanceXRole.fromJsonFactory);

    return _apiUserXTutorshipInstanceXRoleIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  @Put(
    path: '/api/user-x-tutorship-instance-x-role/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRoleIdPut({
    @Path('id') required int? id,
    @Body() required UserXTutorshipInstanceXRoleRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      apiUserXTutorshipInstanceXRoleIdPatch({
    required int? id,
    required PatchedUserXTutorshipInstanceXRoleRequest? body,
  }) {
    generatedMapping.putIfAbsent(UserXTutorshipInstanceXRole,
        () => UserXTutorshipInstanceXRole.fromJsonFactory);

    return _apiUserXTutorshipInstanceXRoleIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  @Patch(
    path: '/api/user-x-tutorship-instance-x-role/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRoleIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedUserXTutorshipInstanceXRoleRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  Future<chopper.Response> apiUserXTutorshipInstanceXRoleIdDelete(
      {required int? id}) {
    return _apiUserXTutorshipInstanceXRoleIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user_ x_ tutorship_ instance_ x_ role.
  @Delete(path: '/api/user-x-tutorship-instance-x-role/{id}/')
  Future<chopper.Response> _apiUserXTutorshipInstanceXRoleIdDelete(
      {@Path('id') required int? id});

  ///
  Future<chopper.Response<List<User>>> apiUsersGet() {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUsersGet();
  }

  ///
  @Get(path: '/api/users/')
  Future<chopper.Response<List<User>>> _apiUsersGet();

  ///
  Future<chopper.Response<User>> apiUsersPost({required UserRequest? body}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUsersPost(body: body);
  }

  ///
  @Post(
    path: '/api/users/',
    optionalBody: true,
  )
  Future<chopper.Response<User>> _apiUsersPost(
      {@Body() required UserRequest? body});

  ///
  ///@param id A unique integer value identifying this user.
  Future<chopper.Response<User>> apiUsersIdGet({required int? id}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUsersIdGet(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user.
  @Get(path: '/api/users/{id}/')
  Future<chopper.Response<User>> _apiUsersIdGet({@Path('id') required int? id});

  ///
  ///@param id A unique integer value identifying this user.
  Future<chopper.Response<User>> apiUsersIdPut({
    required int? id,
    required UserRequest? body,
  }) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUsersIdPut(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user.
  @Put(
    path: '/api/users/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<User>> _apiUsersIdPut({
    @Path('id') required int? id,
    @Body() required UserRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user.
  Future<chopper.Response<User>> apiUsersIdPatch({
    required int? id,
    required PatchedUserRequest? body,
  }) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUsersIdPatch(id: id, body: body);
  }

  ///
  ///@param id A unique integer value identifying this user.
  @Patch(
    path: '/api/users/{id}/',
    optionalBody: true,
  )
  Future<chopper.Response<User>> _apiUsersIdPatch({
    @Path('id') required int? id,
    @Body() required PatchedUserRequest? body,
  });

  ///
  ///@param id A unique integer value identifying this user.
  Future<chopper.Response> apiUsersIdDelete({required int? id}) {
    return _apiUsersIdDelete(id: id);
  }

  ///
  ///@param id A unique integer value identifying this user.
  @Delete(path: '/api/users/{id}/')
  Future<chopper.Response> _apiUsersIdDelete({@Path('id') required int? id});

  ///Look up for a user by email
  Future<chopper.Response<User>> apiUsersIsUserPost(
      {required EmailLookUpRequest? body}) {
    generatedMapping.putIfAbsent(User, () => User.fromJsonFactory);

    return _apiUsersIsUserPost(body: body);
  }

  ///Look up for a user by email
  @Post(
    path: '/api/users/is-user/',
    optionalBody: true,
  )
  Future<chopper.Response<User>> _apiUsersIsUserPost(
      {@Body() required EmailLookUpRequest? body});

  ///Create a new student user
  Future<chopper.Response<NewUser>> apiUsersNewUserPost(
      {required NewUserRequest? body}) {
    generatedMapping.putIfAbsent(NewUser, () => NewUser.fromJsonFactory);

    return _apiUsersNewUserPost(body: body);
  }

  ///Create a new student user
  @Post(
    path: '/api/users/new-user/',
    optionalBody: true,
  )
  Future<chopper.Response<NewUser>> _apiUsersNewUserPost(
      {@Body() required NewUserRequest? body});
}

@JsonSerializable(explicitToJson: true)
class $400IsUser {
  $400IsUser({
    required this.message,
  });

  factory $400IsUser.fromJson(Map<String, dynamic> json) =>
      _$$400IsUserFromJson(json);

  static const toJsonFactory = _$$400IsUserToJson;
  Map<String, dynamic> toJson() => _$$400IsUserToJson(this);

  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$$400IsUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $400IsUser &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^ runtimeType.hashCode;
}

extension $$400IsUserExtension on $400IsUser {
  $400IsUser copyWith({String? message}) {
    return $400IsUser(message: message ?? this.message);
  }

  $400IsUser copyWithWrapped({Wrapped<String>? message}) {
    return $400IsUser(
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class $400NewUser {
  $400NewUser({
    required this.message,
  });

  factory $400NewUser.fromJson(Map<String, dynamic> json) =>
      _$$400NewUserFromJson(json);

  static const toJsonFactory = _$$400NewUserToJson;
  Map<String, dynamic> toJson() => _$$400NewUserToJson(this);

  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$$400NewUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $400NewUser &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^ runtimeType.hashCode;
}

extension $$400NewUserExtension on $400NewUser {
  $400NewUser copyWith({String? message}) {
    return $400NewUser(message: message ?? this.message);
  }

  $400NewUser copyWithWrapped({Wrapped<String>? message}) {
    return $400NewUser(
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class $404IsUserserializer {
  $404IsUserserializer({
    required this.message,
  });

  factory $404IsUserserializer.fromJson(Map<String, dynamic> json) =>
      _$$404IsUserserializerFromJson(json);

  static const toJsonFactory = _$$404IsUserserializerToJson;
  Map<String, dynamic> toJson() => _$$404IsUserserializerToJson(this);

  @JsonKey(name: 'message')
  final String message;
  static const fromJsonFactory = _$$404IsUserserializerFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is $404IsUserserializer &&
            (identical(other.message, message) ||
                const DeepCollectionEquality().equals(other.message, message)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(message) ^ runtimeType.hashCode;
}

extension $$404IsUserserializerExtension on $404IsUserserializer {
  $404IsUserserializer copyWith({String? message}) {
    return $404IsUserserializer(message: message ?? this.message);
  }

  $404IsUserserializer copyWithWrapped({Wrapped<String>? message}) {
    return $404IsUserserializer(
        message: (message != null ? message.value : this.message));
  }
}

@JsonSerializable(explicitToJson: true)
class AcademicUnit {
  AcademicUnit({
    required this.id,
    required this.name,
    required this.sede,
  });

  factory AcademicUnit.fromJson(Map<String, dynamic> json) =>
      _$AcademicUnitFromJson(json);

  static const toJsonFactory = _$AcademicUnitToJson;
  Map<String, dynamic> toJson() => _$AcademicUnitToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'sede')
  final String sede;
  static const fromJsonFactory = _$AcademicUnitFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcademicUnit &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.sede, sede) ||
                const DeepCollectionEquality().equals(other.sede, sede)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(sede) ^
      runtimeType.hashCode;
}

extension $AcademicUnitExtension on AcademicUnit {
  AcademicUnit copyWith({int? id, String? name, String? sede}) {
    return AcademicUnit(
        id: id ?? this.id, name: name ?? this.name, sede: sede ?? this.sede);
  }

  AcademicUnit copyWithWrapped(
      {Wrapped<int>? id, Wrapped<String>? name, Wrapped<String>? sede}) {
    return AcademicUnit(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        sede: (sede != null ? sede.value : this.sede));
  }
}

@JsonSerializable(explicitToJson: true)
class AcademicUnitRequest {
  AcademicUnitRequest({
    required this.name,
    required this.sede,
  });

  factory AcademicUnitRequest.fromJson(Map<String, dynamic> json) =>
      _$AcademicUnitRequestFromJson(json);

  static const toJsonFactory = _$AcademicUnitRequestToJson;
  Map<String, dynamic> toJson() => _$AcademicUnitRequestToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'sede')
  final String sede;
  static const fromJsonFactory = _$AcademicUnitRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcademicUnitRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.sede, sede) ||
                const DeepCollectionEquality().equals(other.sede, sede)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(sede) ^
      runtimeType.hashCode;
}

extension $AcademicUnitRequestExtension on AcademicUnitRequest {
  AcademicUnitRequest copyWith({String? name, String? sede}) {
    return AcademicUnitRequest(
        name: name ?? this.name, sede: sede ?? this.sede);
  }

  AcademicUnitRequest copyWithWrapped(
      {Wrapped<String>? name, Wrapped<String>? sede}) {
    return AcademicUnitRequest(
        name: (name != null ? name.value : this.name),
        sede: (sede != null ? sede.value : this.sede));
  }
}

@JsonSerializable(explicitToJson: true)
class AcademicYear {
  AcademicYear({
    required this.id,
    required this.year,
    required this.start,
    required this.end,
  });

  factory AcademicYear.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearFromJson(json);

  static const toJsonFactory = _$AcademicYearToJson;
  Map<String, dynamic> toJson() => _$AcademicYearToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'year')
  final int year;
  @JsonKey(name: 'start', toJson: _dateToJson)
  final DateTime start;
  @JsonKey(name: 'end', toJson: _dateToJson)
  final DateTime end;
  static const fromJsonFactory = _$AcademicYearFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcademicYear &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end) ^
      runtimeType.hashCode;
}

extension $AcademicYearExtension on AcademicYear {
  AcademicYear copyWith({int? id, int? year, DateTime? start, DateTime? end}) {
    return AcademicYear(
        id: id ?? this.id,
        year: year ?? this.year,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  AcademicYear copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<int>? year,
      Wrapped<DateTime>? start,
      Wrapped<DateTime>? end}) {
    return AcademicYear(
        id: (id != null ? id.value : this.id),
        year: (year != null ? year.value : this.year),
        start: (start != null ? start.value : this.start),
        end: (end != null ? end.value : this.end));
  }
}

@JsonSerializable(explicitToJson: true)
class AcademicYearRequest {
  AcademicYearRequest({
    required this.year,
    required this.start,
    required this.end,
  });

  factory AcademicYearRequest.fromJson(Map<String, dynamic> json) =>
      _$AcademicYearRequestFromJson(json);

  static const toJsonFactory = _$AcademicYearRequestToJson;
  Map<String, dynamic> toJson() => _$AcademicYearRequestToJson(this);

  @JsonKey(name: 'year')
  final int year;
  @JsonKey(name: 'start', toJson: _dateToJson)
  final DateTime start;
  @JsonKey(name: 'end', toJson: _dateToJson)
  final DateTime end;
  static const fromJsonFactory = _$AcademicYearRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AcademicYearRequest &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end) ^
      runtimeType.hashCode;
}

extension $AcademicYearRequestExtension on AcademicYearRequest {
  AcademicYearRequest copyWith({int? year, DateTime? start, DateTime? end}) {
    return AcademicYearRequest(
        year: year ?? this.year,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  AcademicYearRequest copyWithWrapped(
      {Wrapped<int>? year, Wrapped<DateTime>? start, Wrapped<DateTime>? end}) {
    return AcademicYearRequest(
        year: (year != null ? year.value : this.year),
        start: (start != null ? start.value : this.start),
        end: (end != null ? end.value : this.end));
  }
}

@JsonSerializable(explicitToJson: true)
class Area {
  Area({
    required this.id,
    required this.name,
    required this.postulations,
    required this.users,
  });

  factory Area.fromJson(Map<String, dynamic> json) => _$AreaFromJson(json);

  static const toJsonFactory = _$AreaToJson;
  Map<String, dynamic> toJson() => _$AreaToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'postulations', defaultValue: <int>[])
  final List<int> postulations;
  @JsonKey(name: 'users', defaultValue: <int>[])
  final List<int> users;
  static const fromJsonFactory = _$AreaFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Area &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.postulations, postulations) ||
                const DeepCollectionEquality()
                    .equals(other.postulations, postulations)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(postulations) ^
      const DeepCollectionEquality().hash(users) ^
      runtimeType.hashCode;
}

extension $AreaExtension on Area {
  Area copyWith(
      {int? id, String? name, List<int>? postulations, List<int>? users}) {
    return Area(
        id: id ?? this.id,
        name: name ?? this.name,
        postulations: postulations ?? this.postulations,
        users: users ?? this.users);
  }

  Area copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? name,
      Wrapped<List<int>>? postulations,
      Wrapped<List<int>>? users}) {
    return Area(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        postulations:
            (postulations != null ? postulations.value : this.postulations),
        users: (users != null ? users.value : this.users));
  }
}

@JsonSerializable(explicitToJson: true)
class AreaRequest {
  AreaRequest({
    required this.name,
  });

  factory AreaRequest.fromJson(Map<String, dynamic> json) =>
      _$AreaRequestFromJson(json);

  static const toJsonFactory = _$AreaRequestToJson;
  Map<String, dynamic> toJson() => _$AreaRequestToJson(this);

  @JsonKey(name: 'name')
  final String name;
  static const fromJsonFactory = _$AreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AreaRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $AreaRequestExtension on AreaRequest {
  AreaRequest copyWith({String? name}) {
    return AreaRequest(name: name ?? this.name);
  }

  AreaRequest copyWithWrapped({Wrapped<String>? name}) {
    return AreaRequest(name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class Career {
  Career({
    required this.id,
    required this.name,
    required this.academicUnit,
    required this.areas,
    required this.users,
  });

  factory Career.fromJson(Map<String, dynamic> json) => _$CareerFromJson(json);

  static const toJsonFactory = _$CareerToJson;
  Map<String, dynamic> toJson() => _$CareerToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'academic_unit')
  final int academicUnit;
  @JsonKey(name: 'areas', defaultValue: <int>[])
  final List<int> areas;
  @JsonKey(name: 'users', defaultValue: <int>[])
  final List<int> users;
  static const fromJsonFactory = _$CareerFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Career &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.academicUnit, academicUnit) ||
                const DeepCollectionEquality()
                    .equals(other.academicUnit, academicUnit)) &&
            (identical(other.areas, areas) ||
                const DeepCollectionEquality().equals(other.areas, areas)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(academicUnit) ^
      const DeepCollectionEquality().hash(areas) ^
      const DeepCollectionEquality().hash(users) ^
      runtimeType.hashCode;
}

extension $CareerExtension on Career {
  Career copyWith(
      {int? id,
      String? name,
      int? academicUnit,
      List<int>? areas,
      List<int>? users}) {
    return Career(
        id: id ?? this.id,
        name: name ?? this.name,
        academicUnit: academicUnit ?? this.academicUnit,
        areas: areas ?? this.areas,
        users: users ?? this.users);
  }

  Career copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? name,
      Wrapped<int>? academicUnit,
      Wrapped<List<int>>? areas,
      Wrapped<List<int>>? users}) {
    return Career(
        id: (id != null ? id.value : this.id),
        name: (name != null ? name.value : this.name),
        academicUnit:
            (academicUnit != null ? academicUnit.value : this.academicUnit),
        areas: (areas != null ? areas.value : this.areas),
        users: (users != null ? users.value : this.users));
  }
}

@JsonSerializable(explicitToJson: true)
class CareerRequest {
  CareerRequest({
    required this.name,
    required this.academicUnit,
  });

  factory CareerRequest.fromJson(Map<String, dynamic> json) =>
      _$CareerRequestFromJson(json);

  static const toJsonFactory = _$CareerRequestToJson;
  Map<String, dynamic> toJson() => _$CareerRequestToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'academic_unit')
  final int academicUnit;
  static const fromJsonFactory = _$CareerRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CareerRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.academicUnit, academicUnit) ||
                const DeepCollectionEquality()
                    .equals(other.academicUnit, academicUnit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(academicUnit) ^
      runtimeType.hashCode;
}

extension $CareerRequestExtension on CareerRequest {
  CareerRequest copyWith({String? name, int? academicUnit}) {
    return CareerRequest(
        name: name ?? this.name,
        academicUnit: academicUnit ?? this.academicUnit);
  }

  CareerRequest copyWithWrapped(
      {Wrapped<String>? name, Wrapped<int>? academicUnit}) {
    return CareerRequest(
        name: (name != null ? name.value : this.name),
        academicUnit:
            (academicUnit != null ? academicUnit.value : this.academicUnit));
  }
}

@JsonSerializable(explicitToJson: true)
class CareerXArea {
  CareerXArea({
    required this.id,
    required this.career,
    required this.area,
  });

  factory CareerXArea.fromJson(Map<String, dynamic> json) =>
      _$CareerXAreaFromJson(json);

  static const toJsonFactory = _$CareerXAreaToJson;
  Map<String, dynamic> toJson() => _$CareerXAreaToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'career')
  final int career;
  @JsonKey(name: 'area')
  final int area;
  static const fromJsonFactory = _$CareerXAreaFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CareerXArea &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.career, career) ||
                const DeepCollectionEquality().equals(other.career, career)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(career) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $CareerXAreaExtension on CareerXArea {
  CareerXArea copyWith({int? id, int? career, int? area}) {
    return CareerXArea(
        id: id ?? this.id,
        career: career ?? this.career,
        area: area ?? this.area);
  }

  CareerXArea copyWithWrapped(
      {Wrapped<int>? id, Wrapped<int>? career, Wrapped<int>? area}) {
    return CareerXArea(
        id: (id != null ? id.value : this.id),
        career: (career != null ? career.value : this.career),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class CareerXAreaRequest {
  CareerXAreaRequest({
    required this.career,
    required this.area,
  });

  factory CareerXAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$CareerXAreaRequestFromJson(json);

  static const toJsonFactory = _$CareerXAreaRequestToJson;
  Map<String, dynamic> toJson() => _$CareerXAreaRequestToJson(this);

  @JsonKey(name: 'career')
  final int career;
  @JsonKey(name: 'area')
  final int area;
  static const fromJsonFactory = _$CareerXAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CareerXAreaRequest &&
            (identical(other.career, career) ||
                const DeepCollectionEquality().equals(other.career, career)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(career) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $CareerXAreaRequestExtension on CareerXAreaRequest {
  CareerXAreaRequest copyWith({int? career, int? area}) {
    return CareerXAreaRequest(
        career: career ?? this.career, area: area ?? this.area);
  }

  CareerXAreaRequest copyWithWrapped(
      {Wrapped<int>? career, Wrapped<int>? area}) {
    return CareerXAreaRequest(
        career: (career != null ? career.value : this.career),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class CareerXUser {
  CareerXUser({
    required this.id,
    required this.career,
    required this.user,
  });

  factory CareerXUser.fromJson(Map<String, dynamic> json) =>
      _$CareerXUserFromJson(json);

  static const toJsonFactory = _$CareerXUserToJson;
  Map<String, dynamic> toJson() => _$CareerXUserToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'career')
  final int career;
  @JsonKey(name: 'user')
  final int user;
  static const fromJsonFactory = _$CareerXUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CareerXUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.career, career) ||
                const DeepCollectionEquality().equals(other.career, career)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(career) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $CareerXUserExtension on CareerXUser {
  CareerXUser copyWith({int? id, int? career, int? user}) {
    return CareerXUser(
        id: id ?? this.id,
        career: career ?? this.career,
        user: user ?? this.user);
  }

  CareerXUser copyWithWrapped(
      {Wrapped<int>? id, Wrapped<int>? career, Wrapped<int>? user}) {
    return CareerXUser(
        id: (id != null ? id.value : this.id),
        career: (career != null ? career.value : this.career),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class CareerXUserRequest {
  CareerXUserRequest({
    required this.career,
    required this.user,
  });

  factory CareerXUserRequest.fromJson(Map<String, dynamic> json) =>
      _$CareerXUserRequestFromJson(json);

  static const toJsonFactory = _$CareerXUserRequestToJson;
  Map<String, dynamic> toJson() => _$CareerXUserRequestToJson(this);

  @JsonKey(name: 'career')
  final int career;
  @JsonKey(name: 'user')
  final int user;
  static const fromJsonFactory = _$CareerXUserRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is CareerXUserRequest &&
            (identical(other.career, career) ||
                const DeepCollectionEquality().equals(other.career, career)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(career) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $CareerXUserRequestExtension on CareerXUserRequest {
  CareerXUserRequest copyWith({int? career, int? user}) {
    return CareerXUserRequest(
        career: career ?? this.career, user: user ?? this.user);
  }

  CareerXUserRequest copyWithWrapped(
      {Wrapped<int>? career, Wrapped<int>? user}) {
    return CareerXUserRequest(
        career: (career != null ? career.value : this.career),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class EmailLookUpRequest {
  EmailLookUpRequest({
    required this.email,
  });

  factory EmailLookUpRequest.fromJson(Map<String, dynamic> json) =>
      _$EmailLookUpRequestFromJson(json);

  static const toJsonFactory = _$EmailLookUpRequestToJson;
  Map<String, dynamic> toJson() => _$EmailLookUpRequestToJson(this);

  @JsonKey(name: 'email')
  final String email;
  static const fromJsonFactory = _$EmailLookUpRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailLookUpRequest &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(email) ^ runtimeType.hashCode;
}

extension $EmailLookUpRequestExtension on EmailLookUpRequest {
  EmailLookUpRequest copyWith({String? email}) {
    return EmailLookUpRequest(email: email ?? this.email);
  }

  EmailLookUpRequest copyWithWrapped({Wrapped<String>? email}) {
    return EmailLookUpRequest(
        email: (email != null ? email.value : this.email));
  }
}

@JsonSerializable(explicitToJson: true)
class NewUser {
  NewUser({
    required this.id,
    required this.careers,
    required this.roles,
    required this.name,
    required this.lastName,
    required this.uccKey,
    required this.email,
    required this.academicYear,
  });

  factory NewUser.fromJson(Map<String, dynamic> json) =>
      _$NewUserFromJson(json);

  static const toJsonFactory = _$NewUserToJson;
  Map<String, dynamic> toJson() => _$NewUserToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'careers', defaultValue: <int>[])
  final List<int> careers;
  @JsonKey(name: 'roles', defaultValue: <String>[])
  final List<String> roles;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'ucc_key')
  final int uccKey;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'academic_year')
  final int academicYear;
  static const fromJsonFactory = _$NewUserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewUser &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.careers, careers) ||
                const DeepCollectionEquality()
                    .equals(other.careers, careers)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.uccKey, uccKey) ||
                const DeepCollectionEquality().equals(other.uccKey, uccKey)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.academicYear, academicYear) ||
                const DeepCollectionEquality()
                    .equals(other.academicYear, academicYear)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(careers) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(uccKey) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(academicYear) ^
      runtimeType.hashCode;
}

extension $NewUserExtension on NewUser {
  NewUser copyWith(
      {int? id,
      List<int>? careers,
      List<String>? roles,
      String? name,
      String? lastName,
      int? uccKey,
      String? email,
      int? academicYear}) {
    return NewUser(
        id: id ?? this.id,
        careers: careers ?? this.careers,
        roles: roles ?? this.roles,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        uccKey: uccKey ?? this.uccKey,
        email: email ?? this.email,
        academicYear: academicYear ?? this.academicYear);
  }

  NewUser copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<List<int>>? careers,
      Wrapped<List<String>>? roles,
      Wrapped<String>? name,
      Wrapped<String>? lastName,
      Wrapped<int>? uccKey,
      Wrapped<String>? email,
      Wrapped<int>? academicYear}) {
    return NewUser(
        id: (id != null ? id.value : this.id),
        careers: (careers != null ? careers.value : this.careers),
        roles: (roles != null ? roles.value : this.roles),
        name: (name != null ? name.value : this.name),
        lastName: (lastName != null ? lastName.value : this.lastName),
        uccKey: (uccKey != null ? uccKey.value : this.uccKey),
        email: (email != null ? email.value : this.email),
        academicYear:
            (academicYear != null ? academicYear.value : this.academicYear));
  }
}

@JsonSerializable(explicitToJson: true)
class NewUserRequest {
  NewUserRequest({
    required this.careers,
    required this.roles,
    required this.name,
    required this.lastName,
    required this.uccKey,
    required this.email,
    required this.academicYear,
  });

  factory NewUserRequest.fromJson(Map<String, dynamic> json) =>
      _$NewUserRequestFromJson(json);

  static const toJsonFactory = _$NewUserRequestToJson;
  Map<String, dynamic> toJson() => _$NewUserRequestToJson(this);

  @JsonKey(name: 'careers', defaultValue: <int>[])
  final List<int> careers;
  @JsonKey(name: 'roles', defaultValue: <String>[])
  final List<String> roles;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'ucc_key')
  final int uccKey;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'academic_year')
  final int academicYear;
  static const fromJsonFactory = _$NewUserRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is NewUserRequest &&
            (identical(other.careers, careers) ||
                const DeepCollectionEquality()
                    .equals(other.careers, careers)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.uccKey, uccKey) ||
                const DeepCollectionEquality().equals(other.uccKey, uccKey)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.academicYear, academicYear) ||
                const DeepCollectionEquality()
                    .equals(other.academicYear, academicYear)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(careers) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(uccKey) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(academicYear) ^
      runtimeType.hashCode;
}

extension $NewUserRequestExtension on NewUserRequest {
  NewUserRequest copyWith(
      {List<int>? careers,
      List<String>? roles,
      String? name,
      String? lastName,
      int? uccKey,
      String? email,
      int? academicYear}) {
    return NewUserRequest(
        careers: careers ?? this.careers,
        roles: roles ?? this.roles,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        uccKey: uccKey ?? this.uccKey,
        email: email ?? this.email,
        academicYear: academicYear ?? this.academicYear);
  }

  NewUserRequest copyWithWrapped(
      {Wrapped<List<int>>? careers,
      Wrapped<List<String>>? roles,
      Wrapped<String>? name,
      Wrapped<String>? lastName,
      Wrapped<int>? uccKey,
      Wrapped<String>? email,
      Wrapped<int>? academicYear}) {
    return NewUserRequest(
        careers: (careers != null ? careers.value : this.careers),
        roles: (roles != null ? roles.value : this.roles),
        name: (name != null ? name.value : this.name),
        lastName: (lastName != null ? lastName.value : this.lastName),
        uccKey: (uccKey != null ? uccKey.value : this.uccKey),
        email: (email != null ? email.value : this.email),
        academicYear:
            (academicYear != null ? academicYear.value : this.academicYear));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedAcademicUnitRequest {
  PatchedAcademicUnitRequest({
    this.name,
    this.sede,
  });

  factory PatchedAcademicUnitRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedAcademicUnitRequestFromJson(json);

  static const toJsonFactory = _$PatchedAcademicUnitRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedAcademicUnitRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'sede')
  final String? sede;
  static const fromJsonFactory = _$PatchedAcademicUnitRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedAcademicUnitRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.sede, sede) ||
                const DeepCollectionEquality().equals(other.sede, sede)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(sede) ^
      runtimeType.hashCode;
}

extension $PatchedAcademicUnitRequestExtension on PatchedAcademicUnitRequest {
  PatchedAcademicUnitRequest copyWith({String? name, String? sede}) {
    return PatchedAcademicUnitRequest(
        name: name ?? this.name, sede: sede ?? this.sede);
  }

  PatchedAcademicUnitRequest copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<String?>? sede}) {
    return PatchedAcademicUnitRequest(
        name: (name != null ? name.value : this.name),
        sede: (sede != null ? sede.value : this.sede));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedAcademicYearRequest {
  PatchedAcademicYearRequest({
    this.year,
    this.start,
    this.end,
  });

  factory PatchedAcademicYearRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedAcademicYearRequestFromJson(json);

  static const toJsonFactory = _$PatchedAcademicYearRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedAcademicYearRequestToJson(this);

  @JsonKey(name: 'year')
  final int? year;
  @JsonKey(name: 'start', toJson: _dateToJson)
  final DateTime? start;
  @JsonKey(name: 'end', toJson: _dateToJson)
  final DateTime? end;
  static const fromJsonFactory = _$PatchedAcademicYearRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedAcademicYearRequest &&
            (identical(other.year, year) ||
                const DeepCollectionEquality().equals(other.year, year)) &&
            (identical(other.start, start) ||
                const DeepCollectionEquality().equals(other.start, start)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(year) ^
      const DeepCollectionEquality().hash(start) ^
      const DeepCollectionEquality().hash(end) ^
      runtimeType.hashCode;
}

extension $PatchedAcademicYearRequestExtension on PatchedAcademicYearRequest {
  PatchedAcademicYearRequest copyWith(
      {int? year, DateTime? start, DateTime? end}) {
    return PatchedAcademicYearRequest(
        year: year ?? this.year,
        start: start ?? this.start,
        end: end ?? this.end);
  }

  PatchedAcademicYearRequest copyWithWrapped(
      {Wrapped<int?>? year,
      Wrapped<DateTime?>? start,
      Wrapped<DateTime?>? end}) {
    return PatchedAcademicYearRequest(
        year: (year != null ? year.value : this.year),
        start: (start != null ? start.value : this.start),
        end: (end != null ? end.value : this.end));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedAreaRequest {
  PatchedAreaRequest({
    this.name,
  });

  factory PatchedAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedAreaRequestFromJson(json);

  static const toJsonFactory = _$PatchedAreaRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedAreaRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  static const fromJsonFactory = _$PatchedAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedAreaRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^ runtimeType.hashCode;
}

extension $PatchedAreaRequestExtension on PatchedAreaRequest {
  PatchedAreaRequest copyWith({String? name}) {
    return PatchedAreaRequest(name: name ?? this.name);
  }

  PatchedAreaRequest copyWithWrapped({Wrapped<String?>? name}) {
    return PatchedAreaRequest(name: (name != null ? name.value : this.name));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedCareerRequest {
  PatchedCareerRequest({
    this.name,
    this.academicUnit,
  });

  factory PatchedCareerRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedCareerRequestFromJson(json);

  static const toJsonFactory = _$PatchedCareerRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedCareerRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'academic_unit')
  final int? academicUnit;
  static const fromJsonFactory = _$PatchedCareerRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedCareerRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.academicUnit, academicUnit) ||
                const DeepCollectionEquality()
                    .equals(other.academicUnit, academicUnit)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(academicUnit) ^
      runtimeType.hashCode;
}

extension $PatchedCareerRequestExtension on PatchedCareerRequest {
  PatchedCareerRequest copyWith({String? name, int? academicUnit}) {
    return PatchedCareerRequest(
        name: name ?? this.name,
        academicUnit: academicUnit ?? this.academicUnit);
  }

  PatchedCareerRequest copyWithWrapped(
      {Wrapped<String?>? name, Wrapped<int?>? academicUnit}) {
    return PatchedCareerRequest(
        name: (name != null ? name.value : this.name),
        academicUnit:
            (academicUnit != null ? academicUnit.value : this.academicUnit));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedCareerXAreaRequest {
  PatchedCareerXAreaRequest({
    this.career,
    this.area,
  });

  factory PatchedCareerXAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedCareerXAreaRequestFromJson(json);

  static const toJsonFactory = _$PatchedCareerXAreaRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedCareerXAreaRequestToJson(this);

  @JsonKey(name: 'career')
  final int? career;
  @JsonKey(name: 'area')
  final int? area;
  static const fromJsonFactory = _$PatchedCareerXAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedCareerXAreaRequest &&
            (identical(other.career, career) ||
                const DeepCollectionEquality().equals(other.career, career)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(career) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $PatchedCareerXAreaRequestExtension on PatchedCareerXAreaRequest {
  PatchedCareerXAreaRequest copyWith({int? career, int? area}) {
    return PatchedCareerXAreaRequest(
        career: career ?? this.career, area: area ?? this.area);
  }

  PatchedCareerXAreaRequest copyWithWrapped(
      {Wrapped<int?>? career, Wrapped<int?>? area}) {
    return PatchedCareerXAreaRequest(
        career: (career != null ? career.value : this.career),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedCareerXUserRequest {
  PatchedCareerXUserRequest({
    this.career,
    this.user,
  });

  factory PatchedCareerXUserRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedCareerXUserRequestFromJson(json);

  static const toJsonFactory = _$PatchedCareerXUserRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedCareerXUserRequestToJson(this);

  @JsonKey(name: 'career')
  final int? career;
  @JsonKey(name: 'user')
  final int? user;
  static const fromJsonFactory = _$PatchedCareerXUserRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedCareerXUserRequest &&
            (identical(other.career, career) ||
                const DeepCollectionEquality().equals(other.career, career)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(career) ^
      const DeepCollectionEquality().hash(user) ^
      runtimeType.hashCode;
}

extension $PatchedCareerXUserRequestExtension on PatchedCareerXUserRequest {
  PatchedCareerXUserRequest copyWith({int? career, int? user}) {
    return PatchedCareerXUserRequest(
        career: career ?? this.career, user: user ?? this.user);
  }

  PatchedCareerXUserRequest copyWithWrapped(
      {Wrapped<int?>? career, Wrapped<int?>? user}) {
    return PatchedCareerXUserRequest(
        career: (career != null ? career.value : this.career),
        user: (user != null ? user.value : this.user));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedPostulationRequest {
  PatchedPostulationRequest({
    this.date,
    this.status,
    this.studentUser,
    this.coordinatorUser,
  });

  factory PatchedPostulationRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedPostulationRequestFromJson(json);

  static const toJsonFactory = _$PatchedPostulationRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedPostulationRequestToJson(this);

  @JsonKey(name: 'date')
  final DateTime? date;
  @JsonKey(name: 'status')
  final String? status;
  @JsonKey(name: 'student_user')
  final int? studentUser;
  @JsonKey(name: 'coordinator_user')
  final int? coordinatorUser;
  static const fromJsonFactory = _$PatchedPostulationRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedPostulationRequest &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.studentUser, studentUser) ||
                const DeepCollectionEquality()
                    .equals(other.studentUser, studentUser)) &&
            (identical(other.coordinatorUser, coordinatorUser) ||
                const DeepCollectionEquality()
                    .equals(other.coordinatorUser, coordinatorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(studentUser) ^
      const DeepCollectionEquality().hash(coordinatorUser) ^
      runtimeType.hashCode;
}

extension $PatchedPostulationRequestExtension on PatchedPostulationRequest {
  PatchedPostulationRequest copyWith(
      {DateTime? date,
      String? status,
      int? studentUser,
      int? coordinatorUser}) {
    return PatchedPostulationRequest(
        date: date ?? this.date,
        status: status ?? this.status,
        studentUser: studentUser ?? this.studentUser,
        coordinatorUser: coordinatorUser ?? this.coordinatorUser);
  }

  PatchedPostulationRequest copyWithWrapped(
      {Wrapped<DateTime?>? date,
      Wrapped<String?>? status,
      Wrapped<int?>? studentUser,
      Wrapped<int?>? coordinatorUser}) {
    return PatchedPostulationRequest(
        date: (date != null ? date.value : this.date),
        status: (status != null ? status.value : this.status),
        studentUser:
            (studentUser != null ? studentUser.value : this.studentUser),
        coordinatorUser: (coordinatorUser != null
            ? coordinatorUser.value
            : this.coordinatorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedPostulationXAreaRequest {
  PatchedPostulationXAreaRequest({
    this.postulation,
    this.area,
  });

  factory PatchedPostulationXAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedPostulationXAreaRequestFromJson(json);

  static const toJsonFactory = _$PatchedPostulationXAreaRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedPostulationXAreaRequestToJson(this);

  @JsonKey(name: 'postulation')
  final int? postulation;
  @JsonKey(name: 'area')
  final int? area;
  static const fromJsonFactory = _$PatchedPostulationXAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedPostulationXAreaRequest &&
            (identical(other.postulation, postulation) ||
                const DeepCollectionEquality()
                    .equals(other.postulation, postulation)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(postulation) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $PatchedPostulationXAreaRequestExtension
    on PatchedPostulationXAreaRequest {
  PatchedPostulationXAreaRequest copyWith({int? postulation, int? area}) {
    return PatchedPostulationXAreaRequest(
        postulation: postulation ?? this.postulation, area: area ?? this.area);
  }

  PatchedPostulationXAreaRequest copyWithWrapped(
      {Wrapped<int?>? postulation, Wrapped<int?>? area}) {
    return PatchedPostulationXAreaRequest(
        postulation:
            (postulation != null ? postulation.value : this.postulation),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedRoleRequest {
  PatchedRoleRequest({
    this.title,
    this.type,
    this.description,
  });

  factory PatchedRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedRoleRequestFromJson(json);

  static const toJsonFactory = _$PatchedRoleRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedRoleRequestToJson(this);

  @JsonKey(name: 'title')
  final String? title;
  @JsonKey(name: 'type')
  final String? type;
  @JsonKey(name: 'description')
  final String? description;
  static const fromJsonFactory = _$PatchedRoleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedRoleRequest &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $PatchedRoleRequestExtension on PatchedRoleRequest {
  PatchedRoleRequest copyWith(
      {String? title, String? type, String? description}) {
    return PatchedRoleRequest(
        title: title ?? this.title,
        type: type ?? this.type,
        description: description ?? this.description);
  }

  PatchedRoleRequest copyWithWrapped(
      {Wrapped<String?>? title,
      Wrapped<String?>? type,
      Wrapped<String?>? description}) {
    return PatchedRoleRequest(
        title: (title != null ? title.value : this.title),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedTutorUserReviewRequest {
  PatchedTutorUserReviewRequest({
    this.comment,
    this.occurred,
    this.absent,
    this.utility,
    this.tutorUser,
    this.studentUser,
    this.tutorshipInstance,
  });

  factory PatchedTutorUserReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedTutorUserReviewRequestFromJson(json);

  static const toJsonFactory = _$PatchedTutorUserReviewRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedTutorUserReviewRequestToJson(this);

  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'occurred')
  final bool? occurred;
  @JsonKey(name: 'absent')
  final bool? absent;
  @JsonKey(name: 'utility')
  final int? utility;
  @JsonKey(name: 'tutor_user')
  final int? tutorUser;
  @JsonKey(name: 'student_user')
  final int? studentUser;
  @JsonKey(name: 'tutorship_instance')
  final int? tutorshipInstance;
  static const fromJsonFactory = _$PatchedTutorUserReviewRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedTutorUserReviewRequest &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.occurred, occurred) ||
                const DeepCollectionEquality()
                    .equals(other.occurred, occurred)) &&
            (identical(other.absent, absent) ||
                const DeepCollectionEquality().equals(other.absent, absent)) &&
            (identical(other.utility, utility) ||
                const DeepCollectionEquality()
                    .equals(other.utility, utility)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)) &&
            (identical(other.studentUser, studentUser) ||
                const DeepCollectionEquality()
                    .equals(other.studentUser, studentUser)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(occurred) ^
      const DeepCollectionEquality().hash(absent) ^
      const DeepCollectionEquality().hash(utility) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      const DeepCollectionEquality().hash(studentUser) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      runtimeType.hashCode;
}

extension $PatchedTutorUserReviewRequestExtension
    on PatchedTutorUserReviewRequest {
  PatchedTutorUserReviewRequest copyWith(
      {String? comment,
      bool? occurred,
      bool? absent,
      int? utility,
      int? tutorUser,
      int? studentUser,
      int? tutorshipInstance}) {
    return PatchedTutorUserReviewRequest(
        comment: comment ?? this.comment,
        occurred: occurred ?? this.occurred,
        absent: absent ?? this.absent,
        utility: utility ?? this.utility,
        tutorUser: tutorUser ?? this.tutorUser,
        studentUser: studentUser ?? this.studentUser,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance);
  }

  PatchedTutorUserReviewRequest copyWithWrapped(
      {Wrapped<String?>? comment,
      Wrapped<bool?>? occurred,
      Wrapped<bool?>? absent,
      Wrapped<int?>? utility,
      Wrapped<int?>? tutorUser,
      Wrapped<int?>? studentUser,
      Wrapped<int?>? tutorshipInstance}) {
    return PatchedTutorUserReviewRequest(
        comment: (comment != null ? comment.value : this.comment),
        occurred: (occurred != null ? occurred.value : this.occurred),
        absent: (absent != null ? absent.value : this.absent),
        utility: (utility != null ? utility.value : this.utility),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser),
        studentUser:
            (studentUser != null ? studentUser.value : this.studentUser),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedTutorUserScheduleRequest {
  PatchedTutorUserScheduleRequest({
    this.modality,
    this.day,
    this.begin,
    this.end,
    this.capacity,
    this.tutorUser,
  });

  factory PatchedTutorUserScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedTutorUserScheduleRequestFromJson(json);

  static const toJsonFactory = _$PatchedTutorUserScheduleRequestToJson;
  Map<String, dynamic> toJson() =>
      _$PatchedTutorUserScheduleRequestToJson(this);

  @JsonKey(name: 'modality')
  final String? modality;
  @JsonKey(name: 'day')
  final String? day;
  @JsonKey(name: 'begin')
  final String? begin;
  @JsonKey(name: 'end')
  final String? end;
  @JsonKey(name: 'capacity')
  final int? capacity;
  @JsonKey(name: 'tutor_user')
  final int? tutorUser;
  static const fromJsonFactory = _$PatchedTutorUserScheduleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedTutorUserScheduleRequest &&
            (identical(other.modality, modality) ||
                const DeepCollectionEquality()
                    .equals(other.modality, modality)) &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.begin, begin) ||
                const DeepCollectionEquality().equals(other.begin, begin)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.capacity, capacity) ||
                const DeepCollectionEquality()
                    .equals(other.capacity, capacity)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(modality) ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(begin) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(capacity) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      runtimeType.hashCode;
}

extension $PatchedTutorUserScheduleRequestExtension
    on PatchedTutorUserScheduleRequest {
  PatchedTutorUserScheduleRequest copyWith(
      {String? modality,
      String? day,
      String? begin,
      String? end,
      int? capacity,
      int? tutorUser}) {
    return PatchedTutorUserScheduleRequest(
        modality: modality ?? this.modality,
        day: day ?? this.day,
        begin: begin ?? this.begin,
        end: end ?? this.end,
        capacity: capacity ?? this.capacity,
        tutorUser: tutorUser ?? this.tutorUser);
  }

  PatchedTutorUserScheduleRequest copyWithWrapped(
      {Wrapped<String?>? modality,
      Wrapped<String?>? day,
      Wrapped<String?>? begin,
      Wrapped<String?>? end,
      Wrapped<int?>? capacity,
      Wrapped<int?>? tutorUser}) {
    return PatchedTutorUserScheduleRequest(
        modality: (modality != null ? modality.value : this.modality),
        day: (day != null ? day.value : this.day),
        begin: (begin != null ? begin.value : this.begin),
        end: (end != null ? end.value : this.end),
        capacity: (capacity != null ? capacity.value : this.capacity),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedTutorshipInstanceRequest {
  PatchedTutorshipInstanceRequest({
    this.schedule,
    this.date,
    this.status,
  });

  factory PatchedTutorshipInstanceRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedTutorshipInstanceRequestFromJson(json);

  static const toJsonFactory = _$PatchedTutorshipInstanceRequestToJson;
  Map<String, dynamic> toJson() =>
      _$PatchedTutorshipInstanceRequestToJson(this);

  @JsonKey(name: 'schedule')
  final TutorUserScheduleRequest? schedule;
  @JsonKey(name: 'date', toJson: _dateToJson)
  final DateTime? date;
  @JsonKey(name: 'status')
  final String? status;
  static const fromJsonFactory = _$PatchedTutorshipInstanceRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedTutorshipInstanceRequest &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $PatchedTutorshipInstanceRequestExtension
    on PatchedTutorshipInstanceRequest {
  PatchedTutorshipInstanceRequest copyWith(
      {TutorUserScheduleRequest? schedule, DateTime? date, String? status}) {
    return PatchedTutorshipInstanceRequest(
        schedule: schedule ?? this.schedule,
        date: date ?? this.date,
        status: status ?? this.status);
  }

  PatchedTutorshipInstanceRequest copyWithWrapped(
      {Wrapped<TutorUserScheduleRequest?>? schedule,
      Wrapped<DateTime?>? date,
      Wrapped<String?>? status}) {
    return PatchedTutorshipInstanceRequest(
        schedule: (schedule != null ? schedule.value : this.schedule),
        date: (date != null ? date.value : this.date),
        status: (status != null ? status.value : this.status));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedTutorshipReportRequest {
  PatchedTutorshipReportRequest({
    this.comment,
    this.subject,
    this.tutorshipInstance,
    this.tutorUser,
  });

  factory PatchedTutorshipReportRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedTutorshipReportRequestFromJson(json);

  static const toJsonFactory = _$PatchedTutorshipReportRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedTutorshipReportRequestToJson(this);

  @JsonKey(name: 'comment')
  final String? comment;
  @JsonKey(name: 'subject')
  final String? subject;
  @JsonKey(name: 'tutorship_instance')
  final int? tutorshipInstance;
  @JsonKey(name: 'tutor_user')
  final int? tutorUser;
  static const fromJsonFactory = _$PatchedTutorshipReportRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedTutorshipReportRequest &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      runtimeType.hashCode;
}

extension $PatchedTutorshipReportRequestExtension
    on PatchedTutorshipReportRequest {
  PatchedTutorshipReportRequest copyWith(
      {String? comment,
      String? subject,
      int? tutorshipInstance,
      int? tutorUser}) {
    return PatchedTutorshipReportRequest(
        comment: comment ?? this.comment,
        subject: subject ?? this.subject,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance,
        tutorUser: tutorUser ?? this.tutorUser);
  }

  PatchedTutorshipReportRequest copyWithWrapped(
      {Wrapped<String?>? comment,
      Wrapped<String?>? subject,
      Wrapped<int?>? tutorshipInstance,
      Wrapped<int?>? tutorUser}) {
    return PatchedTutorshipReportRequest(
        comment: (comment != null ? comment.value : this.comment),
        subject: (subject != null ? subject.value : this.subject),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedUserRequest {
  PatchedUserRequest({
    this.name,
    this.lastName,
    this.uccKey,
    this.email,
    this.academicYear,
  });

  factory PatchedUserRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedUserRequestFromJson(json);

  static const toJsonFactory = _$PatchedUserRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedUserRequestToJson(this);

  @JsonKey(name: 'name')
  final String? name;
  @JsonKey(name: 'last_name')
  final String? lastName;
  @JsonKey(name: 'ucc_key')
  final int? uccKey;
  @JsonKey(name: 'email')
  final String? email;
  @JsonKey(name: 'academic_year')
  final int? academicYear;
  static const fromJsonFactory = _$PatchedUserRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedUserRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.uccKey, uccKey) ||
                const DeepCollectionEquality().equals(other.uccKey, uccKey)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.academicYear, academicYear) ||
                const DeepCollectionEquality()
                    .equals(other.academicYear, academicYear)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(uccKey) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(academicYear) ^
      runtimeType.hashCode;
}

extension $PatchedUserRequestExtension on PatchedUserRequest {
  PatchedUserRequest copyWith(
      {String? name,
      String? lastName,
      int? uccKey,
      String? email,
      int? academicYear}) {
    return PatchedUserRequest(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        uccKey: uccKey ?? this.uccKey,
        email: email ?? this.email,
        academicYear: academicYear ?? this.academicYear);
  }

  PatchedUserRequest copyWithWrapped(
      {Wrapped<String?>? name,
      Wrapped<String?>? lastName,
      Wrapped<int?>? uccKey,
      Wrapped<String?>? email,
      Wrapped<int?>? academicYear}) {
    return PatchedUserRequest(
        name: (name != null ? name.value : this.name),
        lastName: (lastName != null ? lastName.value : this.lastName),
        uccKey: (uccKey != null ? uccKey.value : this.uccKey),
        email: (email != null ? email.value : this.email),
        academicYear:
            (academicYear != null ? academicYear.value : this.academicYear));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedUserXAreaRequest {
  PatchedUserXAreaRequest({
    this.user,
    this.area,
  });

  factory PatchedUserXAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedUserXAreaRequestFromJson(json);

  static const toJsonFactory = _$PatchedUserXAreaRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedUserXAreaRequestToJson(this);

  @JsonKey(name: 'user')
  final int? user;
  @JsonKey(name: 'area')
  final int? area;
  static const fromJsonFactory = _$PatchedUserXAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedUserXAreaRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $PatchedUserXAreaRequestExtension on PatchedUserXAreaRequest {
  PatchedUserXAreaRequest copyWith({int? user, int? area}) {
    return PatchedUserXAreaRequest(
        user: user ?? this.user, area: area ?? this.area);
  }

  PatchedUserXAreaRequest copyWithWrapped(
      {Wrapped<int?>? user, Wrapped<int?>? area}) {
    return PatchedUserXAreaRequest(
        user: (user != null ? user.value : this.user),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedUserXRoleRequest {
  PatchedUserXRoleRequest({
    this.user,
    this.role,
  });

  factory PatchedUserXRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$PatchedUserXRoleRequestFromJson(json);

  static const toJsonFactory = _$PatchedUserXRoleRequestToJson;
  Map<String, dynamic> toJson() => _$PatchedUserXRoleRequestToJson(this);

  @JsonKey(name: 'user')
  final int? user;
  @JsonKey(name: 'role')
  final int? role;
  static const fromJsonFactory = _$PatchedUserXRoleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedUserXRoleRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $PatchedUserXRoleRequestExtension on PatchedUserXRoleRequest {
  PatchedUserXRoleRequest copyWith({int? user, int? role}) {
    return PatchedUserXRoleRequest(
        user: user ?? this.user, role: role ?? this.role);
  }

  PatchedUserXRoleRequest copyWithWrapped(
      {Wrapped<int?>? user, Wrapped<int?>? role}) {
    return PatchedUserXRoleRequest(
        user: (user != null ? user.value : this.user),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class PatchedUserXTutorshipInstanceXRoleRequest {
  PatchedUserXTutorshipInstanceXRoleRequest({
    this.user,
    this.tutorshipInstance,
    this.role,
  });

  factory PatchedUserXTutorshipInstanceXRoleRequest.fromJson(
          Map<String, dynamic> json) =>
      _$PatchedUserXTutorshipInstanceXRoleRequestFromJson(json);

  static const toJsonFactory =
      _$PatchedUserXTutorshipInstanceXRoleRequestToJson;
  Map<String, dynamic> toJson() =>
      _$PatchedUserXTutorshipInstanceXRoleRequestToJson(this);

  @JsonKey(name: 'user')
  final int? user;
  @JsonKey(name: 'tutorship_instance')
  final int? tutorshipInstance;
  @JsonKey(name: 'role')
  final int? role;
  static const fromJsonFactory =
      _$PatchedUserXTutorshipInstanceXRoleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PatchedUserXTutorshipInstanceXRoleRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $PatchedUserXTutorshipInstanceXRoleRequestExtension
    on PatchedUserXTutorshipInstanceXRoleRequest {
  PatchedUserXTutorshipInstanceXRoleRequest copyWith(
      {int? user, int? tutorshipInstance, int? role}) {
    return PatchedUserXTutorshipInstanceXRoleRequest(
        user: user ?? this.user,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance,
        role: role ?? this.role);
  }

  PatchedUserXTutorshipInstanceXRoleRequest copyWithWrapped(
      {Wrapped<int?>? user,
      Wrapped<int?>? tutorshipInstance,
      Wrapped<int?>? role}) {
    return PatchedUserXTutorshipInstanceXRoleRequest(
        user: (user != null ? user.value : this.user),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class Postulation {
  Postulation({
    required this.id,
    required this.date,
    required this.status,
    required this.studentUser,
    required this.coordinatorUser,
  });

  factory Postulation.fromJson(Map<String, dynamic> json) =>
      _$PostulationFromJson(json);

  static const toJsonFactory = _$PostulationToJson;
  Map<String, dynamic> toJson() => _$PostulationToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'student_user')
  final int studentUser;
  @JsonKey(name: 'coordinator_user')
  final int coordinatorUser;
  static const fromJsonFactory = _$PostulationFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Postulation &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.studentUser, studentUser) ||
                const DeepCollectionEquality()
                    .equals(other.studentUser, studentUser)) &&
            (identical(other.coordinatorUser, coordinatorUser) ||
                const DeepCollectionEquality()
                    .equals(other.coordinatorUser, coordinatorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(studentUser) ^
      const DeepCollectionEquality().hash(coordinatorUser) ^
      runtimeType.hashCode;
}

extension $PostulationExtension on Postulation {
  Postulation copyWith(
      {int? id,
      DateTime? date,
      String? status,
      int? studentUser,
      int? coordinatorUser}) {
    return Postulation(
        id: id ?? this.id,
        date: date ?? this.date,
        status: status ?? this.status,
        studentUser: studentUser ?? this.studentUser,
        coordinatorUser: coordinatorUser ?? this.coordinatorUser);
  }

  Postulation copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<DateTime>? date,
      Wrapped<String>? status,
      Wrapped<int>? studentUser,
      Wrapped<int>? coordinatorUser}) {
    return Postulation(
        id: (id != null ? id.value : this.id),
        date: (date != null ? date.value : this.date),
        status: (status != null ? status.value : this.status),
        studentUser:
            (studentUser != null ? studentUser.value : this.studentUser),
        coordinatorUser: (coordinatorUser != null
            ? coordinatorUser.value
            : this.coordinatorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class PostulationRequest {
  PostulationRequest({
    required this.date,
    required this.status,
    required this.studentUser,
    required this.coordinatorUser,
  });

  factory PostulationRequest.fromJson(Map<String, dynamic> json) =>
      _$PostulationRequestFromJson(json);

  static const toJsonFactory = _$PostulationRequestToJson;
  Map<String, dynamic> toJson() => _$PostulationRequestToJson(this);

  @JsonKey(name: 'date')
  final DateTime date;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'student_user')
  final int studentUser;
  @JsonKey(name: 'coordinator_user')
  final int coordinatorUser;
  static const fromJsonFactory = _$PostulationRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostulationRequest &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.studentUser, studentUser) ||
                const DeepCollectionEquality()
                    .equals(other.studentUser, studentUser)) &&
            (identical(other.coordinatorUser, coordinatorUser) ||
                const DeepCollectionEquality()
                    .equals(other.coordinatorUser, coordinatorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(studentUser) ^
      const DeepCollectionEquality().hash(coordinatorUser) ^
      runtimeType.hashCode;
}

extension $PostulationRequestExtension on PostulationRequest {
  PostulationRequest copyWith(
      {DateTime? date,
      String? status,
      int? studentUser,
      int? coordinatorUser}) {
    return PostulationRequest(
        date: date ?? this.date,
        status: status ?? this.status,
        studentUser: studentUser ?? this.studentUser,
        coordinatorUser: coordinatorUser ?? this.coordinatorUser);
  }

  PostulationRequest copyWithWrapped(
      {Wrapped<DateTime>? date,
      Wrapped<String>? status,
      Wrapped<int>? studentUser,
      Wrapped<int>? coordinatorUser}) {
    return PostulationRequest(
        date: (date != null ? date.value : this.date),
        status: (status != null ? status.value : this.status),
        studentUser:
            (studentUser != null ? studentUser.value : this.studentUser),
        coordinatorUser: (coordinatorUser != null
            ? coordinatorUser.value
            : this.coordinatorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class PostulationXArea {
  PostulationXArea({
    required this.id,
    required this.postulation,
    required this.area,
  });

  factory PostulationXArea.fromJson(Map<String, dynamic> json) =>
      _$PostulationXAreaFromJson(json);

  static const toJsonFactory = _$PostulationXAreaToJson;
  Map<String, dynamic> toJson() => _$PostulationXAreaToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'postulation')
  final int postulation;
  @JsonKey(name: 'area')
  final int area;
  static const fromJsonFactory = _$PostulationXAreaFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostulationXArea &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.postulation, postulation) ||
                const DeepCollectionEquality()
                    .equals(other.postulation, postulation)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(postulation) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $PostulationXAreaExtension on PostulationXArea {
  PostulationXArea copyWith({int? id, int? postulation, int? area}) {
    return PostulationXArea(
        id: id ?? this.id,
        postulation: postulation ?? this.postulation,
        area: area ?? this.area);
  }

  PostulationXArea copyWithWrapped(
      {Wrapped<int>? id, Wrapped<int>? postulation, Wrapped<int>? area}) {
    return PostulationXArea(
        id: (id != null ? id.value : this.id),
        postulation:
            (postulation != null ? postulation.value : this.postulation),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class PostulationXAreaRequest {
  PostulationXAreaRequest({
    required this.postulation,
    required this.area,
  });

  factory PostulationXAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$PostulationXAreaRequestFromJson(json);

  static const toJsonFactory = _$PostulationXAreaRequestToJson;
  Map<String, dynamic> toJson() => _$PostulationXAreaRequestToJson(this);

  @JsonKey(name: 'postulation')
  final int postulation;
  @JsonKey(name: 'area')
  final int area;
  static const fromJsonFactory = _$PostulationXAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PostulationXAreaRequest &&
            (identical(other.postulation, postulation) ||
                const DeepCollectionEquality()
                    .equals(other.postulation, postulation)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(postulation) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $PostulationXAreaRequestExtension on PostulationXAreaRequest {
  PostulationXAreaRequest copyWith({int? postulation, int? area}) {
    return PostulationXAreaRequest(
        postulation: postulation ?? this.postulation, area: area ?? this.area);
  }

  PostulationXAreaRequest copyWithWrapped(
      {Wrapped<int>? postulation, Wrapped<int>? area}) {
    return PostulationXAreaRequest(
        postulation:
            (postulation != null ? postulation.value : this.postulation),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class Role {
  Role({
    required this.id,
    required this.title,
    required this.type,
    required this.description,
    required this.users,
  });

  factory Role.fromJson(Map<String, dynamic> json) => _$RoleFromJson(json);

  static const toJsonFactory = _$RoleToJson;
  Map<String, dynamic> toJson() => _$RoleToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'users', defaultValue: <int>[])
  final List<int> users;
  static const fromJsonFactory = _$RoleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Role &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      const DeepCollectionEquality().hash(users) ^
      runtimeType.hashCode;
}

extension $RoleExtension on Role {
  Role copyWith(
      {int? id,
      String? title,
      String? type,
      String? description,
      List<int>? users}) {
    return Role(
        id: id ?? this.id,
        title: title ?? this.title,
        type: type ?? this.type,
        description: description ?? this.description,
        users: users ?? this.users);
  }

  Role copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? title,
      Wrapped<String>? type,
      Wrapped<String>? description,
      Wrapped<List<int>>? users}) {
    return Role(
        id: (id != null ? id.value : this.id),
        title: (title != null ? title.value : this.title),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description),
        users: (users != null ? users.value : this.users));
  }
}

@JsonSerializable(explicitToJson: true)
class RoleRequest {
  RoleRequest({
    required this.title,
    required this.type,
    required this.description,
  });

  factory RoleRequest.fromJson(Map<String, dynamic> json) =>
      _$RoleRequestFromJson(json);

  static const toJsonFactory = _$RoleRequestToJson;
  Map<String, dynamic> toJson() => _$RoleRequestToJson(this);

  @JsonKey(name: 'title')
  final String title;
  @JsonKey(name: 'type')
  final String type;
  @JsonKey(name: 'description')
  final String description;
  static const fromJsonFactory = _$RoleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is RoleRequest &&
            (identical(other.title, title) ||
                const DeepCollectionEquality().equals(other.title, title)) &&
            (identical(other.type, type) ||
                const DeepCollectionEquality().equals(other.type, type)) &&
            (identical(other.description, description) ||
                const DeepCollectionEquality()
                    .equals(other.description, description)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(title) ^
      const DeepCollectionEquality().hash(type) ^
      const DeepCollectionEquality().hash(description) ^
      runtimeType.hashCode;
}

extension $RoleRequestExtension on RoleRequest {
  RoleRequest copyWith({String? title, String? type, String? description}) {
    return RoleRequest(
        title: title ?? this.title,
        type: type ?? this.type,
        description: description ?? this.description);
  }

  RoleRequest copyWithWrapped(
      {Wrapped<String>? title,
      Wrapped<String>? type,
      Wrapped<String>? description}) {
    return RoleRequest(
        title: (title != null ? title.value : this.title),
        type: (type != null ? type.value : this.type),
        description:
            (description != null ? description.value : this.description));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorUserReview {
  TutorUserReview({
    required this.id,
    required this.comment,
    required this.occurred,
    required this.absent,
    required this.utility,
    required this.tutorUser,
    required this.studentUser,
    required this.tutorshipInstance,
  });

  factory TutorUserReview.fromJson(Map<String, dynamic> json) =>
      _$TutorUserReviewFromJson(json);

  static const toJsonFactory = _$TutorUserReviewToJson;
  Map<String, dynamic> toJson() => _$TutorUserReviewToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'occurred')
  final bool occurred;
  @JsonKey(name: 'absent')
  final bool absent;
  @JsonKey(name: 'utility')
  final int utility;
  @JsonKey(name: 'tutor_user')
  final int tutorUser;
  @JsonKey(name: 'student_user')
  final int studentUser;
  @JsonKey(name: 'tutorship_instance')
  final int tutorshipInstance;
  static const fromJsonFactory = _$TutorUserReviewFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorUserReview &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.occurred, occurred) ||
                const DeepCollectionEquality()
                    .equals(other.occurred, occurred)) &&
            (identical(other.absent, absent) ||
                const DeepCollectionEquality().equals(other.absent, absent)) &&
            (identical(other.utility, utility) ||
                const DeepCollectionEquality()
                    .equals(other.utility, utility)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)) &&
            (identical(other.studentUser, studentUser) ||
                const DeepCollectionEquality()
                    .equals(other.studentUser, studentUser)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(occurred) ^
      const DeepCollectionEquality().hash(absent) ^
      const DeepCollectionEquality().hash(utility) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      const DeepCollectionEquality().hash(studentUser) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      runtimeType.hashCode;
}

extension $TutorUserReviewExtension on TutorUserReview {
  TutorUserReview copyWith(
      {int? id,
      String? comment,
      bool? occurred,
      bool? absent,
      int? utility,
      int? tutorUser,
      int? studentUser,
      int? tutorshipInstance}) {
    return TutorUserReview(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        occurred: occurred ?? this.occurred,
        absent: absent ?? this.absent,
        utility: utility ?? this.utility,
        tutorUser: tutorUser ?? this.tutorUser,
        studentUser: studentUser ?? this.studentUser,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance);
  }

  TutorUserReview copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? comment,
      Wrapped<bool>? occurred,
      Wrapped<bool>? absent,
      Wrapped<int>? utility,
      Wrapped<int>? tutorUser,
      Wrapped<int>? studentUser,
      Wrapped<int>? tutorshipInstance}) {
    return TutorUserReview(
        id: (id != null ? id.value : this.id),
        comment: (comment != null ? comment.value : this.comment),
        occurred: (occurred != null ? occurred.value : this.occurred),
        absent: (absent != null ? absent.value : this.absent),
        utility: (utility != null ? utility.value : this.utility),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser),
        studentUser:
            (studentUser != null ? studentUser.value : this.studentUser),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorUserReviewRequest {
  TutorUserReviewRequest({
    required this.comment,
    required this.occurred,
    required this.absent,
    required this.utility,
    required this.tutorUser,
    required this.studentUser,
    required this.tutorshipInstance,
  });

  factory TutorUserReviewRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorUserReviewRequestFromJson(json);

  static const toJsonFactory = _$TutorUserReviewRequestToJson;
  Map<String, dynamic> toJson() => _$TutorUserReviewRequestToJson(this);

  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'occurred')
  final bool occurred;
  @JsonKey(name: 'absent')
  final bool absent;
  @JsonKey(name: 'utility')
  final int utility;
  @JsonKey(name: 'tutor_user')
  final int tutorUser;
  @JsonKey(name: 'student_user')
  final int studentUser;
  @JsonKey(name: 'tutorship_instance')
  final int tutorshipInstance;
  static const fromJsonFactory = _$TutorUserReviewRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorUserReviewRequest &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.occurred, occurred) ||
                const DeepCollectionEquality()
                    .equals(other.occurred, occurred)) &&
            (identical(other.absent, absent) ||
                const DeepCollectionEquality().equals(other.absent, absent)) &&
            (identical(other.utility, utility) ||
                const DeepCollectionEquality()
                    .equals(other.utility, utility)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)) &&
            (identical(other.studentUser, studentUser) ||
                const DeepCollectionEquality()
                    .equals(other.studentUser, studentUser)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(occurred) ^
      const DeepCollectionEquality().hash(absent) ^
      const DeepCollectionEquality().hash(utility) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      const DeepCollectionEquality().hash(studentUser) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      runtimeType.hashCode;
}

extension $TutorUserReviewRequestExtension on TutorUserReviewRequest {
  TutorUserReviewRequest copyWith(
      {String? comment,
      bool? occurred,
      bool? absent,
      int? utility,
      int? tutorUser,
      int? studentUser,
      int? tutorshipInstance}) {
    return TutorUserReviewRequest(
        comment: comment ?? this.comment,
        occurred: occurred ?? this.occurred,
        absent: absent ?? this.absent,
        utility: utility ?? this.utility,
        tutorUser: tutorUser ?? this.tutorUser,
        studentUser: studentUser ?? this.studentUser,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance);
  }

  TutorUserReviewRequest copyWithWrapped(
      {Wrapped<String>? comment,
      Wrapped<bool>? occurred,
      Wrapped<bool>? absent,
      Wrapped<int>? utility,
      Wrapped<int>? tutorUser,
      Wrapped<int>? studentUser,
      Wrapped<int>? tutorshipInstance}) {
    return TutorUserReviewRequest(
        comment: (comment != null ? comment.value : this.comment),
        occurred: (occurred != null ? occurred.value : this.occurred),
        absent: (absent != null ? absent.value : this.absent),
        utility: (utility != null ? utility.value : this.utility),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser),
        studentUser:
            (studentUser != null ? studentUser.value : this.studentUser),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorUserSchedule {
  TutorUserSchedule({
    required this.id,
    required this.modality,
    required this.day,
    required this.begin,
    required this.end,
    required this.capacity,
    required this.tutorUser,
  });

  factory TutorUserSchedule.fromJson(Map<String, dynamic> json) =>
      _$TutorUserScheduleFromJson(json);

  static const toJsonFactory = _$TutorUserScheduleToJson;
  Map<String, dynamic> toJson() => _$TutorUserScheduleToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'modality')
  final String modality;
  @JsonKey(name: 'day')
  final String day;
  @JsonKey(name: 'begin')
  final String begin;
  @JsonKey(name: 'end')
  final String end;
  @JsonKey(name: 'capacity')
  final int capacity;
  @JsonKey(name: 'tutor_user')
  final int tutorUser;
  static const fromJsonFactory = _$TutorUserScheduleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorUserSchedule &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.modality, modality) ||
                const DeepCollectionEquality()
                    .equals(other.modality, modality)) &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.begin, begin) ||
                const DeepCollectionEquality().equals(other.begin, begin)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.capacity, capacity) ||
                const DeepCollectionEquality()
                    .equals(other.capacity, capacity)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(modality) ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(begin) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(capacity) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      runtimeType.hashCode;
}

extension $TutorUserScheduleExtension on TutorUserSchedule {
  TutorUserSchedule copyWith(
      {int? id,
      String? modality,
      String? day,
      String? begin,
      String? end,
      int? capacity,
      int? tutorUser}) {
    return TutorUserSchedule(
        id: id ?? this.id,
        modality: modality ?? this.modality,
        day: day ?? this.day,
        begin: begin ?? this.begin,
        end: end ?? this.end,
        capacity: capacity ?? this.capacity,
        tutorUser: tutorUser ?? this.tutorUser);
  }

  TutorUserSchedule copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? modality,
      Wrapped<String>? day,
      Wrapped<String>? begin,
      Wrapped<String>? end,
      Wrapped<int>? capacity,
      Wrapped<int>? tutorUser}) {
    return TutorUserSchedule(
        id: (id != null ? id.value : this.id),
        modality: (modality != null ? modality.value : this.modality),
        day: (day != null ? day.value : this.day),
        begin: (begin != null ? begin.value : this.begin),
        end: (end != null ? end.value : this.end),
        capacity: (capacity != null ? capacity.value : this.capacity),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorUserScheduleRequest {
  TutorUserScheduleRequest({
    required this.modality,
    required this.day,
    required this.begin,
    required this.end,
    required this.capacity,
    required this.tutorUser,
  });

  factory TutorUserScheduleRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorUserScheduleRequestFromJson(json);

  static const toJsonFactory = _$TutorUserScheduleRequestToJson;
  Map<String, dynamic> toJson() => _$TutorUserScheduleRequestToJson(this);

  @JsonKey(name: 'modality')
  final String modality;
  @JsonKey(name: 'day')
  final String day;
  @JsonKey(name: 'begin')
  final String begin;
  @JsonKey(name: 'end')
  final String end;
  @JsonKey(name: 'capacity')
  final int capacity;
  @JsonKey(name: 'tutor_user')
  final int tutorUser;
  static const fromJsonFactory = _$TutorUserScheduleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorUserScheduleRequest &&
            (identical(other.modality, modality) ||
                const DeepCollectionEquality()
                    .equals(other.modality, modality)) &&
            (identical(other.day, day) ||
                const DeepCollectionEquality().equals(other.day, day)) &&
            (identical(other.begin, begin) ||
                const DeepCollectionEquality().equals(other.begin, begin)) &&
            (identical(other.end, end) ||
                const DeepCollectionEquality().equals(other.end, end)) &&
            (identical(other.capacity, capacity) ||
                const DeepCollectionEquality()
                    .equals(other.capacity, capacity)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(modality) ^
      const DeepCollectionEquality().hash(day) ^
      const DeepCollectionEquality().hash(begin) ^
      const DeepCollectionEquality().hash(end) ^
      const DeepCollectionEquality().hash(capacity) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      runtimeType.hashCode;
}

extension $TutorUserScheduleRequestExtension on TutorUserScheduleRequest {
  TutorUserScheduleRequest copyWith(
      {String? modality,
      String? day,
      String? begin,
      String? end,
      int? capacity,
      int? tutorUser}) {
    return TutorUserScheduleRequest(
        modality: modality ?? this.modality,
        day: day ?? this.day,
        begin: begin ?? this.begin,
        end: end ?? this.end,
        capacity: capacity ?? this.capacity,
        tutorUser: tutorUser ?? this.tutorUser);
  }

  TutorUserScheduleRequest copyWithWrapped(
      {Wrapped<String>? modality,
      Wrapped<String>? day,
      Wrapped<String>? begin,
      Wrapped<String>? end,
      Wrapped<int>? capacity,
      Wrapped<int>? tutorUser}) {
    return TutorUserScheduleRequest(
        modality: (modality != null ? modality.value : this.modality),
        day: (day != null ? day.value : this.day),
        begin: (begin != null ? begin.value : this.begin),
        end: (end != null ? end.value : this.end),
        capacity: (capacity != null ? capacity.value : this.capacity),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorshipInstance {
  TutorshipInstance({
    required this.id,
    required this.area,
    required this.schedule,
    required this.date,
    required this.status,
    required this.users,
  });

  factory TutorshipInstance.fromJson(Map<String, dynamic> json) =>
      _$TutorshipInstanceFromJson(json);

  static const toJsonFactory = _$TutorshipInstanceToJson;
  Map<String, dynamic> toJson() => _$TutorshipInstanceToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'area')
  final String area;
  @JsonKey(name: 'schedule')
  final TutorUserSchedule schedule;
  @JsonKey(name: 'date', toJson: _dateToJson)
  final DateTime date;
  @JsonKey(name: 'status')
  final String status;
  @JsonKey(name: 'users', defaultValue: <int>[])
  final List<int> users;
  static const fromJsonFactory = _$TutorshipInstanceFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorshipInstance &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)) &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)) &&
            (identical(other.users, users) ||
                const DeepCollectionEquality().equals(other.users, users)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(area) ^
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(status) ^
      const DeepCollectionEquality().hash(users) ^
      runtimeType.hashCode;
}

extension $TutorshipInstanceExtension on TutorshipInstance {
  TutorshipInstance copyWith(
      {int? id,
      String? area,
      TutorUserSchedule? schedule,
      DateTime? date,
      String? status,
      List<int>? users}) {
    return TutorshipInstance(
        id: id ?? this.id,
        area: area ?? this.area,
        schedule: schedule ?? this.schedule,
        date: date ?? this.date,
        status: status ?? this.status,
        users: users ?? this.users);
  }

  TutorshipInstance copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? area,
      Wrapped<TutorUserSchedule>? schedule,
      Wrapped<DateTime>? date,
      Wrapped<String>? status,
      Wrapped<List<int>>? users}) {
    return TutorshipInstance(
        id: (id != null ? id.value : this.id),
        area: (area != null ? area.value : this.area),
        schedule: (schedule != null ? schedule.value : this.schedule),
        date: (date != null ? date.value : this.date),
        status: (status != null ? status.value : this.status),
        users: (users != null ? users.value : this.users));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorshipInstanceRequest {
  TutorshipInstanceRequest({
    required this.schedule,
    required this.date,
    required this.status,
  });

  factory TutorshipInstanceRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorshipInstanceRequestFromJson(json);

  static const toJsonFactory = _$TutorshipInstanceRequestToJson;
  Map<String, dynamic> toJson() => _$TutorshipInstanceRequestToJson(this);

  @JsonKey(name: 'schedule')
  final TutorUserScheduleRequest schedule;
  @JsonKey(name: 'date', toJson: _dateToJson)
  final DateTime date;
  @JsonKey(name: 'status')
  final String status;
  static const fromJsonFactory = _$TutorshipInstanceRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorshipInstanceRequest &&
            (identical(other.schedule, schedule) ||
                const DeepCollectionEquality()
                    .equals(other.schedule, schedule)) &&
            (identical(other.date, date) ||
                const DeepCollectionEquality().equals(other.date, date)) &&
            (identical(other.status, status) ||
                const DeepCollectionEquality().equals(other.status, status)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(schedule) ^
      const DeepCollectionEquality().hash(date) ^
      const DeepCollectionEquality().hash(status) ^
      runtimeType.hashCode;
}

extension $TutorshipInstanceRequestExtension on TutorshipInstanceRequest {
  TutorshipInstanceRequest copyWith(
      {TutorUserScheduleRequest? schedule, DateTime? date, String? status}) {
    return TutorshipInstanceRequest(
        schedule: schedule ?? this.schedule,
        date: date ?? this.date,
        status: status ?? this.status);
  }

  TutorshipInstanceRequest copyWithWrapped(
      {Wrapped<TutorUserScheduleRequest>? schedule,
      Wrapped<DateTime>? date,
      Wrapped<String>? status}) {
    return TutorshipInstanceRequest(
        schedule: (schedule != null ? schedule.value : this.schedule),
        date: (date != null ? date.value : this.date),
        status: (status != null ? status.value : this.status));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorshipReport {
  TutorshipReport({
    required this.id,
    required this.comment,
    required this.subject,
    required this.tutorshipInstance,
    required this.tutorUser,
  });

  factory TutorshipReport.fromJson(Map<String, dynamic> json) =>
      _$TutorshipReportFromJson(json);

  static const toJsonFactory = _$TutorshipReportToJson;
  Map<String, dynamic> toJson() => _$TutorshipReportToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'subject')
  final String subject;
  @JsonKey(name: 'tutorship_instance')
  final int tutorshipInstance;
  @JsonKey(name: 'tutor_user')
  final int tutorUser;
  static const fromJsonFactory = _$TutorshipReportFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorshipReport &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      runtimeType.hashCode;
}

extension $TutorshipReportExtension on TutorshipReport {
  TutorshipReport copyWith(
      {int? id,
      String? comment,
      String? subject,
      int? tutorshipInstance,
      int? tutorUser}) {
    return TutorshipReport(
        id: id ?? this.id,
        comment: comment ?? this.comment,
        subject: subject ?? this.subject,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance,
        tutorUser: tutorUser ?? this.tutorUser);
  }

  TutorshipReport copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<String>? comment,
      Wrapped<String>? subject,
      Wrapped<int>? tutorshipInstance,
      Wrapped<int>? tutorUser}) {
    return TutorshipReport(
        id: (id != null ? id.value : this.id),
        comment: (comment != null ? comment.value : this.comment),
        subject: (subject != null ? subject.value : this.subject),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class TutorshipReportRequest {
  TutorshipReportRequest({
    required this.comment,
    required this.subject,
    required this.tutorshipInstance,
    required this.tutorUser,
  });

  factory TutorshipReportRequest.fromJson(Map<String, dynamic> json) =>
      _$TutorshipReportRequestFromJson(json);

  static const toJsonFactory = _$TutorshipReportRequestToJson;
  Map<String, dynamic> toJson() => _$TutorshipReportRequestToJson(this);

  @JsonKey(name: 'comment')
  final String comment;
  @JsonKey(name: 'subject')
  final String subject;
  @JsonKey(name: 'tutorship_instance')
  final int tutorshipInstance;
  @JsonKey(name: 'tutor_user')
  final int tutorUser;
  static const fromJsonFactory = _$TutorshipReportRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is TutorshipReportRequest &&
            (identical(other.comment, comment) ||
                const DeepCollectionEquality()
                    .equals(other.comment, comment)) &&
            (identical(other.subject, subject) ||
                const DeepCollectionEquality()
                    .equals(other.subject, subject)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)) &&
            (identical(other.tutorUser, tutorUser) ||
                const DeepCollectionEquality()
                    .equals(other.tutorUser, tutorUser)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(comment) ^
      const DeepCollectionEquality().hash(subject) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      const DeepCollectionEquality().hash(tutorUser) ^
      runtimeType.hashCode;
}

extension $TutorshipReportRequestExtension on TutorshipReportRequest {
  TutorshipReportRequest copyWith(
      {String? comment,
      String? subject,
      int? tutorshipInstance,
      int? tutorUser}) {
    return TutorshipReportRequest(
        comment: comment ?? this.comment,
        subject: subject ?? this.subject,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance,
        tutorUser: tutorUser ?? this.tutorUser);
  }

  TutorshipReportRequest copyWithWrapped(
      {Wrapped<String>? comment,
      Wrapped<String>? subject,
      Wrapped<int>? tutorshipInstance,
      Wrapped<int>? tutorUser}) {
    return TutorshipReportRequest(
        comment: (comment != null ? comment.value : this.comment),
        subject: (subject != null ? subject.value : this.subject),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance),
        tutorUser: (tutorUser != null ? tutorUser.value : this.tutorUser));
  }
}

@JsonSerializable(explicitToJson: true)
class User {
  User({
    required this.id,
    required this.careers,
    required this.roles,
    required this.name,
    required this.lastName,
    required this.uccKey,
    required this.email,
    required this.academicYear,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  static const toJsonFactory = _$UserToJson;
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'careers', defaultValue: <String>[])
  final List<String> careers;
  @JsonKey(name: 'roles', defaultValue: <String>[])
  final List<String> roles;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'ucc_key')
  final int uccKey;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'academic_year')
  final int academicYear;
  static const fromJsonFactory = _$UserFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is User &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.careers, careers) ||
                const DeepCollectionEquality()
                    .equals(other.careers, careers)) &&
            (identical(other.roles, roles) ||
                const DeepCollectionEquality().equals(other.roles, roles)) &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.uccKey, uccKey) ||
                const DeepCollectionEquality().equals(other.uccKey, uccKey)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.academicYear, academicYear) ||
                const DeepCollectionEquality()
                    .equals(other.academicYear, academicYear)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(careers) ^
      const DeepCollectionEquality().hash(roles) ^
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(uccKey) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(academicYear) ^
      runtimeType.hashCode;
}

extension $UserExtension on User {
  User copyWith(
      {int? id,
      List<String>? careers,
      List<String>? roles,
      String? name,
      String? lastName,
      int? uccKey,
      String? email,
      int? academicYear}) {
    return User(
        id: id ?? this.id,
        careers: careers ?? this.careers,
        roles: roles ?? this.roles,
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        uccKey: uccKey ?? this.uccKey,
        email: email ?? this.email,
        academicYear: academicYear ?? this.academicYear);
  }

  User copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<List<String>>? careers,
      Wrapped<List<String>>? roles,
      Wrapped<String>? name,
      Wrapped<String>? lastName,
      Wrapped<int>? uccKey,
      Wrapped<String>? email,
      Wrapped<int>? academicYear}) {
    return User(
        id: (id != null ? id.value : this.id),
        careers: (careers != null ? careers.value : this.careers),
        roles: (roles != null ? roles.value : this.roles),
        name: (name != null ? name.value : this.name),
        lastName: (lastName != null ? lastName.value : this.lastName),
        uccKey: (uccKey != null ? uccKey.value : this.uccKey),
        email: (email != null ? email.value : this.email),
        academicYear:
            (academicYear != null ? academicYear.value : this.academicYear));
  }
}

@JsonSerializable(explicitToJson: true)
class UserRequest {
  UserRequest({
    required this.name,
    required this.lastName,
    required this.uccKey,
    required this.email,
    required this.academicYear,
  });

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  static const toJsonFactory = _$UserRequestToJson;
  Map<String, dynamic> toJson() => _$UserRequestToJson(this);

  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'last_name')
  final String lastName;
  @JsonKey(name: 'ucc_key')
  final int uccKey;
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'academic_year')
  final int academicYear;
  static const fromJsonFactory = _$UserRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserRequest &&
            (identical(other.name, name) ||
                const DeepCollectionEquality().equals(other.name, name)) &&
            (identical(other.lastName, lastName) ||
                const DeepCollectionEquality()
                    .equals(other.lastName, lastName)) &&
            (identical(other.uccKey, uccKey) ||
                const DeepCollectionEquality().equals(other.uccKey, uccKey)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.academicYear, academicYear) ||
                const DeepCollectionEquality()
                    .equals(other.academicYear, academicYear)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(name) ^
      const DeepCollectionEquality().hash(lastName) ^
      const DeepCollectionEquality().hash(uccKey) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(academicYear) ^
      runtimeType.hashCode;
}

extension $UserRequestExtension on UserRequest {
  UserRequest copyWith(
      {String? name,
      String? lastName,
      int? uccKey,
      String? email,
      int? academicYear}) {
    return UserRequest(
        name: name ?? this.name,
        lastName: lastName ?? this.lastName,
        uccKey: uccKey ?? this.uccKey,
        email: email ?? this.email,
        academicYear: academicYear ?? this.academicYear);
  }

  UserRequest copyWithWrapped(
      {Wrapped<String>? name,
      Wrapped<String>? lastName,
      Wrapped<int>? uccKey,
      Wrapped<String>? email,
      Wrapped<int>? academicYear}) {
    return UserRequest(
        name: (name != null ? name.value : this.name),
        lastName: (lastName != null ? lastName.value : this.lastName),
        uccKey: (uccKey != null ? uccKey.value : this.uccKey),
        email: (email != null ? email.value : this.email),
        academicYear:
            (academicYear != null ? academicYear.value : this.academicYear));
  }
}

@JsonSerializable(explicitToJson: true)
class UserXArea {
  UserXArea({
    required this.id,
    required this.user,
    required this.area,
  });

  factory UserXArea.fromJson(Map<String, dynamic> json) =>
      _$UserXAreaFromJson(json);

  static const toJsonFactory = _$UserXAreaToJson;
  Map<String, dynamic> toJson() => _$UserXAreaToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'area')
  final int area;
  static const fromJsonFactory = _$UserXAreaFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserXArea &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $UserXAreaExtension on UserXArea {
  UserXArea copyWith({int? id, int? user, int? area}) {
    return UserXArea(
        id: id ?? this.id, user: user ?? this.user, area: area ?? this.area);
  }

  UserXArea copyWithWrapped(
      {Wrapped<int>? id, Wrapped<int>? user, Wrapped<int>? area}) {
    return UserXArea(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class UserXAreaRequest {
  UserXAreaRequest({
    required this.user,
    required this.area,
  });

  factory UserXAreaRequest.fromJson(Map<String, dynamic> json) =>
      _$UserXAreaRequestFromJson(json);

  static const toJsonFactory = _$UserXAreaRequestToJson;
  Map<String, dynamic> toJson() => _$UserXAreaRequestToJson(this);

  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'area')
  final int area;
  static const fromJsonFactory = _$UserXAreaRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserXAreaRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.area, area) ||
                const DeepCollectionEquality().equals(other.area, area)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(area) ^
      runtimeType.hashCode;
}

extension $UserXAreaRequestExtension on UserXAreaRequest {
  UserXAreaRequest copyWith({int? user, int? area}) {
    return UserXAreaRequest(user: user ?? this.user, area: area ?? this.area);
  }

  UserXAreaRequest copyWithWrapped({Wrapped<int>? user, Wrapped<int>? area}) {
    return UserXAreaRequest(
        user: (user != null ? user.value : this.user),
        area: (area != null ? area.value : this.area));
  }
}

@JsonSerializable(explicitToJson: true)
class UserXRole {
  UserXRole({
    required this.id,
    required this.user,
    required this.role,
  });

  factory UserXRole.fromJson(Map<String, dynamic> json) =>
      _$UserXRoleFromJson(json);

  static const toJsonFactory = _$UserXRoleToJson;
  Map<String, dynamic> toJson() => _$UserXRoleToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'role')
  final int role;
  static const fromJsonFactory = _$UserXRoleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserXRole &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $UserXRoleExtension on UserXRole {
  UserXRole copyWith({int? id, int? user, int? role}) {
    return UserXRole(
        id: id ?? this.id, user: user ?? this.user, role: role ?? this.role);
  }

  UserXRole copyWithWrapped(
      {Wrapped<int>? id, Wrapped<int>? user, Wrapped<int>? role}) {
    return UserXRole(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class UserXRoleRequest {
  UserXRoleRequest({
    required this.user,
    required this.role,
  });

  factory UserXRoleRequest.fromJson(Map<String, dynamic> json) =>
      _$UserXRoleRequestFromJson(json);

  static const toJsonFactory = _$UserXRoleRequestToJson;
  Map<String, dynamic> toJson() => _$UserXRoleRequestToJson(this);

  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'role')
  final int role;
  static const fromJsonFactory = _$UserXRoleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserXRoleRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $UserXRoleRequestExtension on UserXRoleRequest {
  UserXRoleRequest copyWith({int? user, int? role}) {
    return UserXRoleRequest(user: user ?? this.user, role: role ?? this.role);
  }

  UserXRoleRequest copyWithWrapped({Wrapped<int>? user, Wrapped<int>? role}) {
    return UserXRoleRequest(
        user: (user != null ? user.value : this.user),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class UserXTutorshipInstanceXRole {
  UserXTutorshipInstanceXRole({
    required this.id,
    required this.user,
    required this.tutorshipInstance,
    required this.role,
  });

  factory UserXTutorshipInstanceXRole.fromJson(Map<String, dynamic> json) =>
      _$UserXTutorshipInstanceXRoleFromJson(json);

  static const toJsonFactory = _$UserXTutorshipInstanceXRoleToJson;
  Map<String, dynamic> toJson() => _$UserXTutorshipInstanceXRoleToJson(this);

  @JsonKey(name: 'id')
  final int id;
  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'tutorship_instance')
  final int tutorshipInstance;
  @JsonKey(name: 'role')
  final int role;
  static const fromJsonFactory = _$UserXTutorshipInstanceXRoleFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserXTutorshipInstanceXRole &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $UserXTutorshipInstanceXRoleExtension on UserXTutorshipInstanceXRole {
  UserXTutorshipInstanceXRole copyWith(
      {int? id, int? user, int? tutorshipInstance, int? role}) {
    return UserXTutorshipInstanceXRole(
        id: id ?? this.id,
        user: user ?? this.user,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance,
        role: role ?? this.role);
  }

  UserXTutorshipInstanceXRole copyWithWrapped(
      {Wrapped<int>? id,
      Wrapped<int>? user,
      Wrapped<int>? tutorshipInstance,
      Wrapped<int>? role}) {
    return UserXTutorshipInstanceXRole(
        id: (id != null ? id.value : this.id),
        user: (user != null ? user.value : this.user),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance),
        role: (role != null ? role.value : this.role));
  }
}

@JsonSerializable(explicitToJson: true)
class UserXTutorshipInstanceXRoleRequest {
  UserXTutorshipInstanceXRoleRequest({
    required this.user,
    required this.tutorshipInstance,
    required this.role,
  });

  factory UserXTutorshipInstanceXRoleRequest.fromJson(
          Map<String, dynamic> json) =>
      _$UserXTutorshipInstanceXRoleRequestFromJson(json);

  static const toJsonFactory = _$UserXTutorshipInstanceXRoleRequestToJson;
  Map<String, dynamic> toJson() =>
      _$UserXTutorshipInstanceXRoleRequestToJson(this);

  @JsonKey(name: 'user')
  final int user;
  @JsonKey(name: 'tutorship_instance')
  final int tutorshipInstance;
  @JsonKey(name: 'role')
  final int role;
  static const fromJsonFactory = _$UserXTutorshipInstanceXRoleRequestFromJson;

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UserXTutorshipInstanceXRoleRequest &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.tutorshipInstance, tutorshipInstance) ||
                const DeepCollectionEquality()
                    .equals(other.tutorshipInstance, tutorshipInstance)) &&
            (identical(other.role, role) ||
                const DeepCollectionEquality().equals(other.role, role)));
  }

  @override
  String toString() => jsonEncode(this);

  @override
  int get hashCode =>
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(tutorshipInstance) ^
      const DeepCollectionEquality().hash(role) ^
      runtimeType.hashCode;
}

extension $UserXTutorshipInstanceXRoleRequestExtension
    on UserXTutorshipInstanceXRoleRequest {
  UserXTutorshipInstanceXRoleRequest copyWith(
      {int? user, int? tutorshipInstance, int? role}) {
    return UserXTutorshipInstanceXRoleRequest(
        user: user ?? this.user,
        tutorshipInstance: tutorshipInstance ?? this.tutorshipInstance,
        role: role ?? this.role);
  }

  UserXTutorshipInstanceXRoleRequest copyWithWrapped(
      {Wrapped<int>? user,
      Wrapped<int>? tutorshipInstance,
      Wrapped<int>? role}) {
    return UserXTutorshipInstanceXRoleRequest(
        user: (user != null ? user.value : this.user),
        tutorshipInstance: (tutorshipInstance != null
            ? tutorshipInstance.value
            : this.tutorshipInstance),
        role: (role != null ? role.value : this.role));
  }
}

String? apiSchemaJsonGetLangToJson(
    enums.ApiSchemaJsonGetLang? apiSchemaJsonGetLang) {
  return apiSchemaJsonGetLang?.value;
}

enums.ApiSchemaJsonGetLang apiSchemaJsonGetLangFromJson(
  Object? apiSchemaJsonGetLang, [
  enums.ApiSchemaJsonGetLang? defaultValue,
]) {
  return enums.ApiSchemaJsonGetLang.values
          .firstWhereOrNull((e) => e.value == apiSchemaJsonGetLang) ??
      defaultValue ??
      enums.ApiSchemaJsonGetLang.swaggerGeneratedUnknown;
}

List<String> apiSchemaJsonGetLangListToJson(
    List<enums.ApiSchemaJsonGetLang>? apiSchemaJsonGetLang) {
  if (apiSchemaJsonGetLang == null) {
    return [];
  }

  return apiSchemaJsonGetLang.map((e) => e.value!).toList();
}

List<enums.ApiSchemaJsonGetLang> apiSchemaJsonGetLangListFromJson(
  List? apiSchemaJsonGetLang, [
  List<enums.ApiSchemaJsonGetLang>? defaultValue,
]) {
  if (apiSchemaJsonGetLang == null) {
    return defaultValue ?? [];
  }

  return apiSchemaJsonGetLang
      .map((e) => apiSchemaJsonGetLangFromJson(e.toString()))
      .toList();
}

List<enums.ApiSchemaJsonGetLang>? apiSchemaJsonGetLangNullableListFromJson(
  List? apiSchemaJsonGetLang, [
  List<enums.ApiSchemaJsonGetLang>? defaultValue,
]) {
  if (apiSchemaJsonGetLang == null) {
    return defaultValue;
  }

  return apiSchemaJsonGetLang
      .map((e) => apiSchemaJsonGetLangFromJson(e.toString()))
      .toList();
}

String? apiSchemaYamlGetLangToJson(
    enums.ApiSchemaYamlGetLang? apiSchemaYamlGetLang) {
  return apiSchemaYamlGetLang?.value;
}

enums.ApiSchemaYamlGetLang apiSchemaYamlGetLangFromJson(
  Object? apiSchemaYamlGetLang, [
  enums.ApiSchemaYamlGetLang? defaultValue,
]) {
  return enums.ApiSchemaYamlGetLang.values
          .firstWhereOrNull((e) => e.value == apiSchemaYamlGetLang) ??
      defaultValue ??
      enums.ApiSchemaYamlGetLang.swaggerGeneratedUnknown;
}

List<String> apiSchemaYamlGetLangListToJson(
    List<enums.ApiSchemaYamlGetLang>? apiSchemaYamlGetLang) {
  if (apiSchemaYamlGetLang == null) {
    return [];
  }

  return apiSchemaYamlGetLang.map((e) => e.value!).toList();
}

List<enums.ApiSchemaYamlGetLang> apiSchemaYamlGetLangListFromJson(
  List? apiSchemaYamlGetLang, [
  List<enums.ApiSchemaYamlGetLang>? defaultValue,
]) {
  if (apiSchemaYamlGetLang == null) {
    return defaultValue ?? [];
  }

  return apiSchemaYamlGetLang
      .map((e) => apiSchemaYamlGetLangFromJson(e.toString()))
      .toList();
}

List<enums.ApiSchemaYamlGetLang>? apiSchemaYamlGetLangNullableListFromJson(
  List? apiSchemaYamlGetLang, [
  List<enums.ApiSchemaYamlGetLang>? defaultValue,
]) {
  if (apiSchemaYamlGetLang == null) {
    return defaultValue;
  }

  return apiSchemaYamlGetLang
      .map((e) => apiSchemaYamlGetLangFromJson(e.toString()))
      .toList();
}

typedef $JsonFactory<T> = T Function(Map<String, dynamic> json);

class $CustomJsonDecoder {
  $CustomJsonDecoder(this.factories);

  final Map<Type, $JsonFactory> factories;

  dynamic decode<T>(dynamic entity) {
    if (entity is Iterable) {
      return _decodeList<T>(entity);
    }

    if (entity is T) {
      return entity;
    }

    if (isTypeOf<T, Map>()) {
      return entity;
    }

    if (isTypeOf<T, Iterable>()) {
      return entity;
    }

    if (entity is Map<String, dynamic>) {
      return _decodeMap<T>(entity);
    }

    return entity;
  }

  T _decodeMap<T>(Map<String, dynamic> values) {
    final jsonFactory = factories[T];
    if (jsonFactory == null || jsonFactory is! $JsonFactory<T>) {
      return throw "Could not find factory for type $T. Is '$T: $T.fromJsonFactory' included in the CustomJsonDecoder instance creation in bootstrapper.dart?";
    }

    return jsonFactory(values);
  }

  List<T> _decodeList<T>(Iterable values) =>
      values.where((v) => v != null).map<T>((v) => decode<T>(v) as T).toList();
}

class $JsonSerializableConverter extends chopper.JsonConverter {
  @override
  FutureOr<chopper.Response<ResultType>> convertResponse<ResultType, Item>(
      chopper.Response response) async {
    if (response.bodyString.isEmpty) {
      // In rare cases, when let's say 204 (no content) is returned -
      // we cannot decode the missing json with the result type specified
      return chopper.Response(response.base, null, error: response.error);
    }

    final jsonRes = await super.convertResponse(response);
    return jsonRes.copyWith<ResultType>(
        body: $jsonDecoder.decode<Item>(jsonRes.body) as ResultType);
  }
}

final $jsonDecoder = $CustomJsonDecoder(generatedMapping);

// ignore: unused_element
String? _dateToJson(DateTime? date) {
  if (date == null) {
    return null;
  }

  final year = date.year.toString();
  final month = date.month < 10 ? '0${date.month}' : date.month.toString();
  final day = date.day < 10 ? '0${date.day}' : date.day.toString();

  return '$year-$month-$day';
}

class Wrapped<T> {
  final T value;
  const Wrapped.value(this.value);
}
