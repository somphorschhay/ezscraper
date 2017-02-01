{         File : HrdTypes.pas                                                 *}

unit HrdTypes;

interface

const

// Success Code
			S_HRD_OK	: HResult																=		HResult($00000000);
		
	  
// End of Success Code

// Information Code
	I_HRD_RESULT_NOTPRESENT	: HResult	       					=		HResult($40002000);
	
// End of Information Code

// Error Code
	E_HRD_FAILTOGETPAGEJ	: HResult																=		HResult($8000CF00);
		
		E_HRD_LOGIN_FAIL	: HResult																=		HResult($8000CF02);
		
  E_HRD_UNKNOWN: HResult                         = HResult($8000FFFF);
  
  E_HRD_SITE_INVALID: HResult                    = HResult($8000CF01);
    
  E_HRD_USER_ACCOUNT_NOTENTER: HResult           = HResult($8000EA00);  
  E_HRD_USER_ACCOUNT_INVALID: HResult            = HResult($8000EA01);  
  E_HRD_USER_ACCOUNT_DENIED: HResult             = HResult($8000EA02);
  
  E_HRD_USER_ID_NOTENTER: HResult                = HResult($8000E100);  
  E_HRD_USER_ID_INVALID: HResult                 = HResult($8000E101);
  E_HRD_USER_ID_DENIED: HResult                  = HResult($8000E102);  

  E_HRD_USER_EMAIL_NOTENTER: HResult             = HResult($8000E150);  
  E_HRD_USER_EMAIL_INVALID: HResult              = HResult($8000E151);
  E_HRD_USER_EMAIL_DENIED: HResult               = HResult($8000E152);
  
  E_HRD_USER_PASSWORD_NOTENTER: HResult          = HResult($8000E200); 
  E_HRD_USER_PASSWORD_INVALID: HResult           = HResult($8000E201); 
  E_HRD_USER_PASSWORD_DENIED: HResult            = HResult($8000E202); 
  E_HRD_USER_PASSWORD_JUSTBEFOREDENY: HResult    = HResult($8000E203); 
  E_HRD_USER_PASSWORD_EXPIRED: HResult           = HResult($8000E204); 

  E_HRD_BRANCH_REGNO_COMPANY_NOTENTER            = HResult($8000E300); 
  E_HRD_BRANCH_REGNO_COMPANY_INVALID             = HResult($8000E301); 
  E_HRD_BRANCH_REGNO_COMPANY_DENIED              = HResult($8000E302); 

  E_HRD_ENUM_DATE_BEGIN_NOTENTER: HResult        = HResult($8000D100); 
  E_HRD_ENUM_DATE_BEGIN_INVALID: HResult         = HResult($8000D101); 
  E_HRD_ENUM_DATE_BEGIN_DENIED: HResult          = HResult($8000D102); 
  E_HRD_ENUM_DATE_BEGIN_GREATTHENEND: HResult    = HResult($8000D103); 
  E_HRD_ENUM_DATE_BEGIN_FUTURE: HResult          = HResult($8000D104); 

  E_HRD_ENUM_DATE_END_NOTENTER: HResult          = HResult($8000D200); 
  E_HRD_ENUM_DATE_END_INVALID: HResult           = HResult($8000D201); 
  E_HRD_ENUM_DATE_END_DENIED: HResult            = HResult($8000D202); 
  E_HRD_ENUM_DATE_END_LESSTHENBEGIN: HResult     = HResult($8000D203); 
  E_HRD_ENUM_DATE_END_FUTURE: HResult            = HResult($8000D204); 

  E_HRD_ACCOUNT_NO_NOTENTER: HResult             = HResult($8000E400); 
  E_HRD_ACCOUNT_NO_INVALID: HResult              = HResult($8000E401); 
  E_HRD_ACCOUNT_NO_DENIED: HResult               = HResult($8000E402); 
  E_HRD_ACCOUNT_NO_NOTREGISTERED: HResult        = HResult($8000E403); 

  E_HRD_ACCOUNT_PASSWORD_NOTENTER: HResult       = HResult($8000E600); 
  E_HRD_ACCOUNT_PASSWORD_INVALID: HResult        = HResult($8000E601); 
  E_HRD_ACCOUNT_PASSWORD_DENIED: HResult         = HResult($8000E602); 
  E_HRD_ACCOUNT_PASSWORD_JUSTBEFOREDENY: HResult = HResult($8000E603); 
  E_HRD_ACCOUNT_PASSWORD_EXPIRED: HResult        = HResult($8000E604); 

  E_HRD_CURRENCY_NOT_CONVERT : HResult            = HResult($8000C100); 
  E_HRD_RESULT_LENGTH_OVER: HResult              = HResult($8000C101); 
  E_HRD_RESULT_COUNT_OVER: HResult               = HResult($8000C102); 
  E_HRD_RESULT_CURRENCY_ERROR: HResult           = HResult($8000C103);
  E_HRD_RESULT_FAIL: HResult                     = HResult($8000C104);
