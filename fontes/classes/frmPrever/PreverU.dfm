object frmPrever: TfrmPrever
  Left = 126
  Top = 89
  Width = 684
  Height = 522
  Caption = 'Preview'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 1
      Top = 3
      Width = 22
      Height = 13
      Caption = 'Pa&g:'
      FocusControl = sePage
      Transparent = False
    end
    object Label3: TLabel
      Left = 184
      Top = 3
      Width = 27
      Height = 13
      Hint = 'Zoom para porcentagem especificada'
      Caption = '&Zoom'
      FocusControl = seZoom
      ParentShowHint = False
      ShowHint = True
      Transparent = False
    end
    object sbFirstPage: TSpeedButton
      Left = 76
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Ir para primeira pagina'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = sbFirstPageClick
    end
    object sbPreviousPage: TSpeedButton
      Left = 101
      Top = 0
      Width = 25
      Height = 25
      Hint = 'voltar uma pagina'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = sbPreviousPageClick
    end
    object sbNextPage: TSpeedButton
      Left = 128
      Top = 0
      Width = 23
      Height = 25
      Hint = 'Ir para pagina seguinte'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = sbNextPageClick
    end
    object sbLastPage: TSpeedButton
      Left = 151
      Top = 0
      Width = 25
      Height = 25
      Hint = 'ir para ultima pagina'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = sbLastPageClick
    end
    object ZoomToWidth: TSpeedButton
      Left = 318
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Zoom para largura da pagina'
      GroupIndex = 1
      Down = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ZoomToWidthClick
    end
    object ZoomTo100: TSpeedButton
      Left = 293
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Zoom de 100%'
      GroupIndex = 1
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ZoomTo100Click
    end
    object ZoomToFit: TSpeedButton
      Left = 268
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Zoom para encaixar na tela'
      GroupIndex = 1
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = ZoomToFitClick
    end
    object PrintSetup: TSpeedButton
      Left = 433
      Top = 0
      Width = 25
      Height = 25
      Hint = 'configurar impressora'
      Enabled = False
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = PrintSetupClick
    end
    object Print: TSpeedButton
      Left = 458
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Imprimir'
      Enabled = False
      Flat = True
      ParentShowHint = False
      ShowHint = True
      Visible = False
      OnClick = PrintClick
    end
    object lblCopies: TLabel
      Left = 352
      Top = 4
      Width = 32
      Height = 13
      Hint = 'Quantidade de copias a serem impresssas'
      Caption = '&Copias'
      FocusControl = SpinEditCopies
      ParentShowHint = False
      ShowHint = True
      Transparent = False
    end
    object Load: TSpeedButton
      Left = 492
      Top = 0
      Width = 25
      Height = 25
      Hint = 'Carregar um relatorio previamente gravado'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = LoadClick
    end
    object Save: TSpeedButton
      Left = 517
      Top = 0
      Width = 25
      Height = 25
      Hint = 'gravar um relatorio para posterior uso'
      Flat = True
      ParentShowHint = False
      ShowHint = True
      OnClick = SaveClick
    end
    object sePage: TSpinEdit
      Left = 32
      Top = 0
      Width = 41
      Height = 22
      Hint = 'Ir Para Pagina No.'
      MaxValue = 0
      MinValue = 0
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      Value = 0
      OnChange = sePageChange
    end
    object seZoom: TSpinEdit
      Left = 216
      Top = 0
      Width = 49
      Height = 22
      Hint = 'Zoom para porcentagem especificada'
      Increment = 10
      MaxValue = 300
      MinValue = 10
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      Value = 100
      OnChange = seZoomChange
    end
    object BitBtnExit: TBitBtn
      Left = 556
      Top = 0
      Width = 57
      Height = 25
      Hint = 'sair'
      Caption = '&Sair'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = BitBtnExitClick
      Glyph.Data = {
        56070000424D5607000000000000360400002800000028000000140000000100
        0800000000002003000000000000000000000001000000010000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A600F0FBFF00A4A0A000808080000000FF0000FF000000FFFF00FF000000FF00
        FF00FFFF0000FFFFFF0000000000000080000080000000808000800000008000
        800080800000C0C0C000C0DCC000F0CAA600F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00000000000000
        800000800000008080008000000080008000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030707070707
        0707070707070707070707070707031313131313131313131313130303030303
        03130C0C0C0C0C0C0C0C0C0C0C0C1307130713070C0C0C0C0C0C0C0C0C0C0C0C
        0C0C0303030303030C0C0C0C0C0C0C0C0C0C0C0C0C0707130713070C0C0C0C0C
        0C0C0C0C0C0C0C0C0C1303030313130C0C0C04040404040400000C0C0C131313
        0404040404040C0C0C0C0C0C0C0C0C0C0C0303030C0C0C0C0C03030303030304
        110500000713131304030303030303030303030C130C0C0C130303030C130303
        0303030303030304051105001313131304030303030303030303030C0C070C0C
        130303030C130303030303030303030411051100131313130403030303030303
        0303030C130C070C130303030C13030303030303030303040511050013121312
        04030303030303030303030C0C070C0C130303030C1303030303030303030304
        110511001313131304030303030303030303030C130C070C130303030C130303
        0303030303030304051105001312131204030303030303030303030C0C070C0C
        130303030C130303030303030303030411051100131313130403030303030303
        0303030C130C070C130303030C13030303030303030303040511050013121312
        04030303030303030303030C0C070C0C130303030C1303030303030303030304
        110511001213121304030303030303030303030C130C070C130303030C130303
        0303030303030304051105001312131204030303030303030303030C0C070C0C
        130303030C130303030303030303030411051100121312130403030303030303
        0303030C130C130C131313130C13030303030303030303040404040404040404
        04030303030303030303030C0C0C0C0C0C0C0C0C0C0303030303030303030303
        0303030303030303030303030303030303030303030313131313131303030303
        03030303030303030300000000000003030303030303030303030303030C0C0C
        0C0C0C1303030303030303030303030303000E0E0E0E00030303030303030303
        03030303030C131313130C130303030303030303030303030300000000000003
        030303030303030303030303030C0C0C0C0C0C03030303030303}
      NumGlyphs = 2
    end
    object SpinEditCopies: TSpinEdit
      Left = 388
      Top = 0
      Width = 37
      Height = 22
      Hint = 'Quantidade de copias a serem impresssas'
      MaxValue = 999
      MinValue = 1
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      Value = 1
    end
  end
  object QRPreview: TQRPreview
    Left = 0
    Top = 25
    Width = 668
    Height = 458
    HorzScrollBar.Tracking = True
    VertScrollBar.Tracking = True
    Align = alClient
    Color = clBtnFace
    ParentColor = False
    TabOrder = 1
    OnPageAvailable = QRPreviewPageAvailable
    PageNumber = 1
    Zoom = 100
  end
  object SaveDialogExport: TSaveDialog
    Filter = 
      'ASCII text|*.txt|Comma separated values|*.csv|Excel|*.xls|HTML|*' +
      '.htm'
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Title = 'Exportar relatorio como'
    Left = 24
    Top = 32
  end
end
