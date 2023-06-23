object frmPesqFazenda: TfrmPesqFazenda
  Left = 406
  Top = 204
  BorderStyle = bsSingle
  Caption = 'Pesquisa de Fazenda'
  ClientHeight = 350
  ClientWidth = 483
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlFIltro: TPanel
    Left = 0
    Top = 0
    Width = 483
    Height = 151
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
    object Label1: TLabel
      Left = 54
      Top = 76
      Width = 28
      Height = 13
      Alignment = taRightJustify
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 27
      Top = 12
      Width = 61
      Height = 18
      Alignment = taRightJustify
      Caption = 'FILTROS'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -13
      Font.Name = 'Arial Black'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 71
      Top = 52
      Width = 11
      Height = 13
      Alignment = taRightJustify
      Caption = 'ID'
    end
    object edtNomeFazenda: TEdit
      Left = 90
      Top = 72
      Width = 350
      Height = 21
      Hint = 'Informe o nome'
      CharCase = ecUpperCase
      MaxLength = 50
      TabOrder = 1
      OnEnter = Status
    end
    object c: TBitBtn
      Left = 372
      Top = 104
      Width = 93
      Height = 33
      Hint = 'Executar pesquisa'
      Caption = 'Pesquisar'
      TabOrder = 2
      OnClick = cClick
      OnEnter = Status
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000C40E0000C40E00000000000000000000FFFFFFFFFFFF
        A3C9A5CDE2CEFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF2B9632359B3B3D9941D0E5D0FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC
        339B39359B3B359B3B359B3B399C3EC9E4C9FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC349B3B359B3B359B3B359B3B359B3B30
        983741A444C5E5C5FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC
        329A38359B3B359B3B359B3B359B3B359B3B359B3B359B3B39A03EBCE2BCFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC339B39359B3B359B3B359B3B359B3B35
        9B3B359B3B359B3B359B3B2E9D303DA73FAEDCAEFFFFFFFFFFFFFFFFFFECF5EC
        359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B
        3B33A0378FC792FFFFFFFFFFFFECF5EC359B3B359B3B359B3B359B3B359B3B35
        9B3B359B3B359B3B359B3B359B3B359B3B359B3B6EBB72FFFFFFFFFFFFECF5EC
        359B3A359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B
        3B3AA33F90C793FFFFFFFFFFFFECF5EC349B3A359B3B359B3B359B3B359B3B35
        9B3B359B3B359B3B359B3B359B3B53AB57CDE6CFFFFFFFFFFFFFFFFFFFECF5EC
        359B3B359B3B359B3B359B3B359B3B359B3B359B3B359B3B48A54EC1DFC3FFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC359B3C359B3B359B3B359B3B359B3B3A
        9F403B9D40B6DAB9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC
        349B3B359B3B359B3B359B3B369A3C8DC690FFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFECF5EC329B37359B3B2C953286C389FFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        359B3B359B3BF9FCF9FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
    end
    object edtIDFazenda: TEdit
      Left = 90
      Top = 48
      Width = 50
      Height = 21
      Hint = 'Informe i ID da Fazenda'
      CharCase = ecUpperCase
      MaxLength = 5
      TabOrder = 0
      OnEnter = Status
      OnKeyPress = edtIDFazendaKeyPress
    end
  end
  object gridPesqFazenda: TDBGrid
    Left = 0
    Top = 180
    Width = 483
    Height = 151
    Align = alClient
    DataSource = dsPesqFazenda
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'IDFAZENDA'
        Title.Alignment = taCenter
        Title.Caption = 'ID'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'NOME'
        Title.Alignment = taCenter
        Title.Caption = 'Nome'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -11
        Title.Font.Name = 'MS Sans Serif'
        Title.Font.Style = [fsBold]
        Width = 350
        Visible = True
      end>
  end
  object ToolBar1: TToolBar
    Left = 0
    Top = 151
    Width = 483
    Height = 29
    Caption = 'ToolBar1'
    EdgeBorders = [ebLeft, ebTop, ebRight, ebBottom]
    TabOrder = 2
    object ToolButton1: TToolButton
      Left = 0
      Top = 2
      Width = 8
      Caption = 'ToolButton1'
      Style = tbsSeparator
    end
    object BitBtn1: TBitBtn
      Tag = 1
      Left = 8
      Top = 2
      Width = 25
      Height = 22
      TabOrder = 0
      OnClick = BitBtn1Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004E2700004E2700005E2E00005E2E00005028
        00004E270000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006632000062300000B85B0000C2600000BE5E0000BE5E0000C260
        0000BA5C00006E36000052290000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00783B0000BA5C0000BE5E0000BA5C0000BA5C0000BA5C0000BA5C
        0000BC5D0000BE5E000086420000FF00FF00FF00FF00FF00FF00FF00FF005C2D
        000086420000FF00FF00FF00FF00D66A0000C2600000B65A0000BC5D0000BA5C
        0000BA5C0000BA5C0000BC5D00008A44000052290000FF00FF00FF00FF006431
        0000D66A0000FF00FF00FF00FF00B4590000C6620000BE630900E8C8A900FBF5
        F000DBA97900BA5C0000BA5C0000C05F000068330000FF00FF00FF00FF00E06F
        0000EC750000FF00FF00FF00FF00C2600000C0620600FF00FF00FF00FF00E7C5
        A500BE640D00BA5C0000BA5C0000BC5D0000BC5D0000FF00FF00763A0000F87B
        0000EA740000FF00FF00FF00FF00C7640400E6C3A000FF00FF00FFFEFE00BC5D
        0000BA5C0000BA5C0000BA5C0000BA5C0000C2600000562A0000803F0000FF86
        0F00FF860F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FEF8F200FFFC
        F800FDFBF800FDFBF800FDFBF800FDFBF800F6EADE00542A00008A440000FF97
        3100FF860F00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FFFEFE00C05F0000984B0000FFB2
        6700E8730000FF00FF00FF00FF00FDA54F00FFF8F100FF00FF00FEE3C900E271
        0100DB720A00DA710A00DA710A00D66F0A00D66C0300C2600000FF00FF00FFE2
        C500FFE2C500FF00FF00FF00FF00FC7D0000FDA04400FF00FF00FF00FF00F395
        3900E06F0000DA6C0000DA6C0000D66A0000CE660000FF00FF00FF00FF00E270
        0000FFE2C500FF00FF00FF00FF00E8730000E8730000FD953000FFEDDB00FF00
        FF00FCCEA100D86B0000D4690000D46900009A4C0000FF00FF00FF00FF00F479
        0000FFE2C500FF00FF00FF00FF00E8730000E8730000F87B0000FC912800FFF0
        E200FF9D3E00DC6D0000D86B0000CE66000066320000FF00FF00FF00FF00FF00
        FF00FF00FF00FFB16500FFE2C500FFE2C500FFE2C500E8730000E8730000FF89
        1500FF8B1900FC7D0000EA740000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2700000FF9C3B00FFDEBD00FFE2C500FFCB9900FFC28700FFB4
        6B00FFA44B00F479000094490000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E2700000E06F0000F87B0000FA7C0000CC65
        00009A4C0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BitBtn2: TBitBtn
      Tag = 1
      Left = 33
      Top = 2
      Width = 25
      Height = 22
      TabOrder = 1
      OnClick = BitBtn2Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004E2700004E2700005E2E00005E2E00005028
        00004E270000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006632000062300000B85B0000C2600000BE5E0000BE5E0000C260
        0000BA5C00006E36000052290000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00783B0000BA5C0000BE5E0000BA5C0000BA5C0000BA5C0000BA5C
        0000BC5D0000BE5E000086420000FF00FF00FF00FF00FF00FF00FF00FF005C2D
        000086420000CE660000C6620000BC5D0000B65A0000BA5C0000BA5C0000BA5C
        0000BA5C0000BA5C0000BC5D00008A44000052290000FF00FF00FF00FF006431
        0000D66A0000D0670000CE660000B65A0000BE630900FBF5F000FBF5F000BA5C
        0000BA5C0000BA5C0000BA5C0000C05F000068330000FF00FF00FF00FF00E06F
        0000EC750000D66A0000C2600000E8C7A600FF00FF00FF00FF00E7C5A500BA5C
        0000BA5C0000BA5C0000BA5C0000BC5D0000BC5D0000FF00FF00763A0000F87B
        0000EA740000D4690000C7640400FF00FF00FF00FF00E2BA9200BC5D0000BA5C
        0000BA5C0000BA5C0000BA5C0000BA5C0000C2600000562A0000803F0000FF86
        0F00F87B0000FDC48C00FF00FF00FF00FF00FF00FF00FFFAF600FFFCF800FDFB
        F800FDFBF800FDFBF800FDFBF800BA5C0000C2600000542A00008A440000FF97
        3100FF800300FFF8F200FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BC5D0000C05F000066320000984B0000FFB2
        6700FFA64F00FC7D0000FDA54F00FF00FF00FF00FF00F38E2C00E2710100DB72
        0A00DA710A00D66F0A00D66F0A00C4610000C2600000562A0000FF00FF00FFB1
        6500FFC08300E8730000FC7D0000FFF4EA00FF00FF00FEEBD800F3953900DA6C
        0000DA6C0000DA6C0000D66A0000C05F0000C2600000FF00FF00FF00FF00E270
        0000FFCB9900FFA64F00FF7E0000F87B0000FD953000FF00FF00FF00FF00E270
        0000E06F0000D86B0000D4690000D46900009A4C0000FF00FF00FF00FF00F479
        0000FF983300FFD8B100FFA44B00E8730000F87B0000FEDEBE00FFF0E200E270
        0000E2700000DC6D0000D86B0000CE66000066320000FF00FF00FF00FF00FF00
        FF00FF00FF00FFB16500FFE2C500FFCFA100FFB26700FF8F2100FF891500FF8E
        1F00FF8E1F00FC7D0000EA740000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2700000FF9C3B00FFDEBD00FFE2C500FFCB9900FFC28700FFB4
        6B00FFA44B00F479000094490000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E2700000E06F0000F87B0000FA7C0000CC65
        00009A4C0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BitBtn3: TBitBtn
      Tag = 1
      Left = 58
      Top = 2
      Width = 25
      Height = 22
      TabOrder = 2
      OnClick = BitBtn3Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004E2700004E2700005E2E00005E2E00005028
        00004E270000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006632000062300000B85B0000C2600000BE5E0000BE5E0000C260
        0000BA5C00006E36000052290000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00783B0000BA5C0000BE5E0000BA5C0000BA5C0000BA5C0000BA5C
        0000BC5D0000BE5E000086420000FF00FF00FF00FF00FF00FF00FF00FF005C2D
        000086420000CE660000C6620000BC5D0000B65A0000BA5C0000BA5C0000BA5C
        0000BA5C0000BA5C0000BC5D00008A44000052290000FF00FF00FF00FF006431
        0000D66A0000D0670000CE660000B65A0000BC5D0000DBA97900FBF5F000E8C8
        A900BC620900BA5C0000BA5C0000C05F000068330000FF00FF00FF00FF00E06F
        0000EC750000D66A0000C2600000BE5E0000BC5D0000BE640D00E7C5A500FF00
        FF00FF00FF00BC600600BA5C0000BC5D0000BC5D0000FF00FF00763A0000F87B
        0000EA740000D4690000C6620000BC5D0000BC5D0000BC5D0000BC5D0000FFFE
        FE00FF00FF00E5C2A000BB5F0400BA5C0000C2600000562A0000803F0000FF86
        0F00F87B0000FEEEDE00FFFBF800FFFBF800FFFBF800FFFBF800FFFCF800FBF7
        F200FF00FF00FF00FF00FF00FF00BA5C0000C2600000542A00008A440000FF97
        3100FF800300FFFEFE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00BC5D0000C05F000066320000984B0000FFB2
        6700FFA64F00FC7F0300FC820A00FC820A00FC820A00F17C0A00E2710100F7E0
        C900FF00FF00FDF7F100E1974F00C4610000C2600000562A0000FF00FF00FFB1
        6500FFC08300E8730000FC7D0000FC7D0000FC7D0000F87B0000F3953900FF00
        FF00FF00FF00E4934400D66A0000C05F0000C2600000FF00FF00FF00FF00E270
        0000FFCB9900FFA64F00FF7E0000F87B0000FC7D0000FECFA100FF00FF00FBEB
        DB00E68A3000D86B0000D4690000D46900009A4C0000FF00FF00FF00FF00F479
        0000FF983300FFD8B100FFA44B00E8730000F87B0000FD9D3E00FFF0E200E786
        2800E2700000DC6D0000D86B0000CE66000066320000FF00FF00FF00FF00FF00
        FF00FF00FF00FFB16500FFE2C500FFCFA100FFB26700FF8F2100FF891500FF8E
        1F00FF8E1F00FC7D0000EA740000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2700000FF9C3B00FFDEBD00FFE2C500FFCB9900FFC28700FFB4
        6B00FFA44B00F479000094490000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E2700000E06F0000F87B0000FA7C0000CC65
        00009A4C0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object BitBtn4: TBitBtn
      Tag = 1
      Left = 83
      Top = 2
      Width = 25
      Height = 22
      TabOrder = 3
      OnClick = BitBtn4Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF004E2700004E2700005E2E00005E2E00005028
        00004E270000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF006632000062300000B85B0000C2600000BE5E0000BE5E0000C260
        0000BA5C00006E36000052290000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00783B0000BA5C0000BE5E0000BA5C0000BA5C0000BA5C0000BA5C
        0000BC5D0000BE5E000086420000FF00FF00FF00FF00FF00FF00FF00FF005C2D
        000086420000BC5D0000B65A0000BA5C0000BA5C0000BA5C0000BA5C0000BA5C
        0000BA5C0000FF00FF00FF00FF008A44000052290000FF00FF00FF00FF006431
        0000D66A0000B65A0000BC5D0000DBA97900FBF5F000E8C8A900BC620900BA5C
        0000BA5C0000FF00FF00FF00FF00C05F000068330000FF00FF00FF00FF00E06F
        0000EC750000BE5E0000BC5D0000BE640D00E7C5A500FF00FF00FF00FF00BC60
        0600BA5C0000FF00FF00FF00FF00BC5D0000BC5D0000FF00FF0070370000D469
        0000C6620000BC5D0000BC5D0000BC5D0000BC5D0000FFFEFE00FF00FF00E5C2
        A000BB5F0400FF00FF00FF00FF00C2600000C2600000562A000070370000FEEE
        DE00FFFBF800FFFBF800FFFBF800FFFBF800FFFCF800FBF7F200FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C2600000C2600000542A000070370000FFFE
        FE00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00C2600000C05F00006632000070370000FC7F
        0300FC820A00FC820A00FC820A00F17C0A00E2710100F7E0C900FF00FF00FDF7
        F100E1974F00FF00FF00FF00FF00C2600000C2600000562A000070370000E873
        0000FC7D0000FC7D0000FC7D0000F87B0000F3953900FF00FF00FF00FF00E493
        4400D66A0000FF00FF00FF00FF00C05F0000C2600000FF00FF00FF00FF00E270
        0000FFCB9900FFA64F00FC7D0000FECFA100FF00FF00FBEBDB00E68A3000D86B
        0000E6720000FF00FF00FF00FF00D46900009A4C0000FF00FF00FF00FF00F479
        0000FF983300FFD8B100F87B0000FD9D3E00FFF0E200E7862800EE760000EE76
        0000E6720000FF00FF00FF00FF00CE66000066320000FF00FF00FF00FF00FF00
        FF00FF00FF00FFB16500FFE2C500FF8F2100FF891500FFB46B00EE760000FF8E
        1F00FF8E1F00FC7D0000EA740000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00E2700000FF9C3B00FFDEBD00FFE2C500FFCB9900FFC28700FFB4
        6B00FFA44B00F479000094490000FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00E2700000E06F0000F87B0000FA7C0000CC65
        00009A4C0000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
    object ToolButton2: TToolButton
      Left = 108
      Top = 2
      Width = 20
      Caption = 'ToolButton2'
      ImageIndex = 0
      Style = tbsSeparator
    end
    object BitBtn5: TBitBtn
      Left = 128
      Top = 2
      Width = 25
      Height = 22
      TabOrder = 4
      OnClick = BitBtn5Click
      Glyph.Data = {
        36050000424D3605000000000000360400002800000010000000100000000100
        08000000000000010000C40E0000C40E00000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFF075B
        07FFFFFFFFFFFFFFFFFFFFFFFFF65A7259F6FFFFFFFFFFFFFFFFFFFFFFA47373
        725BFFFFFFFFFFFFFFFFFFFF08227C737362F7FFFFFFFFFFFFFFFFFF5B7C7C7C
        73731908FFFFFFFFFFFFFF076B7D7D7C7C73735AFFFFFFFFFFFFFF5A7E7D7D7C
        7C7C736AA4FFFFFFFFFFA4757E3D2252337C7C731A08FFFFFFFF1B3E2C5B08FF
        A32B7C7C735AFFFFFFFF5B5A07FFFFFFFFF7237C7C6BA4FFFFFFFFFFFFFFFFFF
        FFFF07237C7C2207FFFFFFFFFFFFFFFFFFFFFF071A3C7B5AF6FFFFFFFFFFFFFF
        FFFFFFFFF65A3473A3FFFFFFFFFFFFFFFFFFFFFFFFF65B2B2207FFFFFFFFFFFF
        FFFFFFFFFFFFFFA3225AFFFFFFFFFFFFFFFFFFFFFFFFFFFFF7A4}
    end
    object ToolButton4: TToolButton
      Left = 153
      Top = 2
      Width = 20
      Caption = 'ToolButton4'
      ImageIndex = 2
      Style = tbsSeparator
    end
    object BitBtn7: TBitBtn
      Left = 173
      Top = 2
      Width = 25
      Height = 22
      TabOrder = 5
      OnClick = BitBtn7Click
      Glyph.Data = {
        36040000424D3604000000000000360000002800000010000000100000000100
        2000000000000004000000000000000000000000000000000000FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000006E0000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000006E0000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000006E000019EB000018EB0000006E00FF00FF00FF00FF00FF00FF00FF00
        FF0000006E000008EB000008EB0000006E00FF00FF00FF00FF00FF00FF00FF00
        FF0000006E00001EEB000019EB000008C80000006E00FF00FF00FF00FF000000
        6E000002D6000006EB000008EB0000006E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000006E000014D600001BEB00001BEB0000006E0000006E000007
        EB000006EB000000C90000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000006E000021EB00001DEB00000EDF000008E8000006
        EB000008EB0000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000006E000019DE000016EB000013EB000008
        D70000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF0000006E000020E700001BEB000018EB000011
        D70000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF0000006E000831EB00042CEB00001AD9000019D9000021
        EB000021EB0000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000006E00092FE0000A32EB000A36EB0000006E0000006E000028
        EB000023EB000014D60000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF0000006E001543EB00133EEB00031FC80000006E00FF00FF00FF00FF000000
        6E000014C8000024EB000025EB0000006E00FF00FF00FF00FF00FF00FF00FF00
        FF0000006E001947EB001846EB0000006E00FF00FF00FF00FF00FF00FF00FF00
        FF0000006E00022CEB00012AEB0000006E00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000006E0000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF0000006E0000006E00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
        FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
    end
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 331
    Width = 483
    Height = 19
    Panels = <>
  end
  object dsPesqFazenda: TDataSource
    DataSet = DM.qPesqFazenda
    Left = 104
    Top = 8
  end
end