PROGRAM_NAME='NI3100Code'
(***********************************************************)
(*  FILE CREATED ON: 06/13/2009  AT: 20:19:49              *)
(***********************************************************)
(*  FILE_LAST_MODIFIED_ON: 11/30/2010  AT: 12:51:14        *)
(***********************************************************)
(* System Type : NetLinx                                   *)
(***********************************************************)
(* REV HISTORY:                                            *)
(***********************************************************)
(*
    $History: $3.5 
    Revised Draft for MITE South and Central Installs
    --new features, autodetect location via IP address
    --April 2018 update include presets.
    --Updated August 2020.
    Note on Monivision IR--SET ID to "NO" or IR codes will not work
*)
(***********************************************************)
(*          DEVICE NUMBER DEFINITIONS GO BELOW             *)
(***********************************************************)
//current ni password is m1t3e36
//last modified Nov 23, 2017. 

DEFINE_DEVICE //panel devices

vdvTP_Recording			= 34001:1:0
CV10dvTP_Recording		= 10001:1:0   //1

vdvTP_AMX_Setup			= 34001:2:0
CV10dvTP_AMX_Setup 		= 10001:2:0   //2

vdvTP_DialSetup			= 34001:3:0
CV10dvTP_DialSetup		= 10001:3:0   //3

vdvTP_Dial			= 34001:4:0
CV10dvTP_Dial			= 10001:4:0   //4

vdvTP_InstrCamControl		= 34001:5:0
CV10dvTP_InstrCamControl	= 10001:5:0   //5

vdvTP_AddressBook		= 34001:25:0  
CV10dvTP_AddressBook		= 10001:5:0   //5

vdvTP_VideoSwitch		= 34001:6:0
CV10dvTP_VideoSwitch		= 10001:6:0   //6

vdvTP_modeSelect		= 34001:7:0
CV10dvTP_modeSelect		= 10001:7:0   //7

vdvTP_dialing			= 34001:8:0
CV10dvTP_dialing		= 10001:8:0 //

vdvTP_record_preset		= 34001:9:0
CV10dvTP_record_preset		= 10001:9:0 // 9

vdvTP_RoomSettings		= 34001:10:0
CV10dvTP_RoomSettings		= 10001:10:0  //10

vdvTP_StudentCamera		= 34001:11:0 //Note this is also the channel for the new morenet dialing
CV10dvTP_StudentCamera		= 10001:11:0  //11

vdvTP_Alerts			= 34001:12:0
CV10dvTP_Alerts			= 10001:12:0  //12

vdvTP_PresentationSelections	= 34001:30:0
CV10dvTP_PresentationSelections	= 10001:30:0  //30

vdvTP_WeatherSelect		= 34001:31:0
CV10dvTP_WeatherSelect		= 10001:31:0  //31

vdvTP_SupportSelection		= 34001:32:0
CV10dvTP_SupportSelection	= 10001:32:0

vdvTP_AdvancedSelection		= 34001:33:0
CV10dvTP_AdvancedSelection	= 10001:33:0  //33

vdvTP_VTCSelections		= 34001:34:0
CV10dvTP_VTCSelections		= 10001:34:0  //34

vdvTP_VTC239Selections		= 34001:35:0
CV10dvTP_VTC239Selections	= 10001:35:0

vdvTP_Volume			= 34001:40:0
CV10dvTP_VVolume		= 10001:40:0

vdvTP_Quick_dial_SETPreset	= 34001:41:0
CV10dvTP_Quick_dial_SETPreset	= 10001:22:0

vdvTP_Record_SETPreset		= 34001:42:0
CV10dvTP_Record_SETPreset	= 10001:23:0

     
DEFINE_DEVICE  //virtual devices for combining and uncombining

vdvKNOX				= 34011:1:0
vdvTEACHCAM			= 34012:1:0
vdvPOLYCOM			= 34013:1:0
vdvSCALER			= 34014:1:0
vdvVGAMON			= 34015:1:0
vdvFrontLCD			= 34016:1:0
vdvRearLCD			= 34017:1:0
vdvRearPreviewLCD		= 34018:1:0

vdvrelay			= 34023:1:0
vdvIO				= 34024:1:0

DEFINE_DEVICE //Unreal devices

baseMASTER			= 0:1:0
dv_Lifesize			= 0:2:0   

baseNI				= 5001:1:0 //either 700 or 3100
basePanel			= 10001:1:0

(***********************************************************)
(*               CONSTANT DEFINITIONS GO BELOW             *)
(***********************************************************)

DEFINE_CONSTANT //for internet control of lifesize. 
TCP_IP = 1
TELNET = 23

DEFINE_CONSTANT //track status of the VGA Monitor
FIRSTVGA        =   1
SECONDVGA       =   2

DEFINE_CONSTANT //track which camera is being used
CAMERA_INSTR_INPUT      =   1
CAMERA_STUDENT_INPUT    =   2
CAMERA_DOC_INPUT        =   3
CAMERA_VCR_INPUT        =   4
CAMERA_DVD_INPUT        =   5
CAMERA_AUX1_INPUT       =   6
CAMERA_AUX2_INPUT       =   7
CAMERA_PC_INPUT         =   16

AVCAMERA_INSTR_INPUT    =   1
AVCAMERA_STUDENT_INPUT  =   2
AVCAMERA_DOC_INPUT      =   3
AVCAMERA_VCR_INPUT      =   4
AVCAMERA_DVD_INPUT      =   5
AVCAMERA_AUX1_INPUT     =   6
AVCAMERA_AUX2_INPUT     =   7
AVPC_INPUT          	=   8

DEFINE_CONSTANT //track knox router inputs and outputs
(*Knox Router Inputs--video*)
KVI_Instructor_Camera       	=   1
KVI_Document_Camera     	=   2
KVI_AUX1            		=   3
KVI_AUX2            		=   4
KVI_VCR_Video_Out       	=   5
KVI_Polycom_Send        	=   6 //what the polycom is sending, student camera as well
KVI_Polycom_Receive         	=   7
KVI_PC_Video            	=   8

(*Knox Router Inputs--audio*)
KAI_AUX1            		=   	1
KAI_AUX2            		=   	2       
KAI_VCR_Audio_Out       	=   	4
KAI_NULL            		=   	5

(*Knox Router Outputs-video*)
KVO_Instructor_TV       	=   	1
KVO_Student_TV          	=   	2
KVO_Record_VCR_Input       	=   	5
KVO_Scaler_Video_Input      	=   	6
KVO_Polycom_SVID_Video_IN   	=   	7
KVO_Polycom_VCR_Video_IN   	=   	8

(*Knox Router Outputs-audio*)
KAO_Polycom_VCR_Audio_IN    	=   	1

DEFINE_CONSTANT //Constats for  switchers
cnVideoLevel 			= 	1
cnAudioLevel 			= 	2

DEFINE_CONSTANT //Constats for inputs from keyboards and keypads
cnLookingForDialingNameA 	= 1
cnLookingForDialingNameB 	= 2
cnLookingForDialingNameC 	= 3
cnLookingForDialingNameD 	= 4
cnLookingForDialingNameE 	= 5
cnLookingForDialingNameF 	= 6

cnLookingForRecordNameA 	= 7
cnLookingForRecordNameB 	= 8
cnLookingForRecordNameC 	= 9
cnLookingForRecordNameD 	= 10

cnLookingForDialingNumberA 	= 11
cnLookingForDialingNumberB	= 12
cnLookingForDialingNumberC	= 13
cnLookingForDialingNumberD	= 14
cnLookingForDialingNumberE	= 15
cnLookingForDialingNumberF	= 16

cnLookingForRecordNumberA 	= 17
cnLookingForRecordNumberB 	= 18
cnLookingForRecordNumberC 	= 19
cnLookingForRecordNumberD 	= 20

cnLookingForAlertEmails 	= 5
cnLookingForSiteName 		= 6
cnLookingForCustomMessage 	=7

(*These Contants are used to track the status of the input of the scaler*)
SCALERPC    	=   1
SCALERVIDEO     =   2



