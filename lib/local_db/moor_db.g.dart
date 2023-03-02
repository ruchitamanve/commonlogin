// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_db.dart';

// ignore_for_file: type=lint
class $user_ui_detailsTable extends user_ui_details
    with TableInfo<$user_ui_detailsTable, user_ui_detail> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $user_ui_detailsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _aOMFeedbackEmailIdMeta =
      const VerificationMeta('aOMFeedbackEmailId');
  @override
  late final GeneratedColumn<String> aOMFeedbackEmailId =
      GeneratedColumn<String>('a_o_m_feedback_email_id', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _aOMFeedbackFromEmailIdMeta =
      const VerificationMeta('aOMFeedbackFromEmailId');
  @override
  late final GeneratedColumn<String> aOMFeedbackFromEmailId =
      GeneratedColumn<String>(
          'a_o_m_feedback_from_email_id', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _baseURL1Meta =
      const VerificationMeta('baseURL1');
  @override
  late final GeneratedColumn<String> baseURL1 = GeneratedColumn<String>(
      'base_u_r_l1', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _baseURL2Meta =
      const VerificationMeta('baseURL2');
  @override
  late final GeneratedColumn<String> baseURL2 = GeneratedColumn<String>(
      'base_u_r_l2', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _buttoncolorMeta =
      const VerificationMeta('buttoncolor');
  @override
  late final GeneratedColumn<String> buttoncolor = GeneratedColumn<String>(
      'buttoncolor', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _clientIDMeta =
      const VerificationMeta('clientID');
  @override
  late final GeneratedColumn<String> clientID = GeneratedColumn<String>(
      'client_i_d', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _clientLogoMeta =
      const VerificationMeta('clientLogo');
  @override
  late final GeneratedColumn<String> clientLogo = GeneratedColumn<String>(
      'client_logo', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _clientNameMeta =
      const VerificationMeta('clientName');
  @override
  late final GeneratedColumn<String> clientName = GeneratedColumn<String>(
      'client_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _dottedLineColourMeta =
      const VerificationMeta('dottedLineColour');
  @override
  late final GeneratedColumn<String> dottedLineColour = GeneratedColumn<String>(
      'dotted_line_colour', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _errorNumberMeta =
      const VerificationMeta('errorNumber');
  @override
  late final GeneratedColumn<String> errorNumber = GeneratedColumn<String>(
      'error_number', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fontFamilyMeta =
      const VerificationMeta('fontFamily');
  @override
  late final GeneratedColumn<String> fontFamily = GeneratedColumn<String>(
      'font_family', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fontFilesNameMeta =
      const VerificationMeta('fontFilesName');
  @override
  late final GeneratedColumn<String> fontFilesName = GeneratedColumn<String>(
      'font_files_name', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _fontPathMeta =
      const VerificationMeta('fontPath');
  @override
  late final GeneratedColumn<String> fontPath = GeneratedColumn<String>(
      'font_path', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _headerColourMeta =
      const VerificationMeta('headerColour');
  @override
  late final GeneratedColumn<String> headerColour = GeneratedColumn<String>(
      'header_colour', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _headerTextcolourMeta =
      const VerificationMeta('headerTextcolour');
  @override
  late final GeneratedColumn<String> headerTextcolour = GeneratedColumn<String>(
      'header_textcolour', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _iconColourMeta =
      const VerificationMeta('iconColour');
  @override
  late final GeneratedColumn<String> iconColour = GeneratedColumn<String>(
      'icon_colour', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isDownloadAndroidMeta =
      const VerificationMeta('isDownloadAndroid');
  @override
  late final GeneratedColumn<String> isDownloadAndroid =
      GeneratedColumn<String>('is_download_android', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _isDownloadIOSMeta =
      const VerificationMeta('isDownloadIOS');
  @override
  late final GeneratedColumn<String> isDownloadIOS = GeneratedColumn<String>(
      'is_download_i_o_s', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _isDownloadWindowsMeta =
      const VerificationMeta('isDownloadWindows');
  @override
  late final GeneratedColumn<String> isDownloadWindows =
      GeneratedColumn<String>('is_download_windows', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _securityModelMeta =
      const VerificationMeta('securityModel');
  @override
  late final GeneratedColumn<String> securityModel = GeneratedColumn<String>(
      'security_model', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subHeadercolourMeta =
      const VerificationMeta('subHeadercolour');
  @override
  late final GeneratedColumn<String> subHeadercolour = GeneratedColumn<String>(
      'sub_headercolour', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _subHeadercolourdarkMeta =
      const VerificationMeta('subHeadercolourdark');
  @override
  late final GeneratedColumn<String> subHeadercolourdark =
      GeneratedColumn<String>('sub_headercolourdark', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _subHeadercolourlightMeta =
      const VerificationMeta('subHeadercolourlight');
  @override
  late final GeneratedColumn<String> subHeadercolourlight =
      GeneratedColumn<String>('sub_headercolourlight', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _subscriberSessionGUIDMeta =
      const VerificationMeta('subscriberSessionGUID');
  @override
  late final GeneratedColumn<String> subscriberSessionGUID =
      GeneratedColumn<String>('subscriber_session_g_u_i_d', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _termsOfUseContentMeta =
      const VerificationMeta('termsOfUseContent');
  @override
  late final GeneratedColumn<String> termsOfUseContent =
      GeneratedColumn<String>('terms_of_use_content', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  static const VerificationMeta _termsOfUseFileNameMeta =
      const VerificationMeta('termsOfUseFileName');
  @override
  late final GeneratedColumn<String> termsOfUseFileName =
      GeneratedColumn<String>('terms_of_use_file_name', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        aOMFeedbackEmailId,
        aOMFeedbackFromEmailId,
        baseURL1,
        baseURL2,
        buttoncolor,
        clientID,
        clientLogo,
        clientName,
        dottedLineColour,
        errorNumber,
        fontFamily,
        fontFilesName,
        fontPath,
        headerColour,
        headerTextcolour,
        iconColour,
        isDownloadAndroid,
        isDownloadIOS,
        isDownloadWindows,
        securityModel,
        subHeadercolour,
        subHeadercolourdark,
        subHeadercolourlight,
        subscriberSessionGUID,
        termsOfUseContent,
        termsOfUseFileName
      ];
  @override
  String get aliasedName => _alias ?? 'user_ui_details';
  @override
  String get actualTableName => 'user_ui_details';
  @override
  VerificationContext validateIntegrity(Insertable<user_ui_detail> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('a_o_m_feedback_email_id')) {
      context.handle(
          _aOMFeedbackEmailIdMeta,
          aOMFeedbackEmailId.isAcceptableOrUnknown(
              data['a_o_m_feedback_email_id']!, _aOMFeedbackEmailIdMeta));
    } else if (isInserting) {
      context.missing(_aOMFeedbackEmailIdMeta);
    }
    if (data.containsKey('a_o_m_feedback_from_email_id')) {
      context.handle(
          _aOMFeedbackFromEmailIdMeta,
          aOMFeedbackFromEmailId.isAcceptableOrUnknown(
              data['a_o_m_feedback_from_email_id']!,
              _aOMFeedbackFromEmailIdMeta));
    } else if (isInserting) {
      context.missing(_aOMFeedbackFromEmailIdMeta);
    }
    if (data.containsKey('base_u_r_l1')) {
      context.handle(_baseURL1Meta,
          baseURL1.isAcceptableOrUnknown(data['base_u_r_l1']!, _baseURL1Meta));
    } else if (isInserting) {
      context.missing(_baseURL1Meta);
    }
    if (data.containsKey('base_u_r_l2')) {
      context.handle(_baseURL2Meta,
          baseURL2.isAcceptableOrUnknown(data['base_u_r_l2']!, _baseURL2Meta));
    } else if (isInserting) {
      context.missing(_baseURL2Meta);
    }
    if (data.containsKey('buttoncolor')) {
      context.handle(
          _buttoncolorMeta,
          buttoncolor.isAcceptableOrUnknown(
              data['buttoncolor']!, _buttoncolorMeta));
    } else if (isInserting) {
      context.missing(_buttoncolorMeta);
    }
    if (data.containsKey('client_i_d')) {
      context.handle(_clientIDMeta,
          clientID.isAcceptableOrUnknown(data['client_i_d']!, _clientIDMeta));
    } else if (isInserting) {
      context.missing(_clientIDMeta);
    }
    if (data.containsKey('client_logo')) {
      context.handle(
          _clientLogoMeta,
          clientLogo.isAcceptableOrUnknown(
              data['client_logo']!, _clientLogoMeta));
    } else if (isInserting) {
      context.missing(_clientLogoMeta);
    }
    if (data.containsKey('client_name')) {
      context.handle(
          _clientNameMeta,
          clientName.isAcceptableOrUnknown(
              data['client_name']!, _clientNameMeta));
    } else if (isInserting) {
      context.missing(_clientNameMeta);
    }
    if (data.containsKey('dotted_line_colour')) {
      context.handle(
          _dottedLineColourMeta,
          dottedLineColour.isAcceptableOrUnknown(
              data['dotted_line_colour']!, _dottedLineColourMeta));
    } else if (isInserting) {
      context.missing(_dottedLineColourMeta);
    }
    if (data.containsKey('error_number')) {
      context.handle(
          _errorNumberMeta,
          errorNumber.isAcceptableOrUnknown(
              data['error_number']!, _errorNumberMeta));
    } else if (isInserting) {
      context.missing(_errorNumberMeta);
    }
    if (data.containsKey('font_family')) {
      context.handle(
          _fontFamilyMeta,
          fontFamily.isAcceptableOrUnknown(
              data['font_family']!, _fontFamilyMeta));
    } else if (isInserting) {
      context.missing(_fontFamilyMeta);
    }
    if (data.containsKey('font_files_name')) {
      context.handle(
          _fontFilesNameMeta,
          fontFilesName.isAcceptableOrUnknown(
              data['font_files_name']!, _fontFilesNameMeta));
    } else if (isInserting) {
      context.missing(_fontFilesNameMeta);
    }
    if (data.containsKey('font_path')) {
      context.handle(_fontPathMeta,
          fontPath.isAcceptableOrUnknown(data['font_path']!, _fontPathMeta));
    } else if (isInserting) {
      context.missing(_fontPathMeta);
    }
    if (data.containsKey('header_colour')) {
      context.handle(
          _headerColourMeta,
          headerColour.isAcceptableOrUnknown(
              data['header_colour']!, _headerColourMeta));
    } else if (isInserting) {
      context.missing(_headerColourMeta);
    }
    if (data.containsKey('header_textcolour')) {
      context.handle(
          _headerTextcolourMeta,
          headerTextcolour.isAcceptableOrUnknown(
              data['header_textcolour']!, _headerTextcolourMeta));
    } else if (isInserting) {
      context.missing(_headerTextcolourMeta);
    }
    if (data.containsKey('icon_colour')) {
      context.handle(
          _iconColourMeta,
          iconColour.isAcceptableOrUnknown(
              data['icon_colour']!, _iconColourMeta));
    } else if (isInserting) {
      context.missing(_iconColourMeta);
    }
    if (data.containsKey('is_download_android')) {
      context.handle(
          _isDownloadAndroidMeta,
          isDownloadAndroid.isAcceptableOrUnknown(
              data['is_download_android']!, _isDownloadAndroidMeta));
    } else if (isInserting) {
      context.missing(_isDownloadAndroidMeta);
    }
    if (data.containsKey('is_download_i_o_s')) {
      context.handle(
          _isDownloadIOSMeta,
          isDownloadIOS.isAcceptableOrUnknown(
              data['is_download_i_o_s']!, _isDownloadIOSMeta));
    } else if (isInserting) {
      context.missing(_isDownloadIOSMeta);
    }
    if (data.containsKey('is_download_windows')) {
      context.handle(
          _isDownloadWindowsMeta,
          isDownloadWindows.isAcceptableOrUnknown(
              data['is_download_windows']!, _isDownloadWindowsMeta));
    } else if (isInserting) {
      context.missing(_isDownloadWindowsMeta);
    }
    if (data.containsKey('security_model')) {
      context.handle(
          _securityModelMeta,
          securityModel.isAcceptableOrUnknown(
              data['security_model']!, _securityModelMeta));
    } else if (isInserting) {
      context.missing(_securityModelMeta);
    }
    if (data.containsKey('sub_headercolour')) {
      context.handle(
          _subHeadercolourMeta,
          subHeadercolour.isAcceptableOrUnknown(
              data['sub_headercolour']!, _subHeadercolourMeta));
    } else if (isInserting) {
      context.missing(_subHeadercolourMeta);
    }
    if (data.containsKey('sub_headercolourdark')) {
      context.handle(
          _subHeadercolourdarkMeta,
          subHeadercolourdark.isAcceptableOrUnknown(
              data['sub_headercolourdark']!, _subHeadercolourdarkMeta));
    } else if (isInserting) {
      context.missing(_subHeadercolourdarkMeta);
    }
    if (data.containsKey('sub_headercolourlight')) {
      context.handle(
          _subHeadercolourlightMeta,
          subHeadercolourlight.isAcceptableOrUnknown(
              data['sub_headercolourlight']!, _subHeadercolourlightMeta));
    } else if (isInserting) {
      context.missing(_subHeadercolourlightMeta);
    }
    if (data.containsKey('subscriber_session_g_u_i_d')) {
      context.handle(
          _subscriberSessionGUIDMeta,
          subscriberSessionGUID.isAcceptableOrUnknown(
              data['subscriber_session_g_u_i_d']!, _subscriberSessionGUIDMeta));
    } else if (isInserting) {
      context.missing(_subscriberSessionGUIDMeta);
    }
    if (data.containsKey('terms_of_use_content')) {
      context.handle(
          _termsOfUseContentMeta,
          termsOfUseContent.isAcceptableOrUnknown(
              data['terms_of_use_content']!, _termsOfUseContentMeta));
    } else if (isInserting) {
      context.missing(_termsOfUseContentMeta);
    }
    if (data.containsKey('terms_of_use_file_name')) {
      context.handle(
          _termsOfUseFileNameMeta,
          termsOfUseFileName.isAcceptableOrUnknown(
              data['terms_of_use_file_name']!, _termsOfUseFileNameMeta));
    } else if (isInserting) {
      context.missing(_termsOfUseFileNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  user_ui_detail map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return user_ui_detail(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      aOMFeedbackEmailId: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}a_o_m_feedback_email_id'])!,
      aOMFeedbackFromEmailId: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}a_o_m_feedback_from_email_id'])!,
      baseURL1: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_u_r_l1'])!,
      baseURL2: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}base_u_r_l2'])!,
      buttoncolor: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}buttoncolor'])!,
      clientID: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_i_d'])!,
      clientLogo: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_logo'])!,
      clientName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_name'])!,
      dottedLineColour: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}dotted_line_colour'])!,
      errorNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}error_number'])!,
      fontFamily: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_family'])!,
      fontFilesName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}font_files_name'])!,
      fontPath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}font_path'])!,
      headerColour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}header_colour'])!,
      headerTextcolour: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}header_textcolour'])!,
      iconColour: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_colour'])!,
      isDownloadAndroid: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}is_download_android'])!,
      isDownloadIOS: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}is_download_i_o_s'])!,
      isDownloadWindows: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}is_download_windows'])!,
      securityModel: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}security_model'])!,
      subHeadercolour: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}sub_headercolour'])!,
      subHeadercolourdark: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}sub_headercolourdark'])!,
      subHeadercolourlight: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}sub_headercolourlight'])!,
      subscriberSessionGUID: attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}subscriber_session_g_u_i_d'])!,
      termsOfUseContent: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}terms_of_use_content'])!,
      termsOfUseFileName: attachedDatabase.typeMapping.read(DriftSqlType.string,
          data['${effectivePrefix}terms_of_use_file_name'])!,
    );
  }

  @override
  $user_ui_detailsTable createAlias(String alias) {
    return $user_ui_detailsTable(attachedDatabase, alias);
  }
}

class user_ui_detail extends DataClass implements Insertable<user_ui_detail> {
  final int id;
  final String aOMFeedbackEmailId;
  final String aOMFeedbackFromEmailId;
  final String baseURL1;
  final String baseURL2;
  final String buttoncolor;
  final String clientID;
  final String clientLogo;
  final String clientName;
  final String dottedLineColour;
  final String errorNumber;
  final String fontFamily;
  final String fontFilesName;
  final String fontPath;
  final String headerColour;
  final String headerTextcolour;
  final String iconColour;
  final String isDownloadAndroid;
  final String isDownloadIOS;
  final String isDownloadWindows;
  final String securityModel;
  final String subHeadercolour;
  final String subHeadercolourdark;
  final String subHeadercolourlight;
  final String subscriberSessionGUID;
  final String termsOfUseContent;
  final String termsOfUseFileName;
  const user_ui_detail(
      {required this.id,
      required this.aOMFeedbackEmailId,
      required this.aOMFeedbackFromEmailId,
      required this.baseURL1,
      required this.baseURL2,
      required this.buttoncolor,
      required this.clientID,
      required this.clientLogo,
      required this.clientName,
      required this.dottedLineColour,
      required this.errorNumber,
      required this.fontFamily,
      required this.fontFilesName,
      required this.fontPath,
      required this.headerColour,
      required this.headerTextcolour,
      required this.iconColour,
      required this.isDownloadAndroid,
      required this.isDownloadIOS,
      required this.isDownloadWindows,
      required this.securityModel,
      required this.subHeadercolour,
      required this.subHeadercolourdark,
      required this.subHeadercolourlight,
      required this.subscriberSessionGUID,
      required this.termsOfUseContent,
      required this.termsOfUseFileName});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['a_o_m_feedback_email_id'] = Variable<String>(aOMFeedbackEmailId);
    map['a_o_m_feedback_from_email_id'] =
        Variable<String>(aOMFeedbackFromEmailId);
    map['base_u_r_l1'] = Variable<String>(baseURL1);
    map['base_u_r_l2'] = Variable<String>(baseURL2);
    map['buttoncolor'] = Variable<String>(buttoncolor);
    map['client_i_d'] = Variable<String>(clientID);
    map['client_logo'] = Variable<String>(clientLogo);
    map['client_name'] = Variable<String>(clientName);
    map['dotted_line_colour'] = Variable<String>(dottedLineColour);
    map['error_number'] = Variable<String>(errorNumber);
    map['font_family'] = Variable<String>(fontFamily);
    map['font_files_name'] = Variable<String>(fontFilesName);
    map['font_path'] = Variable<String>(fontPath);
    map['header_colour'] = Variable<String>(headerColour);
    map['header_textcolour'] = Variable<String>(headerTextcolour);
    map['icon_colour'] = Variable<String>(iconColour);
    map['is_download_android'] = Variable<String>(isDownloadAndroid);
    map['is_download_i_o_s'] = Variable<String>(isDownloadIOS);
    map['is_download_windows'] = Variable<String>(isDownloadWindows);
    map['security_model'] = Variable<String>(securityModel);
    map['sub_headercolour'] = Variable<String>(subHeadercolour);
    map['sub_headercolourdark'] = Variable<String>(subHeadercolourdark);
    map['sub_headercolourlight'] = Variable<String>(subHeadercolourlight);
    map['subscriber_session_g_u_i_d'] = Variable<String>(subscriberSessionGUID);
    map['terms_of_use_content'] = Variable<String>(termsOfUseContent);
    map['terms_of_use_file_name'] = Variable<String>(termsOfUseFileName);
    return map;
  }

  user_ui_detailsCompanion toCompanion(bool nullToAbsent) {
    return user_ui_detailsCompanion(
      id: Value(id),
      aOMFeedbackEmailId: Value(aOMFeedbackEmailId),
      aOMFeedbackFromEmailId: Value(aOMFeedbackFromEmailId),
      baseURL1: Value(baseURL1),
      baseURL2: Value(baseURL2),
      buttoncolor: Value(buttoncolor),
      clientID: Value(clientID),
      clientLogo: Value(clientLogo),
      clientName: Value(clientName),
      dottedLineColour: Value(dottedLineColour),
      errorNumber: Value(errorNumber),
      fontFamily: Value(fontFamily),
      fontFilesName: Value(fontFilesName),
      fontPath: Value(fontPath),
      headerColour: Value(headerColour),
      headerTextcolour: Value(headerTextcolour),
      iconColour: Value(iconColour),
      isDownloadAndroid: Value(isDownloadAndroid),
      isDownloadIOS: Value(isDownloadIOS),
      isDownloadWindows: Value(isDownloadWindows),
      securityModel: Value(securityModel),
      subHeadercolour: Value(subHeadercolour),
      subHeadercolourdark: Value(subHeadercolourdark),
      subHeadercolourlight: Value(subHeadercolourlight),
      subscriberSessionGUID: Value(subscriberSessionGUID),
      termsOfUseContent: Value(termsOfUseContent),
      termsOfUseFileName: Value(termsOfUseFileName),
    );
  }

  factory user_ui_detail.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return user_ui_detail(
      id: serializer.fromJson<int>(json['id']),
      aOMFeedbackEmailId:
          serializer.fromJson<String>(json['aOMFeedbackEmailId']),
      aOMFeedbackFromEmailId:
          serializer.fromJson<String>(json['aOMFeedbackFromEmailId']),
      baseURL1: serializer.fromJson<String>(json['baseURL1']),
      baseURL2: serializer.fromJson<String>(json['baseURL2']),
      buttoncolor: serializer.fromJson<String>(json['buttoncolor']),
      clientID: serializer.fromJson<String>(json['clientID']),
      clientLogo: serializer.fromJson<String>(json['clientLogo']),
      clientName: serializer.fromJson<String>(json['clientName']),
      dottedLineColour: serializer.fromJson<String>(json['dottedLineColour']),
      errorNumber: serializer.fromJson<String>(json['errorNumber']),
      fontFamily: serializer.fromJson<String>(json['fontFamily']),
      fontFilesName: serializer.fromJson<String>(json['fontFilesName']),
      fontPath: serializer.fromJson<String>(json['fontPath']),
      headerColour: serializer.fromJson<String>(json['headerColour']),
      headerTextcolour: serializer.fromJson<String>(json['headerTextcolour']),
      iconColour: serializer.fromJson<String>(json['iconColour']),
      isDownloadAndroid: serializer.fromJson<String>(json['isDownloadAndroid']),
      isDownloadIOS: serializer.fromJson<String>(json['isDownloadIOS']),
      isDownloadWindows: serializer.fromJson<String>(json['isDownloadWindows']),
      securityModel: serializer.fromJson<String>(json['securityModel']),
      subHeadercolour: serializer.fromJson<String>(json['subHeadercolour']),
      subHeadercolourdark:
          serializer.fromJson<String>(json['subHeadercolourdark']),
      subHeadercolourlight:
          serializer.fromJson<String>(json['subHeadercolourlight']),
      subscriberSessionGUID:
          serializer.fromJson<String>(json['subscriberSessionGUID']),
      termsOfUseContent: serializer.fromJson<String>(json['termsOfUseContent']),
      termsOfUseFileName:
          serializer.fromJson<String>(json['termsOfUseFileName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'aOMFeedbackEmailId': serializer.toJson<String>(aOMFeedbackEmailId),
      'aOMFeedbackFromEmailId':
          serializer.toJson<String>(aOMFeedbackFromEmailId),
      'baseURL1': serializer.toJson<String>(baseURL1),
      'baseURL2': serializer.toJson<String>(baseURL2),
      'buttoncolor': serializer.toJson<String>(buttoncolor),
      'clientID': serializer.toJson<String>(clientID),
      'clientLogo': serializer.toJson<String>(clientLogo),
      'clientName': serializer.toJson<String>(clientName),
      'dottedLineColour': serializer.toJson<String>(dottedLineColour),
      'errorNumber': serializer.toJson<String>(errorNumber),
      'fontFamily': serializer.toJson<String>(fontFamily),
      'fontFilesName': serializer.toJson<String>(fontFilesName),
      'fontPath': serializer.toJson<String>(fontPath),
      'headerColour': serializer.toJson<String>(headerColour),
      'headerTextcolour': serializer.toJson<String>(headerTextcolour),
      'iconColour': serializer.toJson<String>(iconColour),
      'isDownloadAndroid': serializer.toJson<String>(isDownloadAndroid),
      'isDownloadIOS': serializer.toJson<String>(isDownloadIOS),
      'isDownloadWindows': serializer.toJson<String>(isDownloadWindows),
      'securityModel': serializer.toJson<String>(securityModel),
      'subHeadercolour': serializer.toJson<String>(subHeadercolour),
      'subHeadercolourdark': serializer.toJson<String>(subHeadercolourdark),
      'subHeadercolourlight': serializer.toJson<String>(subHeadercolourlight),
      'subscriberSessionGUID': serializer.toJson<String>(subscriberSessionGUID),
      'termsOfUseContent': serializer.toJson<String>(termsOfUseContent),
      'termsOfUseFileName': serializer.toJson<String>(termsOfUseFileName),
    };
  }

  user_ui_detail copyWith(
          {int? id,
          String? aOMFeedbackEmailId,
          String? aOMFeedbackFromEmailId,
          String? baseURL1,
          String? baseURL2,
          String? buttoncolor,
          String? clientID,
          String? clientLogo,
          String? clientName,
          String? dottedLineColour,
          String? errorNumber,
          String? fontFamily,
          String? fontFilesName,
          String? fontPath,
          String? headerColour,
          String? headerTextcolour,
          String? iconColour,
          String? isDownloadAndroid,
          String? isDownloadIOS,
          String? isDownloadWindows,
          String? securityModel,
          String? subHeadercolour,
          String? subHeadercolourdark,
          String? subHeadercolourlight,
          String? subscriberSessionGUID,
          String? termsOfUseContent,
          String? termsOfUseFileName}) =>
      user_ui_detail(
        id: id ?? this.id,
        aOMFeedbackEmailId: aOMFeedbackEmailId ?? this.aOMFeedbackEmailId,
        aOMFeedbackFromEmailId:
            aOMFeedbackFromEmailId ?? this.aOMFeedbackFromEmailId,
        baseURL1: baseURL1 ?? this.baseURL1,
        baseURL2: baseURL2 ?? this.baseURL2,
        buttoncolor: buttoncolor ?? this.buttoncolor,
        clientID: clientID ?? this.clientID,
        clientLogo: clientLogo ?? this.clientLogo,
        clientName: clientName ?? this.clientName,
        dottedLineColour: dottedLineColour ?? this.dottedLineColour,
        errorNumber: errorNumber ?? this.errorNumber,
        fontFamily: fontFamily ?? this.fontFamily,
        fontFilesName: fontFilesName ?? this.fontFilesName,
        fontPath: fontPath ?? this.fontPath,
        headerColour: headerColour ?? this.headerColour,
        headerTextcolour: headerTextcolour ?? this.headerTextcolour,
        iconColour: iconColour ?? this.iconColour,
        isDownloadAndroid: isDownloadAndroid ?? this.isDownloadAndroid,
        isDownloadIOS: isDownloadIOS ?? this.isDownloadIOS,
        isDownloadWindows: isDownloadWindows ?? this.isDownloadWindows,
        securityModel: securityModel ?? this.securityModel,
        subHeadercolour: subHeadercolour ?? this.subHeadercolour,
        subHeadercolourdark: subHeadercolourdark ?? this.subHeadercolourdark,
        subHeadercolourlight: subHeadercolourlight ?? this.subHeadercolourlight,
        subscriberSessionGUID:
            subscriberSessionGUID ?? this.subscriberSessionGUID,
        termsOfUseContent: termsOfUseContent ?? this.termsOfUseContent,
        termsOfUseFileName: termsOfUseFileName ?? this.termsOfUseFileName,
      );
  @override
  String toString() {
    return (StringBuffer('user_ui_detail(')
          ..write('id: $id, ')
          ..write('aOMFeedbackEmailId: $aOMFeedbackEmailId, ')
          ..write('aOMFeedbackFromEmailId: $aOMFeedbackFromEmailId, ')
          ..write('baseURL1: $baseURL1, ')
          ..write('baseURL2: $baseURL2, ')
          ..write('buttoncolor: $buttoncolor, ')
          ..write('clientID: $clientID, ')
          ..write('clientLogo: $clientLogo, ')
          ..write('clientName: $clientName, ')
          ..write('dottedLineColour: $dottedLineColour, ')
          ..write('errorNumber: $errorNumber, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('fontFilesName: $fontFilesName, ')
          ..write('fontPath: $fontPath, ')
          ..write('headerColour: $headerColour, ')
          ..write('headerTextcolour: $headerTextcolour, ')
          ..write('iconColour: $iconColour, ')
          ..write('isDownloadAndroid: $isDownloadAndroid, ')
          ..write('isDownloadIOS: $isDownloadIOS, ')
          ..write('isDownloadWindows: $isDownloadWindows, ')
          ..write('securityModel: $securityModel, ')
          ..write('subHeadercolour: $subHeadercolour, ')
          ..write('subHeadercolourdark: $subHeadercolourdark, ')
          ..write('subHeadercolourlight: $subHeadercolourlight, ')
          ..write('subscriberSessionGUID: $subscriberSessionGUID, ')
          ..write('termsOfUseContent: $termsOfUseContent, ')
          ..write('termsOfUseFileName: $termsOfUseFileName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        aOMFeedbackEmailId,
        aOMFeedbackFromEmailId,
        baseURL1,
        baseURL2,
        buttoncolor,
        clientID,
        clientLogo,
        clientName,
        dottedLineColour,
        errorNumber,
        fontFamily,
        fontFilesName,
        fontPath,
        headerColour,
        headerTextcolour,
        iconColour,
        isDownloadAndroid,
        isDownloadIOS,
        isDownloadWindows,
        securityModel,
        subHeadercolour,
        subHeadercolourdark,
        subHeadercolourlight,
        subscriberSessionGUID,
        termsOfUseContent,
        termsOfUseFileName
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is user_ui_detail &&
          other.id == this.id &&
          other.aOMFeedbackEmailId == this.aOMFeedbackEmailId &&
          other.aOMFeedbackFromEmailId == this.aOMFeedbackFromEmailId &&
          other.baseURL1 == this.baseURL1 &&
          other.baseURL2 == this.baseURL2 &&
          other.buttoncolor == this.buttoncolor &&
          other.clientID == this.clientID &&
          other.clientLogo == this.clientLogo &&
          other.clientName == this.clientName &&
          other.dottedLineColour == this.dottedLineColour &&
          other.errorNumber == this.errorNumber &&
          other.fontFamily == this.fontFamily &&
          other.fontFilesName == this.fontFilesName &&
          other.fontPath == this.fontPath &&
          other.headerColour == this.headerColour &&
          other.headerTextcolour == this.headerTextcolour &&
          other.iconColour == this.iconColour &&
          other.isDownloadAndroid == this.isDownloadAndroid &&
          other.isDownloadIOS == this.isDownloadIOS &&
          other.isDownloadWindows == this.isDownloadWindows &&
          other.securityModel == this.securityModel &&
          other.subHeadercolour == this.subHeadercolour &&
          other.subHeadercolourdark == this.subHeadercolourdark &&
          other.subHeadercolourlight == this.subHeadercolourlight &&
          other.subscriberSessionGUID == this.subscriberSessionGUID &&
          other.termsOfUseContent == this.termsOfUseContent &&
          other.termsOfUseFileName == this.termsOfUseFileName);
}

class user_ui_detailsCompanion extends UpdateCompanion<user_ui_detail> {
  final Value<int> id;
  final Value<String> aOMFeedbackEmailId;
  final Value<String> aOMFeedbackFromEmailId;
  final Value<String> baseURL1;
  final Value<String> baseURL2;
  final Value<String> buttoncolor;
  final Value<String> clientID;
  final Value<String> clientLogo;
  final Value<String> clientName;
  final Value<String> dottedLineColour;
  final Value<String> errorNumber;
  final Value<String> fontFamily;
  final Value<String> fontFilesName;
  final Value<String> fontPath;
  final Value<String> headerColour;
  final Value<String> headerTextcolour;
  final Value<String> iconColour;
  final Value<String> isDownloadAndroid;
  final Value<String> isDownloadIOS;
  final Value<String> isDownloadWindows;
  final Value<String> securityModel;
  final Value<String> subHeadercolour;
  final Value<String> subHeadercolourdark;
  final Value<String> subHeadercolourlight;
  final Value<String> subscriberSessionGUID;
  final Value<String> termsOfUseContent;
  final Value<String> termsOfUseFileName;
  const user_ui_detailsCompanion({
    this.id = const Value.absent(),
    this.aOMFeedbackEmailId = const Value.absent(),
    this.aOMFeedbackFromEmailId = const Value.absent(),
    this.baseURL1 = const Value.absent(),
    this.baseURL2 = const Value.absent(),
    this.buttoncolor = const Value.absent(),
    this.clientID = const Value.absent(),
    this.clientLogo = const Value.absent(),
    this.clientName = const Value.absent(),
    this.dottedLineColour = const Value.absent(),
    this.errorNumber = const Value.absent(),
    this.fontFamily = const Value.absent(),
    this.fontFilesName = const Value.absent(),
    this.fontPath = const Value.absent(),
    this.headerColour = const Value.absent(),
    this.headerTextcolour = const Value.absent(),
    this.iconColour = const Value.absent(),
    this.isDownloadAndroid = const Value.absent(),
    this.isDownloadIOS = const Value.absent(),
    this.isDownloadWindows = const Value.absent(),
    this.securityModel = const Value.absent(),
    this.subHeadercolour = const Value.absent(),
    this.subHeadercolourdark = const Value.absent(),
    this.subHeadercolourlight = const Value.absent(),
    this.subscriberSessionGUID = const Value.absent(),
    this.termsOfUseContent = const Value.absent(),
    this.termsOfUseFileName = const Value.absent(),
  });
  user_ui_detailsCompanion.insert({
    this.id = const Value.absent(),
    required String aOMFeedbackEmailId,
    required String aOMFeedbackFromEmailId,
    required String baseURL1,
    required String baseURL2,
    required String buttoncolor,
    required String clientID,
    required String clientLogo,
    required String clientName,
    required String dottedLineColour,
    required String errorNumber,
    required String fontFamily,
    required String fontFilesName,
    required String fontPath,
    required String headerColour,
    required String headerTextcolour,
    required String iconColour,
    required String isDownloadAndroid,
    required String isDownloadIOS,
    required String isDownloadWindows,
    required String securityModel,
    required String subHeadercolour,
    required String subHeadercolourdark,
    required String subHeadercolourlight,
    required String subscriberSessionGUID,
    required String termsOfUseContent,
    required String termsOfUseFileName,
  })  : aOMFeedbackEmailId = Value(aOMFeedbackEmailId),
        aOMFeedbackFromEmailId = Value(aOMFeedbackFromEmailId),
        baseURL1 = Value(baseURL1),
        baseURL2 = Value(baseURL2),
        buttoncolor = Value(buttoncolor),
        clientID = Value(clientID),
        clientLogo = Value(clientLogo),
        clientName = Value(clientName),
        dottedLineColour = Value(dottedLineColour),
        errorNumber = Value(errorNumber),
        fontFamily = Value(fontFamily),
        fontFilesName = Value(fontFilesName),
        fontPath = Value(fontPath),
        headerColour = Value(headerColour),
        headerTextcolour = Value(headerTextcolour),
        iconColour = Value(iconColour),
        isDownloadAndroid = Value(isDownloadAndroid),
        isDownloadIOS = Value(isDownloadIOS),
        isDownloadWindows = Value(isDownloadWindows),
        securityModel = Value(securityModel),
        subHeadercolour = Value(subHeadercolour),
        subHeadercolourdark = Value(subHeadercolourdark),
        subHeadercolourlight = Value(subHeadercolourlight),
        subscriberSessionGUID = Value(subscriberSessionGUID),
        termsOfUseContent = Value(termsOfUseContent),
        termsOfUseFileName = Value(termsOfUseFileName);
  static Insertable<user_ui_detail> custom({
    Expression<int>? id,
    Expression<String>? aOMFeedbackEmailId,
    Expression<String>? aOMFeedbackFromEmailId,
    Expression<String>? baseURL1,
    Expression<String>? baseURL2,
    Expression<String>? buttoncolor,
    Expression<String>? clientID,
    Expression<String>? clientLogo,
    Expression<String>? clientName,
    Expression<String>? dottedLineColour,
    Expression<String>? errorNumber,
    Expression<String>? fontFamily,
    Expression<String>? fontFilesName,
    Expression<String>? fontPath,
    Expression<String>? headerColour,
    Expression<String>? headerTextcolour,
    Expression<String>? iconColour,
    Expression<String>? isDownloadAndroid,
    Expression<String>? isDownloadIOS,
    Expression<String>? isDownloadWindows,
    Expression<String>? securityModel,
    Expression<String>? subHeadercolour,
    Expression<String>? subHeadercolourdark,
    Expression<String>? subHeadercolourlight,
    Expression<String>? subscriberSessionGUID,
    Expression<String>? termsOfUseContent,
    Expression<String>? termsOfUseFileName,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (aOMFeedbackEmailId != null)
        'a_o_m_feedback_email_id': aOMFeedbackEmailId,
      if (aOMFeedbackFromEmailId != null)
        'a_o_m_feedback_from_email_id': aOMFeedbackFromEmailId,
      if (baseURL1 != null) 'base_u_r_l1': baseURL1,
      if (baseURL2 != null) 'base_u_r_l2': baseURL2,
      if (buttoncolor != null) 'buttoncolor': buttoncolor,
      if (clientID != null) 'client_i_d': clientID,
      if (clientLogo != null) 'client_logo': clientLogo,
      if (clientName != null) 'client_name': clientName,
      if (dottedLineColour != null) 'dotted_line_colour': dottedLineColour,
      if (errorNumber != null) 'error_number': errorNumber,
      if (fontFamily != null) 'font_family': fontFamily,
      if (fontFilesName != null) 'font_files_name': fontFilesName,
      if (fontPath != null) 'font_path': fontPath,
      if (headerColour != null) 'header_colour': headerColour,
      if (headerTextcolour != null) 'header_textcolour': headerTextcolour,
      if (iconColour != null) 'icon_colour': iconColour,
      if (isDownloadAndroid != null) 'is_download_android': isDownloadAndroid,
      if (isDownloadIOS != null) 'is_download_i_o_s': isDownloadIOS,
      if (isDownloadWindows != null) 'is_download_windows': isDownloadWindows,
      if (securityModel != null) 'security_model': securityModel,
      if (subHeadercolour != null) 'sub_headercolour': subHeadercolour,
      if (subHeadercolourdark != null)
        'sub_headercolourdark': subHeadercolourdark,
      if (subHeadercolourlight != null)
        'sub_headercolourlight': subHeadercolourlight,
      if (subscriberSessionGUID != null)
        'subscriber_session_g_u_i_d': subscriberSessionGUID,
      if (termsOfUseContent != null) 'terms_of_use_content': termsOfUseContent,
      if (termsOfUseFileName != null)
        'terms_of_use_file_name': termsOfUseFileName,
    });
  }

  user_ui_detailsCompanion copyWith(
      {Value<int>? id,
      Value<String>? aOMFeedbackEmailId,
      Value<String>? aOMFeedbackFromEmailId,
      Value<String>? baseURL1,
      Value<String>? baseURL2,
      Value<String>? buttoncolor,
      Value<String>? clientID,
      Value<String>? clientLogo,
      Value<String>? clientName,
      Value<String>? dottedLineColour,
      Value<String>? errorNumber,
      Value<String>? fontFamily,
      Value<String>? fontFilesName,
      Value<String>? fontPath,
      Value<String>? headerColour,
      Value<String>? headerTextcolour,
      Value<String>? iconColour,
      Value<String>? isDownloadAndroid,
      Value<String>? isDownloadIOS,
      Value<String>? isDownloadWindows,
      Value<String>? securityModel,
      Value<String>? subHeadercolour,
      Value<String>? subHeadercolourdark,
      Value<String>? subHeadercolourlight,
      Value<String>? subscriberSessionGUID,
      Value<String>? termsOfUseContent,
      Value<String>? termsOfUseFileName}) {
    return user_ui_detailsCompanion(
      id: id ?? this.id,
      aOMFeedbackEmailId: aOMFeedbackEmailId ?? this.aOMFeedbackEmailId,
      aOMFeedbackFromEmailId:
          aOMFeedbackFromEmailId ?? this.aOMFeedbackFromEmailId,
      baseURL1: baseURL1 ?? this.baseURL1,
      baseURL2: baseURL2 ?? this.baseURL2,
      buttoncolor: buttoncolor ?? this.buttoncolor,
      clientID: clientID ?? this.clientID,
      clientLogo: clientLogo ?? this.clientLogo,
      clientName: clientName ?? this.clientName,
      dottedLineColour: dottedLineColour ?? this.dottedLineColour,
      errorNumber: errorNumber ?? this.errorNumber,
      fontFamily: fontFamily ?? this.fontFamily,
      fontFilesName: fontFilesName ?? this.fontFilesName,
      fontPath: fontPath ?? this.fontPath,
      headerColour: headerColour ?? this.headerColour,
      headerTextcolour: headerTextcolour ?? this.headerTextcolour,
      iconColour: iconColour ?? this.iconColour,
      isDownloadAndroid: isDownloadAndroid ?? this.isDownloadAndroid,
      isDownloadIOS: isDownloadIOS ?? this.isDownloadIOS,
      isDownloadWindows: isDownloadWindows ?? this.isDownloadWindows,
      securityModel: securityModel ?? this.securityModel,
      subHeadercolour: subHeadercolour ?? this.subHeadercolour,
      subHeadercolourdark: subHeadercolourdark ?? this.subHeadercolourdark,
      subHeadercolourlight: subHeadercolourlight ?? this.subHeadercolourlight,
      subscriberSessionGUID:
          subscriberSessionGUID ?? this.subscriberSessionGUID,
      termsOfUseContent: termsOfUseContent ?? this.termsOfUseContent,
      termsOfUseFileName: termsOfUseFileName ?? this.termsOfUseFileName,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (aOMFeedbackEmailId.present) {
      map['a_o_m_feedback_email_id'] =
          Variable<String>(aOMFeedbackEmailId.value);
    }
    if (aOMFeedbackFromEmailId.present) {
      map['a_o_m_feedback_from_email_id'] =
          Variable<String>(aOMFeedbackFromEmailId.value);
    }
    if (baseURL1.present) {
      map['base_u_r_l1'] = Variable<String>(baseURL1.value);
    }
    if (baseURL2.present) {
      map['base_u_r_l2'] = Variable<String>(baseURL2.value);
    }
    if (buttoncolor.present) {
      map['buttoncolor'] = Variable<String>(buttoncolor.value);
    }
    if (clientID.present) {
      map['client_i_d'] = Variable<String>(clientID.value);
    }
    if (clientLogo.present) {
      map['client_logo'] = Variable<String>(clientLogo.value);
    }
    if (clientName.present) {
      map['client_name'] = Variable<String>(clientName.value);
    }
    if (dottedLineColour.present) {
      map['dotted_line_colour'] = Variable<String>(dottedLineColour.value);
    }
    if (errorNumber.present) {
      map['error_number'] = Variable<String>(errorNumber.value);
    }
    if (fontFamily.present) {
      map['font_family'] = Variable<String>(fontFamily.value);
    }
    if (fontFilesName.present) {
      map['font_files_name'] = Variable<String>(fontFilesName.value);
    }
    if (fontPath.present) {
      map['font_path'] = Variable<String>(fontPath.value);
    }
    if (headerColour.present) {
      map['header_colour'] = Variable<String>(headerColour.value);
    }
    if (headerTextcolour.present) {
      map['header_textcolour'] = Variable<String>(headerTextcolour.value);
    }
    if (iconColour.present) {
      map['icon_colour'] = Variable<String>(iconColour.value);
    }
    if (isDownloadAndroid.present) {
      map['is_download_android'] = Variable<String>(isDownloadAndroid.value);
    }
    if (isDownloadIOS.present) {
      map['is_download_i_o_s'] = Variable<String>(isDownloadIOS.value);
    }
    if (isDownloadWindows.present) {
      map['is_download_windows'] = Variable<String>(isDownloadWindows.value);
    }
    if (securityModel.present) {
      map['security_model'] = Variable<String>(securityModel.value);
    }
    if (subHeadercolour.present) {
      map['sub_headercolour'] = Variable<String>(subHeadercolour.value);
    }
    if (subHeadercolourdark.present) {
      map['sub_headercolourdark'] = Variable<String>(subHeadercolourdark.value);
    }
    if (subHeadercolourlight.present) {
      map['sub_headercolourlight'] =
          Variable<String>(subHeadercolourlight.value);
    }
    if (subscriberSessionGUID.present) {
      map['subscriber_session_g_u_i_d'] =
          Variable<String>(subscriberSessionGUID.value);
    }
    if (termsOfUseContent.present) {
      map['terms_of_use_content'] = Variable<String>(termsOfUseContent.value);
    }
    if (termsOfUseFileName.present) {
      map['terms_of_use_file_name'] =
          Variable<String>(termsOfUseFileName.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('user_ui_detailsCompanion(')
          ..write('id: $id, ')
          ..write('aOMFeedbackEmailId: $aOMFeedbackEmailId, ')
          ..write('aOMFeedbackFromEmailId: $aOMFeedbackFromEmailId, ')
          ..write('baseURL1: $baseURL1, ')
          ..write('baseURL2: $baseURL2, ')
          ..write('buttoncolor: $buttoncolor, ')
          ..write('clientID: $clientID, ')
          ..write('clientLogo: $clientLogo, ')
          ..write('clientName: $clientName, ')
          ..write('dottedLineColour: $dottedLineColour, ')
          ..write('errorNumber: $errorNumber, ')
          ..write('fontFamily: $fontFamily, ')
          ..write('fontFilesName: $fontFilesName, ')
          ..write('fontPath: $fontPath, ')
          ..write('headerColour: $headerColour, ')
          ..write('headerTextcolour: $headerTextcolour, ')
          ..write('iconColour: $iconColour, ')
          ..write('isDownloadAndroid: $isDownloadAndroid, ')
          ..write('isDownloadIOS: $isDownloadIOS, ')
          ..write('isDownloadWindows: $isDownloadWindows, ')
          ..write('securityModel: $securityModel, ')
          ..write('subHeadercolour: $subHeadercolour, ')
          ..write('subHeadercolourdark: $subHeadercolourdark, ')
          ..write('subHeadercolourlight: $subHeadercolourlight, ')
          ..write('subscriberSessionGUID: $subscriberSessionGUID, ')
          ..write('termsOfUseContent: $termsOfUseContent, ')
          ..write('termsOfUseFileName: $termsOfUseFileName')
          ..write(')'))
        .toString();
  }
}

class $user_related_tokensTable extends user_related_tokens
    with TableInfo<$user_related_tokensTable, user_related_token> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $user_related_tokensTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _client_tokenMeta =
      const VerificationMeta('client_token');
  @override
  late final GeneratedColumn<String> client_token = GeneratedColumn<String>(
      'client_token', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _device_hashMeta =
      const VerificationMeta('device_hash');
  @override
  late final GeneratedColumn<String> device_hash = GeneratedColumn<String>(
      'device_hash', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _uuidMeta = const VerificationMeta('uuid');
  @override
  late final GeneratedColumn<String> uuid = GeneratedColumn<String>(
      'uuid', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _android_idMeta =
      const VerificationMeta('android_id');
  @override
  late final GeneratedColumn<String> android_id = GeneratedColumn<String>(
      'android_id', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _pns_keyMeta =
      const VerificationMeta('pns_key');
  @override
  late final GeneratedColumn<String> pns_key = GeneratedColumn<String>(
      'pns_key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _some_another_keyMeta =
      const VerificationMeta('some_another_key');
  @override
  late final GeneratedColumn<String> some_another_key = GeneratedColumn<String>(
      'some_another_key', aliasedName, false,
      additionalChecks: GeneratedColumn.checkTextLength(),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _some_another_valueMeta =
      const VerificationMeta('some_another_value');
  @override
  late final GeneratedColumn<String> some_another_value =
      GeneratedColumn<String>('some_another_value', aliasedName, false,
          additionalChecks: GeneratedColumn.checkTextLength(),
          type: DriftSqlType.string,
          requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        client_token,
        device_hash,
        uuid,
        android_id,
        pns_key,
        some_another_key,
        some_another_value
      ];
  @override
  String get aliasedName => _alias ?? 'user_related_tokens';
  @override
  String get actualTableName => 'user_related_tokens';
  @override
  VerificationContext validateIntegrity(Insertable<user_related_token> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('client_token')) {
      context.handle(
          _client_tokenMeta,
          client_token.isAcceptableOrUnknown(
              data['client_token']!, _client_tokenMeta));
    } else if (isInserting) {
      context.missing(_client_tokenMeta);
    }
    if (data.containsKey('device_hash')) {
      context.handle(
          _device_hashMeta,
          device_hash.isAcceptableOrUnknown(
              data['device_hash']!, _device_hashMeta));
    } else if (isInserting) {
      context.missing(_device_hashMeta);
    }
    if (data.containsKey('uuid')) {
      context.handle(
          _uuidMeta, uuid.isAcceptableOrUnknown(data['uuid']!, _uuidMeta));
    } else if (isInserting) {
      context.missing(_uuidMeta);
    }
    if (data.containsKey('android_id')) {
      context.handle(
          _android_idMeta,
          android_id.isAcceptableOrUnknown(
              data['android_id']!, _android_idMeta));
    } else if (isInserting) {
      context.missing(_android_idMeta);
    }
    if (data.containsKey('pns_key')) {
      context.handle(_pns_keyMeta,
          pns_key.isAcceptableOrUnknown(data['pns_key']!, _pns_keyMeta));
    } else if (isInserting) {
      context.missing(_pns_keyMeta);
    }
    if (data.containsKey('some_another_key')) {
      context.handle(
          _some_another_keyMeta,
          some_another_key.isAcceptableOrUnknown(
              data['some_another_key']!, _some_another_keyMeta));
    } else if (isInserting) {
      context.missing(_some_another_keyMeta);
    }
    if (data.containsKey('some_another_value')) {
      context.handle(
          _some_another_valueMeta,
          some_another_value.isAcceptableOrUnknown(
              data['some_another_value']!, _some_another_valueMeta));
    } else if (isInserting) {
      context.missing(_some_another_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  user_related_token map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return user_related_token(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      client_token: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}client_token'])!,
      device_hash: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}device_hash'])!,
      uuid: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uuid'])!,
      android_id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}android_id'])!,
      pns_key: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pns_key'])!,
      some_another_key: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}some_another_key'])!,
      some_another_value: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}some_another_value'])!,
    );
  }

  @override
  $user_related_tokensTable createAlias(String alias) {
    return $user_related_tokensTable(attachedDatabase, alias);
  }
}

class user_related_token extends DataClass
    implements Insertable<user_related_token> {
  final int id;
  final String client_token;
  final String device_hash;
  final String uuid;
  final String android_id;
  final String pns_key;
  final String some_another_key;
  final String some_another_value;
  const user_related_token(
      {required this.id,
      required this.client_token,
      required this.device_hash,
      required this.uuid,
      required this.android_id,
      required this.pns_key,
      required this.some_another_key,
      required this.some_another_value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['client_token'] = Variable<String>(client_token);
    map['device_hash'] = Variable<String>(device_hash);
    map['uuid'] = Variable<String>(uuid);
    map['android_id'] = Variable<String>(android_id);
    map['pns_key'] = Variable<String>(pns_key);
    map['some_another_key'] = Variable<String>(some_another_key);
    map['some_another_value'] = Variable<String>(some_another_value);
    return map;
  }

  user_related_tokensCompanion toCompanion(bool nullToAbsent) {
    return user_related_tokensCompanion(
      id: Value(id),
      client_token: Value(client_token),
      device_hash: Value(device_hash),
      uuid: Value(uuid),
      android_id: Value(android_id),
      pns_key: Value(pns_key),
      some_another_key: Value(some_another_key),
      some_another_value: Value(some_another_value),
    );
  }

  factory user_related_token.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return user_related_token(
      id: serializer.fromJson<int>(json['id']),
      client_token: serializer.fromJson<String>(json['client_token']),
      device_hash: serializer.fromJson<String>(json['device_hash']),
      uuid: serializer.fromJson<String>(json['uuid']),
      android_id: serializer.fromJson<String>(json['android_id']),
      pns_key: serializer.fromJson<String>(json['pns_key']),
      some_another_key: serializer.fromJson<String>(json['some_another_key']),
      some_another_value:
          serializer.fromJson<String>(json['some_another_value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'client_token': serializer.toJson<String>(client_token),
      'device_hash': serializer.toJson<String>(device_hash),
      'uuid': serializer.toJson<String>(uuid),
      'android_id': serializer.toJson<String>(android_id),
      'pns_key': serializer.toJson<String>(pns_key),
      'some_another_key': serializer.toJson<String>(some_another_key),
      'some_another_value': serializer.toJson<String>(some_another_value),
    };
  }

  user_related_token copyWith(
          {int? id,
          String? client_token,
          String? device_hash,
          String? uuid,
          String? android_id,
          String? pns_key,
          String? some_another_key,
          String? some_another_value}) =>
      user_related_token(
        id: id ?? this.id,
        client_token: client_token ?? this.client_token,
        device_hash: device_hash ?? this.device_hash,
        uuid: uuid ?? this.uuid,
        android_id: android_id ?? this.android_id,
        pns_key: pns_key ?? this.pns_key,
        some_another_key: some_another_key ?? this.some_another_key,
        some_another_value: some_another_value ?? this.some_another_value,
      );
  @override
  String toString() {
    return (StringBuffer('user_related_token(')
          ..write('id: $id, ')
          ..write('client_token: $client_token, ')
          ..write('device_hash: $device_hash, ')
          ..write('uuid: $uuid, ')
          ..write('android_id: $android_id, ')
          ..write('pns_key: $pns_key, ')
          ..write('some_another_key: $some_another_key, ')
          ..write('some_another_value: $some_another_value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, client_token, device_hash, uuid,
      android_id, pns_key, some_another_key, some_another_value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is user_related_token &&
          other.id == this.id &&
          other.client_token == this.client_token &&
          other.device_hash == this.device_hash &&
          other.uuid == this.uuid &&
          other.android_id == this.android_id &&
          other.pns_key == this.pns_key &&
          other.some_another_key == this.some_another_key &&
          other.some_another_value == this.some_another_value);
}

class user_related_tokensCompanion extends UpdateCompanion<user_related_token> {
  final Value<int> id;
  final Value<String> client_token;
  final Value<String> device_hash;
  final Value<String> uuid;
  final Value<String> android_id;
  final Value<String> pns_key;
  final Value<String> some_another_key;
  final Value<String> some_another_value;
  const user_related_tokensCompanion({
    this.id = const Value.absent(),
    this.client_token = const Value.absent(),
    this.device_hash = const Value.absent(),
    this.uuid = const Value.absent(),
    this.android_id = const Value.absent(),
    this.pns_key = const Value.absent(),
    this.some_another_key = const Value.absent(),
    this.some_another_value = const Value.absent(),
  });
  user_related_tokensCompanion.insert({
    this.id = const Value.absent(),
    required String client_token,
    required String device_hash,
    required String uuid,
    required String android_id,
    required String pns_key,
    required String some_another_key,
    required String some_another_value,
  })  : client_token = Value(client_token),
        device_hash = Value(device_hash),
        uuid = Value(uuid),
        android_id = Value(android_id),
        pns_key = Value(pns_key),
        some_another_key = Value(some_another_key),
        some_another_value = Value(some_another_value);
  static Insertable<user_related_token> custom({
    Expression<int>? id,
    Expression<String>? client_token,
    Expression<String>? device_hash,
    Expression<String>? uuid,
    Expression<String>? android_id,
    Expression<String>? pns_key,
    Expression<String>? some_another_key,
    Expression<String>? some_another_value,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (client_token != null) 'client_token': client_token,
      if (device_hash != null) 'device_hash': device_hash,
      if (uuid != null) 'uuid': uuid,
      if (android_id != null) 'android_id': android_id,
      if (pns_key != null) 'pns_key': pns_key,
      if (some_another_key != null) 'some_another_key': some_another_key,
      if (some_another_value != null) 'some_another_value': some_another_value,
    });
  }

  user_related_tokensCompanion copyWith(
      {Value<int>? id,
      Value<String>? client_token,
      Value<String>? device_hash,
      Value<String>? uuid,
      Value<String>? android_id,
      Value<String>? pns_key,
      Value<String>? some_another_key,
      Value<String>? some_another_value}) {
    return user_related_tokensCompanion(
      id: id ?? this.id,
      client_token: client_token ?? this.client_token,
      device_hash: device_hash ?? this.device_hash,
      uuid: uuid ?? this.uuid,
      android_id: android_id ?? this.android_id,
      pns_key: pns_key ?? this.pns_key,
      some_another_key: some_another_key ?? this.some_another_key,
      some_another_value: some_another_value ?? this.some_another_value,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (client_token.present) {
      map['client_token'] = Variable<String>(client_token.value);
    }
    if (device_hash.present) {
      map['device_hash'] = Variable<String>(device_hash.value);
    }
    if (uuid.present) {
      map['uuid'] = Variable<String>(uuid.value);
    }
    if (android_id.present) {
      map['android_id'] = Variable<String>(android_id.value);
    }
    if (pns_key.present) {
      map['pns_key'] = Variable<String>(pns_key.value);
    }
    if (some_another_key.present) {
      map['some_another_key'] = Variable<String>(some_another_key.value);
    }
    if (some_another_value.present) {
      map['some_another_value'] = Variable<String>(some_another_value.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('user_related_tokensCompanion(')
          ..write('id: $id, ')
          ..write('client_token: $client_token, ')
          ..write('device_hash: $device_hash, ')
          ..write('uuid: $uuid, ')
          ..write('android_id: $android_id, ')
          ..write('pns_key: $pns_key, ')
          ..write('some_another_key: $some_another_key, ')
          ..write('some_another_value: $some_another_value')
          ..write(')'))
        .toString();
  }
}

abstract class _$CaasLocalDatabase extends GeneratedDatabase {
  _$CaasLocalDatabase(QueryExecutor e) : super(e);
  late final $user_ui_detailsTable userUiDetails = $user_ui_detailsTable(this);
  late final $user_related_tokensTable userRelatedTokens =
      $user_related_tokensTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities =>
      [userUiDetails, userRelatedTokens];
}
