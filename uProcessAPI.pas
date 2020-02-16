unit uProcessAPI;

interface

uses
  Windows, TlHelp32;

type
  PROCESSENTRY32A = record
    Size: DWORD;
    Usage: DWORD;
    ProcessID: DWORD;
    DefaultHeapID: ULONG_PTR;
    ModuleID: DWORD;
    ThreadsCount: DWORD;
    ParentProcessID: DWORD;
    Priority: Longint;
    Flags: DWORD;
    ExeFile: array [0 .. MAX_PATH - 1] of AnsiChar;
  end;

  TProcessEntry32A = PROCESSENTRY32A;

  THREADENTRY32 = record
    Size: DWORD;
    Usage: DWORD;
    ThreadID: DWORD;
    OwnerProcessID: DWORD;
    Priority: Longint;
    DeltaPriority: Longint;
    Flags: DWORD;
  end;

  TThreadEntry32 = THREADENTRY32;
  TProcessInfo   = TProcessEntry32A;
  TProcessList   = array of TProcessInfo;

  TProcessBasicInfo = record
    ExitStatus: LongWord;
    AffinityMask: UInt64;
    BasePriority: LongWord;
    UniqueProcessId: UInt64;
    InheritedFromUniqueProcessId: UInt64;
  end;

  TModuleInfo = record
    FullPath: AnsiString;
    ModuleName: AnsiString;
    BaseAddress: UInt64;
    EntryAddress: UInt64;
    SizeOfImage: Cardinal;
  end;

  TModulesList = record
    Length: Cardinal;
    Modules: array of TModuleInfo;
  end;

  PROCESS_INFO = record
    Handle: LongWord;
    ID: UInt64;
    InheritedFromID: UInt64;
    SessionID: LongWord;
    Priority: UInt64;
    AffinityMask: UInt64;
    IsDebugged: Boolean;
    ExitStatus: LongWord;
    ThreadsCount: LongWord;
    HandlesCount: LongWord;
    ReservedMemory: LongWord;
    ImageBaseAddress: UInt64;
    LdrAddress: UInt64;
    PEBAddress: UInt64;
    ConsoleHandle: UInt64;
    StdInputHandle: UInt64;
    StdOutputHandle: UInt64;
    StdErrorHandle: UInt64;
    ProcessName: AnsiString;
    CurrentDirectoryPath: AnsiString;
    ImagePathName: AnsiString;
    CommandLine: AnsiString;
    ModulesList: TModulesList;
    Is64BitProcess: BOOL;
  end;