(***********************************************************)
(*              DATA TYPE DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_TYPE
structure MITEDirectory
{
	char Name[40]
	char Number[15]
}

(*
    char Dialing_name_A[40]
    char Dialing_IP_A[20]
    char Dialing_name_B[40]
    char Dialing_IP_B[20]
    char Dialing_name_C[40]
    char Dialing_IP_C[40]
    char Dialing_name_D[40]
    char Dialing_IP_D[40]
    char AlertEmails [50]
    
    *)
structure MITESiteSettingsST
{
    
    char SiteIPAddress [15]
    integer SiteIndex
    char SiteName [50]
    integer KnoxRouterType //1 is 8x8 2 is 16x8 (north)
    integer Cluster //1 north, 2 central, 3 south
    char DefaultSpeed[4]
    char CODEC_IP [15]

}

(***********************************************************)
(*               VARIABLE DEFINITIONS GO BELOW             *)
(***********************************************************)
//for video mute
define_variable
LifeSize_VIDEO_MUTE
LifeSize_Record_Active
DEFINE_VARIABLE //for MITE Directory
persistent MITEDirectory MITEPHONEBOOK [100]
float iLen
integer CurrentPhoneIndex
Call_Active
DEFINE_VARIABLE //for locating our site. 
IP_ADDRESS_STRUCT MyIPAddressInformation
Char MyIPAddress [15]
SettingIndex
persistent MITESiteSettingsST MITESettings [45]
persistent char Recording_Set [20]
persistent char Recording_Key [20]


persistent char Dial_Set [25]
persistent char MOREnet_Dial_Set [25]

persistent char MOREnet_DialPreset_1_name [15]
persistent char MOREnet_DialPreset_2_name [15]
persistent char MOREnet_DialPreset_3_name [15]
persistent char MOREnet_DialPreset_4_name [15]
persistent char MOREnet_DialPreset_5_name [15]
persistent char MOREnet_DialPreset_6_name [15]

persistent char MOREnet_DialPreset_1_numb [10]
persistent char MOREnet_DialPreset_2_numb [10]
persistent char MOREnet_DialPreset_3_numb [10]
persistent char MOREnet_DialPreset_4_numb [10]
persistent char MOREnet_DialPreset_5_numb [10]
persistent char MOREnet_DialPreset_6_numb [10]

persistent char Record_Preset_1_name [15]
persistent char Record_Preset_2_name [15]
persistent char Record_Preset_3_name [15]
persistent char Record_Preset_4_name [15]

persistent char Record_Preset_1_numb [10]
persistent char Record_Preset_2_numb [10]
persistent char Record_Preset_3_numb [10]
persistent char Record_Preset_4_numb [10]

char datafromtouchpanel[50]
DEFINE_VARIABLE //device vars and tracking vars for devices
iCountDialing
Recordingactive

//RS232 devices
DEV dvnKNOX
DEV dvnTEACHCAM
DEV dvnPOLYCOM
DEV dvnSCALER
DEV dvnVGAMON
DEV dvnFrontLCD
DEV dvnRearLCD
DEV dvnRearPreviewLCD
DEV dvnIO

DEV dvnDVD_VCR
DEV dvnRECORD_VCR
DEV dvnMonovisionIR
DEV dvnGlasgowFrontTV

DEV dvnrelay	

//misc
H239VideoPreview
NowPreviewing
tempcontentselection
H239STATUS
Sending_Content
Receiving_Content
Telepresence_ON
trackingMorenetPreset

DEFINE_VARIABLE //Custom Alert
char CustomAlertText[40]

DEFINE_VARIABLE //seleciton tracking vars
char tempvolumeresponse [200]
trackPresenSelections2
trackWeatherSelecitons
trackDeviceAssign //0 is defaults, 1 is not defaults
KnoxRouterType
Video_MAN_SWT_LEVEL	
Video_Switcher_Man_Input
Video_Switcher_Man_Output
trackingTextInput
trackingIPInput
trackAdvancedSelections
trackPresenSelections
track_source
trackVTCInputSelecitons
TRACK_SCALER_INPUT
tracksupportSelections 
RecordPresentation
DialVTC 
DialVTCdirect
DialVTCman
RecordVTC
AutoReboot
CurrentVTC239Video
CurrentVTC239Content
Polycom_Mute
Polycom_Volume
VC_ON
char incomingdatafCodec [400]
char LifeSize_lasterrormessage [400]
Call_Automatic
curentMode
InaVTCCall
Track_RECORD_SOURCE
trackVTCInputSelecitons2 
CurrentVTC239Video2

DEFINE_VARIABLE //For IP Communications and LifeSize
VTC_Volume
LifeSize_MUTE
isonline
DEFINE_VARIABLE //panel device channels


devchan QuickDialPresetNumbers [] = {
	{vdvTP_Quick_dial_SETPreset,11},
	{vdvTP_Quick_dial_SETPreset,12},
	{vdvTP_Quick_dial_SETPreset,13},
	{vdvTP_Quick_dial_SETPreset,14},
	{vdvTP_Quick_dial_SETPreset,15},
	{vdvTP_Quick_dial_SETPreset,16}
}

devchan QuickDialPresetNames [] = {
	{vdvTP_Quick_dial_SETPreset,1},
	{vdvTP_Quick_dial_SETPreset,2},
	{vdvTP_Quick_dial_SETPreset,3},
	{vdvTP_Quick_dial_SETPreset,4},
	{vdvTP_Quick_dial_SETPreset,5},
	{vdvTP_Quick_dial_SETPreset,6}
}

devchan RecordPresetNumber [] = {
	{vdvTP_Record_SETPreset,17},
	{vdvTP_Record_SETPreset,18},
	{vdvTP_Record_SETPreset,19},
	{vdvTP_Record_SETPreset,20}
}

devchan RecordPresetNames [] = {
	{vdvTP_Record_SETPreset,7},
	{vdvTP_Record_SETPreset,8},
	{vdvTP_Record_SETPreset,9},
	{vdvTP_Record_SETPreset,10}
}


//This is the actual buttons being 
devchan MOREnet_Present_Dials [] = {
	{vdvTP_StudentCamera,31},
	{vdvTP_StudentCamera,32},
	{vdvTP_StudentCamera,33},
	{vdvTP_StudentCamera,34},
	{vdvTP_StudentCamera,35},
	{vdvTP_StudentCamera,36}
}

devchan RECORDING_Presets [] ={
	{vdvTP_record_preset,31},
	{vdvTP_record_preset,32},
	{vdvTP_record_preset,33},
	{vdvTP_record_preset,34}
}

devchan LifeSizeRemoteButtons [] =
{
	{vdvTP_RoomSettings,11}, //1
	{vdvTP_RoomSettings,12}, //2
	{vdvTP_RoomSettings,13}, //3
	{vdvTP_RoomSettings,14}, //4
	{vdvTP_RoomSettings,15}, //5
	{vdvTP_RoomSettings,16}, //6
	{vdvTP_RoomSettings,17}, //7
	{vdvTP_RoomSettings,18}, //8
	{vdvTP_RoomSettings,19}, //9
	{vdvTP_RoomSettings,10}, //0
	{vdvTP_RoomSettings,91}, //*
	{vdvTP_RoomSettings,93}, //#
	{vdvTP_RoomSettings,1}, // triangle
	{vdvTP_RoomSettings,2}, //back
	{vdvTP_RoomSettings,21}, //circle
	{vdvTP_RoomSettings,22}, //square
	{vdvTP_RoomSettings,7}, //ok
	{vdvTP_RoomSettings,3}, //arrow up
	{vdvTP_RoomSettings,8}, //arrow down
	{vdvTP_RoomSettings,4}, //arrow left
	{vdvTP_RoomSettings,6}, //arrow right
	{vdvTP_RoomSettings,9}, //home
	{vdvTP_RoomSettings,32}, //near/far
	{vdvTP_RoomSettings,33}, //layout
	{vdvTP_RoomSettings,34}, //input
	{vdvTP_RoomSettings,35} //edit 
}


devchan RecordingNumbers [] =
	{
	{vdvTP_Recording,1}, 
	{vdvTP_Recording,2},
	{vdvTP_Recording,3},
	{vdvTP_Recording,4},
	{vdvTP_Recording,5},
	{vdvTP_Recording,6},
	{vdvTP_Recording,7},
	{vdvTP_Recording,8},
	{vdvTP_Recording,9}
	}

devchan Dialsites []=
{
	{vdvTP_dialing,21}, 
	{vdvTP_dialing,22},
	{vdvTP_dialing,23},
	{vdvTP_dialing,24},
	{vdvTP_dialing,25},
	{vdvTP_dialing,26},
	{vdvTP_dialing,27},
	{vdvTP_dialing,28},
	{vdvTP_dialing,29},
	{vdvTP_dialing,30}

}


devchan MOREnetDialNumbers [] =
	{
	{vdvTP_StudentCamera,1}, 
	{vdvTP_StudentCamera,2},
	{vdvTP_StudentCamera,3},
	{vdvTP_StudentCamera,4},
	{vdvTP_StudentCamera,5},
	{vdvTP_StudentCamera,6},
	{vdvTP_StudentCamera,7},
	{vdvTP_StudentCamera,8},
	{vdvTP_StudentCamera,9}
	}

devchan DialNumbers [] =
	{
	{vdvTP_dialing,1}, 
	{vdvTP_dialing,2},
	{vdvTP_dialing,3},
	{vdvTP_dialing,4},
	{vdvTP_dialing,5},
	{vdvTP_dialing,6},
	{vdvTP_dialing,7},
	{vdvTP_dialing,8},
	{vdvTP_dialing,9}
	}

devchan WeatherSelections [] =
	{
	{vdvTP_WeatherSelect,1}, 
	{vdvTP_WeatherSelect,2},
	{vdvTP_WeatherSelect,3},
	{vdvTP_WeatherSelect,4},
	{vdvTP_WeatherSelect,5},
	{vdvTP_WeatherSelect,7}
	}

devchan DialSetupTextEntry [] =
	{
	{vdvTP_DialSetup,1}, 
	{vdvTP_DialSetup,2},
	{vdvTP_DialSetup,3},
	{vdvTP_DialSetup,4}
}

devchan DialSetupIPEntry [] =
	{
	{vdvTP_DialSetup,11}, 
	{vdvTP_DialSetup,12},
	{vdvTP_DialSetup,13},
	{vdvTP_DialSetup,14}
}

devchan AdvancedSelections [] =
	{
	{vdvTP_AdvancedSelection,1}, 
	{vdvTP_AdvancedSelection,2},
	{vdvTP_AdvancedSelection,3},
	{vdvTP_AdvancedSelection,4},
	{vdvTP_AdvancedSelection,5},
	{vdvTP_AdvancedSelection,6},
	{vdvTP_AdvancedSelection,7}
}

devchan PresentationInputSelections [] =
	{
	{vdvTP_PresentationSelections,1}, 
	{vdvTP_PresentationSelections,2},
	{vdvTP_PresentationSelections,3},
	{vdvTP_PresentationSelections,4},
	{vdvTP_PresentationSelections,5},
	{vdvTP_PresentationSelections,6},
	{vdvTP_PresentationSelections,7},
	{vdvTP_PresentationSelections,8},
	{vdvTP_PresentationSelections,10}
}

devchan VTCInputSelections [] =
	{
	{vdvTP_VTCSelections,1}, 
	{vdvTP_VTCSelections,2},
	{vdvTP_VTCSelections,3},
	{vdvTP_VTCSelections,4},
	{vdvTP_VTCSelections,5},
	{vdvTP_VTCSelections,6},
	{vdvTP_VTCSelections,7},
	{vdvTP_VTCSelections,8},
	{vdvTP_VTCSelections,11}
}

devchan SupportSelections [] =
	{
	{vdvTP_SupportSelection,1}, 
	{vdvTP_SupportSelection,2},
	{vdvTP_SupportSelection,3},
	{vdvTP_SupportSelection,4}
}

devchan FarEndCameraControls [] =
	{
	{vdvTP_RoomSettings,24}, //far up
	{vdvTP_RoomSettings,26}, //far down
	{vdvTP_RoomSettings,23}, //far left
	{vdvTP_RoomSettings,25}, //far right
	{vdvTP_RoomSettings,20}, //far zoom +
	{vdvTP_RoomSettings,9} //far zoom -
}

devchan VTC239VideoSelections [] =
	{
	{vdvTP_VTC239Selections,1}, 
	{vdvTP_VTC239Selections,2}, 
	{vdvTP_VTC239Selections,3}, 
	{vdvTP_VTC239Selections,4}, 
	{vdvTP_VTC239Selections,5}, 
	{vdvTP_VTC239Selections,6}, 
	{vdvTP_VTC239Selections,7}, 
	{vdvTP_VTC239Selections,8},
	{vdvTP_VTC239Selections,11} 
}

devchan VTC239ContentSelections [] =
	{
	{vdvTP_VTC239Selections,12}, 
	{vdvTP_VTC239Selections,13}, 
	{vdvTP_VTC239Selections,14}, 
	{vdvTP_VTC239Selections,15} 
}

(***********************************************************)
(*               LATCHING DEFINITIONS GO BELOW             *)
(***********************************************************)
DEFINE_LATCHING//***DONE FOR LIFESIZE***

(***********************************************************)
(*       MUTUALLY EXCLUSIVE DEFINITIONS GO BELOW           *)
(***********************************************************)
DEFINE_MUTUALLY_EXCLUSIVE//***DONE FOR LIFESIZE***

(***********************************************************)
(*        SUBROUTINE/FUNCTION DEFINITIONS GO BELOW         *)
(***********************************************************)
(* EXAMPLE: DEFINE_FUNCTION <RETURN_TYPE> <NAME> (<PARAMETERS>) *)
(* EXAMPLE: DEFINE_CALL '<NAME>' (<PARAMETERS>) *)


define_function integer addresslength ()	//Find how many entries in addressbook//***DONE FOR LIFESIZE***
{
	local_var iCount
	local_var LastEntry
	for (icount=1; icount<100; icount ++)
		if (length_array (MITESettings[icount].SiteName) =0 )
		{
		LastEntry = icount
		icount = 200
		}
	return lastentry
}

define_call	'populateaddressbook'(integer index)	//
{
	
	local_var integer indexforcalc
	local_var float	iscrollposition
	for (iCountDialing =1; iCountDialing<11 ; iCountDialing++)
	{
	  
		if (length_array(MITESettings[(index+iCountDialing)].SiteName))
		{
		send_command vdvTP_AddressBook, "'TEXT',itoa(iCountDialing),'-Dial: ',MITESettings[(index+iCountDialing)].SiteName"
		}
		else
		{
		send_command vdvTP_AddressBook, "'TEXT',itoa(iCountDialing),'- '"
		}
		iLen = addresslength()
		if (index = 0)
		{
		indexforcalc = 1
		}
		else
		{
		indexforcalc = index
		}
		iscrollposition = ((indexforcalc)/iLen)*100
		send_level vdvTP_AddressBook,1,iscrollposition
		send_level vdvTP_AddressBook,2,iscrollposition
	}
}

define_call'update_preset_fields'
{
     send_command vdvTP_record_preset, "'TEXT31-',Record_Preset_1_name,': ',Record_Preset_1_numb"
     send_command vdvTP_record_preset, "'TEXT32-',Record_Preset_2_name,': ',Record_Preset_2_numb"
     send_command vdvTP_record_preset, "'TEXT33-',Record_Preset_3_name,': ',Record_Preset_3_numb"
     send_command vdvTP_record_preset, "'TEXT34-',Record_Preset_4_name,': ',Record_Preset_4_numb"
     
     send_command vdvTP_StudentCamera, "'TEXT31-',MOREnet_DialPreset_1_name,': ',MOREnet_DialPreset_1_numb"
     send_command vdvTP_StudentCamera, "'TEXT32-',MOREnet_DialPreset_2_name,': ',MOREnet_DialPreset_2_numb"
     send_command vdvTP_StudentCamera, "'TEXT33-',MOREnet_DialPreset_3_name,': ',MOREnet_DialPreset_3_numb"
     send_command vdvTP_StudentCamera, "'TEXT34-',MOREnet_DialPreset_4_name,': ',MOREnet_DialPreset_4_numb"
     send_command vdvTP_StudentCamera, "'TEXT35-',MOREnet_DialPreset_5_name,': ',MOREnet_DialPreset_5_numb"
     send_command vdvTP_StudentCamera, "'TEXT36-',MOREnet_DialPreset_6_name,': ',MOREnet_DialPreset_6_numb"
     
     send_command vdvTP_Record_SETPreset, "'TEXT7-',Record_Preset_1_name"
     send_command vdvTP_Record_SETPreset, "'TEXT8-',Record_Preset_2_name"
     send_command vdvTP_Record_SETPreset, "'TEXT9-',Record_Preset_3_name"
     send_command vdvTP_Record_SETPreset, "'TEXT10-',Record_Preset_4_name"
     
     send_command vdvTP_Record_SETPreset, "'TEXT17-',Record_Preset_1_numb"
     send_command vdvTP_Record_SETPreset, "'TEXT18-',Record_Preset_2_numb"
     send_command vdvTP_Record_SETPreset, "'TEXT19-',Record_Preset_3_numb"
     send_command vdvTP_Record_SETPreset, "'TEXT20-',Record_Preset_4_numb"
     
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT1-',MOREnet_DialPreset_1_name"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT2-',MOREnet_DialPreset_2_name"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT3-',MOREnet_DialPreset_3_name"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT4-',MOREnet_DialPreset_4_name"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT5-',MOREnet_DialPreset_5_name"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT6-',MOREnet_DialPreset_6_name"
     
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT11-',MOREnet_DialPreset_1_numb"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT12-',MOREnet_DialPreset_2_numb"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT13-',MOREnet_DialPreset_3_numb"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT14-',MOREnet_DialPreset_4_numb"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT15-',MOREnet_DialPreset_5_numb"
     send_command vdvTP_Quick_dial_SETPreset, "'TEXT16-',MOREnet_DialPreset_6_numb"
    
}


define_call 'end_video_mute'
{
if (LifeSize_VIDEO_MUTE=1)
{
//we are leaving video mute for some reason. 
//first unmute the audio
 SEND_STRING dv_Lifesize,"'set audio mute off',13,10" //toggle mute
    LifeSize_VIDEO_MUTE=0
    //put the instructor camera back
    wait 10{
	SEND_STRING dv_Lifesize,"'set camera position -N 3 -P 7',13,10" //instructor
    }
    wait 20{
	//back to student input
	SEND_STRING dv_Lifesize,"'set video primary-input hd0',13,10" //student
	trackVTCInputSelecitons = 2
	CurrentVTC239Video = 2
	TRACK_SOURCE = CAMERA_STUDENT_INPUT 
    }
    //send the student camera 
    // SEND_STRING dv_Lifesize,"'set camera position -N 1 -p 0 -t -3 -z 0',13,10"
    }
}


define_call'turnondisplays_presentation'
{
    //turn on
    SEND_STRING vdvFrontLCD,"'ka 0 1',13"
    SEND_STRING vdvRearLCD,"'ka 0 1',13"
    SEND_STRING vdvVGAMON,"'ka 0 1',13"
    ON [vdvIO,4] //AMP Power
    //set the input
    wait 15
    {
	SEND_STRING vdvFrontLCD,"'xb 0 90',13" 
	SEND_STRING vdvRearLCD,"'xb 0 90',13" 
	SEND_STRING vdvVGAMON,"'xb 0 90',13" //91 should be the second input//changed to first
    }

    wait 80 //reduce volume
	{
	SEND_STRING vdvFrontLCD,"'ke 0 00',13"
        SEND_STRING vdvRearLCD,"'ke 0 00',13"
	SEND_STRING vdvVGAMON,"'ke 0 00',13"
	}
}
define_call'turnondisplays'//***DONE FOR LIFESIZE***
{
    //turn on
    SEND_STRING vdvFrontLCD,"'ka 0 1',13"
    SEND_STRING vdvRearLCD,"'ka 0 1',13"
    SEND_STRING vdvRearPreviewLCD,"'ka 0 1',13"
    SEND_STRING vdvVGAMON,"'ka 0 1',13"
    ON [vdvIO,4] //AMP Power
    //set the input
    wait 15
    {
	SEND_STRING vdvFrontLCD,"'xb 0 90',13" //note the last number indicates the input
	SEND_STRING vdvRearLCD,"'xb 0 90',13" //note the last number indicates the input
	SEND_STRING vdvRearPreviewLCD,"'xb 90 1',13"
	SEND_STRING vdvVGAMON,"'xb 0 91',13" //91 should be the second input
    }
       wait 80 //reduce volume
	{
	SEND_STRING vdvFrontLCD,"'ke 0 00',13"
        SEND_STRING vdvRearLCD,"'ke 0 00',13"
	SEND_STRING vdvVGAMON,"'ke 0 00',13"
	}
}

define_call'turnoffdisplays'//***DONE FOR LIFESIZE***
{
    SEND_STRING vdvFrontLCD,"'ka 0 0',13"
    SEND_STRING vdvRearLCD,"'ka 0 0',13"
    SEND_STRING vdvRearPreviewLCD,"'ka 0 0',13"
    SEND_STRING vdvVGAMON,"'ka 0 0',13"
    OFF [vdvIO,1]//AMP Power
   
    wait 60
    {
    SEND_STRING vdvFrontLCD,"'ka 0 0',13"
    SEND_STRING vdvRearLCD,"'ka 0 0',13"
    SEND_STRING vdvRearPreviewLCD,"'ka 0 0',13"
    SEND_STRING vdvVGAMON,"'ka 0 0',13"
    }
}


define_call'shutdownpro'
{
    SEND_STRING dv_Lifesize,"'control sleep',13,10"//need to sleep the LIfeSize
    call'turnoffdisplays'
    curentMode = 5
    SEND_COMMAND basePanel,"'@PPX'" //clear all popups
    SEND_COMMAND basePanel,"'PAGE-[Mode Select]Mode 6'" //return to starting page
    SEND_COMMAND basePanel,"'SLEEP'" 	//sleep the panel
    cancel_wait 'turnoff'
    cancel_wait 'turnoffpart2'
    cancel_wait 'beeps1'
    cancel_wait 'beeps2'
    cancel_wait 'beeps3'
    cancel_wait 'beeps4'
    cancel_wait 'beeps5'
    cancel_wait 'beeps6'
    OFF [vdvIO,4]
}

define_call'beeps' //***DONE FOR LIFESIZE***
{
		send_command basePanel, "'ADBEEP'"
		wait 5 send_command basePanel, "'ADBEEP'"
		wait 10 send_command basePanel, "'ADBEEP'"
		wait 15 send_command basePanel, "'ADBEEP'"
}

define_call'AutoMaticTurnOff' //***DONE FOR LIFESIZE***
{
	cancel_wait 'turnoff'
	cancel_wait 'turnoffpart2'
	cancel_wait 'beeps1'
	cancel_wait 'beeps2'
	cancel_wait 'beeps3'
	cancel_wait 'beeps4'
	cancel_wait 'beeps5'
	cancel_wait 'beeps6'
	wait 108000 'turnoff'
		{
		SEND_COMMAND basePanel,"'WAKE'" 	//Wake the panel
		send_command basePanel, "'@PPN-ConfirmShutdown'"
		call'beeps'
		
		wait 50 'beeps1'
		   {
		   call'beeps'
		   
		   }
		wait 100 'beeps2'
		   {
		   call'beeps'
		   }
		wait 150 'beeps3'
		   {
		   call'beeps'
		   }
		
		wait 1750 'beeps4'
		   {
		   call'beeps'
		   SEND_COMMAND basePanel,"'WAKE'"
		   }
		wait 17100 'beeps5'
		   {
		   call'beeps'
		   }
		wait 17150 'beeps6'
		   {
		   call'beeps'
		   }
		   
		wait 1800 'turnoffpart2' //1800 is normal
			{
			call'shutdownpro'
			}
		}
}


define_call'configureDevices'//***DONE FOR LIFESIZE***
{
//rs232 devices
SEND_COMMAND dvnVGAMON, 'SET BAUD 9600, N, 8, 1, 485 DISABLE'
SEND_COMMAND dvnVGAMON, 'HSOFF'
SEND_COMMAND dvnVGAMON, 'XOFF'

SEND_COMMAND dvnFrontLCD, 'SET BAUD 9600, N, 8, 1, 485 DISABLE'
SEND_COMMAND dvnFrontLCD, 'HSOFF'
SEND_COMMAND dvnFrontLCD, 'XOFF'

SEND_COMMAND dvnRearLCD, 'SET BAUD 9600, N, 8, 1, 485 DISABLE'
SEND_COMMAND dvnRearLCD, 'HSOFF'
SEND_COMMAND dvnRearLCD, 'XOFF'

SEND_COMMAND dvnRearPreviewLCD, 'SET BAUD 9600, N, 8, 1, 485 DISABLE'
SEND_COMMAND dvnRearPreviewLCD, 'HSOFF'
SEND_COMMAND dvnRearPreviewLCD, 'XOFF'


}
define_call'setdevices'//***DONE FOR LIFESIZE***
{

if (MITESettings[SettingIndex].Cluster =1 ) //north 
    {	
    //all on NI 3100
    dvnRearPreviewLCD	= 5001:1:0
    dvnVGAMON		= 5001:2:0
    dvnFrontLCD		= 5001:3:0
    dvnRearLCD		= 5001:4:0
    dvnrelay		= 5001:8:0
    dvnIO		= 5001:17:0
    }
    
if (MITESettings[SettingIndex].Cluster =2) //central 
{
    //on AXCENT 3
    dvnRearPreviewLCD	= 2:1:0
    dvnVGAMON		= 3:1:0
    dvnFrontLCD		= 4:1:0
    dvnRearLCD		= 5:1:0
    dvnrelay		= 8:1:0
    //on NI700
    dvnIO		= 5001:4:0
    }


if (MITESettings[SettingIndex].Cluster =3) //south 
{
    //on AXCENT 3
    dvnRearPreviewLCD	= 2:1:0
    dvnVGAMON		= 3:1:0
    dvnFrontLCD		= 4:1:0
    dvnRearLCD		= 5:1:0
    dvnrelay		= 8:1:0
    //on NI700
    dvnIO		= 5001:4:0
    }

COMBINE_DEVICES (vdvVGAMON,dvnVGAMON)
COMBINE_DEVICES (vdvFrontLCD,dvnFrontLCD)
COMBINE_DEVICES (vdvRearLCD,dvnRearLCD)
COMBINE_DEVICES (vdvRearPreviewLCD,dvnRearPreviewLCD)

COMBINE_DEVICES (vdvrelay,dvnrelay)
COMBINE_DEVICES (vdvIO,dvnIO)

call'configureDevices'
}


(*vga monitor subroutines*)

define_call'Instr_Mon_Power_On'
{
    SEND_STRING vdvRearLCD,"'ka 0 1',13"
}

DEFINE_CALL'Instr_Mon_Power_Off'
{
    SEND_STRING vdvRearLCD,"'ka 0 0',13"
}

define_call'Instr_Mon_input_HDMI1'
{
    SEND_STRING vdvRearLCD,"'xb 0 90',13"
}

DEFINE_CALL'Instr_Mon_input_HDMI2'
{
    SEND_STRING vdvRearLCD,"'xb 0 91',13"
}

define_call'Student_Mon_Power_On'
{
    SEND_STRING vdvFrontLCD,"'ka 0 1',13"
}

DEFINE_CALL'Student_Mon_Power_Off'
{
    SEND_STRING vdvFrontLCD,"'ka 0 0',13"
}

define_call'Student_Mon_input_HDMI1'
{
    SEND_STRING vdvFrontLCD,"'xb 0 90',13"
}

DEFINE_CALL'Student_Mon_input_HDMI2'
{
    SEND_STRING vdvFrontLCD,"'xb 0 91',13"
}

define_call'PreviewLCD_Mon_Power_On'
{
    SEND_STRING vdvRearPreviewLCD,"'ka 0 1',13"
}

DEFINE_CALL'PreviewLCD_Mon_Power_Off'
{
    SEND_STRING vdvRearPreviewLCD,"'ka 0 0',13"
}

define_call'PreviewLCD_Mon_input_HDMI1'
{
    SEND_STRING vdvRearPreviewLCD,"'xb 0 90',13"
}

DEFINE_CALL'PreviewLCD_Mon_input_HDMI2'
{
    SEND_STRING vdvRearPreviewLCD,"'xb 0 91',13"
}

define_call'Graphics_Mon_Power_On'
{
    SEND_STRING vdvVGAMON,"'ka 0 1',13"
}

DEFINE_CALL'Graphics_Mon_Power_Off'
{
    SEND_STRING vdvVGAMON,"'ka 0 0',13"
}

define_call'Graphics_Mon_input_HDMI1'
{
    SEND_STRING vdvVGAMON,"'xb 0 90',13"
}

DEFINE_CALL'Graphics_Mon_input_HDMI2'
{
    SEND_STRING vdvVGAMON,"'xb 0 91',13"
}
DEFINE_CALL'initlifesize'
{
    SEND_STRING dv_Lifesize,"'control wakeup',13,10"//need to wake the LIfeSize
    VTC_Volume =40
    SEND_STRING dv_Lifesize,"'set volume speaker ',itoa(VTC_Volume),13,10" //set  volumne to a "normal" level
    SEND_STRING dv_Lifesize,"'set audio mute off',13,10"	
    SEND_LEVEL vdvTP_Volume ,1,(VTC_Volume)
    SEND_STRING dv_Lifesize,"'set video pip-window off',13,10" 
    // SEND_STRING dv_Lifesize,"'set video digital-zoom-enable on',13,10"
    //this doesn't work for the zoon since we are not using the firewire cable. 
    DialVTC = 0
    RecordVTC = 0
    DialVTCdirect = 0
    DialVTCman = 0    
    
}

define_call'No_content'
{
    SEND_STRING dv_Lifesize,"'set video pip-window off',13,10" 
    CALL'Graphics_Mon_input_HDMI2'
    VC_ON =0
}

define_call'We_Are_Receiving_content'
{
    SEND_STRING dv_Lifesize,"'set video pip-window off',13,10" 
    CALL'Graphics_Mon_input_HDMI1'
    VC_ON =0
    
}

DEFINE_CALL'We_Are_Sending_content'
{
    SEND_STRING dv_Lifesize,"'set video pip-window on',13,10" 
    SEND_STRING vdvVGAMON,"'xb 0 90',13"
    VC_ON =1
}

DEFINE_CALL'VGA_Switch_Doc' //***DONE FOR LIFESIZE***
{
    off [vdvrelay,1]
    off [vdvrelay,2]
    on [vdvrelay,3]
}

DEFINE_CALL'VGA_Switch_PC' //***DONE FOR LIFESIZE***
{
    off [vdvrelay,2]
    off [vdvrelay,3]
    on [vdvrelay,1]
}

DEFINE_CALL'VGA_Switch_Laptop' //***DONE FOR LIFESIZE***
{
    off [vdvrelay,1]
    off [vdvrelay,3]
    on [vdvrelay,2]
}


define_call'find_Index'
{
    local_var iCount
    for (icount=1; icount<30; icount ++)
		if (MyIPAddress = MITESettings[icount].SiteIPAddress )
		{
		SettingIndex = icount
		}
}

define_call'turnoff_dialpages'
{
//This code needs to be used to kill the buttons and pop-up iondicators when a 
//content selection is made 
SEND_COMMAND basePanel,"'@PPF-Dial'"//turn off the popup
DialVTC =0
SEND_COMMAND basePanel,"'@PPF-Directdial'"//turn off the popup
DialVTCdirect = 0
SEND_COMMAND basePanel,"'@PPF-Mandial'"//turn off the popup
DialVTCman = 0
//*****************************************************
}


(***********************************************************)
(*                STARTUP CODE GOES BELOW                  *)
(***********************************************************)


(***********************************************************)
(*            THE MODULE CODE GOES BELOW                   *)
(***********************************************************)
DEFINE_START//load the settings file. 
MITESettings[1].SiteIPAddress= '204.185.34.111'
MITESettings[1].SiteIndex= 1
MITESettings[1].SiteName= 'Blair Oaks Room 1'
MITESettings[1].KnoxRouterType=1
MITESettings[1].Cluster=3
MITESettings[1].DefaultSpeed='768'
MITESettings[1].CODEC_IP='204.185.34.110'

MITESettings[2].SiteIPAddress= '216.74.212.199'
MITESettings[2].SiteIndex= 2
MITESettings[2].SiteName= 'Bunceton Room 1'
MITESettings[2].KnoxRouterType=2
MITESettings[2].Cluster=1
MITESettings[2].DefaultSpeed='768'
MITESettings[2].CODEC_IP='216.74.212.197'

MITESettings[3].SiteIPAddress= '14.14.14.14'
MITESettings[3].SiteIndex= 3 
MITESettings[3].SiteName= 'CMU Columbia Rm D'
MITESettings[3].KnoxRouterType=2
MITESettings[3].Cluster=1
MITESettings[3].DefaultSpeed='768'
MITESettings[3].CODEC_IP='216.106.32.18'

MITESettings[4].SiteIPAddress= '14.14.14.14'
MITESettings[4].SiteIndex= 4
MITESettings[4].SiteName= 'CMU Columbia Rm E'
MITESettings[4].KnoxRouterType=2
MITESettings[4].Cluster=1
MITESettings[4].DefaultSpeed='768'
MITESettings[4].CODEC_IP='216.106.32.20'

MITESettings[5].SiteIPAddress= '14.14.14.14'
MITESettings[5].SiteIndex= 5
MITESettings[5].SiteName= 'CMU Columbia Rm F'
MITESettings[5].KnoxRouterType=2
MITESettings[5].Cluster=1
MITESettings[5].DefaultSpeed='768'
MITESettings[5].CODEC_IP='216.106.32.19'

MITESettings[6].SiteIPAddress= '14.14.14.14'
MITESettings[6].SiteIndex= 6
MITESettings[6].SiteName= 'CMU Cupples A'
MITESettings[6].KnoxRouterType=2
MITESettings[6].Cluster=1
MITESettings[6].DefaultSpeed='768'
MITESettings[6].CODEC_IP='192.245.42.121'

MITESettings[7].SiteIPAddress= '14.14.14.14'
MITESettings[7].SiteIndex= 7
MITESettings[7].SiteName= 'CMU Cupples B'
MITESettings[7].KnoxRouterType=2
MITESettings[7].Cluster=1
MITESettings[7].DefaultSpeed='768'
MITESettings[7].CODEC_IP='192.245.42.122'

MITESettings[8].SiteIPAddress= '14.14.14.14'
MITESettings[8].SiteIndex= 8
MITESettings[8].SiteName= 'CMU Cupples C'
MITESettings[8].KnoxRouterType=2
MITESettings[8].Cluster=1
MITESettings[8].DefaultSpeed='768'
MITESettings[8].CODEC_IP='192.245.42.123'

MITESettings[9].SiteIPAddress= '14.14.14.14'
MITESettings[9].SiteIndex= 9
MITESettings[9].SiteName= 'CMU Cupples D'
MITESettings[9].KnoxRouterType=2
MITESettings[9].Cluster=1
MITESettings[9].DefaultSpeed='768'
MITESettings[9].CODEC_IP='192.245.42.124'
 
MITESettings[10].SiteIPAddress= '14.14.14.14'
MITESettings[10].SiteIndex= 10
MITESettings[10].SiteName= 'CMU Cupples F'
MITESettings[10].KnoxRouterType=2
MITESettings[10].Cluster=1
MITESettings[10].DefaultSpeed='768'
MITESettings[10].CODEC_IP='192.245.42.126'

MITESettings[11].SiteIPAddress= '14.14.14.14'
MITESettings[11].SiteIndex= 11
MITESettings[11].SiteName= 'CMU Cupples 325'
MITESettings[11].KnoxRouterType=2
MITESettings[11].Cluster=1
MITESettings[11].DefaultSpeed='768'
MITESettings[11].CODEC_IP='192.245.42.127'

MITESettings[12].SiteIPAddress= '40.138.73.187'
MITESettings[12].SiteIndex= 12
MITESettings[12].SiteName= 'Crocker Room 1'
MITESettings[12].KnoxRouterType=2
MITESettings[12].Cluster=2
MITESettings[12].DefaultSpeed='768'
MITESettings[12].CODEC_IP='40.138.73.186'

MITESettings[13].SiteIPAddress= '150.199.24.11'
MITESettings[13].SiteIndex= 13
MITESettings[13].SiteName= 'Eugene Room 1'
MITESettings[13].KnoxRouterType=1
MITESettings[13].Cluster=3
MITESettings[13].DefaultSpeed='768'
MITESettings[13].CODEC_IP='150.199.24.12'

MITESettings[14].SiteIPAddress= '209.131.233.43'
MITESettings[14].SiteIndex= 14
MITESettings[14].SiteName= 'Glasgow Room 1'
MITESettings[14].KnoxRouterType=2
MITESettings[14].Cluster=1
MITESettings[14].DefaultSpeed='768'
MITESettings[14].CODEC_IP='209.131.233.8'

MITESettings[15].SiteIPAddress= '14.14.14.14'
MITESettings[15].SiteIndex= 15
MITESettings[15].SiteName= 'Glasgow Room 2'
MITESettings[15].KnoxRouterType=2
MITESettings[15].Cluster=1
MITESettings[15].DefaultSpeed='768'
MITESettings[15].CODEC_IP='150.199.99.217'

MITESettings[16].SiteIPAddress= '198.209.2.21'
MITESettings[16].SiteIndex= 16
MITESettings[16].SiteName= 'New Bloom. Room 1'
MITESettings[16].KnoxRouterType=1
MITESettings[16].Cluster=3
MITESettings[16].DefaultSpeed='768'
MITESettings[16].CODEC_IP='198.209.2.20'

MITESettings[17].SiteIPAddress= '207.160.218.239'
MITESettings[17].SiteIndex= 17
MITESettings[17].SiteName= 'New Franklin Room 1'
MITESettings[17].KnoxRouterType=2
MITESettings[17].Cluster=1
MITESettings[17].DefaultSpeed='768'
MITESettings[17].CODEC_IP='207.160.218.241'

MITESettings[18].SiteIPAddress= '216.74.212.27'
MITESettings[18].SiteIndex= 18
MITESettings[18].SiteName= 'Pilot Grove Room 1'
MITESettings[18].KnoxRouterType=2
MITESettings[18].Cluster=1
MITESettings[18].DefaultSpeed='768'
MITESettings[18].CODEC_IP='216.74.212.26'

MITESettings[19].SiteIPAddress= '14.14.14.14'
MITESettings[19].SiteIndex= 19
MITESettings[19].SiteName= 'Pilot Grove Room 2'
MITESettings[19].KnoxRouterType=2
MITESettings[19].Cluster=1
MITESettings[19].DefaultSpeed='768'
MITESettings[19].CODEC_IP='216.74.212.29'

MITESettings[20].SiteIPAddress= '192.168.202.16'
MITESettings[20].SiteIndex= 20
MITESettings[20].SiteName= 'Prairie Home Room 1'
MITESettings[20].KnoxRouterType=1
MITESettings[20].Cluster=2
MITESettings[20].DefaultSpeed='768'
MITESettings[20].CODEC_IP='192.168.202.69'

MITESettings[21].SiteIPAddress= '114.14.14.14'
MITESettings[21].SiteIndex= 21
MITESettings[21].SiteName= 'Prairie Home Room 2'
MITESettings[21].KnoxRouterType=1
MITESettings[21].Cluster=2
MITESettings[21].DefaultSpeed='768'
MITESettings[21].CODEC_IP='192.168.202.136'

MITESettings[22].SiteIPAddress= '204.185.53.12'
MITESettings[22].SiteIndex= 22
MITESettings[22].SiteName= 'Russellville'
MITESettings[22].KnoxRouterType=1
MITESettings[22].Cluster=3
MITESettings[22].DefaultSpeed='768'
MITESettings[22].CODEC_IP='204.185.53.10'

MITESettings[23].SiteIPAddress= '68.188.37.85'
MITESettings[23].SiteIndex= 23
MITESettings[23].SiteName= 'Sacred Heart'
MITESettings[23].KnoxRouterType=1
MITESettings[23].Cluster=2
MITESettings[23].DefaultSpeed='768'
MITESettings[23].CODEC_IP='68.188.37.84'

MITESettings[24].SiteIPAddress= '14.14.14.14'
MITESettings[24].SiteIndex= 24
MITESettings[24].SiteName= 'Sacred Heart Cart'
MITESettings[24].KnoxRouterType=2
MITESettings[24].Cluster=1
MITESettings[24].DefaultSpeed='768'
MITESettings[24].CODEC_IP='68.188.37.83'

MITESettings[25].SiteIPAddress= '204.185.234.3'
MITESettings[25].SiteIndex= 25
MITESettings[25].SiteName= 'Slater Room 1'
MITESettings[25].KnoxRouterType=2
MITESettings[25].Cluster=1
MITESettings[25].DefaultSpeed='768'
MITESettings[25].CODEC_IP='204.185.234.10'

MITESettings[26].SiteIPAddress= '14.14.14.14'
MITESettings[26].SiteIndex= 26
MITESettings[26].SiteName= 'Slater Room 2'
MITESettings[26].KnoxRouterType=2
MITESettings[26].Cluster=1
MITESettings[26].DefaultSpeed='768'
MITESettings[26].CODEC_IP='204.185.234.9'

MITESettings[27].SiteIPAddress= '184.81.47.221'
MITESettings[27].SiteIndex= 27
MITESettings[27].SiteName= 'St. Elizabeth'
MITESettings[27].KnoxRouterType=1
MITESettings[27].Cluster=3
MITESettings[27].DefaultSpeed='768'
MITESettings[27].CODEC_IP='184.81.47.218'

MITESettings[28].SiteIPAddress= '209.106.55.203'
MITESettings[28].SiteIndex= 28
MITESettings[28].SiteName= 'Tuscumbia Room 1'
MITESettings[28].KnoxRouterType=2
MITESettings[28].Cluster=3
MITESettings[28].DefaultSpeed='768'
MITESettings[28].CODEC_IP='209.106.55.202'

DEFINE_START

GET_IP_ADDRESS(0:1:0,MyIPAddressInformation) //15 char aaa.bbb.ccc.ddd
MyIPAddress = MyIPAddressInformation.IPADDRESS
//look up settings in a table and get for this system

call'find_Index'
call'setdevices'
ON [vdvIO,4]


DEFINE_START //open connections to lifesize
IP_CLIENT_OPEN (dv_Lifesize.PORT,MITESettings[SettingIndex].CODEC_IP,TELNET,TCP_IP)

DEFINE_START //MITE Addressbook 

CurrentPhoneIndex = 1
MITEPHONEBOOK[1].Name = "'Sally Hackman'"
MITEPHONEBOOK[1].Number ="'(660) 248-6340'"

MITEPHONEBOOK[2].Name = "'Scott Kasmann Cell'"
MITEPHONEBOOK[2].Number ="'(660) 621-1133'"

MITEPHONEBOOK[3].Name = "'Sheri Eaton Phone'"
MITEPHONEBOOK[3].Number ="'(660) 248-1148'"

MITEPHONEBOOK[4].Name = "'Sheri Eaton Fax'"
MITEPHONEBOOK[4].Number ="'(660) 248-2268'"

MITEPHONEBOOK[5].Name = "'Blair Oaks I-TV FAX'"
MITEPHONEBOOK[5].Number ="'(573) 635-2207'"

MITEPHONEBOOK[6].Name = "'Blair Oaks Secure FAX'"
MITEPHONEBOOK[6].Number ="'(573) 635-6327'"

MITEPHONEBOOK[7].Name = "'Bunceton I-TV FAX '"
MITEPHONEBOOK[7].Number ="'(660) 427-5711'"

MITEPHONEBOOK[8].Name = "'Bunceton Secure FAX'"
MITEPHONEBOOK[8].Number ="'(660) 427-5348'"

MITEPHONEBOOK[9].Name = "'Central Methodist I-TV FAX'"
MITEPHONEBOOK[9].Number ="'(660) 248-6226'"

MITEPHONEBOOK[10].Name = "'Eugene School I-TV FAX'"
MITEPHONEBOOK[10].Number ="'(573) 498-4092'"

MITEPHONEBOOK[11].Name = "'Eugene School Secure FAX'"
MITEPHONEBOOK[11].Number ="'(573) 498-4090'"

MITEPHONEBOOK[12].Name = "'Glasgow School I-TV FAX'"
MITEPHONEBOOK[12].Number ="'(660) 338-2498'"

MITEPHONEBOOK[13].Name = "'Glasgow School Secure FAX'"
MITEPHONEBOOK[13].Number ="'(660) 338-2610'"

MITEPHONEBOOK[14].Name = "'Jamestown School I-TV FAX '"
MITEPHONEBOOK[14].Number ="'(660) 849-2429'"

MITEPHONEBOOK[15].Name = "'Jamestown School Secure FAX'"
MITEPHONEBOOK[15].Number ="'(660) 849-2600'"

MITEPHONEBOOK[16].Name = "'New Bloomfield I-TV FAX'"
MITEPHONEBOOK[16].Number ="'(573) 491-0121'"

MITEPHONEBOOK[17].Name = "'New Bloomfield Secure FAX'"
MITEPHONEBOOK[17].Number ="'(573) 491-3915'"

MITEPHONEBOOK[18].Name = "'New Franklin I-TV FAX '"
MITEPHONEBOOK[18].Number ="'(660) 848-3096'"

MITEPHONEBOOK[19].Name = "'New Franklin Secure FAX '"
MITEPHONEBOOK[19].Number ="'(660) 848-2226'"

MITEPHONEBOOK[20].Name = "'Otterville I-TV Fax'"
MITEPHONEBOOK[20].Number ="'(660) 366-4218'"

MITEPHONEBOOK[21].Name = "'Otterville Secure FAX '"
MITEPHONEBOOK[21].Number ="'(660) 366-4293'"

MITEPHONEBOOK[22].Name = "'Pilot Grove I-TV FAX '"
MITEPHONEBOOK[22].Number ="'(660) 834-4400 '"

MITEPHONEBOOK[23].Name = "'Pilot Grove Secure FAX '"
MITEPHONEBOOK[23].Number ="'(660) 834-4401'"

MITEPHONEBOOK[24].Name = "'Prairie Home I-TV FAX'"
MITEPHONEBOOK[24].Number ="'(660) 841-5566 '"

MITEPHONEBOOK[25].Name = "'Prairie Home Secure FAX '"
MITEPHONEBOOK[25].Number ="'(660) 841-5513'"

MITEPHONEBOOK[26].Name = "'Russellville I-TV FAX '"
MITEPHONEBOOK[26].Number ="'(573) 782-3957'"

MITEPHONEBOOK[27].Name = "'Russellville Secure FAX '"
MITEPHONEBOOK[27].Number ="'(573) 782-3262'"

MITEPHONEBOOK[28].Name = "'Sacred Heart I-TV FAX '"
MITEPHONEBOOK[28].Number ="'(660) 829-3867'"

MITEPHONEBOOK[29].Name = "'Sacred Heart Secure FAX'"
MITEPHONEBOOK[29].Number ="'(660) 827-3806'"

MITEPHONEBOOK[30].Name = "'St. Elizabeth I-TV FAX '"
MITEPHONEBOOK[30].Number ="'(573) 493-2129'"

MITEPHONEBOOK[31].Name = "'St. Elizabeth Secure FAX '"
MITEPHONEBOOK[31].Number ="'(573) 493-2380'"

MITEPHONEBOOK[32].Name = "'Slater I-TV FAX '"
MITEPHONEBOOK[32].Number ="'(660) 529-2508'"

MITEPHONEBOOK[33].Name = "'Slater Secure FAX '"
MITEPHONEBOOK[33].Number ="'(660) 529-2508'"

MITEPHONEBOOK[34].Name = "'Slater I-TV Phone'"
MITEPHONEBOOK[34].Number ="'(660) 529-9980'"

MITEPHONEBOOK[35].Name = "'Tuscumbia I-TV FAX'"
MITEPHONEBOOK[35].Number ="'(573) 369-0069'"

MITEPHONEBOOK[36].Name = "'Tuscumbia Secure FAX'"
MITEPHONEBOOK[36].Number ="'(573) 369-2833'"


DEFINE_COMBINE (vdvTP_AMX_Setup, CV10dvTP_AMX_Setup )
DEFINE_COMBINE (vdvTP_Recording, CV10dvTP_Recording )
DEFINE_COMBINE (vdvTP_WeatherSelect, CV10dvTP_WeatherSelect )
DEFINE_COMBINE (vdvTP_modeSelect, CV10dvTP_modeSelect )
DEFINE_COMBINE (vdvTP_RoomSettings, CV10dvTP_RoomSettings )
DEFINE_COMBINE (vdvTP_VideoSwitch, CV10dvTP_VideoSwitch )
DEFINE_COMBINE (vdvTP_InstrCamControl, CV10dvTP_InstrCamControl )
DEFINE_COMBINE (vdvTP_DialSetup, CV10dvTP_DialSetup )
DEFINE_COMBINE (vdvTP_Dial, CV10dvTP_Dial )
DEFINE_COMBINE (vdvTP_Alerts, CV10dvTP_Alerts )
DEFINE_COMBINE (vdvTP_AdvancedSelection, CV10dvTP_AdvancedSelection )
DEFINE_COMBINE (vdvTP_StudentCamera, CV10dvTP_StudentCamera )
DEFINE_COMBINE (vdvTP_VTCSelections, CV10dvTP_VTCSelections )
DEFINE_COMBINE (vdvTP_AddressBook, CV10dvTP_AddressBook )
DEFINE_COMBINE (vdvTP_SupportSelection, CV10dvTP_SupportSelection )
DEFINE_COMBINE (vdvTP_VTC239Selections, CV10dvTP_VTC239Selections )
DEFINE_COMBINE (vdvTP_Volume, CV10dvTP_VVolume )
DEFINE_COMBINE (vdvTP_PresentationSelections, CV10dvTP_PresentationSelections )
DEFINE_COMBINE (vdvTP_dialing, CV10dvTP_dialing )
DEFINE_COMBINE (vdvTP_record_preset, CV10dvTP_record_preset)

DEFINE_COMBINE (vdvTP_Quick_dial_SETPreset, CV10dvTP_Quick_dial_SETPreset)
DEFINE_COMBINE (vdvTP_Record_SETPreset, CV10dvTP_Record_SETPreset)


(***********************************************************)
(*                THE EVENTS GO BELOW                      *)
(***********************************************************)
DEFINE_EVENT //turn telepresence and H.239 on and off
button_event [vdvTP_RoomSettings,36]//Telepresent off
{
	push:
	{
	SEND_STRING dv_Lifesize,"'set system telepresence off',13,10" 
	Telepresence_ON = 0
	}
}

button_event [vdvTP_RoomSettings,37]//Telepresent on
{
	push:
	{
	SEND_STRING dv_Lifesize,"'set system telepresence on',13,10" 
	Telepresence_ON = 1
	}
}

button_event [vdvTP_RoomSettings,38]//H239 off
{
	push:
	{
	SEND_STRING dv_Lifesize,"'set system presentation off',13,10" 
	H239STATUS = 0
	}
}

button_event [vdvTP_RoomSettings,39]//H239 on
{
	push:
	{
	SEND_STRING dv_Lifesize,"'set system presentation on',13,10" 
	H239STATUS = 1
	}
}


DEFINE_EVENT //volume controls/***DONE FOR LIFESIZE***	and video mute
button_event [vdvTP_RoomSettings,27] //Volume +
button_event [vdvTP_Volume,1]//Codecvolume up
{
	push: 
	{
	ON [vdvIO,4]
	if (VTC_Volume < 97)
		{VTC_Volume =VTC_Volume +2
		}
	SEND_STRING dv_Lifesize,"'set volume speaker ',itoa(VTC_Volume),13,10" 
	SEND_LEVEL vdvTP_Volume ,1,(VTC_Volume)
	}
	hold[3,repeat]:
	{
	if (VTC_Volume < 98)
		{VTC_Volume =VTC_Volume +2
		}
	SEND_STRING dv_Lifesize,"'set volume speaker ',itoa(VTC_Volume),13,10" 
	SEND_LEVEL vdvTP_Volume ,1,(VTC_Volume)
	}
}
button_event [vdvTP_RoomSettings,28] //Zoom -
button_event [vdvTP_Volume,3]//volume dowbn
{
	push:
	{
	ON [vdvIO,4]
	if (VTC_Volume > 3)
		{VTC_Volume =VTC_Volume - 2
		}
	SEND_STRING dv_Lifesize,"'set volume speaker ',itoa(VTC_Volume),13,10" 
	SEND_LEVEL vdvTP_Volume ,1,(VTC_Volume)
	}
	hold[3,repeat]:
	{
	if (VTC_Volume > 3)
		{VTC_Volume =VTC_Volume - 2
		}
	SEND_STRING dv_Lifesize,"'set volume speaker ',itoa(VTC_Volume),13,10" 
	SEND_LEVEL vdvTP_Volume ,1,(VTC_Volume)
	}
}

button_event[vdvTP_RoomSettings,31]
button_event[vdvTP_Volume,2] //MUTE
{
	push:
	{
	if (LifeSize_MUTE=0)
	    {
	    SEND_STRING dv_Lifesize,"'set audio mute on',13,10" //toggle mute
	    }
	else
	    {
	    SEND_STRING dv_Lifesize,"'set audio mute off',13,10" //toggle mute
	    }
	}
}


Button_event[vdvTP_VTCSelections,40]
button_event[vdvTP_VTC239Selections,40]//video mute
{
	push:
	{
	if (LifeSize_VIDEO_MUTE=0)
	    {
	    LifeSize_VIDEO_MUTE=1
	    trackVTCInputSelecitons = 1
	    CurrentVTC239Video = 1
	     //Change to Instructor Camera 
	    TRACK_SOURCE = CAMERA_INSTR_INPUT  
	    SEND_STRING dv_Lifesize,"'set video primary-input hdmi0',13,10" //instructor
	    wait 10 {
		SEND_STRING dv_Lifesize,"'set audio mute on',13,10" //toggle mute
		}
	    wait 10{
		//set preset 7 to the current position
		SEND_STRING dv_Lifesize,"'set camera preset -P 7',13,10" //instructor
		}
	    wait 10{
		//send this camera to the center of pan, and the max up on tilt.
		SEND_STRING dv_Lifesize,"'set camera position -p 0 -t 90',13,10"
		}
	    }
	else
	    {
	    call'end_video_mute'
	    }
	}
}

DEFINE_EVENT //MITE phone directory/***DONE FOR LIFESIZE***
button_event[vdvTP_AddressBook,1] //move up
{
	push:
	{
		if (CurrentPhoneIndex > 0)
		{
			CurrentPhoneIndex --
			call'populateaddressbook'(CurrentPhoneIndex)
		}
	}
	HOLD[2,REPEAT]:
	{
	if (CurrentPhoneIndex > 0)
		{
			CurrentPhoneIndex --
			call'populateaddressbook'(CurrentPhoneIndex)
		}
	}
}

button_event[vdvTP_AddressBook,2] //move down
{
	push:
	{
		if (CurrentPhoneIndex <= 35)
		{
			CurrentPhoneIndex ++
			call'populateaddressbook'(CurrentPhoneIndex)
		}
	}
	HOLD[2,REPEAT]:
	{
		if (CurrentPhoneIndex <= 35)
		{
			CurrentPhoneIndex ++
			call'populateaddressbook'(CurrentPhoneIndex)
		}
	}
}

DEFINE_EVENT //VTC 239 Input Selections and other selections
BUTTON_EVENT [VTC239VideoSelections]
{
    push:
    {
    call 'end_video_mute'
    call'turnoff_dialpages'
    call'AutoMaticTurnOff'
    RecordVTC = 0
    SEND_COMMAND basePanel,"'@PPF-RecordVCR'"//turn off the popup
    DialVTC = 0
    SEND_COMMAND basePanel,"'@PPF-Dial'"//turn off the popup
    CurrentVTC239Video  = button.input.channel 
   
    switch(CurrentVTC239Video)
	{
	    case 1:  //instructor
	    {
	    IF (TRACK_SOURCE <> CAMERA_INSTR_INPUT)
		{
		TRACK_SOURCE = CAMERA_INSTR_INPUT  
		SEND_STRING dv_Lifesize,"'set video primary-input hdmi0',13,10" //instructor
		}
	    }
	    case 2:  //student
	    {
	    IF (TRACK_SOURCE <> CAMERA_STUDENT_INPUT)
		{
		TRACK_SOURCE = CAMERA_STUDENT_INPUT  
		SEND_STRING dv_Lifesize,"'set video primary-input hd0',13,10" //student
		}
	    }
	    
	    case 3:  //document
	    {
	    IF (TRACK_SOURCE <> CAMERA_DOC_INPUT)
		{
		TRACK_SOURCE = CAMERA_DOC_INPUT 
		call'Graphics_Mon_input_HDMI1'		
		call'VGA_Switch_Doc'
		wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
		}
	    }
	    
	    case 11:  //return
	    {
	    DialVTC = 0
	    IF (Call_Active=1)
	    {
		SEND_COMMAND basePanel,"'@PPN-ConfirmDiscon'"//turn on the popup
	    }
	    else 
	    {SEND_COMMAND basePanel,"'@PPX'"
            SEND_COMMAND basePanel,"'PAGE-[Mode Select]Mode 6'"
	    }
	    }
	}
    }
}

BUTTON_EVENT[vdvTP_VTCSelections,9]
BUTTON_EVENT[vdvTP_VTC239Selections,9] //dial
{
  PUSH:
  {
    DialVTC = !DialVTC
    if (DialVTC)
    {
    RecordVTC = 0
    SEND_COMMAND basePanel,"'@PPF-RecordVCR'"//turn off the popup
    SEND_COMMAND basePanel,"'@PPN-Dial'"//turn on the popup
    MOREnet_Dial_Set ="''"
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
    DialVTCdirect = 0
    DialVTCman = 0
    }
    else
    {
    SEND_COMMAND basePanel,"'@PPF-Dial'"//turn off the popup
    }
}
}

BUTTON_EVENT[vdvTP_VTCSelections,6]
BUTTON_EVENT[vdvTP_VTC239Selections,6] //dial direct
{
  PUSH:
  {
    DialVTCdirect = !DialVTCdirect
    if (DialVTCdirect)
    {
    RecordVTC = 0
    SEND_COMMAND basePanel,"'@PPF-RecordVCR'"//turn off the popup
    SEND_COMMAND basePanel,"'@PPN-Directdial'"//turn on the popup
    DialVTC =0
    DialVTCman =0 
    }
    else
    {
    SEND_COMMAND basePanel,"'@PPF-Directdial'"//turn off the popup
    }
}
}

BUTTON_EVENT[vdvTP_VTCSelections,7]
BUTTON_EVENT[vdvTP_VTC239Selections,7] //dial direct
{
  PUSH:
  {
    
    DialVTCman = !DialVTCman
    if (DialVTCman)
    {
    SEND_COMMAND basePanel,"'@PPN-Mandial'"//turn on the popup
    RecordVTC = 0
    DialVTC =0
    DialVTCdirect =0 
    }
    else
    {
    SEND_COMMAND basePanel,"'@PPF-Mandial'"//turn off the popup
    }
}
}
BUTTON_EVENT[vdvTP_VTCSelections,10]
BUTTON_EVENT[vdvTP_VTC239Selections,10] //record
{
  PUSH:
  {
   
    RecordVTC = !RecordVTC
    if (RecordVTC)
    {
    SEND_COMMAND basePanel,"'@PPN-RecordVCR'"//turn on the popup
     DialVTC = 0
     DialVTCman =0
     DialVTCdirect =0 
     Recording_Set =''
     Recording_Key ='*SET RECORDING KEY *'
    send_command vdvTP_Recording, "'TEXT1-',Recording_Key"
    send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
    
    call'AutoMaticTurnOff'
    }
    else
    {
    SEND_COMMAND basePanel,"'@PPF-RecordVCR'"//turn off the popup
    //RecordVTC = 0
    }
}
}



BUTTON_EVENT [VTC239ContentSelections]
{
    push:
    {
    call'AutoMaticTurnOff'
    call'turnoff_dialpages'
    tempcontentselection  = button.input.channel 
    switch(tempcontentselection)
	{
	    case 12:  //doc
	    {
		if (tempcontentselection = CurrentVTC239Content)//turn off
		{
		CurrentVTC239Content = 0
		SEND_COMMAND basePanel,"'@PPF-Docpu'"//turn off the popup
		SEND_STRING dv_Lifesize,"'control call presentation 1 stop',13,10"
			    Sending_Content = 0
			    Receiving_Content = 0
			    call'No_content'
			    incomingdatafCodec = ''
			    SEND_COMMAND basePanel,"'@PPF-Lappu'"//turn off the popup
			    SEND_COMMAND basePanel,"'@PPF-PCpu'"//turn off the popup
			    SEND_COMMAND basePanel,"'@PPF-Docpu'"//turn off the popup
		}
		else //turn on
		{
		SEND_COMMAND basePanel,"'@PPN-Docpu'"//turn on the popup
		CurrentVTC239Content = tempcontentselection
		call'VGA_Switch_Doc'
		wait 10 {SEND_STRING dv_Lifesize,"'control call presentation 1 start',13,10"
			call'We_Are_Sending_content' 
			}
		}
	    }
	    case 13:  //pc
	    {
		if (tempcontentselection = CurrentVTC239Content)//turn off
		{
		CurrentVTC239Content = 0
		SEND_COMMAND basePanel,"'@PPF-PCpu'"//turn off the popup
		SEND_STRING dv_Lifesize,"'control call presentation 1 stop',13,10"
			    Sending_Content = 0
			    Receiving_Content = 0
			    call'No_content'
			    incomingdatafCodec = ''
			    SEND_COMMAND basePanel,"'@PPF-Lappu'"//turn off the popup
			    SEND_COMMAND basePanel,"'@PPF-PCpu'"//turn off the popup
			    SEND_COMMAND basePanel,"'@PPF-Docpu'"//turn off the popup
		}
		else //turn on
		{
		SEND_COMMAND basePanel,"'@PPN-PCpu'"//turn on the popup
		CurrentVTC239Content = tempcontentselection
		call'VGA_Switch_PC'
		wait 10 {SEND_STRING dv_Lifesize,"'control call presentation 1 start',13,10"
			call'We_Are_Sending_content' 
			}
		}
	    }
	    
	    case 14:  //laptop
	    {
		if (tempcontentselection = CurrentVTC239Content)//turn off
		{
		CurrentVTC239Content = 0
		SEND_COMMAND basePanel,"'@PPF-Lappu'"//turn off the popup
		SEND_STRING dv_Lifesize,"'control call presentation 1 stop',13,10"
			    Sending_Content = 0
			    Receiving_Content = 0
			    call'No_content'
			    incomingdatafCodec = ''
			    SEND_COMMAND basePanel,"'@PPF-Lappu'"//turn off the popup
			    SEND_COMMAND basePanel,"'@PPF-PCpu'"//turn off the popup
			    SEND_COMMAND basePanel,"'@PPF-Docpu'"//turn off the popup
		}
		else //turn on
		{
		SEND_COMMAND basePanel,"'@PPN-Lappu'"//turn on the popup
		CurrentVTC239Content = tempcontentselection
		call'VGA_Switch_Laptop'
		wait 10 {SEND_STRING dv_Lifesize,"'control call presentation 1 start',13,10"
			call'We_Are_Sending_content' 
			}
		}
	    }
	}
	
    }
}


DEFINE_EVENT //VTC Input Selections
BUTTON_EVENT [VTCInputSelections]
{
    push:
    {
    call 'end_video_mute'
    call'AutoMaticTurnOff'
    RecordVTC = 0
    SEND_COMMAND basePanel,"'@PPF-RecordVCR'"//turn off the popup
    DialVTC = 0
    SEND_COMMAND basePanel,"'@PPF-Dial'"//turn off the popup
    trackVTCInputSelecitons = button.input.channel 
    switch(trackVTCInputSelecitons)
	{
	    case 1:  //instructor
	    {
		IF (TRACK_SOURCE <> CAMERA_INSTR_INPUT)
		    {
		    TRACK_SOURCE = CAMERA_INSTR_INPUT  
		     SEND_STRING dv_Lifesize,"'set video primary-input hdmi0',13,10" //instructor
		    call'Graphics_Mon_input_HDMI2'
		    }
	    }
	    case 2:  //student
	    {
		IF (TRACK_SOURCE <> CAMERA_STUDENT_INPUT)
		    {
		    TRACK_SOURCE = CAMERA_STUDENT_INPUT  
		    SEND_STRING dv_Lifesize,"'set video primary-input hd0',13,10" //student
		    call'Graphics_Mon_input_HDMI2'
		    }
	    }
	    case 3:  //docuement
	    {
		IF (TRACK_SOURCE <> CAMERA_DOC_INPUT)
		{
		    TRACK_SOURCE = CAMERA_DOC_INPUT  
		    call'Graphics_Mon_input_HDMI1'
		    call'VGA_Switch_Doc'
		    wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
		}
	    }
	   case 4:  //computer
	    {
		IF (TRACK_SOURCE <> CAMERA_PC_INPUT)
		{
		TRACK_SOURCE = CAMERA_PC_INPUT  
		call'VGA_Switch_PC'
		call'Graphics_Mon_input_HDMI1'
		wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
		}
	    }
	    case 7:  //Laptop
	    {
	    IF (TRACK_SOURCE <> CAMERA_AUX1_INPUT)
	    {
		TRACK_SOURCE = CAMERA_AUX1_INPUT 
		call'VGA_Switch_Laptop'
		call'Graphics_Mon_input_HDMI1'
		wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
	    }
	    }
	    case 11:  //return
	    {
	    IF (Call_Active=1)
	    {
		SEND_COMMAND basePanel,"'@PPN-ConfirmDiscon'"//turn on the popup
	    }
		//Send_Command basePanel,"'@
	    else{
	    SEND_COMMAND basePanel,"'@PPX'"
            SEND_COMMAND basePanel,"'PAGE-[Mode Select]Mode 6'"
	    }
	    }
	
	
	}
    }
}






DEFINE_EVENT //presentation Inputs selections//***DONE FOR LIFESIZE***
BUTTON_EVENT [PresentationInputSelections]
{
    push:
    {
    call'AutoMaticTurnOff'
    trackPresenSelections = button.input.channel
    
    switch(trackPresenSelections)
	{
	    case 1:  //instructor
	    {
		SEND_STRING dv_Lifesize,"'set video primary-input hdmi0',13,10"
	    
	    }
	    case 2:  //student
	    {
		 SEND_STRING dv_Lifesize,"'set video primary-input hd0',13,10" //student
	    }
	    case 3:  //document
	    {
	        call'VGA_Switch_Doc'
	  	wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
	    }
	    case 4:  //computer
	    {
		call'VGA_Switch_PC'
		wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
	    }
	    case 7:  //Laptop
	    {
		call'VGA_Switch_Laptop'
		wait 10{SEND_STRING dv_Lifesize,"'set video primary-input dvi0',13,10"}	
	    } 
	}
    }
}


DEFINE_EVENT //data (online and string) EVENTS
DATA_EVENT[dv_Lifesize]//dv_Lifesize
{
  ONLINE:
  {
   send_command basePanel, "'ADBEEP'"    
  }
  OFFLINE:
  {
    isonline = 0
    IP_CLIENT_OPEN (dv_Lifesize.PORT,MITESettings[SettingIndex].CODEC_IP,TELNET,TCP_IP)
    WAIT 100 'restartLifesizeConnection'
	{
	 IP_CLIENT_OPEN (dv_Lifesize.PORT,MITESettings[SettingIndex].CODEC_IP,TELNET,TCP_IP)
	}
  }


  ONERROR:
  {
    isonline = 0 
    
      WAIT 100 'restartLifesizeConnection'
    {
    {  IP_CLIENT_OPEN (dv_Lifesize.PORT,MITESettings[SettingIndex].CODEC_IP,TELNET,TCP_IP)}
    }
  }
    STRING:
	{
		incomingdatafCodec = "incomingdatafCodec,data.text"
		send_string 0, incomingdatafCodec
		SELECT
		{
			ACTIVE (FIND_STRING(incomingdatafCodec,'MS,false',1)) :
			{
			     LifeSize_MUTE = 0
			     incomingdatafCodec = ''
			     off [dvnrelay,5]
			}
			 ACTIVE (FIND_STRING(incomingdatafCodec,'MS,true',1)) :
			{
			     LifeSize_MUTE = 1
			     incomingdatafCodec = ''
			     on [dvnrelay,5]
			}
			ACTIVE (FIND_STRING(incomingdatafCodec,'PS,',1)) :
			{
			SELECT{
				ACTIVE (FIND_STRING(incomingdatafCodec,'Terminated',1)) :
				{
				    Sending_Content = 0
				    Receiving_Content = 0
				    
				    call'No_content'
				    incomingdatafCodec = ''
				    SEND_COMMAND basePanel,"'@PPF-Lappu'"//turn off the popup
				    SEND_COMMAND basePanel,"'@PPF-PCpu'"//turn off the popup
				    SEND_COMMAND basePanel,"'@PPF-Docpu'"//turn off the popup
				}
				ACTIVE (FIND_STRING(incomingdatafCodec,'Relinquished',1)) :
				{
				    Sending_Content = 0
				    Receiving_Content = 1
				    call'We_Are_Receiving_content'
				    incomingdatafCodec = ''
				    //turn off the popups and any indicators that we are sending content
				    SEND_COMMAND basePanel,"'@PPF-Lappu'"//turn off the popup
				    SEND_COMMAND basePanel,"'@PPF-PCpu'"//turn off the popup
				    SEND_COMMAND basePanel,"'@PPF-Docpu'"//turn off the popup
				}
				ACTIVE (FIND_STRING(incomingdatafCodec,'Initiated,No',1)) :
				{
				    //presentation is Local
				    Sending_Content = 1
				    Receiving_Content =0
				    call'We_Are_Sending_content'
				    incomingdatafCodec = ''
				}
				ACTIVE (FIND_STRING(incomingdatafCodec,'Initiated,Yes',1)) :
				{
				    //presentation is remote
				    Receiving_Content =1
				    Sending_Content = 0
				    call'We_Are_Receiving_content'
				    incomingdatafCodec = ''
				}
				}
			}
		
			ACTIVE (FIND_STRING(incomingdatafCodec,'login:',1)) :
			{
			isonline = 1 
			cancel_wait 'restartLifesizeConnection'
			send_string dv_Lifesize,"'auto',$0D,$0A"
			incomingdatafCodec = ''
			}
			ACTIVE (FIND_STRING(incomingdatafCodec,'sword:',1)) :
			{
			send_string dv_Lifesize,"'m1t3e36',$0D,$0A"
			incomingdatafCodec = ''
			}
			
			ACTIVE (FIND_STRING(incomingdatafCodec,'Connected',1)) :
			{
			Call_Active = 1 //a call is up; 0 means status unknown 1 is connect, 2 is disconnect
			incomingdatafCodec = ''
			if (curentMode=2)
			{
			    call'turnoff_dialpages'
			    do_push (CV10dvTP_VTCSelections,2)
			}
			
			    call'turnoff_dialpages'
			    do_push (vdvTP_modeSelect, 3) //VTC 239 
			    wait 50{
			    do_push (CV10dvTP_VTC239Selections,2)}
			    wait 100{SEND_STRING dv_Lifesize,"'set audio mute on',13,10" //toggle mute
			    }
			
			//CurrentVTC239Video = 2
			//trackVTCInputSelecitons = 2
			//[Instructor]Camera
			}
			ACTIVE (FIND_STRING(incomingdatafCodec,'Terminated',1)) :
			{
			Call_Active = 2 //no call is up; 0 mean status unknown 1 is connect, 2 is disconnect
			incomingdatafCodec = ''
			 call'No_content'
			 RecordingActive =1
			}
			ACTIVE (FIND_STRING(incomingdatafCodec,'error:',1)) :
			{
			LifeSize_lasterrormessage = incomingdatafCodec
			incomingdatafCodec = ''
			}
			
			ACTIVE (1): //note default statment
			{
			wait 3
			{incomingdatafCodec = ''}
			}	
		}
	}
}
DATA_EVENT [baseNI]//NI /***DONE FOR LIFESIZE***
{
    online:
    {
    call'configureDevices'
    }
}

DATA_EVENT [dvnRelay]//when the axcent 3 comes online/***DONE FOR LIFESIZE***
{   
   online:
    {
    call'configureDevices'
    wait 60
	{
	call'setdevices'
	}
    }
}


DATA_EVENT [basePanel]//NI 
{
    online:
    {
    send_command basePanel, "'ADBEEP'"
    call'populateaddressbook'(CurrentPhoneIndex)
    DialVTC = 0
    RecordVTC = 0
    DialVTCdirect = 0
    DialVTCman = 0

    //send site name to main screen
    send_command vdvTP_RoomSettings, "'TEXT3-',MITESettings[SettingIndex].SiteName"
    call'update_preset_fields'
    }
}  
DATA_EVENT [34001:1:1]//panel 
{
    STRING:
	{
	 datafromtouchpanel = DATA.TEXT
	
		If (find_string(datafromtouchpanel,'ABORT',1))
		{
		//do nothing the user aborted the data entry
		}
		else 
		{
		If (find_string(datafromtouchpanel,'KEYB-',1)) //datafrom keyboard
		{
		    remove_string (datafromtouchpanel,'KEYB-',1)
		    switch (trackingTextInput)
		    {
			case cnLookingForDialingNameA: 
			{
			MOREnet_DialPreset_1_name = datafromtouchpanel
			}
			case cnLookingForDialingNameB: 
			{
			MOREnet_DialPreset_2_name = datafromtouchpanel
			}
			case cnLookingForDialingNameC: 
			{
			MOREnet_DialPreset_3_name = datafromtouchpanel
			}
			case cnLookingForDialingNameD: 
			{
			MOREnet_DialPreset_4_name = datafromtouchpanel
			}
			case cnLookingForDialingNameE: 
			{
			MOREnet_DialPreset_5_name = datafromtouchpanel
			}
			case cnLookingForDialingNameF: 
			{
			MOREnet_DialPreset_6_name = datafromtouchpanel
			}
			case cnLookingForRecordNameA: 
			{
			Record_Preset_1_name = datafromtouchpanel
			}
			case cnLookingForRecordNameB: 
			{
			Record_Preset_2_name = datafromtouchpanel
			}
			case cnLookingForRecordNameC: 
			{
			Record_Preset_3_name = datafromtouchpanel
			}
			case cnLookingForRecordNameD: 
			{
			Record_Preset_4_name = datafromtouchpanel
			}
			
		    } //end the switch case
		    call'update_preset_fields'
		}//end the if
		If (find_string(datafromtouchpanel,'KEYP-',1)) //datafrom keyboard
		{
		    remove_string (datafromtouchpanel,'KEYP-',1)
		    switch (trackingIPInput)
		    {
			case cnLookingForDialingNumberA: 
			{
			MOREnet_DialPreset_1_numb = datafromtouchpanel
			}
			case cnLookingForDialingNumberB: 
			{
			MOREnet_DialPreset_2_numb = datafromtouchpanel
			}
			case cnLookingForDialingNumberC: 
			{
			MOREnet_DialPreset_3_numb = datafromtouchpanel
			}
			case cnLookingForDialingNumberD: 
			{
			MOREnet_DialPreset_4_numb = datafromtouchpanel
			}
			case cnLookingForDialingNumberE: 
			{
			MOREnet_DialPreset_5_numb = datafromtouchpanel
			}
			case cnLookingForDialingNumberF: 
			{
			MOREnet_DialPreset_6_numb = datafromtouchpanel
			}
			case cnLookingForRecordNumberA: 
			{
			Record_Preset_1_numb = datafromtouchpanel
			}
			case cnLookingForRecordNumberB: 
			{
			Record_Preset_2_numb = datafromtouchpanel
			}
			case cnLookingForRecordNumberC: 
			{
			Record_Preset_3_numb = datafromtouchpanel
			}
			case cnLookingForRecordNumberD: 
			{
			Record_Preset_4_numb = datafromtouchpanel
			}
			
		    } //end the switch case
		    call'update_preset_fields'
		}//end the if
		}//end the else
	}//end the string
}//end the data_event


Define_event //direct dial
//CurrentPhoneIndex //from 0 to length
Button_Event [Dialsites]
{
push:
    {
    local_var INTEGER buttonthatwaspressed
    buttonthatwaspressed = get_last (Dialsites)
    SEND_STRING dv_Lifesize,"'control call dial -p h323 ',MITESettings[(CurrentPhoneIndex + buttonthatwaspressed)].CODEC_IP,' -b ',MITESettings[SettingIndex].DefaultSpeed,13,10" //
    SEND_STRING 0,"'control call dial -p h323 ',MITESettings[(CurrentPhoneIndex +buttonthatwaspressed)].CODEC_IP,' -b ',MITESettings[SettingIndex].DefaultSpeed,13,10" //
    //dial the site
    to[vdvTP_dialing,button.input.channel]
    }
}
Define_Event //ManualDial
Button_Event [DialNumbers]
{
 push:
    {
    local_var INTEGER buttonthatwaspressed
    buttonthatwaspressed = get_last (DialNumbers)
    Dial_Set = "Dial_Set,itoa(buttonthatwaspressed)"
    send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
    to[vdvTP_dialing,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_dialing,10]
{
push: 
    {
    Dial_Set = "Dial_Set,'0'"
    send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
    to[vdvTP_dialing,button.input.channel]
    call'AutoMaticTurnOff'
    }
}


button_event [vdvTP_dialing,11]
{
push: 
    {
    Dial_Set = "Dial_Set,'.'"
    send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
    to[vdvTP_dialing,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_dialing,12]
{
push: 
    {
    Dial_Set = "Dial_Set,'#'"
    send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
    to[vdvTP_dialing,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_dialing,13]
{
push: 
    {
    Dial_Set = "Dial_Set,'@'"
    send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
    to[vdvTP_dialing,button.input.channel]
    call'AutoMaticTurnOff'
    }
}


button_event [vdvTP_dialing,15] //backspace
{
	push:
	{
	local_var INTEGER lengthofsetstring
	lengthofsetstring = (length_string(Dial_Set))
	set_length_string (Dial_Set,(lengthofsetstring-1))
	send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
	to[vdvTP_dialing,button.input.channel]
	}
}
    
button_event [vdvTP_dialing,14] //Clear
{
	push:
	{
	local_var INTEGER lengthofsetstring
	Dial_Set ="''"
	send_command vdvTP_dialing, "'TEXT1-',Dial_Set"
	to[vdvTP_dialing,button.input.channel]
	}
}

button_event [vdvTP_dialing,16] //Dial
{
    push:
    {
    to [vdvTP_dialing, button.input.channel]
    SEND_STRING dv_Lifesize,"'control call dial -p h323 ',Dial_Set,' -b ',MITESettings[SettingIndex].DefaultSpeed,13,10" //
    }
}


Define_Event //MOREnet Dial Presets --time to dial
BUTTON_EVENT [MOREnet_Present_Dials]
{
 push:
    {
    call'AutoMaticTurnOff'
    to[vdvTP_InstrCamControl,BUTTON.INPUT.CHANNEL]
    trackingMorenetPreset = button.input.channel 
    switch (trackingMorenetPreset)
	{
	    case 31:
	    {
	    MOREnet_Dial_Set = MOREnet_DialPreset_1_numb
	    }
	    case 32:
	    {
	    MOREnet_Dial_Set = MOREnet_DialPreset_2_numb
	    }
	    case 33:
	    {
	    MOREnet_Dial_Set = MOREnet_DialPreset_3_numb
	    }
	    case 34:
	    {
	    MOREnet_Dial_Set = MOREnet_DialPreset_4_numb
	    }
	    case 35:
	    {
	    MOREnet_Dial_Set = MOREnet_DialPreset_5_numb
	    }
	    case 36:
	    {
	    MOREnet_Dial_Set = MOREnet_DialPreset_6_numb
	    }
	}
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"  //other input 
    }
}

BUTTON_EVENT [RECORDING_Presets]
{
 push:
    {
    call'AutoMaticTurnOff'
    to[vdvTP_record_preset ,BUTTON.INPUT.CHANNEL]
     
    switch (button.input.channel)
	{
	    case 31:
	    {
	    Recording_Key = Record_Preset_1_numb
	    }
	    case 32:
	    {
	    Recording_Key = Record_Preset_2_numb
	    }
	    case 33:
	    {
	    Recording_Key = Record_Preset_3_numb
	    }
	    case 34:
	    {
	    Recording_Key = Record_Preset_4_numb
	    }
	    
	}
	Recording_Set =''
	send_command vdvTP_Recording, "'TEXT1-',Recording_Key"
	send_command vdvTP_Recording, "'TEXT2-',Recording_Set"

    }
}

Define_Event //MOREnetDial
Button_Event [MOREnetDialNumbers]
{
 push:
    {
    local_var INTEGER buttonthatwaspressed
    buttonthatwaspressed = get_last (MOREnetDialNumbers)
    MOREnet_Dial_Set = "MOREnet_Dial_Set,itoa(buttonthatwaspressed)"
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"  //other input 
    to[vdvTP_StudentCamera,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_StudentCamera,10]
{
push: 
    {
    MOREnet_Dial_Set = "MOREnet_Dial_Set,'0'"
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
    to[vdvTP_dialing,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

/*
button_event [vdvTP_StudentCamera,11]
{
push: 
    {
    MOREnet_Dial_Set = "MOREnet_Dial_Set,'.'"
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
    to[vdvTP_StudentCamera,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_StudentCamera,12]
{
push: 
    {
    MOREnet_Dial_Set = "MOREnet_Dial_Set,'#'"
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
    to[vdvTP_StudentCamera,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_StudentCamera,13]
{
push: 
    {
    MOREnet_Dial_Set = "MOREnet_Dial_Set,'@'"
    send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
    to[vdvTP_StudentCamera,button.input.channel]
    call'AutoMaticTurnOff'
    }
}
*/

button_event [vdvTP_StudentCamera,15] //backspace
{
	push:
	{
	local_var INTEGER lengthofsetstring
	lengthofsetstring = (length_string(MOREnet_Dial_Set))
	set_length_string (MOREnet_Dial_Set,(lengthofsetstring-1))
	send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
	to[vdvTP_StudentCamera,button.input.channel]
	}
}
    
button_event [vdvTP_StudentCamera,14] //Clear
{
	push:
	{
	//local_var INTEGER lengthofsetstring
	MOREnet_Dial_Set ="''"
	send_command vdvTP_StudentCamera, "'TEXT1-',MOREnet_Dial_Set"
	to[vdvTP_StudentCamera,button.input.channel]
	}
}

button_event [vdvTP_StudentCamera,25] //Dial
{
    push:
    {
    to [vdvTP_StudentCamera, button.input.channel]
    SEND_STRING dv_Lifesize,"'control call dial -p h323 573885',MOREnet_Dial_Set,' -b 768',13,10" //
    }
}
button_event [vdvTP_Dial,1]//hangup
{
    push:
    {
    to [vdvTP_Dial, button.input.channel]
    SEND_STRING dv_Lifesize,"'control call hangup -a',13,10"  
    DialVTC = 0
    RecordVTC = 0
    DialVTCdirect = 0
    DialVTCman = 0
    
    SEND_COMMAND basePanel,"'@PPF-Mandial'"//turn off the popup
    SEND_COMMAND basePanel,"'@PPF-Dial'"//turn off the popup
    }
}


Define_Event //Recording
Button_Event [RecordingNumbers]
{
 push:
    {
    local_var INTEGER buttonthatwaspressed
    buttonthatwaspressed = get_last (RecordingNumbers)
    Recording_Set = "Recording_Set,itoa(buttonthatwaspressed)"
    send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
    to[vdvTP_Recording,button.input.channel]
    call'AutoMaticTurnOff'
    }
}

button_event [vdvTP_Recording,10]
{
push: 
    {
    Recording_Set = "Recording_Set,'0'"
    send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
    to[vdvTP_Recording,button.input.channel]
    call'AutoMaticTurnOff'
    }
}


button_event [vdvTP_Recording,210]
{
push: 
    {
    Recording_Set = ''
    send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
    }
}

button_event [vdvTP_Recording,208] //backspace
{
	push:
	{
	local_var INTEGER lengthofsetstring
	lengthofsetstring = (length_string(Recording_Set))
	set_length_string (Recording_Set,(lengthofsetstring-1))
	send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
	to[vdvTP_Recording,button.input.channel]
	}
}
    
button_event [vdvTP_Recording,212] //set recording key
{
	push:
	{
	Recording_Key = Recording_Set
	Recording_Set =''
	send_command vdvTP_Recording, "'TEXT1-',Recording_Key"
	send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
	to[vdvTP_Recording,button.input.channel]
	}
}

button_event [vdvTP_Recording,11] //Record
{
	push:
	{
	SEND_STRING dv_Lifesize,"'control record start ',Recording_Key,13,10" //
	//command to start the recording sent, 
	}
}

button_event [vdvTP_Recording,12] //Stop
{
	push:
	{
	SEND_STRING dv_Lifesize,"'control record stop',13,10" //
	}
}

    
DEFINE_EVENT //manual control of displays //instructor
button_event [vdvTP_AMX_Setup,17] //power on
{
    push:
    {
    call'Instr_Mon_Power_On'
    }
}
button_event [vdvTP_AMX_Setup,18] //power off
{
    push:
    {
    call'Instr_Mon_Power_Off'
    }
}
button_event [vdvTP_AMX_Setup,19] //HDMI1
{
    push:
    {
    call'Instr_Mon_input_HDMI1'
    }
}
button_event [vdvTP_AMX_Setup,20] //HDMI2 
{
    push:
    {
    call'Instr_Mon_input_HDMI2'
    }
}

DEFINE_EVENT //manual control of displays //graphics
button_event [vdvTP_AMX_Setup,5] //power on
{
    push:
    {
    call'Graphics_Mon_Power_On'
    }
}
button_event [vdvTP_AMX_Setup,6] //power off
{
    push:
    {
    call'Graphics_Mon_Power_Off'
    }
}
button_event [vdvTP_AMX_Setup,7] //HDMI1
{
    push:
    {
    call'Graphics_Mon_input_HDMI1'
    }
}
button_event [vdvTP_AMX_Setup,8] //HDMI2 
{
    push:
    {
    call'Graphics_Mon_input_HDMI2'
    }
}

DEFINE_EVENT //manual control of displays //Student
button_event [vdvTP_AMX_Setup,9] //power on
{
    push:
    {
    call'Student_Mon_Power_On'
    }
}
button_event [vdvTP_AMX_Setup,10] //power off
{
    push:
    {
    call'Student_Mon_Power_Off'
    }
}
button_event [vdvTP_AMX_Setup,15] //HDMI1
{
    push:
    {
    call'Student_Mon_input_HDMI1'
    }
}
button_event [vdvTP_AMX_Setup,16] //HDMI2 
{
    push:
    {
    call'Student_Mon_input_HDMI2'
    }
}
DEFINE_EVENT //manual control of displays //instructor
button_event [vdvTP_AMX_Setup,1] //power on
{
    push:
    {
    call'PreviewLCD_Mon_Power_On'
    }
}
button_event [vdvTP_AMX_Setup,2] //power off
{
    push:
    {
    call'PreviewLCD_Mon_Power_Off'
    }
}
button_event [vdvTP_AMX_Setup,3] //HDMI1
{
    push:
    {
    call'PreviewLCD_Mon_input_HDMI1'
    }
}
button_event [vdvTP_AMX_Setup,4] //HDMI2 
{
    push:
    {
    call'PreviewLCD_Mon_input_HDMI2'
    }
}


//hangup

button_event [vdvTP_Dial,5]//hangup
{
    push:
    {
    to [vdvTP_Dial, button.input.channel]
    SEND_STRING dv_Lifesize,"'control call hangup -a',13,10"  
    DialVTC = 0
    RecordVTC = 0
    DialVTCdirect = 0
    DialVTCman = 0
    SEND_COMMAND basePanel,"'@PPF-Mandial'"//turn off the popup
    
    SEND_COMMAND basePanel,"'@PPF-Dial'"//turn off the popup
    }
}

 
DEFINE_EVENT //dial setup screen
button_event [QuickDialPresetNames]
{
    push:
    {	
    to [vdvTP_DialSetup, button.input.channel]
    trackingTextInput = button.input.channel 
    switch (trackingTextInput)
	{
	    case cnLookingForDialingNameA: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',MOREnet_DialPreset_1_name"
	    }
	    case cnLookingForDialingNameB: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',MOREnet_DialPreset_2_name"
	    }
	    case cnLookingForDialingNameC: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',MOREnet_DialPreset_3_name"
	    }
	    case cnLookingForDialingNameD: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',MOREnet_DialPreset_4_name"
	    }
	    case cnLookingForDialingNameE: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',MOREnet_DialPreset_5_name"
	    }
	    case cnLookingForDialingNameF: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',MOREnet_DialPreset_6_name"
	    }
	}
    }
}


button_event [QuickDialPresetNumbers]
{
    push:
    {	
    to [vdvTP_DialSetup, button.input.channel]
    trackingIPInput = (button.input.channel)
    switch (trackingIPInput)
	{
	    case cnLookingForDialingNumberA: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',MOREnet_DialPreset_1_numb"
	    }
	    case cnLookingForDialingNumberB: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',MOREnet_DialPreset_2_numb"
	    }
	    case cnLookingForDialingNumberC: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',MOREnet_DialPreset_3_numb"
	    }
	    case cnLookingForDialingNumberD: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',MOREnet_DialPreset_4_numb"
	    }
	    case cnLookingForDialingNumberE: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',MOREnet_DialPreset_5_numb"
	    }
	    case cnLookingForDialingNumberF: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',MOREnet_DialPreset_6_numb"
	    }
	}
    }
}

