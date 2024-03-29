import 'package:json_annotation/json_annotation.dart';
import 'package:collection/collection.dart';

enum BlankEnum {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('')
  $null('');

  final String? value;

  const BlankEnum(this.value);
}

enum NullEnum {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('null')
  $null('null');

  final String? value;

  const NullEnum(this.value);
}

enum PostulationStatusEnum {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Revision')
  revision('Revision'),
  @JsonValue('Rejected')
  rejected('Rejected'),
  @JsonValue('Approved')
  approved('Approved');

  final String? value;

  const PostulationStatusEnum(this.value);
}

enum TutorshipInstanceStatusEnum {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('Scheduled')
  scheduled('Scheduled'),
  @JsonValue('In progress')
  inProgress('In progress'),
  @JsonValue('Done')
  done('Done'),
  @JsonValue('Cancelled')
  cancelled('Cancelled'),
  @JsonValue('Delayed')
  delayed('Delayed');

  final String? value;

  const TutorshipInstanceStatusEnum(this.value);
}

enum ApiSchemaJsonGetLang {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('af')
  af('af'),
  @JsonValue('ar')
  ar('ar'),
  @JsonValue('ar-dz')
  arDz('ar-dz'),
  @JsonValue('ast')
  ast('ast'),
  @JsonValue('az')
  az('az'),
  @JsonValue('be')
  be('be'),
  @JsonValue('bg')
  bg('bg'),
  @JsonValue('bn')
  bn('bn'),
  @JsonValue('br')
  br('br'),
  @JsonValue('bs')
  bs('bs'),
  @JsonValue('ca')
  ca('ca'),
  @JsonValue('ckb')
  ckb('ckb'),
  @JsonValue('cs')
  cs('cs'),
  @JsonValue('cy')
  cy('cy'),
  @JsonValue('da')
  da('da'),
  @JsonValue('de')
  de('de'),
  @JsonValue('dsb')
  dsb('dsb'),
  @JsonValue('el')
  el('el'),
  @JsonValue('en')
  en('en'),
  @JsonValue('en-au')
  enAu('en-au'),
  @JsonValue('en-gb')
  enGb('en-gb'),
  @JsonValue('eo')
  eo('eo'),
  @JsonValue('es')
  es('es'),
  @JsonValue('es-ar')
  esAr('es-ar'),
  @JsonValue('es-co')
  esCo('es-co'),
  @JsonValue('es-mx')
  esMx('es-mx'),
  @JsonValue('es-ni')
  esNi('es-ni'),
  @JsonValue('es-ve')
  esVe('es-ve'),
  @JsonValue('et')
  et('et'),
  @JsonValue('eu')
  eu('eu'),
  @JsonValue('fa')
  fa('fa'),
  @JsonValue('fi')
  fi('fi'),
  @JsonValue('fr')
  fr('fr'),
  @JsonValue('fy')
  fy('fy'),
  @JsonValue('ga')
  ga('ga'),
  @JsonValue('gd')
  gd('gd'),
  @JsonValue('gl')
  gl('gl'),
  @JsonValue('he')
  he('he'),
  @JsonValue('hi')
  hi('hi'),
  @JsonValue('hr')
  hr('hr'),
  @JsonValue('hsb')
  hsb('hsb'),
  @JsonValue('hu')
  hu('hu'),
  @JsonValue('hy')
  hy('hy'),
  @JsonValue('ia')
  ia('ia'),
  @JsonValue('id')
  id('id'),
  @JsonValue('ig')
  ig('ig'),
  @JsonValue('io')
  io('io'),
  @JsonValue('is')
  $is('is'),
  @JsonValue('it')
  it('it'),
  @JsonValue('ja')
  ja('ja'),
  @JsonValue('ka')
  ka('ka'),
  @JsonValue('kab')
  kab('kab'),
  @JsonValue('kk')
  kk('kk'),
  @JsonValue('km')
  km('km'),
  @JsonValue('kn')
  kn('kn'),
  @JsonValue('ko')
  ko('ko'),
  @JsonValue('ky')
  ky('ky'),
  @JsonValue('lb')
  lb('lb'),
  @JsonValue('lt')
  lt('lt'),
  @JsonValue('lv')
  lv('lv'),
  @JsonValue('mk')
  mk('mk'),
  @JsonValue('ml')
  ml('ml'),
  @JsonValue('mn')
  mn('mn'),
  @JsonValue('mr')
  mr('mr'),
  @JsonValue('ms')
  ms('ms'),
  @JsonValue('my')
  my('my'),
  @JsonValue('nb')
  nb('nb'),
  @JsonValue('ne')
  ne('ne'),
  @JsonValue('nl')
  nl('nl'),
  @JsonValue('nn')
  nn('nn'),
  @JsonValue('os')
  os('os'),
  @JsonValue('pa')
  pa('pa'),
  @JsonValue('pl')
  pl('pl'),
  @JsonValue('pt')
  pt('pt'),
  @JsonValue('pt-br')
  ptBr('pt-br'),
  @JsonValue('ro')
  ro('ro'),
  @JsonValue('ru')
  ru('ru'),
  @JsonValue('sk')
  sk('sk'),
  @JsonValue('sl')
  sl('sl'),
  @JsonValue('sq')
  sq('sq'),
  @JsonValue('sr')
  sr('sr'),
  @JsonValue('sr-latn')
  srLatn('sr-latn'),
  @JsonValue('sv')
  sv('sv'),
  @JsonValue('sw')
  sw('sw'),
  @JsonValue('ta')
  ta('ta'),
  @JsonValue('te')
  te('te'),
  @JsonValue('tg')
  tg('tg'),
  @JsonValue('th')
  th('th'),
  @JsonValue('tk')
  tk('tk'),
  @JsonValue('tr')
  tr('tr'),
  @JsonValue('tt')
  tt('tt'),
  @JsonValue('udm')
  udm('udm'),
  @JsonValue('ug')
  ug('ug'),
  @JsonValue('uk')
  uk('uk'),
  @JsonValue('ur')
  ur('ur'),
  @JsonValue('uz')
  uz('uz'),
  @JsonValue('vi')
  vi('vi'),
  @JsonValue('zh-hans')
  zhHans('zh-hans'),
  @JsonValue('zh-hant')
  zhHant('zh-hant');

