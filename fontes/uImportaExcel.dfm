object frmImportaExcel: TfrmImportaExcel
  Left = 277
  Top = 125
  BorderStyle = bsSingle
  Caption = 'Importa'#231#227'o de Arquivo Excel - CSV'
  ClientHeight = 441
  ClientWidth = 672
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 672
    Height = 82
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 172
      Height = 13
      Caption = 'Selecione o arquivo a ser importado:'
    end
    object edtArquivo: TEdit
      Left = 24
      Top = 40
      Width = 465
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnSelecao: TBitBtn
      Left = 496
      Top = 40
      Width = 25
      Height = 20
      TabOrder = 1
      OnClick = btnSelecaoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
    end
    object btnExplicacoes: TBitBtn
      Left = 552
      Top = 33
      Width = 103
      Height = 31
      Caption = 'Explica'#231#245'es'
      TabOrder = 2
      OnClick = btnExplicacoesClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E0BAA900E0BAA900DDBAAA00DAB8A900E0BA
        A900FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2C2B500E9DDD900E3E5E600DEE2E700D1CBCC00CCC6C700BCBB
        BF00B1ABAC00B8A39C00D8B5A500FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00DEB7A500F0EDED00EFF2F300E5D9D500D5A79200C2683F00C26A4200C595
        8000C1B1AC00ABA3A300AD9E9A00FF00FF00FF00FF00FF00FF00FF00FF00E3C4
        B500F8F6F400F6F4F300CF7F5900BD4A1A00BB441400FF00FF00FF00FF00BB46
        1700BF4C1B00C1775500C0B7B700B6A7A400DCB7A700FF00FF00FF00FF00F3E9
        E200FCFFFF00D78F6C00BB451600BF4E1F00BC471800FBF2ED00F7E7E000BC4A
        1A00BF4E1F00BF471700C27A5900BBB1B100C9B1AA00FF00FF00E0BAA900FF00
        FF00FEFAF800C1501F00C1522300BF4D1E00BC481800EFD1C100EFCFBF00BD4A
        1A00BF4E1F00BF4E1F00BF4A1900D0C9C900C7C4C600E0BAA900E1BCAB00FF00
        FF00F2D5C600C65D2A00C4592800C0512100BB451600FF00FF00FF00FF00BA43
        1400BF4E1F00BF4E1F00BF4D1E00D1AF9F00D3D4D800E0BAA900E6C7BA00FF00
        FF00E3AD8E00CE6D3800CB693400C7602D00C55A2800EFCFBF00FF00FF00F2DD
        D300CC724700BF4E1F00BF4E1F00CF896800E5E7ED00E0BAA900E6C6B800FF00
        FF00E7B58B00D1773F00CF723B00CB693400CA653100C7623000EBC4AF00FF00
        FF00FCF7F400BC471800BF4E1F00D18B6A00EAEFF400E0BAA900E0BBAA00FF00
        FF00F6E2D000D8864C00D8864C00DA916200D1794200CC6B3600C9642F00EBC4
        AD00FF00FF00D17D5300BC471600E5C5B600F3F8FE00E0BAA900FF00FF00FF00
        FF00FEFCFB00D9864600EEC6A600FEFCFB00E2A47B00D0733C00CE6D3800E2A7
        8800FF00FF00D88C6800BD471600F4F2F200F6F8FA00FF00FF00FF00FF00F3E3
        DD00FF00FF00EEC59D00E0985900FF00FF00FF00FF00F0D0B800F0D0B700FF00
        FF00FF00FF00C75D2600DE9F7D00FCFFFF00EBD5CC00FF00FF00FF00FF00E2BF
        B000FCF6F200FFFEFE00EBBC8E00F6E1CA00FF00FF00FF00FF00FF00FF00FEFC
        FB00EEC9B000E2A47B00FEFCFB00F3EBE600E0BBAA00FF00FF00FF00FF00FF00
        FF00FF00FF00FAF3F000FF00FF00FCF6F200F4D9BC00EBBC8E00E7B58B00F0D0
        B700FCF6F200FF00FF00F7EEEA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2BFB000F3E5DE00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00F2DDD300E0BBAA00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00DEB7A500E1BCAC00E1BCAB00E1BC
        AB00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 82
    Width = 672
    Height = 297
    Align = alClient
    BevelInner = bvLowered
    TabOrder = 1
    object memoLog: TMemo
      Left = 40
      Top = 24
      Width = 601
      Height = 249
      ReadOnly = True
      TabOrder = 0
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 379
    Width = 672
    Height = 62
    Align = alBottom
    TabOrder = 2
    object btValidar: TBitBtn
      Left = 525
      Top = 16
      Width = 107
      Height = 33
      Caption = 'Validar Dados'
      TabOrder = 0
      OnClick = btValidarClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00CA999800FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF006392B200278D
        EF001D74B300D19A9700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF004EB5FC0041A3
        FF00278DEF007D829300CF999700FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0054BA
        FE005BBCFF00258BEB001F74B100D29A9700FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF0035A0
        FE0053B9FE003FA2FF00268CEC0082849300D09A9800FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0056BBFE005ABBFF003487D50056666F00FFFFFF009F6F6D00C8A7
        9B00D2B3A500CDA09C00C6929200FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF0035A1FE0050B8FF00C0CCD8009E9C9A00AF8E8300E2D4B800FFFF
        DA00FFFFDB00FCF8D600ECDDC400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00C5ABA900CBA59600FDEBBD00FDF6CE00FFFF
        D900FFFFDA00FFFFE200FFFFE800FEFEFD00C4A5A100FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00C0918C00F3DFB800F6D9AB00FDF5CD00FFFF
        D900FFFFDD00FFFFF200FFFFF700FFFFFF00F3ECD800FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00E7CDB100FFEDBA00F2C99500FFFDD600FFFD
        D600FFFDD600FFFDD600FFFDD600FFFFE200FFFFE100C4919200FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00EFD8B600FEEBB900F2C99500F2C99500FFFD
        D600FFFDD600FFFDD600FFFDD600FFFFDE00FFFFDF00BB9A8E00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00E6CBAF00FFF3C100EFBD8700F2C99500FBEE
        C400FFFDD600FFFFDA00FFFFDA00FFFFD900FFFFDD00C4919200FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00D4B0A000FFF1C100F7DDB100F4CF9C00F6D7
        A800FAE7BC00FFFDD700FFFFD900FFFFD800FFFED700FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C29C8E00FFFFFF00FFFFFF00F2C9
        9600EFB88300F3CA9800F7DAAA00FAF0C600BE998F00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00F5F0E800FFFFF300FCE7
        B400F9DDAA00FCE6B300FFF0BE00C59F9400FFFFFF00FFFFFF00FFFFFF00FFFF
        FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00C39B
        9000CCA69900CA9B9800FFFFFF00FFFFFF00FFFFFF00FFFFFF00}
    end
    object btAvancar: TBitBtn
      Left = 525
      Top = 16
      Width = 107
      Height = 33
      Caption = 'Avan'#231'ar'
      TabOrder = 1
      OnClick = btAvancarClick
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF000066000021A33500FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00006600001EB4320018AE290027AF3E0000660000FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00006600001F99310026BA3E001FB5340013AB230025AE3C00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00006600004FDA790048D56F002FB34A0000660000006600001CB22F0022AC
        380000660000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF000066000055E0820050DB7B0000660000B73D3D00FF00FF000066000017AE
        270021AB3600FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00B73D3D0047CF6D0000660000CD686800CB636300B73D3D00FF00FF00FF00
        FF000066000014AB230000660000FF00FF00FF00FF00FF00FF00FF00FF00B73D
        3D00C95D5D0000660000D37B7B00B73D3D00D0717100CE6C6C00B73D3D00FF00
        FF00FF00FF000B7E130014AB2400FF00FF00FF00FF00FF00FF00FF00FF00DF9F
        9F00DE9C9C00D47D7D00B73D3D00FF00FF00FF00FF00C6545400CC666600B73D
        3D00FF00FF00FF00FF00FF00FF0008790F0000660000FF00FF00FF00FF00D174
        7400E0A2A200B73D3D00FF00FF00FF00FF00FF00FF00FF00FF00B73D3D00CD69
        6900B73D3D00FF00FF00FF00FF00FF00FF0000660000FF00FF00FF00FF00FF00
        FF00B73D3D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00B73D
        3D00C2484800B73D3D00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00C6535300B73D3D00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00B73D3D00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00B73D3D00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'CSV files (*.csv)|*.csv'
    Left = 528
    Top = 8
  end
end