//note need to revisit the 

button_event [RecordPresetNames]
{
    push:
    {	
    to [vdvTP_DialSetup, button.input.channel]
    trackingTextInput = button.input.channel 
    switch (trackingTextInput)
	{
	    case cnLookingForRecordNameA: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',Record_Preset_1_name"
	    }
	    case cnLookingForRecordNameB: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',Record_Preset_2_name"
	    }
	    case cnLookingForRecordNameC: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',Record_Preset_3_name"
	    }
	    case cnLookingForRecordNameD: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'AKEYB-',Record_Preset_4_name"
	    }
	}
    }
}

button_event [RecordPresetNumber]
{
    push:
    {	
    to [vdvTP_DialSetup, button.input.channel]
    trackingIPInput = (button.input.channel)
    switch (trackingIPInput)
	{
	    case cnLookingForRecordNumberA: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',Record_Preset_1_numb"
	    }
	    case cnLookingForRecordNumberB: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',Record_Preset_2_numb"
	    }
	    case cnLookingForRecordNumberC: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',Record_Preset_3_numb"
	    }
	    case cnLookingForRecordNumberD: 
	    {
	    SEND_COMMAND vdvTP_DialSetup,"'@AKP-',Record_Preset_4_numb"
	    }
	}
    }
}

button_event[vdvTP_DialSetup,5]
{
	push:
	{
	MITESettings[SettingIndex].DefaultSpeed = '384'
	}
}