type
  Pointer64 = UInt64;
  Pointer32 = UInt;

  PROCESS_BASIC_INFORMATION = record
    ExitStatus: LongWord;
    PebBaseAddress: Pointer;
    AffinityMask: Cardinal;
    BasePriority: Integer;
    UniqueProcessId: LongWord;
    InheritedFromUniqueProcessId: LongWord;
  end;

  PROCESS_BASIC_INFORMATION64 = record
    ExitStatus: LongWord;
    Reserved0: LongWord;
    PebBaseAddress: UInt64;
    AffinityMask: UInt64;
    BasePriority: LongWord;
    Reserved1: LongWord;
    UniqueProcessId: UInt64;
    InheritedFromUniqueProcessId: UInt64;
  end;

  PROCESS_BASIC_INFORMATION_WOW64 = record
    Wow64PebAddress: UInt64;
  end;

  UCHAR = AnsiChar;

  UNICODE_STRING = record
    Length: Word;
    MaximumLength: Word;
    Buffer: Pointer;
  end;

  UNICODE_STRING_WOW64 = record
    Length: Word;
    MaximumLength: Word;
    Buffer: Pointer32;
  end;

  UNICODE_STRING64 = record
    Length: Word;
    MaximumLength: Word;
    Fill: LongWord;
    Buffer: UInt64;
  end;

  PLDR_MODULE = Pointer;

  TModuleListEntry = record
    ForwardLDRModule: PLDR_MODULE;
    BackwardLDRModule: PLDR_MODULE;
  end;

  LDR_MODULE = record
    InLoadModuleOrderList: TModuleListEntry;
    InMemoryModuleOrderList: TModuleListEntry;
    InInitializationModuleOrderList: TModuleListEntry;
    BaseAddress: Pointer;
    EntryPoint: Pointer;
    SizeOfImage: UInt;
    FullDLLName: UNICODE_STRING;
    BaseDLLName: UNICODE_STRING;
    Flags: ULONG;
    LoadCount: Short;
    TlsIndex: Short;
    TimeDateStamp: ULONG;
  end;

  PEB_LDR_DATA = record
    Size: ULONG;
    Initialized: Boolean;
    SsHandle: Pointer;
    InLoadModuleOrderList: TModuleListEntry;
    InMemoryModuleOrderList: TModuleListEntry;
    InInitializationModuleOrderList: TModuleListEntry;
  end;

  PPEB_LDR_DATA     = ^PEB_LDR_DATA;
  PLDR_MODULE_WOW64 = Pointer32;

  TModuleListEntryWow64 = record
    ForwardLDRModule: PLDR_MODULE_WOW64;
    BackwardLDRModule: PLDR_MODULE_WOW64;
  end;

  LDR_MODULE_WOW64 = record
    InLoadModuleOrderList: TModuleListEntryWow64;
    InMemoryModuleOrderList: TModuleListEntryWow64;
    InInitializationModuleOrderList: TModuleListEntryWow64;
    BaseAddress: Pointer32;
    EntryPoint: Pointer32;
    SizeOfImage: UInt;
    FullDLLName: UNICODE_STRING_WOW64;
    BaseDLLName: UNICODE_STRING_WOW64;
    Flags: ULONG;
    LoadCount: Short;
    TlsIndex: Short;
    TimeDateStamp: ULONG;
  end;

  PEB_LDR_DATA_WOW64 = record
    Size: ULONG;
    Initialized: Boolean;
    SsHandle: Pointer32;
    InLoadModuleOrderList: TModuleListEntryWow64;
    InMemoryModuleOrderList: TModuleListEntryWow64;
    InInitializationModuleOrderList: TModuleListEntryWow64;
  end;

  PPEB_LDR_DATA_WOW64 = Pointer32;
  PLDR_MODULE64       = UInt64;

  TModuleListEntry64 = record
    ForwardLDRModule: PLDR_MODULE64;
    BackwardLDRModule: PLDR_MODULE64;
  end;

  LDR_MODULE64 = record
    InLoadModuleOrderList: TModuleListEntry64;
    InMemoryModuleOrderList: TModuleListEntry64;
    InInitializationModuleOrderList: TModuleListEntry64;
    BaseAddress: Pointer64;
    EntryPoint: Pointer64;
    SizeOfImage: ULONG;
    FullDLLName: UNICODE_STRING64;
    BaseDLLName: UNICODE_STRING64;
    Flags: ULONG;
    LoadCount: Short;
    TlsIndex: Short;
    TimeDateStamp: ULONG;
  end;

  PEB_LDR_DATA64 = record
    Size: UInt;
    Initialized: Boolean;
    SsHandle: UInt64;
    InLoadModuleOrderList: TModuleListEntry64;
    InMemoryModuleOrderList: TModuleListEntry64;
    InInitializationModuleOrderList: TModuleListEntry64;
  end;

  PEB = record
    InheritedAddressSpace: UCHAR;
    ReadImageFileExecOptions: UCHAR;
    BeingDebugged: Boolean;
    BitField: UCHAR;
    Mutant: Pointer;
    ImageBaseAddress: Pointer;
    Ldr: PPEB_LDR_DATA;
    ProcessParameters: Pointer;
    Reserved0: array [0 .. 103] of Byte;
    Reserved1: array [0 .. 51] of Pointer;
    PostProcessInitRoutine: Pointer;
    Reserved2: array [0 .. 127] of Byte;
    Reserved3: Pointer;
    SessionID: LongWord;
  end;

  PEB_WOW64 = record
    InheritedAddressSpace: UCHAR;
    ReadImageFileExecOptions: UCHAR;
    BeingDebugged: Boolean;
    BitField: UCHAR;
    Mutant: Pointer32;
    ImageBaseAddress: Pointer32;
    Ldr: PPEB_LDR_DATA_WOW64;
    ProcessParameters: Pointer32;
    Reserved0: array [0 .. 103] of Byte;
    Reserved1: array [0 .. 51] of Pointer32;
    PostProcessInitRoutine: Pointer32;
    Reserved2: array [0 .. 127] of Byte;
    Reserved3: Pointer32;
    SessionID: LongWord;
  end;

  PEB64 = record
    InheritedAddressSpace: Byte;
    ReadImageFileExecOptions: Byte;
    BeingDebugged: Boolean;
    BitField: Byte;
    Reserved0: LongWord;
    Mutant: UInt64;
    ImageBaseAddress: UInt64;
    Ldr: UInt64;
    ProcessParameters: UInt64;
    Reserved1: array [0 .. 519] of Byte;
    PostProcessInitRoutine: UInt64;
    Reserved2: array [0 .. 135] of Byte;
    SessionID: LongWord;
  end;

  RTL_USER_PROCESS_PARAMETERS = record
    MaximumLength: LongWord;
    Length: LongWord;
    Flags: LongWord;
    DebugFlags: LongWord;
    ConsoleHandle: THandle;
    ConsoleFlags: LongWord;
    StdInputHandle: THandle;
    StdOutputHandle: THandle;
    StdErrorHandle: THandle;
    CurrentDirectoryPath: UNICODE_STRING;
    CurrentDirectoryHandle: THandle;
    DllPath: UNICODE_STRING;
    ImagePathName: UNICODE_STRING;
    CommandLine: UNICODE_STRING;
  end;

  RTL_USER_PROCESS_PARAMETERS_WOW64 = record
    MaximumLength: LongWord;
    Length: LongWord;
    Flags: LongWord;
    DebugFlags: LongWord;
    ConsoleHandle: LongWord;
    ConsoleFlags: LongWord;
    StdInputHandle: LongWord;
    StdOutputHandle: LongWord;
    StdErrorHandle: LongWord;
    CurrentDirectoryPath: UNICODE_STRING_WOW64;
    CurrentDirectoryHandle: LongWord;
    DllPath: UNICODE_STRING_WOW64;
    ImagePathName: UNICODE_STRING_WOW64;
    CommandLine: UNICODE_STRING_WOW64;
  end;

  RTL_USER_PROCESS_PARAMETERS64 = record
    MaximumLength: LongWord;
    Length: LongWord;
    Flags: LongWord;
    DebugFlags: LongWord;
    ConsoleHandle: UInt64;
    ConsoleFlags: LongWord;
    Reserved: LongWord;
    StdInputHandle: UInt64;
    StdOutputHandle: UInt64;
    StdErrorHandle: UInt64;
    CurrentDirectoryPath: UNICODE_STRING64;
    CurrentDirectoryHandle: UInt64;
    DllPath: UNICODE_STRING64;
    ImagePathName: UNICODE_STRING64;
    CommandLine: UNICODE_STRING64;
  end;

  VM_COUNTERS = record
    PeakVirtualSize: LongWord;
    VirtualSize: LongWord;
    PageFaultCount: LongWord;
    PeakWorkingSetSize: LongWord;
    WorkingSetSize: LongWord;
    QuotaPeakPagedPoolUsage: LongWord;
    QuotaPagedPoolUsage: LongWord;
    QuotaPeakNonPagedPoolUsage: LongWord;
    QuotaNonPagedPoolUsage: LongWord;
    PagefileUsage: LongWord;
    PeakPagefileUsage: LongWord;
  end;

  PROCESSINFOCLASS = (                      //
    ProcessBasicInformation,                //
    ProcessQuotaLimits,                     //
    ProcessIoCounters,                      //
    ProcessVmCounters,                      //
    ProcessTimes,                           //
    ProcessBasePriority,                    //
    ProcessRaisePriority,                   //
    ProcessDebugPort,                       //
    ProcessExceptionPort,                   //
    ProcessAccessToken,                     //
    ProcessLdtInformation,                  //
    ProcessLdtSize,                         //
    ProcessDefaultHardErrorMode,            //
    ProcessIoPortHandlers,                  //
    ProcessPooledUsageAndLimits,            //
    ProcessWorkingSetWatch,                 //
    ProcessUserModeIOPL,                    //
    ProcessEnableAlignmentFaultFixup,       //
    ProcessPriorityClass,                   //
    ProcessWx86Information,                 //
    ProcessHandleCount,                     //
    ProcessAffinityMask,                    //
    ProcessPriorityBoost,                   //
    ProcessDeviceMap,                       //
    ProcessSessionInformation,              //
    ProcessForegroundInformation,           //
    ProcessWow64Information,                //
    ProcessImageFileName,                   //
    ProcessLUIDDeviceMapsEnabled,           //
    ProcessBreakOnTermination,              //
    ProcessDebugObjectHandle,               //
    ProcessDebugFlags,                      //
    ProcessHandleTracing,                   //
    ProcessIoPriority,                      //
    ProcessExecuteFlags,                    //
    ProcessTlsInformation,                  //
    ProcessCookie,                          //
    ProcessImageInformation,                //
    ProcessCycleTime,                       //
    ProcessPagePriority,                    //
    ProcessInstrumentationCallback,         //
    ProcessThreadStackAllocation,           //
    ProcessWorkingSetWatchEx,               //
    ProcessImageFileNameWin32,              //
    ProcessImageFileMapping,                //
    ProcessAffinityUpdateMode,              //
    ProcessMemoryAllocationMode,            //
    ProcessGroupInformation,                //
    ProcessTokenVirtualizationEnabled,      //
    ProcessOwnerInformation,                //
    ProcessWindowInformation,               //
    ProcessHandleInformation,               //
    ProcessMitigationPolicy,                //
    ProcessDynamicFunctionTableInformation, //
    ProcessHandleCheckingMode,              //
    ProcessKeepAliveCount,                  //
    ProcessRevokeFileHandles,               //
    ProcessWorkingSetControl,               //
    ProcessHandleTable,                     //
    ProcessCheckStackExtentsMode,           //
    ProcessCommandLineInformation,          //
    ProcessProtectionInformation,           //
    MaxProcessInfoClass                     //
    );

  SYSTEMINFOCLASS = (             //
    SystemBasicInformation,       //
    Unknown,                      //
    SystemPerformanceInformation, //
    SystemInformationClassMax     //
    );

  NTStatus = LongWord;
  SIZE_T   = Cardinal;

  _PROCESS_MEMORY_COUNTERS_EX = record
    cb: LongWord;
    PageFaultCount: LongWord;
    PeakWorkingSetSize: SIZE_T;
    WorkingSetSize: SIZE_T;
    QuotaPeakPagedPoolUsage: SIZE_T;
    QuotaPagedPoolUsage: SIZE_T;
    QuotaPeakNonPagedPoolUsage: SIZE_T;
    QuotaNonPagedPoolUsage: SIZE_T;
    PagefileUsage: SIZE_T;
    PeakPagefileUsage: SIZE_T;
    PrivateUsage: SIZE_T;
  end;

