
{*******************************************************}
{                                                       }
{       Borland Delphi Visual Component Library         }
{                                                       }
{  Copyright (c) 1995-2001 Borland Software Corporation }
{                                                       }
{*******************************************************}

unit Consts;

interface

resourcestring
  SOpenFileTitle = '�������';
  SCantWriteResourceStreamError = 'Can''t write to a read-only resource stream';
  SDuplicateReference = 'WriteObject called twice for the same instance';
  SClassMismatch = '������ %s - �������� �����';
  SInvalidTabIndex = '������ Tab''� ������� �� �������';
  SInvalidTabPosition = '������� Tab''� ������������ � ������� ������ Tab''� ';
  SInvalidTabStyle = '����� Tab''a ����������� � ������� �������� Tab''a';
  SInvalidBitmap = '�������� ���������(Bitmap) ����������� ';
  SInvalidIcon = '�������� ����������� ������(Icon)';
  SInvalidMetafile = '�������� ����������� ���������';
  SInvalidPixelFormat = '�������� ������ �������� (PixelFormat)';
  SInvalidImage = '�������� �����������';
  SBitmapEmpty = '������ �����������';
  SScanLine = '������ ������������ ����� ��� ������';
  SChangeIconSize = '���������� ��������� �������� ������';
  SOleGraphic = '�������� �������� � TOleGraphic';
  SUnknownExtension = '����������� ������ ����������� (.%s)';
  SUnknownClipboardFormat = '���������������� ������� ������';
  SOutOfResources = '��� �������� �������';
  SNoCanvasHandle = '����� (Canvas) �� ��������� ��������';
  SInvalidImageSize = '�������� ������ �����������';
  STooManyImages = '������� ����� �����������';
  SDimsDoNotMatch = '������� ���������� TImage �� ������������� �������� TImageList';
  SInvalidImageList = '�������� ImageList';
  SReplaceImage = '���������� ����� �����������';
  SImageIndexError = '�������� ������ ���������� ImageList';
  SImageReadFail = '������ ������ ������ ImageList �� ������';
  SImageWriteFail = '������ ������ ������ ImageList � �����';
  SWindowDCError = '������ �������� ��������� ����';
  SClientNotSet = '������ TDrag �� ���������������';
  SWindowClass = '������ �������� ������ ����';
  SWindowCreate = '������ �������� ����';
  SCannotFocus = '���������� ���������� ����� ����� �� ����������� ��� ��������� ����';
  SParentRequired = 'Control ''%s'' �� ����� ������������ �����';
  SParentGivenNotAParent = '���������� �������� �� �������� ''%s''';
  SMDIChildNotVisible = '���������� �������� �������� ����� MDI (����������������� ����������)';
  SVisibleChanged = '�������� Visible ������ �������� � ���������� OnShow ��� OnHide';
  SCannotShowModal = '��������� ���� ������ ������� ������� (Visible:=true)';
  SScrollBarRange = '�������� ScrollBar''� ��� ���������� ������';
  SPropertyOutOfRange = '%s �������� ��� ���������� ������';
  SMenuIndexError = '������ ���� ��� �������� ������';
  SMenuReinserted = '���� ������ ���������';
  SMenuNotFound = '���-���� �� �������';
  SNoTimers = '�� ������� ��������� ��������';
  SNotPrinting = '������� ������ �� ��������� � ������ ������';
  SPrinting = '��� ������';
  SPrinterIndexError = '������ �������� ��� ���������� ������';
  SInvalidPrinter = '�������� ���������� ������� �� ���� �������';
  SDeviceOnPort = '%s �� %s';
  SGroupIndexTooLow = 'GroupIndex �� ����� ���� ������ ��� ���������� ������ ���� GroupIndex';
  STwoMDIForms = '� ����� ���������� �� ����� ���� ����� ��� ���� MDI �����';
  SNoMDIForm = '�� ���� ������� �����. �� ���� �� MDI ���� �� ������������';
  SImageCanvasNeedsBitmap = '����������� ����� �������� ������ ���� ��� �������� ���������(Bitmap) ';
  SControlParentSetToSelf = '������ �� ����� ���� ��������� ��� ����';
  SOKButton = 'OK';
  SCancelButton = '������';
  SYesButton = '&��';
  SNoButton = '&���';
  SHelpButton = '&������';
  SCloseButton = '&�������';
  SIgnoreButton = '&������������';
  SRetryButton = '&������';
  SAbortButton = '����������';
  SAllButton = '&���';

  SCannotDragForm = '�� ���� ���������� �����';
  SPutObjectError = '���������� ������ � ���������������� ��������';
  SCardDLLNotLoaded = '�� ���� ��������� CARDS.DLL';
  SDuplicateCardId = '������� ������� CardId ';

  SDdeErr = '������ �� DDE  ($0%x)';
  SDdeConvErr = 'DDE ������ - ���������� �� ����������� ($0%x)';
  SDdeMemErr = '������ ��������� ����� ����������� ������ DDE ��������� ���������� ($0%x)';
  SDdeNoConnect = '���������� ��������� � DDE ������������';

  SFB = 'FB';
  SFG = 'FG';
  SBG = 'BG';
  SOldTShape = '���������� ��������� ������ ������ TShape';
  SVMetafiles = '���������';
  SVEnhMetafiles = 'Enhanced Metafiles';
  SVIcons = '������';
  SVBitmaps = '�����';
  SGridTooLarge = '������� ������� ������� ��� ��������';
  STooManyDeleted = '������� ������� ����� ������� ��� ��������';
  SIndexOutOfRange = '������ ������� ��� ���������� ������';
  SFixedColTooBig = '���������� ������������� ������� ������ ���� ������, ��� ����� �������';
  SFixedRowTooBig = '���������� ������������� �������� ������ ���� ������, ��� ����� ��������';
  SInvalidStringGridOp = '���������� �������� ��� ������� ������ �� �������';
  SInvalidEnumValue = '�������� Enum ��������';
  SInvalidNumber = '�������� ���������';
  SOutlineIndexError = '������ ��� ����� �� ������';
  SOutlineExpandError = '�������� ������ ���� ��������';
  SInvalidCurrentItem = '�������� �������� ��� ������� �������';
  SMaskErr = '�������� ������� ��������';
  SMaskEditErr = '�������� ������� ��������. ����������� Escape, ����� �������� ���������';
  SOutlineError = 'Invalid outline index';
  SOutlineBadLevel = '�������� ���������� ������';
  SOutlineSelection = '�������� ���������';
  SOutlineFileLoad = '������ �������� �����';
  SOutlineLongLine = '����� ������� �������';
  SOutlineMaxLevels = '���������� ������������ �������';

  SMsgDlgWarning = '��������';
  SMsgDlgError = '������';
  SMsgDlgInformation = '����������';
  SMsgDlgConfirm = '�������������';
  SMsgDlgYes = '&��';
  SMsgDlgNo = '&���';
  SMsgDlgOK = 'OK';
  SMsgDlgCancel = '������';
  SMsgDlgHelp = '&������';
  SMsgDlgHelpNone = '������ ����������';
  SMsgDlgHelpHelp = '������';
  SMsgDlgAbort = '&��������';
  SMsgDlgRetry = '&������';
  SMsgDlgIgnore = '&������������';
  SMsgDlgAll = '&���';
  SMsgDlgNoToAll = '�� ��������� �� ����';
  SMsgDlgYesToAll = '��������� �� ����';

  SmkcBkSp = 'BkSp';
  SmkcTab = 'Tab';
  SmkcEsc = 'Esc';
  SmkcEnter = 'Enter';
  SmkcSpace = 'Space';
  SmkcPgUp = 'PgUp';
  SmkcPgDn = 'PgDn';
  SmkcEnd = 'End';
  SmkcHome = 'Home';
  SmkcLeft = 'Left';
  SmkcUp = 'Up';
  SmkcRight = 'Right';
  SmkcDown = 'Down';
  SmkcIns = 'Ins';
  SmkcDel = 'Del';
  SmkcShift = 'Shift+';
  SmkcCtrl = 'Ctrl+';
  SmkcAlt = 'Alt+';

  srUnknown = '(Unknown)';
  srNone = '(None)';
  SOutOfRange = '�������� ������ ���� ����� %d � %d';

  SDateEncodeError = '�������� �������� ��� ����������� ����';
  SDefaultFilter = '��� ����� (*.*)|*.*';
  sAllFilter = '���';
  SNoVolumeLabel = ': [ - no volume label - ]';
  SInsertLineError = '���������� �������� �����';

  SConfirmCreateDir = '������������� ���������� �� ����������. �������?';
  SSelectDirCap = '�������� ����������';
  SDirNameCap = '&��� ����������:';
  SDrivesCap = '��&���:';
  SDirsCap = '&����������:';
  SFilesCap = '&�����: (*.*)';
  SNetworkCap = '��&��...';

  SColorPrefix = 'Color';               //!! obsolete - delete in 5.0
  SColorTags = 'ABCDEFGHIJKLMNOP';      //!! obsolete - delete in 5.0

  SInvalidClipFmt = '�������� ������ ������';
  SIconToClipboard = '����� �� ������������ ����������� ������ (Icons)';
  SCannotOpenClipboard = '���������� ������� �����';

  SDefault = '�� ���������';

  SInvalidMemoSize = '����� �������� ������� ���������� Memo';
  SCustomColors = '������� �����';
  SInvalidPrinterOp = '�� �������������� �������� � ����������� ��������';
  SNoDefaultPrinter = '����� �� ������ �������';

  SIniFileWriteError = '���������� ������ � %s';

  SBitsIndexError = '������ ����� ��� ���������� ������';

  SUntitled = '(Untitled)';

  SInvalidRegType = '�������� ��� ������ ��� ''%s''';

  SUnknownConversion = '����������� ���� RichEdit (.%s)';
  SDuplicateMenus = '���� ''%s'' ��� ������������ ������ ������';

  SPictureLabel = '�����������:';
  SPictureDesc = ' (%dx%d)';
  SPreviewLabel = '����������';

  SCannotOpenAVI = '���������� ������� AVI';

  SNotOpenErr = '��� �������� MCI ����������';
  SMPOpenFilter = '��� ����� (*.*)|*.*|Wave ����� (*.wav)|*.wav|Midi ����� (*.mid)|*.mid|����� ��� Windows (*.avi)|*.avi';
  SMCINil = '';
  SMCIAVIVideo = 'AVIVideo';
  SMCICDAudio = 'CDAudio';
  SMCIDAT = 'DAT';
  SMCIDigitalVideo = 'DigitalVideo';
  SMCIMMMovie = 'MMMovie';
  SMCIOther = '������';
  SMCIOverlay = '���������� ����������';
  SMCIScanner = '������';
  SMCISequencer = 'MIDI-����';
  SMCIVCR = '������������';
  SMCIVideodisc = '����-�������-����';
  SMCIWaveAudio = 'Wav-����';
  SMCIUnknownError = '����������� ������';

  SBoldItalicFont = 'Bold Italic';
  SBoldFont = 'Bold';
  SItalicFont = 'Italic';
  SRegularFont = 'Regular';

  SPropertiesVerb = '��������';

  SServiceFailed = 'Service failed on %s: %s';
  SExecute = 'execute';
  SStart = 'start';
  SStop = 'stop';
  SPause = 'pause';
  SContinue = 'continue';
  SInterrogate = 'interrogate';
  SShutdown = 'shutdown';
  SCustomError = 'Service failed in custom message(%d): %s';
  SServiceInstallOK = 'Service installed successfully';
  SServiceInstallFailed = 'Service "%s" failed to install with error: "%s"';
  SServiceUninstallOK = 'Service uninstalled successfully';
  SServiceUninstallFailed = 'Service "%s" failed to uninstall with error: "%s"';

  SInvalidActionRegistration = 'Invalid action registration';
  SInvalidActionUnregistration = 'Invalid action unregistration';
  SInvalidActionEnumeration = 'Invalid action enumeration';
  SInvalidActionCreation = 'Invalid action creation';

  SDockedCtlNeedsName = 'Docked control must have a name';
  SDockTreeRemoveError = 'Error removing control from dock tree';
  SDockZoneNotFound = ' - Dock zone not found';
  SDockZoneHasNoCtl = ' - Dock zone has no control';

  SAllCommands = 'All Commands';

  SDuplicateItem = 'List does not allow duplicates ($0%x)';

  STextNotFound = '����� �� ������: "%s"';
  SBrowserExecError = 'No default browser is specified';

  SColorBoxCustomCaption = 'Custom...';

  SMultiSelectRequired = 'Multiselect mode must be on for this feature';

  SKeyCaption = '����';
  SValueCaption = '��������';
  SKeyConflict = '���� � ������ "%s" ��� ����������';
  SKeyNotFound = '���� "%s" �� ������';
  SNoColumnMoving = 'goColMoving is not a supported option';
  SNoEqualsInKey = 'Key may not contain equals sign ("=")';

  SSendError = '������ �������� ���������';
  SAssignSubItemError = 'Cannot assign a subitem to an actionbar when one of it''s parent''s is already assigned to an actionbar';
  SDeleteItemWithSubItems = 'Item %s has subitems, delete anyway?';
  SDeleteNotAllowed = 'You are not allowed to delete this item';
  SMoveNotAllowed = 'Item %s is not allowed to be moved';
  SMoreButtons = '������ ������';
  SErrorDownloadingURL = '������ �������� URL: %s';
  SUrlMonDllMissing = '���������� ��������� %s';
  SAllActions = '(All Actions)';
  SNoCategory = '(No Category)';
  SExpand = 'Expand';
  SErrorSettingPath = '������ ��������� ����: "%s"';
  SLBPutError = 'Attempting to put items into a virtual style listbox';
  SErrorLoadingFile = 'Error loading previously saved settings file: %s'#13'Would you like to delete it?';
  SResetUsageData = 'Reset all usage data?';
  SFileRunDialogTitle = 'Run';
  SNoName = '(No Name)';
  SErrorActionManagerNotAssigned = 'ActionManager must first be assigned';
  SAddRemoveButtons = '&Add or Remove Buttons';
  SResetActionToolBar = 'Reset Toolbar';
  SCustomize = '&Customize';
  SSeparator = 'Separator';
  SCirularReferencesNotAllowed = 'Circular references not allowed';
  SCannotHideActionBand = '%s does not allow hiding';
  SErrorSettingCount = 'Error setting %s.Count';
  SListBoxMustBeVirtual = 'Listbox (%s) style must be virtual in order to set Count';
  SUnableToSaveSettings = 'Unable to save settings';
  SRestoreDefaultSchedule = 'Would you like to reset to the default Priority Schedule?';
  SNoGetItemEventHandler = 'No OnGetItem event handler assigned';
  SInvalidColorMap = 'Invalid Colormap this ActionBand requires ColorMaps of type TCustomActionBarColorMapEx';
  SDuplicateActionBarStyleName = '����� � ������ %s ��� ���������������';
  SStandardStyleActionBars = '����������� �����';
  SXPStyleActionBars = 'XP �����';
  SActionBarStyleMissing = 'No ActionBand style unit present in the uses clause.'#13 +
    'Your application must include either XPStyleActnCtrls, StdStyleActnCtrls or ' +
    'a third party ActionBand style unit in its uses clause.';

implementation

end.
