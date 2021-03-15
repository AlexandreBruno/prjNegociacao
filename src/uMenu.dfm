object Menu: TMenu
  Left = 0
  Top = 0
  Caption = 'Menu'
  ClientHeight = 279
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsMDIForm
  Menu = MainMenu1
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 24
    Top = 32
    object Arquivo1: TMenuItem
      Caption = 'Arquivo'
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object CadastroDistribuidor: TMenuItem
        Caption = 'Distribuidores'
        OnClick = CadastroDistribuidorClick
      end
      object CadastroProdutos: TMenuItem
        Caption = 'Produtos'
        OnClick = CadastroProdutosClick
      end
      object CadastroProduto: TMenuItem
        Caption = 'Produtores'
        OnClick = CadastroProdutoClick
      end
    end
    object Movimentaes1: TMenuItem
      Caption = 'Movimenta'#231#245'es'
      object ListaNegociacoes: TMenuItem
        Caption = 'Negocia'#231#245'es'
        OnClick = ListaNegociacoesClick
      end
    end
  end
end