function NtQueryInformationProcess(ProcessHandle: THandle; ProcessInformationClass: PROCESSINFOCLASS; ProcessInformation: Pointer; ProcessInformationLength: LongWord; out ReturnLength: LongWord): NTStatus; stdcall; external 'ntdll.dll';
function NtReadVirtualMemory(ProcessHandle: THandle; BaseAddress: Pointer; Buffer: Pointer; BufferLength: LongWord; out ReturnLength: LongWord): BOOL; stdcall; external 'ntdll.dll';
function NtQuerySystemInformation(SystemInformationClass: SYSTEMINFOCLASS; SystemInformation: Pointer; SystemInformationLength: ULONG; ReturnLength: PDWORD): NTStatus; stdcall; external 'ntdll.dll';
procedure GetProcessMemoryInfo(ProcessHandle: THandle; out ProcessMemoryCounters: _PROCESS_MEMORY_COUNTERS_EX; ProcessMemoryCountersSize: LongWord); stdcall; external 'psapi.dll';
function GetProcessHandleCount(ProcessHandle: THandle; CounterPtr: Pointer): LongBool; stdcall; external 'kernel32.dll';
function GetProcessId(Handle: THandle): LongWord; stdcall; external 'kernel32.dll';
function Process32FirstA(hSnapshot: THandle; var lppe: TProcessEntry32A): BOOL; stdcall; external 'kernel32.dll' name 'Process32First';
function Process32NextA(hSnapshot: THandle; var lppe: TProcessEntry32A): BOOL; stdcall; external 'kernel32.dll' name 'Process32Next';

var
  NtWow64QueryInformationProcess64: function(ProcessHandle: THandle; ProcessInformationClass: PROCESSINFOCLASS; ProcessInformation: Pointer; ProcessInformationLength: LongWord; out ReturnLength: UInt64): NTStatus; stdcall;
  NtWow64ReadVirtualMemory64      : function(ProcessHandle: THandle; BaseAddress: UInt64; Buffer: Pointer; BufferLength: UInt64; out ReturnLength: UInt64): BOOL; stdcall;
  IsWow64Process                  : function(ProcessHandle: THandle; out Wow64Process: BOOL): BOOL; stdcall;

function WideStringToString(const WideStringToConversion: WideString; CodePage: Word): AnsiString;
function StringToWideString(const AnsiStringToConversion: AnsiString; CodePage: Word): WideString;
function ProcessIDToHandle(ProcessID: LongWord): THandle;
function HandleToProcessID(ProcessHandle: THandle): LongWord;
procedure GetProcessInfo(ProcessID: LongWord; out ProcessInfo: PROCESS_INFO; Process32_64CompatibleMode: Boolean = false);
procedure GetProcessBasicInfo(ProcessID: LongWord; out ProcessBasicInfo: TProcessBasicInfo);
function Is64BitProcess(ProcessID: LongWord): LongBool;
function IsProcessLaunched(ProcessName: AnsiString): Boolean;
procedure GetProcessList(out ProcessList: TProcessList);
function GetTlHelp32ProcessInfo(ProcessID: LongWord): TProcessInfo; overload;
function GetTlHelp32ProcessInfo(ProcessName: AnsiString): TProcessInfo; overload;
procedure StartProcess(const CommandLine: string; out ProcessHandle: THandle; out ProcessID: LongWord);
function GetProcessCPULoading(ProcessID: LongWord; Delay: Cardinal): Single;

implementation

type
{$IFDEF CPUX64}
  NativeUInt = UInt64;
{$ELSE}
  NativeUInt = LongWord;
{$ENDIF}

var
  Is64BitWindows: BOOL = false;

function ProcessIDToHandle(ProcessID: LongWord): THandle;
begin
  Result := OpenProcess(PROCESS_ALL_ACCESS, false, ProcessID);
end;

function HandleToProcessID(ProcessHandle: THandle): LongWord;
begin
  Result := GetProcessId(ProcessHandle);
end;

function WideStringToString(const WideStringToConversion: WideString; CodePage: Word): AnsiString;
var
  L: Integer;
begin
  if WideStringToConversion = '' then
    Result := ''
  else
  begin
    L := WideCharToMultiByte(CodePage, WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR, @WideStringToConversion[1], -1, nil, 0, nil, nil);
    SetLength(Result, L - 1);
    if L > 1 then
      WideCharToMultiByte(CodePage, WC_COMPOSITECHECK or WC_DISCARDNS or WC_SEPCHARS or WC_DEFAULTCHAR, @WideStringToConversion[1], -1, @Result[1], L - 1, nil, nil);
  end;
end;

function StringToWideString(const AnsiStringToConversion: AnsiString; CodePage: Word): WideString;
var
  L: Integer;
begin
  if AnsiStringToConversion = '' then
    Result := ''
  else
  begin
    L := MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PAnsiChar(@AnsiStringToConversion[1]), -1, nil, 0);
    SetLength(Result, L - 1);
    if L > 1 then
      MultiByteToWideChar(CodePage, MB_PRECOMPOSED, PAnsiChar(@AnsiStringToConversion[1]), -1, PWideChar(@Result[1]), L - 1);
  end;
end;

const
  SE_DEBUG_NAME = 'SeDebugPrivilege';

function NTSetPrivilege(sPrivilege: AnsiString; bEnabled: Boolean): Boolean;
var
  hToken       : THandle;
  TokenPriv    : TOKEN_PRIVILEGES;
  PrevTokenPriv: TOKEN_PRIVILEGES;
  ReturnLength : Cardinal;
