unit uMatchData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, jpeg, ExtCtrls, pngimage, Buttons, Menus, Grids,
  DBGrids, DB, DBTables, RpCon, RpConDS, RpDefine, RpRave, DBCtrls,
  ComCtrls;

type
  TfMatchData = class(TForm)
    Bg: TImage;
    Panel: TPanel;
    LogoAp: TImage;
    btExit: TBitBtn;
    MainMenu1: TMainMenu;
    Menu1: TMenuItem;
    MenuUtama1: TMenuItem;
    Exit1: TMenuItem;
    MenuUtama2: TMenuItem;
    DBMatch: TDBGrid;
    btSearch: TBitBtn;
    edSearch: TEdit;
    btFindNearest: TBitBtn;
    btBack: TBitBtn;
    DBNavigator1: TDBNavigator;
    lblApp: TLabel;
    Label1: TLabel;
    GroupSort: TRadioGroup;
    cbbSearchby: TComboBox;
    GroupSearch: TGroupBox;
    InputMatchdayData1: TMenuItem;
    PremierLeagueTeamData1: TMenuItem;
    Logout1: TMenuItem;
    btInputMatch: TBitBtn;
    About1: TMenuItem;
    About2: TMenuItem;
    procedure FormActivate(Sender: TObject);

    procedure btExitClick(Sender: TObject);
    procedure FormCanResize(Sender: TObject; var NewWidth,
      NewHeight: Integer; var Resize: Boolean);
    procedure btDataTeamClick(Sender: TObject);

    procedure edSearchKeyPress(Sender: TObject; var Key: Char);
    procedure btSearchClick(Sender: TObject);
    procedure btBackClick(Sender: TObject);
    procedure GroupSortClick(Sender: TObject);
    procedure btFindNearestClick(Sender: TObject);
    procedure MenuUtama2Click(Sender: TObject);
    procedure InputMatchdayData1Click(Sender: TObject);
    procedure PremierLeagueTeamData1Click(Sender: TObject);
    procedure cbbSearchbyChange(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure btInputMatchClick(Sender: TObject);
    procedure About2Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fMatchData: TfMatchData;
  ada : boolean;

implementation

uses uFormLogin, uTeamData, uMenuUtama, uInputMatch, uFormAbout;



{$R *.dfm}

procedure TfMatchData.FormActivate(Sender: TObject);
var
  hMenuHandle: HMENU;
begin
  hMenuHandle:= GetSystemMenu(fMatchData.Handle, FALSE);
  if (hMenuHandle <> 0) then
    DeleteMenu(hMenuHandle, SC_CLOSE, MF_BYCOMMAND);

end;



procedure TfMatchData.btExitClick(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfMatchData.FormCanResize(Sender: TObject; var NewWidth,
  NewHeight: Integer; var Resize: Boolean);
begin
resize:=true;
end;




procedure TfMatchData.btDataTeamClick(Sender: TObject);
begin
fMenuUtama.Hide;
fTeamData.Show;
end;



procedure TfMatchData.edSearchKeyPress(Sender: TObject; var Key: Char);
begin
if not (key=chr(13)) then exit;
if edSearch.Text='' then
 begin
  edSearch.SetFocus;
 end
else
 begin
  btSearch.SetFocus;
 end;
end;

procedure TfMatchData.btSearchClick(Sender: TObject);
begin
if cbbSearchby.Text='Match Code' then
 begin
   fInputMatch.TMatch.IndexName:='';
   ada:=fInputMatch.TMatch.FindKey([edSearch.Text]);
 end
else
if cbbSearchby.Text='Matchday' then
 begin
   fInputMatch.TMatch.IndexName:='iMatchday';
   ada:=fInputMatch.TMatch.FindKey([edSearch.Text]);
 end
else
if cbbSearchby.Text='Date' then
 begin
   fInputMatch.TMatch.IndexName:='iDate';
   ada:=fInputMatch.TMatch.FindKey([StrToDate(edSearch.Text)]);
 end
else
if cbbSearchby.Text='Home' then
 begin
   fInputMatch.TMatch.IndexName:='iHome';
   ada:=fInputMatch.TMatch.FindKey([edSearch.Text]);
 end
else
if cbbSearchby.Text='Away' then
 begin
   fInputMatch.TMatch.IndexName:='iAway';
   ada:=fInputMatch.TMatch.FindKey([edSearch.Text]);
 end;


if ada then
 begin
  Application.MessageBox('Search Completed','Information',mb_iconinformation);
 end
else
if not ada then
 begin
  Application.MessageBox('Search Completed, Data Not Found','Warning',mb_iconwarning);
  end;
  end;

procedure TfMatchData.btBackClick(Sender: TObject);
begin
fMatchData.Hide;
fMenuUtama.Show;
end;

procedure TfMatchData.GroupSortClick(Sender: TObject);
begin
if (GroupSort.ItemIndex=0) then
begin
 fInputMatch.TMatch.IndexName:='';
end
else
if (GroupSort.ItemIndex=1) then
begin
  fInputMatch.TMatch.IndexName:='iMatchday';
end
else
if (GroupSort.ItemIndex=2) then
begin
  fInputMatch.TMatch.IndexName:='iHome';
end
else
if (GroupSort.ItemIndex=3) then
begin
  fInputMatch.TMatch.IndexName:='iAway';
end
else
if (GroupSort.ItemIndex=4) then
begin
  fInputMatch.TMatch.IndexName:='iDate';
end;
end;

procedure TfMatchData.btFindNearestClick(Sender: TObject);
begin
if cbbSearchby.Text='Match Code' then
 begin
   fInputMatch.TMatch.IndexName:='';
fInputMatch.TMatch.FindNearest([edSearch.Text]);
 end
else
if cbbSearchby.Text='Matchday' then
 begin
   fInputMatch.TMatch.IndexName:='iMatchday';
fInputMatch.TMatch.FindNearest([edSearch.Text]);
 end
else
if cbbSearchby.Text='Date' then
 begin
   fInputMatch.TMatch.IndexName:='iDate';
fInputMatch.TMatch.FindNearest([StrToDate(edSearch.Text)]);
 end
else
if cbbSearchby.Text='Home' then
 begin
   fInputMatch.TMatch.IndexName:='iHome';
fInputMatch.TMatch.FindNearest([edSearch.Text]);
 end
else
if cbbSearchby.Text='Away' then
 begin
   fInputMatch.TMatch.IndexName:='iAway';
 fInputMatch.TMatch.FindNearest([edSearch.Text]);
 end;


end;

procedure TfMatchData.MenuUtama2Click(Sender: TObject);
begin
fMatchData.Hide;
fMenuUtama.Show;
end;

procedure TfMatchData.InputMatchdayData1Click(Sender: TObject);
begin
fMatchData.Hide;
fInputMatch.Show;
end;

procedure TfMatchData.PremierLeagueTeamData1Click(Sender: TObject);
begin
fMatchData.Hide;
fTeamData.Show;
end;

procedure TfMatchData.cbbSearchbyChange(Sender: TObject);
begin
if cbbSearchby.Text='' then
 begin
  edSearch.Visible:=false;
  btSearch.Enabled:=false;
  btFindNearest.Enabled:=false;
  end
 else
begin
  edSearch.Visible:=true;
  btSearch.Enabled:=true;
  btFindNearest.Enabled:=true;
edSearch.SetFocus;
end;
end;





procedure TfMatchData.Exit1Click(Sender: TObject);
begin
if(Application.MessageBox('Exit Program?','Confirmation',MB_YesNo)=ID_Yes) then
 begin
  Application.Terminate;
 end;
end;

procedure TfMatchData.Logout1Click(Sender: TObject);
begin
fMatchData.Hide;
fMenuUtama.btLogoutClick(sender);
end;

procedure TfMatchData.btInputMatchClick(Sender: TObject);
begin
fMatchData.Hide;
fInputMatch.Show;
end;

procedure TfMatchData.About2Click(Sender: TObject);
begin
fAbout.Show;
end;

end.
