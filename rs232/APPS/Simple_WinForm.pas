unit Simple_WinForm;

//
// NAME: "Simple" 
//
// TYPE: Delphi .NET
//
// DATE: January 28, 2009.
//
// PURPOSE: Example terminal program.
//
//

interface

uses
  wsc32uc, KeyCode,
  System.Drawing, System.Collections, System.ComponentModel,
  System.Windows.Forms, System.Data,
  SysUtils;  {REQUIRED}

type
  TWinForm = class(System.Windows.Forms.Form)
  {$REGION 'Designer Managed Code'}
  strict private
    /// <summary>
    /// Required designer variable.
    /// </summary>
    components: System.ComponentModel.IContainer;
    eHistory: System.Windows.Forms.TextBox;
    MainMenu1: System.Windows.Forms.MainMenu;
    mLine: System.Windows.Forms.MenuItem;
    mOnLine: System.Windows.Forms.MenuItem;
    mOffLine: System.Windows.Forms.MenuItem;
    mExit: System.Windows.Forms.MenuItem;
    mChange: System.Windows.Forms.MenuItem;
    mPort: System.Windows.Forms.MenuItem;
    mBaud: System.Windows.Forms.MenuItem;
    mCOM1: System.Windows.Forms.MenuItem;
    mCOM2: System.Windows.Forms.MenuItem;
    mCOM3: System.Windows.Forms.MenuItem;
    mCOM4: System.Windows.Forms.MenuItem;
    m1200: System.Windows.Forms.MenuItem;
    m2400: System.Windows.Forms.MenuItem;
    m4800: System.Windows.Forms.MenuItem;
    m9600: System.Windows.Forms.MenuItem;
    m19200: System.Windows.Forms.MenuItem;
    m38400: System.Windows.Forms.MenuItem;
    m57600: System.Windows.Forms.MenuItem;
    m115200: System.Windows.Forms.MenuItem;
    Timer1: System.Windows.Forms.Timer;
    /// <summary>
    /// Required method for Designer support - do not modify
    /// the contents of this method with the code editor.
    /// </summary>
    procedure InitializeComponent;
    procedure mOnLine_Click(sender: System.Object; e: System.EventArgs);
    procedure mOffLine_Click(sender: System.Object; e: System.EventArgs);
    procedure mExit_Click(sender: System.Object; e: System.EventArgs);
    procedure mCOM1_Click(sender: System.Object; e: System.EventArgs);
    procedure mCOM2_Click(sender: System.Object; e: System.EventArgs);
    procedure mCOM3_Click(sender: System.Object; e: System.EventArgs);
    procedure mCOM4_Click(sender: System.Object; e: System.EventArgs);
    procedure m1200_Click(sender: System.Object; e: System.EventArgs);
    procedure m2400_Click(sender: System.Object; e: System.EventArgs);
    procedure m4800_Click(sender: System.Object; e: System.EventArgs);
    procedure m9600_Click(sender: System.Object; e: System.EventArgs);
    procedure m19200_Click(sender: System.Object; e: System.EventArgs);
    procedure m38400_Click(sender: System.Object; e: System.EventArgs);
    procedure m57600_Click(sender: System.Object; e: System.EventArgs);
    procedure m115200_Click(sender: System.Object; e: System.EventArgs);
    procedure TWinForm_Load(sender: System.Object; e: System.EventArgs);
    procedure Timer1_Tick(sender: System.Object; e: System.EventArgs);
    procedure TextBoxKeyPress(sender: System.Object; e: System.Windows.Forms.KeyPressEventArgs);
  {$ENDREGION}
  strict protected
    /// <summary>
    /// Clean up any resources being used.
    /// </summary>
    procedure Dispose(Disposing: Boolean); override;
  private
    { Private Declarations }
    gPort : Integer;  
    gBaud : Integer;
    gOnLine : Boolean;
  public
    constructor Create;
  end;

  [assembly: RuntimeRequiredAttribute(TypeOf(TWinForm))]

implementation

{$AUTOBOX ON}
{$UNSAFECODE ON}