begin
  if OpenProcessToken(GetCurrentProcess, TOKEN_ADJUST_PRIVILEGES or TOKEN_QUERY, hToken) then
  begin
    if LookupPrivilegeValueA(nil, PAnsiChar(sPrivilege), TokenPriv.Privileges[0].Luid) then
    begin
      TokenPriv.PrivilegeCount := 1;
      case bEnabled of
        True:
          TokenPriv.Privileges[0].Attributes := SE_PRIVILEGE_ENABLED;
        false:
          TokenPriv.Privileges[0].Attributes := 0;
      end;
      ReturnLength  := 0;
      PrevTokenPriv := TokenPriv;
      AdjustTokenPrivileges(hToken, false, TokenPriv, SizeOf(PrevTokenPriv), PrevTokenPriv, ReturnLength);
    end;
    CloseHandle(hToken);
  end;
  Result := GetLastError = ERROR_SUCCESS;
end;

function _Is64BitWindows: BOOL;
{$IFNDEF CPUX64}
var
  Wow64Process: BOOL;
{$ENDIF}
begin
  IsWow64Process := GetProcAddress(GetModuleHandle(kernel32), 'IsWow64Process');
{$IFDEF CPUX64}
  Result := True;
{$ELSE}
  Wow64Process := false;
  if Assigned(IsWow64Process) then
    Wow64Process := IsWow64Process(GetCurrentProcess, Wow64Process) and Wow64Process;
  Result         := Wow64Process;
{$ENDIF}
end;

procedure _InitFunctions;
var
  NtdllHandle: THandle;
begin
  Is64BitWindows := _Is64BitWindows;
  if Is64BitWindows then
  begin
    NtdllHandle := GetModuleHandleA('ntdll.dll');
{$IFDEF CPUX64}
    NtWow64QueryInformationProcess64 := GetProcAddress(NtdllHandle, 'NtQueryInformationProcess');
    NtWow64ReadVirtualMemory64       := GetProcAddress(NtdllHandle, 'NtReadVirtualMemory');
{$ELSE}
    NtWow64QueryInformationProcess64 := GetProcAddress(NtdllHandle, 'NtWow64QueryInformationProcess64');
    NtWow64ReadVirtualMemory64       := GetProcAddress(NtdllHandle, 'NtWow64ReadVirtualMemory64');
{$ENDIF}
  end
  else
  begin
    Is64BitWindows := false;
  end;
end;

procedure _GetModulesList32(ProcessHandle: THandle; LdrAddress: Pointer; out Modules: TModulesList);
var
  LdrInfo      : PEB_LDR_DATA;
  ModuleInfo   : LDR_MODULE;
  StringBuffer : Pointer;
  StringPointer: Pointer;
  StringLength : Word;
  BytesRead    : LongWord;