  final String? value;

  const ApiSchemaJsonGetLang(this.value);
}

enum ApiSchemaYamlGetLang {
  @JsonValue(null)
  swaggerGeneratedUnknown(null),

  @JsonValue('af')
  af('af'),
  @JsonValue('ar')
  ar('ar'),
  @JsonValue('ar-dz')
  arDz('ar-dz'),
  @JsonValue('ast')
  ast('ast'),
  @JsonValue('az')
  az('az'),
  @JsonValue('be')
  be('be'),
  @JsonValue('bg')
  bg('bg'),
  @JsonValue('bn')
  bn('bn'),
  @JsonValue('br')
  br('br'),
  @JsonValue('bs')
  bs('bs'),
  @JsonValue('ca')
  ca('ca'),
  @JsonValue('ckb')
  ckb('ckb'),
  @JsonValue('cs')
  cs('cs'),
  @JsonValue('cy')
  cy('cy'),
  @JsonValue('da')
  da('da'),
  @JsonValue('de')
  de('de'),
  @JsonValue('dsb')
  dsb('dsb'),
  @JsonValue('el')
  el('el'),
  @JsonValue('en')
  en('en'),
  @JsonValue('en-au')
  enAu('en-au'),
  @JsonValue('en-gb')
  enGb('en-gb'),
  @JsonValue('eo')
  eo('eo'),
  @JsonValue('es')
  es('es'),
  @JsonValue('es-ar')
  esAr('es-ar'),
  @JsonValue('es-co')
  esCo('es-co'),
  @JsonValue('es-mx')
  esMx('es-mx'),
  @JsonValue('es-ni')
  esNi('es-ni'),
  @JsonValue('es-ve')
  esVe('es-ve'),
  @JsonValue('et')
  et('et'),
  @JsonValue('eu')
  eu('eu'),
  @JsonValue('fa')
  fa('fa'),
  @JsonValue('fi')
  fi('fi'),
  @JsonValue('fr')
  fr('fr'),
  @JsonValue('fy')
  fy('fy'),
  @JsonValue('ga')
  ga('ga'),
  @JsonValue('gd')
  gd('gd'),
  @JsonValue('gl')
  gl('gl'),
  @JsonValue('he')
  he('he'),
  @JsonValue('hi')
  hi('hi'),
  @JsonValue('hr')
  hr('hr'),
  @JsonValue('hsb')
  hsb('hsb'),
  @JsonValue('hu')
  hu('hu'),
  @JsonValue('hy')
  hy('hy'),
  @JsonValue('ia')
  ia('ia'),
  @JsonValue('id')
  id('id'),
  @JsonValue('ig')
  ig('ig'),
  @JsonValue('io')
  io('io'),
  @JsonValue('is')
  $is('is'),
  @JsonValue('it')
  it('it'),
  @JsonValue('ja')
  ja('ja'),
  @JsonValue('ka')
  ka('ka'),
  @JsonValue('kab')
  kab('kab'),
  @JsonValue('kk')
  kk('kk'),
  @JsonValue('km')
  km('km'),
  @JsonValue('kn')
  kn('kn'),
  @JsonValue('ko')
  ko('ko'),
  @JsonValue('ky')
  ky('ky'),
  @JsonValue('lb')
  lb('lb'),
  @JsonValue('lt')
  lt('lt'),
  @JsonValue('lv')
  lv('lv'),
  @JsonValue('mk')
  mk('mk'),
  @JsonValue('ml')
  ml('ml'),
  @JsonValue('mn')
  mn('mn'),
  @JsonValue('mr')
  mr('mr'),
  @JsonValue('ms')
  ms('ms'),
  @JsonValue('my')
  my('my'),
  @JsonValue('nb')
  nb('nb'),
  @JsonValue('ne')
  ne('ne'),
  @JsonValue('nl')
  nl('nl'),
  @JsonValue('nn')
  nn('nn'),
  @JsonValue('os')
  os('os'),
  @JsonValue('pa')
  pa('pa'),
  @JsonValue('pl')
  pl('pl'),
  @JsonValue('pt')
  pt('pt'),
  @JsonValue('pt-br')
  ptBr('pt-br'),
  @JsonValue('ro')
  ro('ro'),
  @JsonValue('ru')
  ru('ru'),
  @JsonValue('sk')
  sk('sk'),
  @JsonValue('sl')
  sl('sl'),
  @JsonValue('sq')
  sq('sq'),
  @JsonValue('sr')
  sr('sr'),
  @JsonValue('sr-latn')
  srLatn('sr-latn'),
  @JsonValue('sv')
  sv('sv'),
  @JsonValue('sw')
  sw('sw'),
  @JsonValue('ta')
  ta('ta'),
  @JsonValue('te')
  te('te'),
  @JsonValue('tg')
  tg('tg'),
  @JsonValue('th')
  th('th'),
  @JsonValue('tk')
  tk('tk'),
  @JsonValue('tr')
  tr('tr'),
  @JsonValue('tt')
  tt('tt'),
  @JsonValue('udm')
  udm('udm'),
  @JsonValue('ug')
  ug('ug'),
  @JsonValue('uk')
  uk('uk'),
  @JsonValue('ur')
  ur('ur'),
  @JsonValue('uz')
  uz('uz'),
  @JsonValue('vi')
  vi('vi'),
  @JsonValue('zh-hans')
  zhHans('zh-hans'),
  @JsonValue('zh-hant')
  zhHant('zh-hant');

  final String? value;

  const ApiSchemaYamlGetLang(this.value);
}