button_event[vdvTP_DialSetup,7]
{
	push:
	{
	MITESettings[SettingIndex].DefaultSpeed = '512'
	}
}

button_event[vdvTP_DialSetup,8]
{
	push:
	{
	MITESettings[SettingIndex].DefaultSpeed = '1024'
	}
}

button_event[vdvTP_DialSetup,9]
{
	push:
	{
	MITESettings[SettingIndex].DefaultSpeed = '768'
	}
}


DEFINE_EVENT //student camera controls //DONE FOR LIFESIZE
button_event[vdvTP_InstrCamControl,132]
button_event[vdvTP_StudentCamera,132]//up
{
	push:
	{
	to [vdvTP_StudentCamera, button.input.channel]
	to [vdvTP_InstrCamControl, button.input.channel]
		SEND_STRING dv_Lifesize,"'set camera position -u',13,10" //
	}	
	release:
	{
	SEND_STRING dv_Lifesize,"'set camera position -s',13,10" //
	}
}

button_event[vdvTP_InstrCamControl,133]
button_event[vdvTP_StudentCamera,133]//down
{
	push:
	{
	to [vdvTP_StudentCamera, button.input.channel]
	to [vdvTP_InstrCamControl, button.input.channel]
	SEND_STRING dv_Lifesize,"'set camera position -d',13,10" //
	}	
	release:
	{
	SEND_STRING dv_Lifesize,"'set camera position -s',13,10" //
	}
}
button_event[vdvTP_InstrCamControl,134]
button_event[vdvTP_StudentCamera,134]//left
{
	push:
	{
	to [vdvTP_StudentCamera, button.input.channel]
	to [vdvTP_InstrCamControl, button.input.channel]
	SEND_STRING dv_Lifesize,"'set camera position -l',13,10" //
	}	
	release:
	{
	SEND_STRING dv_Lifesize,"'set camera position -s',13,10" //
	}
}
button_event[vdvTP_InstrCamControl,135]
button_event[vdvTP_StudentCamera,135]//right
{
	push:
	{
	to [vdvTP_StudentCamera, button.input.channel]
	to [vdvTP_InstrCamControl, button.input.channel]
	SEND_STRING dv_Lifesize,"'set camera position -r',13,10" //
	}	
	release:
	{
	SEND_STRING dv_Lifesize,"'set camera position -s',13,10" //
	}
}


