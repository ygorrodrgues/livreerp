inherited dmKernel_Cliente: TdmKernel_Cliente
  Height = 323
  Width = 388
  inherited qryCadBase: TSQLQuery
    Params = <
      item
        DataType = ftInteger
        Name = 'CODCLI'
        ParamType = ptInput
      end>
    SQL.Strings = (
      'SELECT * FROM CLIENTE WHERE CODCLI=:CODCLI')
  end
  inherited qryLstAux: TSQLQuery
    Left = 56
  end
end