begin
  NtReadVirtualMemory(ProcessHandle, LdrAddress, @LdrInfo, SizeOf(LdrInfo), BytesRead);
  NtReadVirtualMemory(ProcessHandle, LdrInfo.InLoadModuleOrderList.ForwardLDRModule, @ModuleInfo, SizeOf(ModuleInfo), BytesRead);
  FillChar(Modules, SizeOf(Modules), #0);
  while (LdrInfo.InLoadModuleOrderList.ForwardLDRModule <> nil) and (BytesRead <> 0) and (ModuleInfo.BaseAddress <> nil) do
  begin
    Inc(Modules.Length);
    SetLength(Modules.Modules, Modules.Length);
    with Modules do
    begin
      Modules[Length - 1].BaseAddress  := UInt64(ModuleInfo.BaseAddress);
      Modules[Length - 1].EntryAddress := UInt64(ModuleInfo.EntryPoint);
      Modules[Length - 1].SizeOfImage  := UInt64(ModuleInfo.SizeOfImage);
    end;
    StringPointer := ModuleInfo.FullDLLName.Buffer;
    StringLength  := ModuleInfo.FullDLLName.Length;
    GetMem(StringBuffer, StringLength + 2);
    FillChar(StringBuffer^, StringLength + 2, #0);
    NtReadVirtualMemory(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
    Modules.Modules[Modules.Length - 1].FullPath := WideStringToString(PWideChar(StringBuffer), 0);
    FreeMem(StringBuffer);
    StringPointer := ModuleInfo.BaseDLLName.Buffer;
    StringLength  := ModuleInfo.BaseDLLName.Length;
    GetMem(StringBuffer, StringLength + 2);
    FillChar(StringBuffer^, StringLength + 2, #0);
    NtReadVirtualMemory(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
    Modules.Modules[Modules.Length - 1].ModuleName := WideStringToString(PWideChar(StringBuffer), 0);
    FreeMem(StringBuffer);
    NtReadVirtualMemory(ProcessHandle, ModuleInfo.InLoadModuleOrderList.ForwardLDRModule, @ModuleInfo, SizeOf(ModuleInfo), BytesRead);
  end;
end;

procedure _GetProcessInfo32(ProcessID: LongWord; out ProcessInfo: PROCESS_INFO);
var
  ProcessHandle    : THandle;
  ProcessBasicInfo : PROCESS_BASIC_INFORMATION;
  PEBInfo          : PEB;
  UserParameters   : RTL_USER_PROCESS_PARAMETERS;
  BytesRead        : UInt;
  ReturnLength     : UInt;
  _Is64BitProcess  : BOOL;
  CurrentDirectory : AnsiString;
  ImageName        : AnsiString;
  CmdLine          : AnsiString;
  StringBuffer     : Pointer;
  StringPointer    : Pointer;
  StringLength     : Word;
  TlHelp32Info     : TProcessInfo;
  LocalHandlesCount: LongWord;
  MemoryCounters   : _PROCESS_MEMORY_COUNTERS_EX;
begin
  FillChar(ProcessBasicInfo, SizeOf(ProcessBasicInfo), #0);
  FillChar(PEBInfo, SizeOf(PEBInfo), #0);
  FillChar(UserParameters, SizeOf(UserParameters), #0);
  FillChar(ProcessInfo, SizeOf(ProcessInfo), #0);
  NTSetPrivilege(SE_DEBUG_NAME, True);
  ProcessHandle   := OpenProcess(PROCESS_QUERY_INFORMATION + PROCESS_VM_READ, false, ProcessID);
  _Is64BitProcess := false;
  NtQueryInformationProcess(ProcessHandle, ProcessBasicInformation, @ProcessBasicInfo, SizeOf(ProcessBasicInfo), ReturnLength);
  NtReadVirtualMemory(ProcessHandle, ProcessBasicInfo.PebBaseAddress, @PEBInfo, SizeOf(PEBInfo), BytesRead);
  NtReadVirtualMemory(ProcessHandle, PEBInfo.ProcessParameters, @UserParameters, SizeOf(UserParameters), BytesRead);
  _GetModulesList32(ProcessHandle, PEBInfo.Ldr, ProcessInfo.ModulesList);
  StringPointer := UserParameters.CommandLine.Buffer;
  StringLength  := UserParameters.CommandLine.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtReadVirtualMemory(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  CmdLine := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  StringPointer := UserParameters.ImagePathName.Buffer;
  StringLength  := UserParameters.ImagePathName.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtReadVirtualMemory(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  ImageName := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  StringPointer := UserParameters.CurrentDirectoryPath.Buffer;
  StringLength  := UserParameters.CurrentDirectoryPath.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtReadVirtualMemory(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  CurrentDirectory := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  FillChar(MemoryCounters, SizeOf(MemoryCounters), #0);
  GetProcessMemoryInfo(ProcessHandle, MemoryCounters, SizeOf(MemoryCounters));
  FillChar(TlHelp32Info, SizeOf(TlHelp32Info), #0);
  TlHelp32Info := GetTlHelp32ProcessInfo(ProcessID);
  GetProcessHandleCount(ProcessHandle, @LocalHandlesCount);
  with ProcessInfo do
  begin
    Handle               := ProcessHandle;
    ID                   := ProcessBasicInfo.UniqueProcessId;
    InheritedFromID      := ProcessBasicInfo.InheritedFromUniqueProcessId;
    SessionID            := PEBInfo.SessionID;
    Priority             := ProcessBasicInfo.BasePriority;
    AffinityMask         := ProcessBasicInfo.AffinityMask;
    IsDebugged           := PEBInfo.BeingDebugged;
    ExitStatus           := ProcessBasicInfo.ExitStatus;
    ThreadsCount         := TlHelp32Info.ThreadsCount;
    HandlesCount         := LocalHandlesCount;
    ReservedMemory       := MemoryCounters.PrivateUsage;
    ImageBaseAddress     := UInt64(PEBInfo.ImageBaseAddress);
    LdrAddress           := UInt64(PEBInfo.Ldr);
    PEBAddress           := UInt64(ProcessBasicInfo.PebBaseAddress);
    ConsoleHandle        := UserParameters.ConsoleHandle;
    StdInputHandle       := UserParameters.StdInputHandle;
    StdOutputHandle      := UserParameters.StdOutputHandle;
    StdErrorHandle       := UserParameters.StdErrorHandle;
    ProcessName          := TlHelp32Info.ExeFile;
    CurrentDirectoryPath := CurrentDirectory;
    ImagePathName        := ImageName;
    CommandLine          := CmdLine;
    Is64BitProcess       := _Is64BitProcess;
  end;
  CloseHandle(ProcessHandle);
end;

procedure _GetModulesList64(ProcessHandle: THandle; LdrAddress: UInt64; out Modules: TModulesList);
var
  LdrInfo      : PEB_LDR_DATA64;
  ModuleInfo   : LDR_MODULE64;
  StringBuffer : Pointer;
  StringPointer: UInt64;
  StringLength : Word;
  BytesRead    : UInt64;
begin
  NtWow64ReadVirtualMemory64(ProcessHandle, LdrAddress, @LdrInfo, SizeOf(LdrInfo), BytesRead);
  NtWow64ReadVirtualMemory64(ProcessHandle, UInt64(LdrInfo.InLoadModuleOrderList.ForwardLDRModule), @ModuleInfo, SizeOf(ModuleInfo), BytesRead);
  FillChar(Modules, SizeOf(Modules), #0);
  while (LdrInfo.InLoadModuleOrderList.ForwardLDRModule <> 0) and (BytesRead <> 0) and (ModuleInfo.BaseAddress <> 0) do
  begin
    Inc(Modules.Length);
    SetLength(Modules.Modules, Modules.Length);
    with Modules do
    begin
      Modules[Length - 1].BaseAddress  := ModuleInfo.BaseAddress;
      Modules[Length - 1].EntryAddress := ModuleInfo.EntryPoint;
      Modules[Length - 1].SizeOfImage  := ModuleInfo.SizeOfImage;
    end;
    StringPointer := ModuleInfo.FullDLLName.Buffer;
    StringLength  := ModuleInfo.FullDLLName.Length;
    GetMem(StringBuffer, StringLength + 2);
    FillChar(StringBuffer^, StringLength + 2, #0);
    NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
    Modules.Modules[Modules.Length - 1].FullPath := WideStringToString(PWideChar(StringBuffer), 0);
    FreeMem(StringBuffer);
    StringPointer := ModuleInfo.BaseDLLName.Buffer;
    StringLength  := ModuleInfo.BaseDLLName.Length;
    GetMem(StringBuffer, StringLength + 2);
    FillChar(StringBuffer^, StringLength + 2, #0);
    NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
    Modules.Modules[Modules.Length - 1].ModuleName := WideStringToString(PWideChar(StringBuffer), 0);
    FreeMem(StringBuffer);
    NtWow64ReadVirtualMemory64(ProcessHandle, ModuleInfo.InLoadModuleOrderList.ForwardLDRModule, @ModuleInfo, SizeOf(ModuleInfo), BytesRead);
  end;
end;

procedure _GetProcessInfo64(ProcessID: LongWord; out ProcessInfo: PROCESS_INFO);
var
  ProcessHandle    : THandle;
  ProcessBasicInfo : PROCESS_BASIC_INFORMATION64;
  PEBInfo          : PEB64;
  UserParameters   : RTL_USER_PROCESS_PARAMETERS64;
  BytesRead        : UInt64;
  ReturnLength     : UInt64;
  _Is64BitProcess  : BOOL;
  CurrentDirectory : AnsiString;
  ImageName        : AnsiString;
  CmdLine          : AnsiString;
  StringBuffer     : Pointer;
  StringPointer    : UInt64;
  StringLength     : Word;
  TlHelp32Info     : TProcessInfo;
  LocalHandlesCount: LongWord;
  MemoryCounters   : _PROCESS_MEMORY_COUNTERS_EX;
begin
  FillChar(ProcessBasicInfo, SizeOf(ProcessBasicInfo), #0);
  FillChar(PEBInfo, SizeOf(PEBInfo), #0);
  FillChar(UserParameters, SizeOf(UserParameters), #0);
  FillChar(ProcessInfo, SizeOf(ProcessInfo), #0);
  NTSetPrivilege(SE_DEBUG_NAME, True);
  ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION + PROCESS_VM_READ, false, ProcessID);
  IsWow64Process(ProcessHandle, _Is64BitProcess);
  _Is64BitProcess := not _Is64BitProcess;
  NtWow64QueryInformationProcess64(ProcessHandle, ProcessBasicInformation, @ProcessBasicInfo, SizeOf(ProcessBasicInfo), ReturnLength);
  NtWow64ReadVirtualMemory64(ProcessHandle, ProcessBasicInfo.PebBaseAddress, @PEBInfo, SizeOf(PEBInfo), BytesRead);
  NtWow64ReadVirtualMemory64(ProcessHandle, PEBInfo.ProcessParameters, @UserParameters, SizeOf(UserParameters), BytesRead);
  _GetModulesList64(ProcessHandle, PEBInfo.Ldr, ProcessInfo.ModulesList);
  StringPointer := UserParameters.CommandLine.Buffer;
  StringLength  := UserParameters.CommandLine.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  CmdLine := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  StringPointer := UserParameters.ImagePathName.Buffer;
  StringLength  := UserParameters.ImagePathName.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  ImageName := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  StringPointer := UserParameters.CurrentDirectoryPath.Buffer;
  StringLength  := UserParameters.CurrentDirectoryPath.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  CurrentDirectory := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  FillChar(MemoryCounters, SizeOf(MemoryCounters), #0);
  GetProcessMemoryInfo(ProcessHandle, MemoryCounters, SizeOf(MemoryCounters));
  FillChar(TlHelp32Info, SizeOf(TlHelp32Info), #0);
  TlHelp32Info := GetTlHelp32ProcessInfo(ProcessID);
  GetProcessHandleCount(ProcessHandle, @LocalHandlesCount);
  with ProcessInfo do
  begin
    Handle               := ProcessHandle;
    ID                   := ProcessBasicInfo.UniqueProcessId;
    InheritedFromID      := ProcessBasicInfo.InheritedFromUniqueProcessId;
    SessionID            := PEBInfo.SessionID;
    Priority             := ProcessBasicInfo.BasePriority;
    AffinityMask         := ProcessBasicInfo.AffinityMask;
    IsDebugged           := PEBInfo.BeingDebugged;
    ExitStatus           := ProcessBasicInfo.ExitStatus;
    ThreadsCount         := TlHelp32Info.ThreadsCount;
    HandlesCount         := LocalHandlesCount;
    ReservedMemory       := MemoryCounters.PrivateUsage;
    ImageBaseAddress     := PEBInfo.ImageBaseAddress;
    LdrAddress           := PEBInfo.Ldr;
    PEBAddress           := ProcessBasicInfo.PebBaseAddress;
    ConsoleHandle        := UserParameters.ConsoleHandle;
    StdInputHandle       := UserParameters.StdInputHandle;
    StdOutputHandle      := UserParameters.StdOutputHandle;
    StdErrorHandle       := UserParameters.StdErrorHandle;
    ProcessName          := TlHelp32Info.ExeFile;
    CurrentDirectoryPath := CurrentDirectory;
    ImagePathName        := ImageName;
    CommandLine          := CmdLine;
    Is64BitProcess       := _Is64BitProcess;
  end;
  CloseHandle(ProcessHandle);
end;

procedure _GetModulesListWow64(ProcessHandle: THandle; LdrAddress: Pointer32; out Modules: TModulesList);
var
  LdrInfo      : PEB_LDR_DATA_WOW64;
  ModuleInfo   : LDR_MODULE_WOW64;
  StringBuffer : Pointer;
  StringPointer: UInt64;
  StringLength : Word;
  BytesRead    : UInt64;
begin
  NtWow64ReadVirtualMemory64(ProcessHandle, UInt64(LdrAddress), @LdrInfo, SizeOf(LdrInfo), BytesRead);
  NtWow64ReadVirtualMemory64(ProcessHandle, UInt64(LdrInfo.InLoadModuleOrderList.ForwardLDRModule), @ModuleInfo, SizeOf(ModuleInfo), BytesRead);
  FillChar(Modules, SizeOf(Modules), #0);
  while (LdrInfo.InLoadModuleOrderList.ForwardLDRModule <> 0) and (BytesRead <> 0) and (ModuleInfo.BaseAddress <> 0) do
  begin
    Inc(Modules.Length);
    SetLength(Modules.Modules, Modules.Length);
    with Modules do
    begin
      Modules[Length - 1].BaseAddress  := ModuleInfo.BaseAddress;
      Modules[Length - 1].EntryAddress := ModuleInfo.EntryPoint;
      Modules[Length - 1].SizeOfImage  := ModuleInfo.SizeOfImage;
    end;
    StringPointer := ModuleInfo.FullDLLName.Buffer;
    StringLength  := ModuleInfo.FullDLLName.Length;
    GetMem(StringBuffer, StringLength + 2);
    FillChar(StringBuffer^, StringLength + 2, #0);
    NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
    Modules.Modules[Modules.Length - 1].FullPath := WideStringToString(PWideChar(StringBuffer), 0);
    FreeMem(StringBuffer);
    StringPointer := ModuleInfo.BaseDLLName.Buffer;
    StringLength  := ModuleInfo.BaseDLLName.Length;
    GetMem(StringBuffer, StringLength + 2);
    FillChar(StringBuffer^, StringLength + 2, #0);
    NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
    Modules.Modules[Modules.Length - 1].ModuleName := WideStringToString(PWideChar(StringBuffer), 0);
    FreeMem(StringBuffer);
    NtWow64ReadVirtualMemory64(ProcessHandle, ModuleInfo.InLoadModuleOrderList.ForwardLDRModule, @ModuleInfo, SizeOf(ModuleInfo), BytesRead);
  end;
end;

procedure _GetProcessInfoWow64(ProcessID: LongWord; out ProcessInfo: PROCESS_INFO);
var
  ProcessHandle        : THandle;
  ProcessBasicInfo     : PROCESS_BASIC_INFORMATION64;
  ProcessBasicInfoWow64: PROCESS_BASIC_INFORMATION_WOW64;
  PEBInfo              : PEB_WOW64;
  UserParameters       : RTL_USER_PROCESS_PARAMETERS_WOW64;
  BytesRead            : UInt64;
  ReturnLength         : UInt64;
  _Is64BitProcess      : BOOL;
  CurrentDirectory     : AnsiString;
  ImageName            : AnsiString;
  CmdLine              : AnsiString;
  StringBuffer         : Pointer;
  StringPointer        : UInt64;
  StringLength         : Word;
  TlHelp32Info         : TProcessInfo;
  LocalHandlesCount    : LongWord;
  MemoryCounters       : _PROCESS_MEMORY_COUNTERS_EX;
begin
  FillChar(ProcessBasicInfo, SizeOf(ProcessBasicInfo), #0);
  FillChar(PEBInfo, SizeOf(PEBInfo), #0);
  FillChar(UserParameters, SizeOf(UserParameters), #0);
  FillChar(ProcessInfo, SizeOf(ProcessInfo), #0);
  NTSetPrivilege(SE_DEBUG_NAME, True);
  ProcessHandle := OpenProcess(PROCESS_QUERY_INFORMATION + PROCESS_VM_READ, false, ProcessID);
  IsWow64Process(ProcessHandle, _Is64BitProcess);
  _Is64BitProcess := not _Is64BitProcess;
  NtWow64QueryInformationProcess64(ProcessHandle, ProcessBasicInformation, @ProcessBasicInfo, SizeOf(ProcessBasicInfo), ReturnLength);
  NtWow64QueryInformationProcess64(ProcessHandle, ProcessWow64Information, @ProcessBasicInfoWow64, SizeOf(ProcessBasicInfoWow64), ReturnLength);
  NtWow64ReadVirtualMemory64(ProcessHandle, ProcessBasicInfoWow64.Wow64PebAddress, @PEBInfo, SizeOf(PEBInfo), BytesRead);
  NtWow64ReadVirtualMemory64(ProcessHandle, UInt64(PEBInfo.ProcessParameters), @UserParameters, SizeOf(UserParameters), BytesRead);
  _GetModulesListWow64(ProcessHandle, UInt64(PEBInfo.Ldr), ProcessInfo.ModulesList);
  StringPointer := UserParameters.CommandLine.Buffer;
  StringLength  := UserParameters.CommandLine.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  CmdLine := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  StringPointer := UserParameters.ImagePathName.Buffer;
  StringLength  := UserParameters.ImagePathName.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  ImageName := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  StringPointer := UserParameters.CurrentDirectoryPath.Buffer;
  StringLength  := UserParameters.CurrentDirectoryPath.Length;
  GetMem(StringBuffer, StringLength + 2);
  FillChar(StringBuffer^, StringLength + 2, #0);
  NtWow64ReadVirtualMemory64(ProcessHandle, StringPointer, StringBuffer, StringLength, BytesRead);
  CurrentDirectory := WideStringToString(PWideChar(StringBuffer), 0);
  FreeMem(StringBuffer);
  FillChar(MemoryCounters, SizeOf(MemoryCounters), #0);
  GetProcessMemoryInfo(ProcessHandle, MemoryCounters, SizeOf(MemoryCounters));
  FillChar(TlHelp32Info, SizeOf(TlHelp32Info), #0);
  TlHelp32Info := GetTlHelp32ProcessInfo(ProcessID);
  GetProcessHandleCount(ProcessHandle, @LocalHandlesCount);
  with ProcessInfo do
  begin
    Handle               := ProcessHandle;
    ID                   := ProcessBasicInfo.UniqueProcessId;
    InheritedFromID      := ProcessBasicInfo.InheritedFromUniqueProcessId;
    SessionID            := PEBInfo.SessionID;
    Priority             := ProcessBasicInfo.BasePriority;
    AffinityMask         := ProcessBasicInfo.AffinityMask;
    IsDebugged           := PEBInfo.BeingDebugged;
    ExitStatus           := ProcessBasicInfo.ExitStatus;
    ThreadsCount         := TlHelp32Info.ThreadsCount;
    HandlesCount         := LocalHandlesCount;
    ReservedMemory       := MemoryCounters.PrivateUsage;
    ImageBaseAddress     := UInt64(PEBInfo.ImageBaseAddress);
    LdrAddress           := UInt64(PEBInfo.Ldr);
    PEBAddress           := ProcessBasicInfo.PebBaseAddress;
    ConsoleHandle        := UserParameters.ConsoleHandle;
    StdInputHandle       := UserParameters.StdInputHandle;
    StdOutputHandle      := UserParameters.StdOutputHandle;
    StdErrorHandle       := UserParameters.StdErrorHandle;
    ProcessName          := TlHelp32Info.ExeFile;
    CurrentDirectoryPath := CurrentDirectory;
    ImagePathName        := ImageName;
    CommandLine          := CmdLine;
    Is64BitProcess       := _Is64BitProcess;
  end;
  CloseHandle(ProcessHandle);
end;

procedure GetProcessInfo(ProcessID: LongWord; out ProcessInfo: PROCESS_INFO; Process32_64CompatibleMode: Boolean = false);
var
  IsTarget64Bit: LongBool;
  TargetHandle : THandle;
begin
  FillChar(ProcessInfo, SizeOf(ProcessInfo), #0);
  TargetHandle := ProcessIDToHandle(ProcessID);
  if TargetHandle = 0 then
    Exit;
  IsWow64Process(TargetHandle, IsTarget64Bit);
  IsTarget64Bit := not IsTarget64Bit;
  CloseHandle(TargetHandle);
{$IFDEF CPUX64}
  if IsTarget64Bit then
    _GetProcessInfo64(ProcessID, ProcessInfo)
  else if Process32_64CompatibleMode then
    _GetProcessInfo64(ProcessID, ProcessInfo)
  else
    _GetProcessInfoWow64(ProcessID, ProcessInfo);
{$ELSE}
  if Is64BitWindows then
    if IsTarget64Bit then
      _GetProcessInfo64(ProcessID, ProcessInfo)
    else if Process32_64CompatibleMode then
      _GetProcessInfo64(ProcessID, ProcessInfo)
    else
      _GetProcessInfo32(ProcessID, ProcessInfo)
  else
    _GetProcessInfo32(ProcessID, ProcessInfo);
{$ENDIF}
end;

procedure GetProcessBasicInfo(ProcessID: LongWord; out ProcessBasicInfo: TProcessBasicInfo);
var
  ProcessBasicInfo32: PROCESS_BASIC_INFORMATION;
  ProcessBasicInfo64: PROCESS_BASIC_INFORMATION64;
  ProcessHandle     : THandle;
  ReturnLength32    : LongWord;
  ReturnLength64    : UInt64;
begin
  ProcessHandle := ProcessIDToHandle(ProcessID);
  if Is64BitProcess(ProcessID) then
  begin
    NtWow64QueryInformationProcess64(ProcessHandle, ProcessBasicInformation, @ProcessBasicInfo64, SizeOf(ProcessBasicInfo64), ReturnLength64);
    ProcessBasicInfo.ExitStatus                   := ProcessBasicInfo64.ExitStatus;
    ProcessBasicInfo.AffinityMask                 := ProcessBasicInfo64.AffinityMask;
    ProcessBasicInfo.BasePriority                 := ProcessBasicInfo64.BasePriority;
    ProcessBasicInfo.UniqueProcessId              := ProcessBasicInfo64.UniqueProcessId;
    ProcessBasicInfo.InheritedFromUniqueProcessId := ProcessBasicInfo64.InheritedFromUniqueProcessId;
  end
  else
  begin
    NtQueryInformationProcess(ProcessHandle, ProcessBasicInformation, @ProcessBasicInfo, SizeOf(ProcessBasicInfo), ReturnLength32);
    ProcessBasicInfo.ExitStatus                   := ProcessBasicInfo32.ExitStatus;
    ProcessBasicInfo.AffinityMask                 := ProcessBasicInfo32.AffinityMask;
    ProcessBasicInfo.BasePriority                 := ProcessBasicInfo32.BasePriority;
    ProcessBasicInfo.UniqueProcessId              := ProcessBasicInfo32.UniqueProcessId;
    ProcessBasicInfo.InheritedFromUniqueProcessId := ProcessBasicInfo32.InheritedFromUniqueProcessId;
  end;
  CloseHandle(ProcessHandle);
end;

function Is64BitProcess(ProcessID: LongWord): LongBool;
var
  ProcessHandle: NativeUInt;
begin
  ProcessHandle := ProcessIDToHandle(ProcessID);
  if Is64BitWindows then
  begin
    IsWow64Process(ProcessHandle, Result);
    Result := not Result;
  end
  else
  begin
    Result := false;
  end;
  CloseHandle(ProcessHandle);
end;

function IsProcessLaunched(ProcessName: AnsiString): Boolean;
var
  hSnapshot  : THandle;
  ProcessInfo: TProcessInfo;
begin
  Result           := false;
  ProcessInfo.Size := SizeOf(ProcessInfo);
  hSnapshot        := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32FirstA(hSnapshot, ProcessInfo) then
  begin
    if ProcessInfo.ExeFile = ProcessName then
    begin
      Result := True;
    end
    else
    begin
      while Process32NextA(hSnapshot, ProcessInfo) do
      begin
        if ProcessInfo.ExeFile = ProcessName then
        begin
          Result := True;
          Break;
        end;
      end;
    end;
  end;
  CloseHandle(hSnapshot);
end;

function GetProcessIdFromThreadID(ThreadID: LongWord): LongWord;
var
  TlHelpHandle : LongWord;
  THREADENTRY32: TThreadEntry32;
begin
  Result       := 0;
  TlHelpHandle := CreateToolHelp32Snapshot(TH32CS_SNAPTHREAD, 0);
  if TlHelpHandle <> INVALID_HANDLE_VALUE then
  begin
    THREADENTRY32.Size := SizeOf(TThreadEntry32);
    if Thread32First(TlHelpHandle, tagTHREADENTRY32(THREADENTRY32)) then
      repeat
        if THREADENTRY32.ThreadID = ThreadID then
          Result := THREADENTRY32.OwnerProcessID;
      until not Thread32Next(TlHelpHandle, tagTHREADENTRY32(THREADENTRY32));
    CloseHandle(TlHelpHandle);
  end;
end;

procedure GetProcessList(out ProcessList: TProcessList);
var
  hSnapshot  : THandle;
  ProcessInfo: TProcessInfo;
  Size       : LongWord;
begin
  Size := 0;
  SetLength(ProcessList, Size);
  ProcessInfo.Size := SizeOf(ProcessInfo);
  hSnapshot        := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32FirstA(hSnapshot, ProcessInfo) then
  begin
    Inc(Size);
    SetLength(ProcessList, Size);
    ProcessList[Size - 1] := ProcessInfo;
    while Process32NextA(hSnapshot, ProcessInfo) do
    begin
      Inc(Size);
      SetLength(ProcessList, Size);
      ProcessList[Size - 1] := ProcessInfo;
    end;
  end;
  CloseHandle(hSnapshot);
end;

function GetTlHelp32ProcessInfo(ProcessID: LongWord): TProcessInfo; overload;
var
  hSnapshot  : THandle;
  ProcessInfo: TProcessInfo;
begin
  FillChar(Result, SizeOf(Result), #0);
  ProcessInfo.Size := SizeOf(ProcessInfo);
  hSnapshot        := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32FirstA(hSnapshot, ProcessInfo) then
  begin
    if ProcessInfo.ProcessID = ProcessID then
    begin
      Result := ProcessInfo;
    end
    else
    begin
      while Process32NextA(hSnapshot, ProcessInfo) do
      begin
        if ProcessInfo.ProcessID = ProcessID then
        begin
          Result := ProcessInfo;
          Break;
        end;
      end;
    end;
  end;
  CloseHandle(hSnapshot);
end;

function GetTlHelp32ProcessInfo(ProcessName: AnsiString): TProcessInfo; overload;
var
  hSnapshot  : THandle;
  ProcessInfo: TProcessInfo;
begin
  FillChar(Result, SizeOf(Result), #0);
  ProcessInfo.Size := SizeOf(ProcessInfo);
  hSnapshot        := CreateToolHelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  if Process32FirstA(hSnapshot, ProcessInfo) then
  begin
    if ProcessInfo.ExeFile = ProcessName then
    begin
      Result := ProcessInfo;
    end
    else
    begin
      while Process32NextA(hSnapshot, ProcessInfo) do
      begin
        if ProcessInfo.ExeFile = ProcessName then
        begin
          Result := ProcessInfo;
          Break;
        end;
      end;
    end;
  end;
  CloseHandle(hSnapshot);
end;

procedure StartProcess(const CommandLine: string; out ProcessHandle: THandle; out ProcessID: LongWord);
var
  ProcessInfo: _PROCESS_INFORMATION;
  StartupInfo: _STARTUPINFO;
begin
  FillChar(StartupInfo, SizeOf(StartupInfo), #0);
  FillChar(ProcessInfo, SizeOf(ProcessInfo), #0);
  StartupInfo.wShowWindow := SW_SHOWNORMAL;
  CreateProcess(nil, PChar(CommandLine), nil, nil, false, 0, nil, nil, StartupInfo, ProcessInfo);
  CloseHandle(ProcessInfo.hThread);
  ProcessHandle := ProcessInfo.hProcess;
  ProcessID     := ProcessInfo.dwProcessId;
end;

function GetProcessCPULoading(ProcessID: LongWord; Delay: Cardinal): Single;
var
  SystemInfo                                          : SYSTEM_INFO;
  ProcessorsCount                                     : Byte;
  lpCreationTime, lpExitTime, lpKernelTime, lpUserTime: TFileTime;
  WorkingTime                                         : Int64;
  WorkingInterval, LifeInterval                       : Single;
  FirstUpdateTime, SecondUpdateTime                   : Cardinal;
  FirstWorkingTime                                    : Int64;
  ProcessHandle                                       : THandle;
begin
  ProcessHandle := ProcessIDToHandle(ProcessID);
  GetSystemInfo(SystemInfo);
  ProcessorsCount := SystemInfo.dwNumberOfProcessors;
  GetProcessTimes(ProcessHandle, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime);
  FirstUpdateTime  := GetTickCount;
  FirstWorkingTime := Int64(lpKernelTime) + Int64(lpUserTime);
  Sleep(Delay);
  GetProcessTimes(ProcessHandle, lpCreationTime, lpExitTime, lpKernelTime, lpUserTime);
  SecondUpdateTime := GetTickCount;
  LifeInterval     := SecondUpdateTime - FirstUpdateTime;
  if LifeInterval <= 0 then
    LifeInterval  := 0.01;
  WorkingTime     := Int64(lpKernelTime) + Int64(lpUserTime);
  WorkingInterval := WorkingTime - FirstWorkingTime;
  Result          := WorkingInterval / (LifeInterval * 100 * ProcessorsCount);
  CloseHandle(ProcessHandle);
end;

initialization

_InitFunctions;

end.