button_event[vdvTP_RoomSettings,29]
button_event[vdvTP_InstrCamControl,159]
button_event[vdvTP_StudentCamera,159]//*zoom in
{
	push:
	{
	to [vdvTP_StudentCamera, button.input.channel]
	to [vdvTP_InstrCamControl, button.input.channel]
	SEND_STRING dv_Lifesize,"'set camera position -n',13,10" //
	}
	release:
	{
	SEND_STRING dv_Lifesize,"'set camera position -s',13,10" //
	}
}

button_event[vdvTP_RoomSettings,30]
button_event[vdvTP_InstrCamControl,158]
button_event[vdvTP_StudentCamera,158]//zoom out
{
	push:
	{	
	to [vdvTP_StudentCamera, button.input.channel]
	to [vdvTP_InstrCamControl, button.input.channel]	
	SEND_STRING dv_Lifesize,"'set camera position -f',13,10" //
	}	
	release:
	{
	SEND_STRING dv_Lifesize,"'set camera position -s',13,10" //
	}	
}

DEFINE_EVENT //Video Switcher Manual operation //***DONE FOR LIFESIZE***

button_event [vdvTP_VideoSwitch,1]
{
	push:
	{
	    call'VGA_Switch_PC'
	}
}

button_event [vdvTP_VideoSwitch,2]
{
	push:
	{
	    call'VGA_Switch_Laptop'
	}
}