{$REGION 'Windows Form Designer generated code'}
/// <summary>
/// Required method for Designer support -- do not modify
/// the contents of this method with the code editor.
/// </summary>
procedure TWinForm.InitializeComponent;
type
  TArrayOfSystem_Windows_Forms_MenuItem = array of System.Windows.Forms.MenuItem;
begin
  Self.components := System.ComponentModel.Container.Create;
  Self.eHistory := System.Windows.Forms.TextBox.Create;
  Self.MainMenu1 := System.Windows.Forms.MainMenu.Create;
  Self.mLine := System.Windows.Forms.MenuItem.Create;
  Self.mOnLine := System.Windows.Forms.MenuItem.Create;
  Self.mOffLine := System.Windows.Forms.MenuItem.Create;
  Self.mExit := System.Windows.Forms.MenuItem.Create;
  Self.mChange := System.Windows.Forms.MenuItem.Create;
  Self.mPort := System.Windows.Forms.MenuItem.Create;
  Self.mCOM1 := System.Windows.Forms.MenuItem.Create;
  Self.mCOM2 := System.Windows.Forms.MenuItem.Create;
  Self.mCOM3 := System.Windows.Forms.MenuItem.Create;
  Self.mCOM4 := System.Windows.Forms.MenuItem.Create;
  Self.mBaud := System.Windows.Forms.MenuItem.Create;
  Self.m1200 := System.Windows.Forms.MenuItem.Create;
  Self.m2400 := System.Windows.Forms.MenuItem.Create;
  Self.m4800 := System.Windows.Forms.MenuItem.Create;
  Self.m9600 := System.Windows.Forms.MenuItem.Create;
  Self.m19200 := System.Windows.Forms.MenuItem.Create;
  Self.m38400 := System.Windows.Forms.MenuItem.Create;
  Self.m57600 := System.Windows.Forms.MenuItem.Create;
  Self.m115200 := System.Windows.Forms.MenuItem.Create;
  Self.Timer1 := System.Windows.Forms.Timer.Create(Self.components);
  Self.SuspendLayout;
  // 
  // eHistory
  // 
  Self.eHistory.Location := System.Drawing.Point.Create(8, 8);
  Self.eHistory.Multiline := True;
  Self.eHistory.Name := 'eHistory';
  Self.eHistory.ReadOnly := True;
  Self.eHistory.ScrollBars := System.Windows.Forms.ScrollBars.Vertical;
  Self.eHistory.Size := System.Drawing.Size.Create(504, 464);
  Self.eHistory.TabIndex := 0;
  Self.eHistory.Text := '';
  Include(Self.eHistory.KeyPress, Self.TextBoxKeyPress);
  // 
  // MainMenu1
  // 
  Self.MainMenu1.MenuItems.AddRange(TArrayOfSystem_Windows_Forms_MenuItem.Create(Self.mLine, 
          Self.mChange));
  // 
  // mLine
  // 
  Self.mLine.Enabled := False;
  Self.mLine.Index := 0;
  Self.mLine.MenuItems.AddRange(TArrayOfSystem_Windows_Forms_MenuItem.Create(Self.mOnLine, 
          Self.mOffLine, Self.mExit));
  Self.mLine.Text := 'Line';
  // 
  // mOnLine
  // 
  Self.mOnLine.Index := 0;
  Self.mOnLine.Text := 'OnLine';
  Include(Self.mOnLine.Click, Self.mOnLine_Click);
  // 
  // mOffLine
  // 
  Self.mOffLine.Index := 1;
  Self.mOffLine.Text := 'OffLine';
  Include(Self.mOffLine.Click, Self.mOffLine_Click);
  // 
  // mExit
  // 
  Self.mExit.Index := 2;
  Self.mExit.Text := 'Exit';
  Include(Self.mExit.Click, Self.mExit_Click);
  // 
  // mChange
  // 
  Self.mChange.Enabled := False;
  Self.mChange.Index := 1;
  Self.mChange.MenuItems.AddRange(TArrayOfSystem_Windows_Forms_MenuItem.Create(Self.mPort, 
          Self.mBaud));
  Self.mChange.Text := 'Change';
  // 
  // mPort
  // 
  Self.mPort.Index := 0;
  Self.mPort.MenuItems.AddRange(TArrayOfSystem_Windows_Forms_MenuItem.Create(Self.mCOM1, 
          Self.mCOM2, Self.mCOM3, Self.mCOM4));
  Self.mPort.Text := 'Port';
  // 
  // mCOM1
  // 
  Self.mCOM1.Checked := True;
  Self.mCOM1.Index := 0;
  Self.mCOM1.Text := 'COM1';
  Include(Self.mCOM1.Click, Self.mCOM1_Click);
  // 
  // mCOM2
  // 
  Self.mCOM2.Index := 1;
  Self.mCOM2.Text := 'COM2';
  Include(Self.mCOM2.Click, Self.mCOM2_Click);
  // 
  // mCOM3
  // 
  Self.mCOM3.Index := 2;
  Self.mCOM3.Text := 'COM3';
  Include(Self.mCOM3.Click, Self.mCOM3_Click);
  // 
  // mCOM4
  // 
  Self.mCOM4.Index := 3;
  Self.mCOM4.Text := 'COM4';
  Include(Self.mCOM4.Click, Self.mCOM4_Click);
  // 
  // mBaud
  // 
  Self.mBaud.Index := 1;
  Self.mBaud.MenuItems.AddRange(TArrayOfSystem_Windows_Forms_MenuItem.Create(Self.m1200, 
          Self.m2400, Self.m4800, Self.m9600, Self.m19200, Self.m38400, Self.m57600, 
          Self.m115200));
  Self.mBaud.Text := 'Baud';
  // 
  // m1200
  // 
  Self.m1200.Index := 0;
  Self.m1200.Text := '1200';
  Include(Self.m1200.Click, Self.m1200_Click);
  // 
  // m2400
  // 
  Self.m2400.Index := 1;
  Self.m2400.Text := '2400';
  Include(Self.m2400.Click, Self.m2400_Click);
  // 
  // m4800
  // 
  Self.m4800.Index := 2;
  Self.m4800.Text := '4800';
  Include(Self.m4800.Click, Self.m4800_Click);
  // 
  // m9600
  // 
  Self.m9600.Index := 3;
  Self.m9600.Text := '9600';
  Include(Self.m9600.Click, Self.m9600_Click);
  // 
  // m19200
  // 
  Self.m19200.Checked := True;
  Self.m19200.Index := 4;
  Self.m19200.Text := '19200';
  Include(Self.m19200.Click, Self.m19200_Click);
  // 
  // m38400
  // 
  Self.m38400.Index := 5;
  Self.m38400.Text := '38400';
  Include(Self.m38400.Click, Self.m38400_Click);
  // 
  // m57600
  // 
  Self.m57600.Index := 6;
  Self.m57600.Text := '57600';
  Include(Self.m57600.Click, Self.m57600_Click);
  // 
  // m115200
  // 
  Self.m115200.Index := 7;
  Self.m115200.Text := '115200';
  Include(Self.m115200.Click, Self.m115200_Click);
  // 
  // Timer1
  // 
  Include(Self.Timer1.Tick, Self.Timer1_Tick);
  // 
  // TWinForm
  // 
  Self.AutoScaleBaseSize := System.Drawing.Size.Create(5, 13);
  Self.ClientSize := System.Drawing.Size.Create(520, 486);
  Self.Controls.Add(Self.eHistory);
  Self.Menu := Self.MainMenu1;
  Self.Name := 'TWinForm';
  Self.Text := 'simple';
  Include(Self.Load, Self.TWinForm_Load);
  Self.ResumeLayout(False);