// End of Error Code


// Param Input

	AAAAAAAAAAAAAAAAAAAAAAAA								=		1
	AAAAAAAAAAAAAAAAAAAAAAAA								=		2
	aaaaaa								=		3
	aAAAAAAAA								=		4
	//input201701272142519945								=		5
	//input201701272142519956								=		6
	//input201701272142519957								=		7
	//input201701272142519958								=		8
	//input201701272142519969								=		9
	//input2017012721425199610								=		10


	AAA								=		1
	AAAAAAAA								=		2
	AAAAAAAA								=		3
	AAA								=		4
	AAAAAAAA								=		5
	AAAAAAAA								=		6
	AAAAAAAA								=		7
	AAAAAAAA								=		8
	AAAAAAAA								=		9
	AAAAAAAA								=		10


										

										


  HRD_PARAM_1 = 1;
  HRD_PARAM_2 = 2;
  HRD_PARAM_3 = 3;
  HRD_PARAM_4 = 4;
  HRD_PARAM_5 = 5;
  HRD_PARAM_6 = 6;
  HRD_PARAM_7 = 7;
  HRD_PARAM_8 = 8;
  HRD_PARAM_9 = 9;
  HRD_PARAM_10 = 10;


  HRDPARAM_USER_ID                = 1;
  HRDPARAM_USER_EMAIL             = 2;
  HRDPARAM_USER_FIRST_NAME        = 3;
  HRDPARAM_USER_LAST_NAME         = 4;
  HRDPARAM_USER_FULL_NAME         = 5;
  HRDPARAM_USER_PASSWORD          = 6;
  HRDPARAM_USER_ACCOUNT           = 7;
  HRDPARAM_USER_BIRTHDAY          = 8;
  HRDPARAM_USER_START_DATE        = 9;
  HRDPARAM_USER_END_DATE          =10;


// Result Output

	AAAAAAAAAS								=		1
	AAAAAAAAAAA								=		2
	AAAAAAAAAA								=		3
	//output201701272144185814								=		4
	//output201701272144185825								=		5
	//output201701272144185826								=		6
	//output201701272144185827								=		7
	//output201701272144185838								=		8
	//output201701272144185839								=		9
	//output2017012721441858310								=		10

<<<<<<< HEAD

										=======
			
>>>>>>> origin/chhunly

                    HRD_RESULT_10 = 10;

  HRDRESULT_JOB_ID                = 1;
  HRDRESULT_JOB_TITLE             = 2;
  HRDRESULT_JOB_COMPANY           = 3;
  HRDRESULT_JOB_SALARY            = 4;
  HRDRESULT_JOB_CATEGORY          = 5;
  HRDRESULT_JOB_LOCATION          = 6;
  HRDRESULT_JOB_CLOSE_DATE        = 7;
  HRDRESULT_JOB_DETAIL            = 8;
  //input201701231202432089 =9
  //input2017012312024320910  =10

// End of Result Output
implementation

end.