button_event [vdvTP_VideoSwitch,3]
{
	push:
	{
	    call'VGA_Switch_Doc'
	}
}



DEFINE_EVENT //Navigation Selections: Weather
button_event [WeatherSelections]
{
	push:
	{
	trackWeatherSelecitons = button.input.channel
	call'AutoMaticTurnOff'
	}
}


DEFINE_EVENT //Navigation Selections: advacnedselections
button_event [AdvancedSelections]
{
	push:
	{
	call'AutoMaticTurnOff'
	trackAdvancedSelections = button.input.channel
	if (trackAdvancedSelections = 2) //we are looking at the device configurations
	    {
	    if (MITESettings[SettingIndex].Cluster = 1)
		{
		send_command basePanel, "'@PPA-[AMX Setup]CustomNorth'" //hide all popups on the 
		send_command basePanel, "'PAGE-[AMX Setup]CustomNorth'" //show that page
		send_command basePanel, "'@PPN-[Advanced]NAV 8'" //turn on the nav on this page
		}
	    if (MITESettings[SettingIndex].Cluster = 2)
		{
		send_command basePanel, "'@PPA-[AMX Setup]CustomCentralSouth'" //hide all popups on the 
		send_command basePanel, "'PAGE-[AMX Setup]CustomCentralSouth'" //show that page
		send_command basePanel, "'@PPN-[Advanced]NAV 8'" //turn on the nav on this page
		}
	     if (MITESettings[SettingIndex].Cluster = 3)
		{
		send_command basePanel, "'@PPA-[AMX Setup]CustomCentralSouth'" //hide all popups on the 
		send_command basePanel, "'PAGE-[AMX Setup]CustomCentralSouth'" //show that page
		send_command basePanel, "'@PPN-[Advanced]NAV 8'" //turn on the nav on this page
		}
	    if (MITESettings[SettingIndex].Cluster = 4)
		{
		send_command basePanel, "'@PPA-[AMX Setup]CustomCentralSouth'" //hide all popups on the 
		send_command basePanel, "'PAGE-[AMX Setup]CustomCentralSouth'" //show that page
		send_command basePanel, "'@PPN-[Advanced]NAV 8'" //turn on the nav on this page
		}
	    if (MITESettings[SettingIndex].Cluster = 5)
		{
		send_command basePanel, "'@PPA-[AMX Setup]CustomCentralSouth'" //hide all popups on the 
		send_command basePanel, "'PAGE-[AMX Setup]CustomCentralSouth'" //show that page
		send_command basePanel, "'@PPN-[Advanced]NAV 8'" //turn on the nav on this page
		}
	    }	
	}
}