end;
{$ENDREGION}

procedure TWinForm.Dispose(Disposing: Boolean);
begin
  if Disposing then
  begin
    if Components <> nil then
      Components.Dispose();
  end;
  inherited Dispose(Disposing);
end;

constructor TWinForm.Create;
begin
  inherited Create;
  //
  // Required for Windows Form Designer support
  //
  InitializeComponent;
  //
  // TODO: Add any constructor code after InitializeComponent call
  //
end;

procedure TWinForm.TextBoxKeyPress(sender: System.Object; e: System.Windows.Forms.KeyPressEventArgs);
var
  KeyChar : Char;
begin
  {key press}
  if gOnLine then
    begin
      KeyChar := e.KeyChar;
      {System.Windows.Forms.MessageBox.Show(Format('%x', [KeyChar]));}
      SioPutc(gPort,KeyChar)
    end;
end;

procedure TWinForm.Timer1_Tick(sender: System.Object; e: System.EventArgs);
const EV_RXCHAR = 1;
{gather all incoming data}
procedure GetIncoming(Port:Integer);
var
  I, Code : Integer;
  S : String;
  CharCount : Integer;
begin
  {Gather all incoming}
  CharCount := 0;
  S := '';
  for I := 1 to 128 do
  begin
    Code := SioGetc(Port);
    if Code < 0 then break;
    {ignore CR}
    if Chr(Code) <> Chr(13) then
      begin
        {got character (other than CR)}
        Inc(CharCount);
        if Chr(Code) = Chr(10) then break;
        S := S + Chr(Code);
      end
  end; {for}
{display}
if CharCount > 0 then
  begin
    {System.Windows.Forms.MessageBox.Show(Format('<%s>', [S]));}
    eHistory.Text := eHistory.Text + S;
    if Chr(Code) = Chr(10) then eHistory.Text:= eHistory.Text + Chr(10);
  end
