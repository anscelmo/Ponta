object frmImportaExcelExpl: TfrmImportaExcelExpl
  Left = 277
  Top = 125
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Explica'#231#245'es'
  ClientHeight = 377
  ClientWidth = 425
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 243
    Height = 16
    Caption = 'Detalhes do layout do arquivo CSV'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MemoExplica: TMemo
    Left = 16
    Top = 40
    Width = 393
    Height = 281
    Lines.Strings = (
      'Para efetuar a carga do aquivo CSV, este dever'#225' estar no '
      'seguinte formato:'
      ''
      '1'#186' Linha: Cabe'#231'alho'
      '- dever'#225' conter o texto fixo "IDENTIFICACAO;FAZENDA"'
      ''
      'Demais linhas: Dados'
      '- dever'#227'o conter as informa'#231#245'es de n'#250'mero de identifica'#231#227'o +'
      'nome da fazenda, separadas por ";" (ponto-v'#237'rgula)'
      ''
      ''
      'Antes da importa'#231#227'o ser realizada ser'#227'o realizadas algumas'
      'valida'#231#245'es, sendo:'
      ''
      '- validar se o n'#250'mero de identifica'#231#227'o est'#225' informada no arquivo'
      '- validar se o n'#250'mero de identifica'#231#227'o '#233' num'#233'rico'
      '- validar se o n'#250'mero de identifica'#231#227'o possui o tamanho esperado'
      
        '- validar se o n'#250'mero de identifica'#231#227'o est'#225' informado j'#225' existe ' +
        'no cadastro'
      '- validar se a fazenda est'#225' informada no arquivo'
      '- validar se a fazenda existe no cadastro')
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object btFechar: TBitBtn
    Left = 320
    Top = 332
    Width = 83
    Height = 33
    Caption = 'Fechar'
    TabOrder = 1
    OnClick = btFecharClick
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