DEFINE_EVENT //Navigation Selections: Support and Help
button_event [SupportSelections]
{
	push:
	{
	call'AutoMaticTurnOff'
	tracksupportSelections = button.input.channel
	}
}



DEFINE_EVENT //room settings AND LifeSize REMOTE CONTROL

button_event [LifeSizeRemoteButtons]
{
    push:
    {
    local_var integer pressedbutton
    pressedbutton = button.input.channel
    to [vdvTP_RoomSettings, pressedbutton]
    call 'AutoMaticTurnOff'
    switch(pressedbutton)
	{
	   
	    case 11:  //1
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 1',13,10" //
	    }
	    case 12:  //2
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 2',13,10" // 
	    }
	    case 13:  //3
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 3',13,10" // 
	    }
	    case 14:   //4
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 4',13,10" // 
	    }
	    case 15:  //5
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 5',13,10" //
	    }
	    case 16:  //6
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 6',13,10" // 
	    }
	    case 17:  //7
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 7',13,10" //
	    }
	    case 18:   //8
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 8',13,10" // 
	    }
	    case 19:  //9
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 9',13,10" //
	    }
	    case 10:  // 0
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 0',13,10" //
	    }
	    case 91:  //*
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 *',13,10" // 
	    }
	    case 93:  //#
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 #',13,10" //
	    }
	    case 1:  //triangle
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 tri',13,10" //
	    }
	    case 2:  //back
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 back',13,10" //
	    }
	    case 21:  //circle
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 cir',13,10" //
	    }
	    case 22:  //square
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 squ',13,10" //
	    }
	    case 7:  //ok
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 ok',13,10" //
	    }
	    case 3:  //arrow up
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 up',13,10" //
	    }
	    case 8:  //arrow down
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 down',13,10" //
	    }
	    case 4:  //arrow left
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 left',13,10" //
	    }
	    case 6:  //arrow right
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 right',13,10" //
	    }
	    case 9:  //home
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 home',13,10" //
	    }
	    case 32:  //near/far
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 nf',13,10" //
	    }
  	    case 33:  //layout
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 layout',13,10" //
	    }
	    case 34:  //input
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 input',13,10" //
	    }
	    case 35:  //edit
	    {
	     SEND_STRING dv_Lifesize,"'control remote1 mode',13,10" //
	    }
	}	
    }
}