end;
{timer routine}
var
  Code : Integer;
begin
  {timer}
  if gOnLine then
    begin
      Timer1.Enabled := False;
      GetIncoming(gPort);
      {efficiently wait up to 250 ms}
      Code := SioEventWait(gPort, EV_RXCHAR, 250);
      if Code = WSC_IO_COMPLETE then Timer1.Interval := 1
      else Timer1.Interval := 100;
      Timer1.Enabled := True
    end
end;

procedure TWinForm.TWinForm_Load(sender: System.Object; e: System.EventArgs);
var
  Code : Integer;
begin
  {load}
  gPort := COM1;
  gBaud := 19200;
  gOnLine := False;  
  Code := SioKeyCode(WSC_KEY_CODE);
  if Code >= 0 Then
    begin
      mLine.Enabled := True;
      mChange.Enabled := True;
      Timer1.Enabled := True
    end
  else
    begin
      eHistory.Text := eHistory.Text + Format('SioKeyCode fails, error %d', [Code]);
      System.Windows.Forms.MessageBox.Show('SioKeyCode fails (check key code value)');
    end
end;

procedure TWinForm.m115200_Click(sender: System.Object; e: System.EventArgs);
begin
  {115200}
  m1200.Checked := False;
  m2400.Checked := False;
  m4800.Checked := False;
  m9600.Checked := False;
  m19200.Checked := False;
  m38400.Checked := False;
  m57600.Checked := False;
  m115200.Checked := True;
  gBaud := 115200
end;

procedure TWinForm.m57600_Click(sender: System.Object; e: System.EventArgs);
begin
  {57600}
  m1200.Checked := False;
  m2400.Checked := False;
  m4800.Checked := False;
  m9600.Checked := False;
  m19200.Checked := False;
  m38400.Checked := False;
  m57600.Checked := True;
  m115200.Checked := False;
  gBaud := 57600  
end;

procedure TWinForm.m38400_Click(sender: System.Object; e: System.EventArgs);
begin
  {38400}
  m1200.Checked := False;
  m2400.Checked := False;
  m4800.Checked := False;
  m9600.Checked := False;
  m19200.Checked := False;
  m38400.Checked := True;
  m57600.Checked := False;
  m115200.Checked := False;
  gBaud := 38400  
end;

procedure TWinForm.m19200_Click(sender: System.Object; e: System.EventArgs);
begin
  {19200}
  m1200.Checked := False;
  m2400.Checked := False;
  m4800.Checked := False;
  m9600.Checked := False;
  m19200.Checked := True;
  m38400.Checked := False;
  m57600.Checked := False;
  m115200.Checked := False;
  gBaud := 19200  
end;

