unit untKernel_Interface_RegrasBD;

interface

type
  { Definição dos bancos de dados que poderam ser  utilizados na aplicação. }

  TTipoBD = (bdFirebird, bdOracle, bdSQLServer, bdPostGreeSQL, bdMySQL);

  IRegrasBD = interface

    ['{DBEA73DB-3FF6-4AA7-A781-06B11546CA8D}']
    function GetDriverName: string;
    function GetVendorLib: string;
    function GetLibraryName: string;
    
    function Getstr_usuario: string;
    function Getstr_senha: string;    
    procedure Setstr_usuario(const Value: string);
    procedure Setstr_senha(const Value: string);

    property DriverName: string read GetDriverName;
    property LibraryName: string read GetLibraryName;
    property VendorLib: string read GetVendorLib;
    property str_usuario: string read Getstr_usuario write  Setstr_usuario;
    property str_senha: string read Getstr_senha write Setstr_senha;

  end;

implementation


end.