button_event [vdvTP_RoomSettings, 5]//reboot LifeSize now
{
    push:
    {
     SEND_STRING dv_Lifesize,"'control reboot',13,10" //
    }
}

Define_Event //Reboot NI //DONE For LifeSize
button_event[vdvTP_DialSetup, 6] //Reboor NI
{
	push:
	{
	REBOOT (0:0:0)
	}
}


DEFINE_EVENT //mode selections buttons

button_event [vdvTP_modeSelect, 1] //Presentation 
 {   push:
	{	
	if (curentMode <> 1)
	{
	curentMode = button.input.channel
	to [vdvTP_modeSelect, button.input.channel]
	call'AutoMaticTurnOff'
	Call 'initlifesize'
	do_push(vdvTP_PresentationSelections,2)
	call'turnondisplays_presentation'
    wait 25{
	    SEND_STRING dv_Lifesize,"'set system telepresence off',13,10" 
	    Telepresence_ON = 0
	}
	wait 25{
	    SEND_STRING dv_Lifesize,"'control remote1 home',13,10" 
	    SEND_STRING dv_Lifesize,"'control remote1 green',13,10" 
	}
    }
	}
}
button_event [vdvTP_modeSelect, 2] //VTC 
 {   push:
	{
	if (curentMode <> 2)
	{
	CALL'VGA_Switch_PC'
	//remove the following two lines in the future. 
	SEND_STRING dv_Lifesize,"'set system presentation on',13,10"
	H239STATUS = 1	
	curentMode = button.input.channel
	to [vdvTP_modeSelect, button.input.channel]
	call'AutoMaticTurnOff'
	CALL'initlifesize'
	call'turnondisplays'
	TRACK_SOURCE = CAMERA_STUDENT_INPUT  
	trackVTCInputSelecitons = 2
	wait 22 {SEND_STRING dv_Lifesize,"'set video primary-input hd0',13,10" }//student
	wait 30 { SEND_STRING dv_Lifesize,"'set video secondary-input dvi0',13,10" }//dvi input
	   }
    }
}
button_event [vdvTP_modeSelect, 3] //VTC 239 
 {   push:
	{	
	if (curentMode <> 3)
	    {
	    SEND_STRING dv_Lifesize,"'set system telepresence on',13,10" 
	    Telepresence_ON = 1
	    //remove the following two lines in the future. 
	    SEND_STRING dv_Lifesize,"'set system presentation on',13,10" 
	    H239STATUS = 1
	    call'AutoMaticTurnOff'
	    curentMode = button.input.channel
	    to [vdvTP_modeSelect, button.input.channel]
	    call'turnondisplays'
	    call'initlifesize'
	    CALL'VGA_Switch_PC'
	    CurrentVTC239Video =2
	    TRACK_SOURCE = CAMERA_STUDENT_INPUT  
	    wait 22 {SEND_STRING dv_Lifesize,"'set video primary-input hd0',13,10" }//student
	    wait 30 { SEND_STRING dv_Lifesize,"'set video secondary-input dvi0',13,10" }//dvi input
	    }
	}
}
button_event [vdvTP_modeSelect, 4] //Advanced 
{    push:
	{	
	call'AutoMaticTurnOff'
	to [vdvTP_modeSelect, button.input.channel]
	trackAdvancedSelections = 0
	}
}
button_event [vdvTP_modeSelect, 5] //shutdown 
 {   push:
	{
	SEND_STRING dv_Lifesize,"'set system telepresence on',13,10" 
	H239STATUS = 1
	Telepresence_ON = 1
	call'AutoMaticTurnOff'	
	to [vdvTP_modeSelect, button.input.channel]
	call'shutdownpro'
	call'turnoffdisplays'
	Recording_Set = ''
	send_command vdvTP_Recording, "'TEXT2-',Recording_Set"
	}
}

button_event [vdvTP_modeSelect, 6] //weather selestions
{    push:
	{	
	call'AutoMaticTurnOff'
	trackWeatherSelecitons =1
	to [vdvTP_modeSelect, button.input.channel]
	}
}
button_event [vdvTP_modeSelect, 7] //support selestions
 {   push:
	{
	call'AutoMaticTurnOff'
	tracksupportSelections = 5
	call'populateaddressbook'(0)
	to [vdvTP_modeSelect, button.input.channel]
	}

}




(***********************************************************)
(*            THE ACTUAL PROGRAM GOES BELOW                *)
(***********************************************************)
DEFINE_PROGRAM

[vdvTP_AMX_Setup,11] = isonline

[vdvTP_WeatherSelect,1] 		= (trackWeatherSelecitons =1)
[vdvTP_WeatherSelect,2] 		= (trackWeatherSelecitons =2)
[vdvTP_WeatherSelect,3] 		= (trackWeatherSelecitons =3)
[vdvTP_WeatherSelect,4] 		= (trackWeatherSelecitons =4)
[vdvTP_WeatherSelect,5] 		= (trackWeatherSelecitons =5)
[vdvTP_WeatherSelect,7] 		= (trackWeatherSelecitons =7)

[vdvTP_VideoSwitch,1] 			=  [dvnrelay,1]
[vdvTP_VideoSwitch,2] 			=  [dvnrelay,2]
[vdvTP_VideoSwitch,3] 			=  [dvnrelay,3]

[vdvTP_AdvancedSelection,1] 		=  (trackAdvancedSelections = 1)
[vdvTP_AdvancedSelection,2] 		=  (trackAdvancedSelections = 2)
[vdvTP_AdvancedSelection,3] 		=  (trackAdvancedSelections = 3)
[vdvTP_AdvancedSelection,4] 		=  (trackAdvancedSelections = 4)
[vdvTP_AdvancedSelection,5] 		=  (trackAdvancedSelections = 5)
[vdvTP_AdvancedSelection,6] 		=  (trackAdvancedSelections = 6)
[vdvTP_AdvancedSelection,7] 		=  (trackAdvancedSelections = 7)

[vdvTP_DialSetup,5] 			= (MITESettings[SettingIndex].DefaultSpeed = '384')
[vdvTP_DialSetup,7] 			= (MITESettings[SettingIndex].DefaultSpeed = '512')
[vdvTP_DialSetup,8] 			= (MITESettings[SettingIndex].DefaultSpeed = '1024')
[vdvTP_DialSetup,9] 			= (MITESettings[SettingIndex].DefaultSpeed = '768')

[vdvTP_PresentationSelections,1] 	=  (trackPresenSelections = 1)
[vdvTP_PresentationSelections,2] 	=  (trackPresenSelections = 2)
[vdvTP_PresentationSelections,3] 	=  (trackPresenSelections = 3)
[vdvTP_PresentationSelections,4] 	=  (trackPresenSelections = 4)
[vdvTP_PresentationSelections,5] 	=  (trackPresenSelections = 5)
[vdvTP_PresentationSelections,6] 	=  (trackPresenSelections = 6)
[vdvTP_PresentationSelections,7] 	=  (trackPresenSelections = 7)
[vdvTP_PresentationSelections,8] 	=  (trackPresenSelections = 8)
[vdvTP_PresentationSelections,9] 	=  (RecordPresentation = 1)

[vdvTP_VTCSelections,1] 		=  (trackVTCInputSelecitons = 1)
[vdvTP_VTCSelections,2] 		=  (trackVTCInputSelecitons = 2)
[vdvTP_VTCSelections,3] 		=  (trackVTCInputSelecitons = 3)
[vdvTP_VTCSelections,4] 		=  (trackVTCInputSelecitons = 4)
[vdvTP_VTCSelections,5] 		=  (trackVTCInputSelecitons = 5)


[vdvTP_VTCSelections,8] 		=  (trackVTCInputSelecitons = 8)

[vdvTP_SupportSelection,1] 		=  (tracksupportSelections = 1)
[vdvTP_SupportSelection,2] 		=  (tracksupportSelections = 2)
[vdvTP_SupportSelection,3] 		=  (tracksupportSelections = 3)
[vdvTP_SupportSelection,4] 		=  (tracksupportSelections = 4)
[vdvTP_SupportSelection,5] 		=  (tracksupportSelections = 5)
[vdvTP_SupportSelection,6] 		=  (tracksupportSelections = 6)

[vdvTP_RoomSettings,2] 			= (AutoReboot = 1 )
[vdvTP_RoomSettings,3] 			= (AutoReboot = 0 )

[vdvTP_VTC239Selections,1] 		=  (CurrentVTC239Video = 1)
[vdvTP_VTC239Selections,2] 		=  (CurrentVTC239Video = 2)
[vdvTP_VTC239Selections,3] 		=  (CurrentVTC239Video = 3)
[vdvTP_VTC239Selections,4] 		=  (CurrentVTC239Video = 4)
[vdvTP_VTC239Selections,5] 		=  (CurrentVTC239Video = 5)
[vdvTP_VTC239Selections,8] 		=  (CurrentVTC239Video = 8)

[vdvTP_VTC239Selections,12] 		=  (CurrentVTC239Content = 12 and Sending_Content =1)
[vdvTP_VTC239Selections,13] 		=  (CurrentVTC239Content = 13 and Sending_Content =1)
[vdvTP_VTC239Selections,14] 		=  (CurrentVTC239Content = 14 and Sending_Content =1)

[vdvTP_Volume,2] 			=  (LifeSize_MUTE = 1)

[vdvTP_Volume,4] 			= (RecordingActive =1)

[vdvTP_VTCSelections,40] 		=  (LifeSize_VIDEO_MUTE = 1)
[vdvTP_VTC239Selections,40] 		=  (LifeSize_VIDEO_MUTE = 1)

[vdvTP_modeSelect, 1]			=  (curentMode = 1)
[vdvTP_modeSelect, 2]			=  (curentMode = 2)
[vdvTP_modeSelect, 3]			=  (curentMode = 3)
[vdvTP_modeSelect, 5]			=  (curentMode = 5)

[vdvTP_VTC239Selections, 16]			=  (NowPreviewing=1)//video
[vdvTP_VTC239Selections, 17]			=  (NowPreviewing=2)//content

[vdvTP_RoomSettings, 36]  = (Telepresence_ON = 0)
[vdvTP_RoomSettings, 37]  = (Telepresence_ON)

[vdvTP_RoomSettings, 38]  = (H239STATUS = 0)
[vdvTP_RoomSettings, 39]  = (H239STATUS)

[vdvTP_VTCSelections,9] 		=  (DialVTC = 1)
[vdvTP_VTCSelections,10] 		=  (RecordVTC = 1)
[vdvTP_VTCSelections,6] 		=  (DialVTCdirect = 1) //direct
[vdvTP_VTCSelections,7] 		=  (DialVTCman = 1)//man

[vdvTP_VTC239Selections,9] 		=  (DialVTC = 1)
[vdvTP_VTC239Selections,10] 		=  (RecordVTC = 1)
[vdvTP_VTC239Selections,6] 		=  (DialVTCdirect = 1) //direct
[vdvTP_VTC239Selections,7] 		=  (DialVTCman = 1)//man

(**********************************************************)        
(*                     END OF PROGRAM                      *)
(*        DO NOT PUT ANY CODE BELOW THIS COMMENT           *)
(***********************************************************)