procedure TWinForm.m9600_Click(sender: System.Object; e: System.EventArgs);
begin
  {9600}
  m1200.Checked := False;
  m2400.Checked := False;
  m4800.Checked := False;
  m9600.Checked := True;
  m19200.Checked := False;
  m38400.Checked := False;
  m57600.Checked := False;
  m115200.Checked := False;
  gBaud := 9600  
end;

procedure TWinForm.m4800_Click(sender: System.Object; e: System.EventArgs);
begin
  {4800}
  m1200.Checked := False;
  m2400.Checked := False;
  m4800.Checked := True;
  m9600.Checked := False;
  m19200.Checked := False;
  m38400.Checked := False;
  m57600.Checked := False;
  m115200.Checked := False;
  gBaud := 4800  
end;

procedure TWinForm.m2400_Click(sender: System.Object; e: System.EventArgs);
begin
  {2400}
  m1200.Checked := False;
  m2400.Checked := True;
  m4800.Checked := False;
  m9600.Checked := False;
  m19200.Checked := False;
  m38400.Checked := False;
  m57600.Checked := False;
  m115200.Checked := False;
  gBaud := 2400  
end;

procedure TWinForm.m1200_Click(sender: System.Object; e: System.EventArgs);
begin
  {1200}
  m1200.Checked := True;
  m2400.Checked := False;
  m4800.Checked := False;
  m9600.Checked := False;
  m19200.Checked := False;
  m38400.Checked := False;
  m57600.Checked := False;
  m115200.Checked := False;
  gBaud := 1200  
end;

procedure TWinForm.mCOM4_Click(sender: System.Object; e: System.EventArgs);
begin
  {COM4}
  mCOM1.Checked := False;
  mCOM2.Checked := False;
  mCOM3.Checked := False;
  mCOM4.Checked := True;
  gPort := COM4
end;

procedure TWinForm.mCOM3_Click(sender: System.Object; e: System.EventArgs);
begin
  {COM3}
  mCOM1.Checked := False;
  mCOM2.Checked := False;
  mCOM3.Checked := True;
  mCOM4.Checked := False; 
  gPort := COM3
end;

procedure TWinForm.mCOM2_Click(sender: System.Object; e: System.EventArgs);
begin
  {COM2}
  mCOM1.Checked := False;
  mCOM2.Checked := True;
  mCOM3.Checked := False;
  mCOM4.Checked := False;
  gPort := COM2
end;

procedure TWinForm.mCOM1_Click(sender: System.Object; e: System.EventArgs);
begin
  {COM1}
  mCOM1.Checked := True;
  mCOM2.Checked := False;
  mCOM3.Checked := False;
  mCOM4.Checked := False;
  gPort := COM1
end;

procedure TWinForm.mExit_Click(sender: System.Object; e: System.EventArgs);
begin
  {Exit}
  if gOnline then SioDone(gPort);
  Close()
end;

procedure TWinForm.mOffLine_Click(sender: System.Object; e: System.EventArgs);
begin
  {OffLine} 
  if gOnLine then
    begin
      gOnLine := False;
      SioDone(gPort);
      mOnLine.Checked := False;
      mOffLine.Checked := True;
      mChange.Enabled := True;
      eHistory.Text := eHistory.Text + Chr(13) + Chr(10) + 'Offline'
    end
  else
    eHistory.Text := eHistory.Text + Chr(13) + Chr(10) + 'Already offline'
end;

procedure TWinForm.mOnLine_Click(sender: System.Object; e: System.EventArgs);
var
  Code : Integer;
begin
  {OnLine}
  if gOnLine then
    eHistory.Text := eHistory.Text + Chr(13) + Chr(10) + 'Already online'
  else
    begin
      { open the port }
      Code := SioReset(gPort, 1024, 1024);
      if Code >= 0 then
        begin
          mOnLine.Checked := True;
          mOffLine.Checked := False;
          gOnLine := True;
          mChange.Enabled := False;
          eHistory.Text := eHistory.Text + Chr(13) + Chr(10) 
                          + Format('[COM%d online at %d baud]', [1+gPort,gBaud])
                          + Chr(13) + Chr(10);
      
        end
      else
        eHistory.Text := eHistory.Text + Chr(13) + Chr(10) + 'SioReset fails';
    end
end;

end.
