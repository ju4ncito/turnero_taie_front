//Generated code

part of 'api_model.swagger.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

// ignore_for_file: always_put_control_body_on_new_line, always_specify_types, prefer_const_declarations, unnecessary_brace_in_string_interps
class _$ApiModel extends ApiModel {
  _$ApiModel([ChopperClient? client]) {
    if (client == null) return;
    this.client = client;
  }

  @override
  final definitionType = ApiModel;

  @override
  Future<Response<List<AcademicUnit>>> _apiAcademicUnitsGet() {
    final Uri $url = Uri.parse('/api/academic-units/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AcademicUnit>, AcademicUnit>($request);
  }

  @override
  Future<Response<AcademicUnit>> _apiAcademicUnitsPost(
      {required AcademicUnitRequest? body}) {
    final Uri $url = Uri.parse('/api/academic-units/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AcademicUnit, AcademicUnit>($request);
  }

  @override
  Future<Response<AcademicUnit>> _apiAcademicUnitsIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/academic-units/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AcademicUnit, AcademicUnit>($request);
  }

  @override
  Future<Response<AcademicUnit>> _apiAcademicUnitsIdPut({
    required int? id,
    required AcademicUnitRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/academic-units/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AcademicUnit, AcademicUnit>($request);
  }

  @override
  Future<Response<AcademicUnit>> _apiAcademicUnitsIdPatch({
    required int? id,
    required PatchedAcademicUnitRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/academic-units/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AcademicUnit, AcademicUnit>($request);
  }

  @override
  Future<Response<dynamic>> _apiAcademicUnitsIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/academic-units/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<AcademicYear>>> _apiAcademicYearsGet() {
    final Uri $url = Uri.parse('/api/academic-years/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<AcademicYear>, AcademicYear>($request);
  }

  @override
  Future<Response<AcademicYear>> _apiAcademicYearsPost(
      {required AcademicYearRequest? body}) {
    final Uri $url = Uri.parse('/api/academic-years/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AcademicYear, AcademicYear>($request);
  }

  @override
  Future<Response<AcademicYear>> _apiAcademicYearsYearGet(
      {required int? year}) {
    final Uri $url = Uri.parse('/api/academic-years/${year}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<AcademicYear, AcademicYear>($request);
  }

  @override
  Future<Response<AcademicYear>> _apiAcademicYearsYearPut({
    required int? year,
    required AcademicYearRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/academic-years/${year}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AcademicYear, AcademicYear>($request);
  }

  @override
  Future<Response<AcademicYear>> _apiAcademicYearsYearPatch({
    required int? year,
    required PatchedAcademicYearRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/academic-years/${year}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<AcademicYear, AcademicYear>($request);
  }

  @override
  Future<Response<dynamic>> _apiAcademicYearsYearDelete({required int? year}) {
    final Uri $url = Uri.parse('/api/academic-years/${year}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Area>>> _apiAreasGet() {
    final Uri $url = Uri.parse('/api/areas/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Area>, Area>($request);
  }

  @override
  Future<Response<Area>> _apiAreasPost({required AreaRequest? body}) {
    final Uri $url = Uri.parse('/api/areas/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Area, Area>($request);
  }

  @override
  Future<Response<Area>> _apiAreasIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/areas/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Area, Area>($request);
  }

  @override
  Future<Response<Area>> _apiAreasIdPut({
    required int? id,
    required AreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/areas/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Area, Area>($request);
  }

  @override
  Future<Response<Area>> _apiAreasIdPatch({
    required int? id,
    required PatchedAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/areas/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Area, Area>($request);
  }

  @override
  Future<Response<dynamic>> _apiAreasIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/areas/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<CareerXArea>>> _apiCareerXAreaGet() {
    final Uri $url = Uri.parse('/api/career-x-area/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CareerXArea>, CareerXArea>($request);
  }

  @override
  Future<Response<CareerXArea>> _apiCareerXAreaPost(
      {required CareerXAreaRequest? body}) {
    final Uri $url = Uri.parse('/api/career-x-area/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CareerXArea, CareerXArea>($request);
  }

  @override
  Future<Response<CareerXArea>> _apiCareerXAreaIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/career-x-area/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CareerXArea, CareerXArea>($request);
  }

  @override
  Future<Response<CareerXArea>> _apiCareerXAreaIdPut({
    required int? id,
    required CareerXAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/career-x-area/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CareerXArea, CareerXArea>($request);
  }

  @override
  Future<Response<CareerXArea>> _apiCareerXAreaIdPatch({
    required int? id,
    required PatchedCareerXAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/career-x-area/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CareerXArea, CareerXArea>($request);
  }

  @override
  Future<Response<dynamic>> _apiCareerXAreaIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/career-x-area/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<CareerXUser>>> _apiCareerXUserGet() {
    final Uri $url = Uri.parse('/api/career-x-user/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<CareerXUser>, CareerXUser>($request);
  }

  @override
  Future<Response<CareerXUser>> _apiCareerXUserPost(
      {required CareerXUserRequest? body}) {
    final Uri $url = Uri.parse('/api/career-x-user/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CareerXUser, CareerXUser>($request);
  }

  @override
  Future<Response<CareerXUser>> _apiCareerXUserIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/career-x-user/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<CareerXUser, CareerXUser>($request);
  }

  @override
  Future<Response<CareerXUser>> _apiCareerXUserIdPut({
    required int? id,
    required CareerXUserRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/career-x-user/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CareerXUser, CareerXUser>($request);
  }

  @override
  Future<Response<CareerXUser>> _apiCareerXUserIdPatch({
    required int? id,
    required PatchedCareerXUserRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/career-x-user/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CareerXUser, CareerXUser>($request);
  }

  @override
  Future<Response<dynamic>> _apiCareerXUserIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/career-x-user/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Career>>> _apiCareersGet() {
    final Uri $url = Uri.parse('/api/careers/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Career>, Career>($request);
  }

  @override
  Future<Response<Career>> _apiCareersPost({required CareerRequest? body}) {
    final Uri $url = Uri.parse('/api/careers/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Career, Career>($request);
  }

  @override
  Future<Response<Career>> _apiCareersIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/careers/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Career, Career>($request);
  }

  @override
  Future<Response<Career>> _apiCareersIdPut({
    required int? id,
    required CareerRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/careers/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Career, Career>($request);
  }

  @override
  Future<Response<Career>> _apiCareersIdPatch({
    required int? id,
    required PatchedCareerRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/careers/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Career, Career>($request);
  }

  @override
  Future<Response<dynamic>> _apiCareersIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/careers/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<PostulationXArea>>> _apiPostulationXAreaGet() {
    final Uri $url = Uri.parse('/api/postulation-x-area/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<PostulationXArea>, PostulationXArea>($request);
  }

  @override
  Future<Response<PostulationXArea>> _apiPostulationXAreaPost(
      {required PostulationXAreaRequest? body}) {
    final Uri $url = Uri.parse('/api/postulation-x-area/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PostulationXArea, PostulationXArea>($request);
  }

  @override
  Future<Response<PostulationXArea>> _apiPostulationXAreaIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/postulation-x-area/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<PostulationXArea, PostulationXArea>($request);
  }

  @override
  Future<Response<PostulationXArea>> _apiPostulationXAreaIdPut({
    required int? id,
    required PostulationXAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/postulation-x-area/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PostulationXArea, PostulationXArea>($request);
  }

  @override
  Future<Response<PostulationXArea>> _apiPostulationXAreaIdPatch({
    required int? id,
    required PatchedPostulationXAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/postulation-x-area/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<PostulationXArea, PostulationXArea>($request);
  }

  @override
  Future<Response<dynamic>> _apiPostulationXAreaIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/postulation-x-area/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Postulation>>> _apiPostulationsGet() {
    final Uri $url = Uri.parse('/api/postulations/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Postulation>, Postulation>($request);
  }

  @override
  Future<Response<Postulation>> _apiPostulationsPost(
      {required PostulationRequest? body}) {
    final Uri $url = Uri.parse('/api/postulations/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Postulation, Postulation>($request);
  }

  @override
  Future<Response<Postulation>> _apiPostulationsIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/postulations/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Postulation, Postulation>($request);
  }

  @override
  Future<Response<Postulation>> _apiPostulationsIdPut({
    required int? id,
    required PostulationRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/postulations/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Postulation, Postulation>($request);
  }

  @override
  Future<Response<Postulation>> _apiPostulationsIdPatch({
    required int? id,
    required PatchedPostulationRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/postulations/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Postulation, Postulation>($request);
  }

  @override
  Future<Response<dynamic>> _apiPostulationsIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/postulations/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<Role>>> _apiRolesGet() {
    final Uri $url = Uri.parse('/api/roles/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Role>, Role>($request);
  }

  @override
  Future<Response<Role>> _apiRolesPost({required RoleRequest? body}) {
    final Uri $url = Uri.parse('/api/roles/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Role, Role>($request);
  }

  @override
  Future<Response<Role>> _apiRolesTypeGet({required String? type}) {
    final Uri $url = Uri.parse('/api/roles/${type}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Role, Role>($request);
  }

  @override
  Future<Response<Role>> _apiRolesTypePut({
    required String? type,
    required RoleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/roles/${type}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Role, Role>($request);
  }

  @override
  Future<Response<Role>> _apiRolesTypePatch({
    required String? type,
    required PatchedRoleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/roles/${type}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Role, Role>($request);
  }

  @override
  Future<Response<dynamic>> _apiRolesTypeDelete({required String? type}) {
    final Uri $url = Uri.parse('/api/roles/${type}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<Object>> _apiSchemaJsonGet({String? lang}) {
    final Uri $url = Uri.parse('/api/schema/json');
    final Map<String, dynamic> $params = <String, dynamic>{'lang': lang};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<Object>> _apiSchemaYamlGet({String? lang}) {
    final Uri $url = Uri.parse('/api/schema/yaml');
    final Map<String, dynamic> $params = <String, dynamic>{'lang': lang};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<Object, Object>($request);
  }

  @override
  Future<Response<BusquedaTutoriaHorarios>> _apiSearchsTutorshipSchedulesGet(
      {required String? searchString}) {
    final Uri $url = Uri.parse('/api/searchs/tutorship_schedules');
    final Map<String, dynamic> $params = <String, dynamic>{
      'search_string': searchString
    };
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client
        .send<BusquedaTutoriaHorarios, BusquedaTutoriaHorarios>($request);
  }

  @override
  Future<Response<List<Tag>>> _apiTagsGet() {
    final Uri $url = Uri.parse('/api/tags/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<Tag>, Tag>($request);
  }

  @override
  Future<Response<Tag>> _apiTagsPost({required TagRequest? body}) {
    final Uri $url = Uri.parse('/api/tags/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Tag, Tag>($request);
  }

  @override
  Future<Response<Tag>> _apiTagsNameGet({required String? name}) {
    final Uri $url = Uri.parse('/api/tags/${name}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<Tag, Tag>($request);
  }

  @override
  Future<Response<Tag>> _apiTagsNamePut({
    required String? name,
    required TagRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tags/${name}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Tag, Tag>($request);
  }

  @override
  Future<Response<Tag>> _apiTagsNamePatch({
    required String? name,
    required PatchedTagRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tags/${name}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<Tag, Tag>($request);
  }

  @override
  Future<Response<dynamic>> _apiTagsNameDelete({required String? name}) {
    final Uri $url = Uri.parse('/api/tags/${name}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<ReturnAuthUser>> _apiTokenAuthPost(
      {required GoogleAccessTokenRequest? body}) {
    final Uri $url = Uri.parse('/api/token/auth/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnAuthUser, ReturnAuthUser>($request);
  }

  @override
  Future<Response<ReturnRefreshToken>> _apiTokenRefreshPost(
      {required RefreshTokenRequest? body}) {
    final Uri $url = Uri.parse('/api/token/refresh/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<ReturnRefreshToken, ReturnRefreshToken>($request);
  }

  @override
  Future<Response<List<TutorUserReview>>> _apiTutorUserReviewGet() {
    final Uri $url = Uri.parse('/api/tutor-user-review/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TutorUserReview>, TutorUserReview>($request);
  }

  @override
  Future<Response<TutorUserReview>> _apiTutorUserReviewPost(
      {required TutorUserReviewRequest? body}) {
    final Uri $url = Uri.parse('/api/tutor-user-review/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorUserReview, TutorUserReview>($request);
  }

  @override
  Future<Response<TutorUserReview>> _apiTutorUserReviewIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/tutor-user-review/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TutorUserReview, TutorUserReview>($request);
  }

  @override
  Future<Response<TutorUserReview>> _apiTutorUserReviewIdPut({
    required int? id,
    required TutorUserReviewRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutor-user-review/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorUserReview, TutorUserReview>($request);
  }

  @override
  Future<Response<TutorUserReview>> _apiTutorUserReviewIdPatch({
    required int? id,
    required PatchedTutorUserReviewRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutor-user-review/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorUserReview, TutorUserReview>($request);
  }

  @override
  Future<Response<dynamic>> _apiTutorUserReviewIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/tutor-user-review/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<ReadTutorUserSchedule>>> _apiTutorUserSchedulesGet() {
    final Uri $url = Uri.parse('/api/tutor-user-schedules/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client
        .send<List<ReadTutorUserSchedule>, ReadTutorUserSchedule>($request);
  }

  @override
  Future<Response<CreateDeleteTutorUserSchedule>> _apiTutorUserSchedulesPost(
      {required CreateDeleteTutorUserScheduleRequest? body}) {
    final Uri $url = Uri.parse('/api/tutor-user-schedules/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CreateDeleteTutorUserSchedule,
        CreateDeleteTutorUserSchedule>($request);
  }

  @override
  Future<Response<ReadTutorUserSchedule>> _apiTutorUserSchedulesIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/tutor-user-schedules/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<ReadTutorUserSchedule, ReadTutorUserSchedule>($request);
  }

  @override
  Future<Response<CreateDeleteTutorUserSchedule>> _apiTutorUserSchedulesIdPut({
    required int? id,
    required CreateDeleteTutorUserScheduleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutor-user-schedules/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CreateDeleteTutorUserSchedule,
        CreateDeleteTutorUserSchedule>($request);
  }

  @override
  Future<Response<CreateDeleteTutorUserSchedule>>
      _apiTutorUserSchedulesIdPatch({
    required int? id,
    required PatchedCreateDeleteTutorUserScheduleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutor-user-schedules/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<CreateDeleteTutorUserSchedule,
        CreateDeleteTutorUserSchedule>($request);
  }

  @override
  Future<Response<dynamic>> _apiTutorUserSchedulesIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/tutor-user-schedules/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<SearchTutorship>>> _apiTutorshipInstancesGet(
      {required String? role}) {
    final Uri $url = Uri.parse('/api/tutorship-instances/');
    final Map<String, dynamic> $params = <String, dynamic>{'role': role};
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
      parameters: $params,
    );
    return client.send<List<SearchTutorship>, SearchTutorship>($request);
  }

  @override
  Future<Response<TutorshipInstance>> _apiTutorshipInstancesPost(
      {required TutorshipInstanceRequest? body}) {
    final Uri $url = Uri.parse('/api/tutorship-instances/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorshipInstance, TutorshipInstance>($request);
  }

  @override
  Future<Response<SearchTutorship>> _apiTutorshipInstancesIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/tutorship-instances/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<SearchTutorship, SearchTutorship>($request);
  }

  @override
  Future<Response<TutorshipInstance>> _apiTutorshipInstancesIdPut({
    required int? id,
    required TutorshipInstanceRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutorship-instances/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorshipInstance, TutorshipInstance>($request);
  }

  @override
  Future<Response<TutorshipInstance>> _apiTutorshipInstancesIdPatch({
    required int? id,
    required PatchedTutorshipInstanceRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutorship-instances/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorshipInstance, TutorshipInstance>($request);
  }

  @override
  Future<Response<dynamic>> _apiTutorshipInstancesIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/tutorship-instances/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<OkSerializerDisenroll>>
      _apiTutorshipInstancesIdDisenrollTutorshipPost({required int? id}) {
    final Uri $url =
        Uri.parse('/api/tutorship-instances/${id}/disenroll-tutorship/');
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
    );
    return client.send<OkSerializerDisenroll, OkSerializerDisenroll>($request);
  }

  @override
  Future<Response<OkSerializer>> _apiTutorshipInstancesEnrollTutorshipPost(
      {required EnrollRequest? body}) {
    final Uri $url = Uri.parse('/api/tutorship-instances/enroll-tutorship/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<OkSerializer, OkSerializer>($request);
  }

  @override
  Future<Response<List<TutorshipReport>>> _apiTutorshipReportsGet() {
    final Uri $url = Uri.parse('/api/tutorship-reports/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<TutorshipReport>, TutorshipReport>($request);
  }

  @override
  Future<Response<TutorshipReport>> _apiTutorshipReportsPost(
      {required TutorshipReportRequest? body}) {
    final Uri $url = Uri.parse('/api/tutorship-reports/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorshipReport, TutorshipReport>($request);
  }

  @override
  Future<Response<TutorshipReport>> _apiTutorshipReportsIdGet(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/tutorship-reports/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<TutorshipReport, TutorshipReport>($request);
  }

  @override
  Future<Response<TutorshipReport>> _apiTutorshipReportsIdPut({
    required int? id,
    required TutorshipReportRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutorship-reports/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorshipReport, TutorshipReport>($request);
  }

  @override
  Future<Response<TutorshipReport>> _apiTutorshipReportsIdPatch({
    required int? id,
    required PatchedTutorshipReportRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/tutorship-reports/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<TutorshipReport, TutorshipReport>($request);
  }

  @override
  Future<Response<dynamic>> _apiTutorshipReportsIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/tutorship-reports/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<UserXArea>>> _apiUserXAreaGet() {
    final Uri $url = Uri.parse('/api/user-x-area/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<UserXArea>, UserXArea>($request);
  }

  @override
  Future<Response<UserXArea>> _apiUserXAreaPost(
      {required UserXAreaRequest? body}) {
    final Uri $url = Uri.parse('/api/user-x-area/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXArea, UserXArea>($request);
  }

  @override
  Future<Response<UserXArea>> _apiUserXAreaIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/user-x-area/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserXArea, UserXArea>($request);
  }

  @override
  Future<Response<UserXArea>> _apiUserXAreaIdPut({
    required int? id,
    required UserXAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/user-x-area/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXArea, UserXArea>($request);
  }

  @override
  Future<Response<UserXArea>> _apiUserXAreaIdPatch({
    required int? id,
    required PatchedUserXAreaRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/user-x-area/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXArea, UserXArea>($request);
  }

  @override
  Future<Response<dynamic>> _apiUserXAreaIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/user-x-area/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<UserXRole>>> _apiUserXRoleGet() {
    final Uri $url = Uri.parse('/api/user-x-role/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<UserXRole>, UserXRole>($request);
  }

  @override
  Future<Response<UserXRole>> _apiUserXRolePost(
      {required UserXRoleRequest? body}) {
    final Uri $url = Uri.parse('/api/user-x-role/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXRole, UserXRole>($request);
  }

  @override
  Future<Response<UserXRole>> _apiUserXRoleIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/user-x-role/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserXRole, UserXRole>($request);
  }

  @override
  Future<Response<UserXRole>> _apiUserXRoleIdPut({
    required int? id,
    required UserXRoleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/user-x-role/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXRole, UserXRole>($request);
  }

  @override
  Future<Response<UserXRole>> _apiUserXRoleIdPatch({
    required int? id,
    required PatchedUserXRoleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/user-x-role/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXRole, UserXRole>($request);
  }

  @override
  Future<Response<dynamic>> _apiUserXRoleIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/user-x-role/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<UserXTutorshipInstanceXRole>>>
      _apiUserXTutorshipInstanceXRoleGet() {
    final Uri $url = Uri.parse('/api/user-x-tutorship-instance-x-role/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<UserXTutorshipInstanceXRole>,
        UserXTutorshipInstanceXRole>($request);
  }

  @override
  Future<Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRolePost(
          {required UserXTutorshipInstanceXRoleRequest? body}) {
    final Uri $url = Uri.parse('/api/user-x-tutorship-instance-x-role/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXTutorshipInstanceXRole,
        UserXTutorshipInstanceXRole>($request);
  }

  @override
  Future<Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRoleIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/user-x-tutorship-instance-x-role/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<UserXTutorshipInstanceXRole,
        UserXTutorshipInstanceXRole>($request);
  }

  @override
  Future<Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRoleIdPut({
    required int? id,
    required UserXTutorshipInstanceXRoleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/user-x-tutorship-instance-x-role/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXTutorshipInstanceXRole,
        UserXTutorshipInstanceXRole>($request);
  }

  @override
  Future<Response<UserXTutorshipInstanceXRole>>
      _apiUserXTutorshipInstanceXRoleIdPatch({
    required int? id,
    required PatchedUserXTutorshipInstanceXRoleRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/user-x-tutorship-instance-x-role/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<UserXTutorshipInstanceXRole,
        UserXTutorshipInstanceXRole>($request);
  }

  @override
  Future<Response<dynamic>> _apiUserXTutorshipInstanceXRoleIdDelete(
      {required int? id}) {
    final Uri $url = Uri.parse('/api/user-x-tutorship-instance-x-role/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }

  @override
  Future<Response<List<User>>> _apiUsersGet() {
    final Uri $url = Uri.parse('/api/users/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<List<User>, User>($request);
  }

  @override
  Future<Response<User>> _apiUsersPost({required UserRequest? body}) {
    final Uri $url = Uri.parse('/api/users/');
    final $body = body;
    final Request $request = Request(
      'POST',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _apiUsersIdGet({required int? id}) {
    final Uri $url = Uri.parse('/api/users/${id}/');
    final Request $request = Request(
      'GET',
      $url,
      client.baseUrl,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _apiUsersIdPut({
    required int? id,
    required UserRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/users/${id}/');
    final $body = body;
    final Request $request = Request(
      'PUT',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<User>> _apiUsersIdPatch({
    required int? id,
    required PatchedUserRequest? body,
  }) {
    final Uri $url = Uri.parse('/api/users/${id}/');
    final $body = body;
    final Request $request = Request(
      'PATCH',
      $url,
      client.baseUrl,
      body: $body,
    );
    return client.send<User, User>($request);
  }

  @override
  Future<Response<dynamic>> _apiUsersIdDelete({required int? id}) {
    final Uri $url = Uri.parse('/api/users/${id}/');
    final Request $request = Request(
      'DELETE',
      $url,
      client.baseUrl,
    );
    return client.send<dynamic, dynamic>($request);
  }
}
