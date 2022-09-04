


class ServerConfig{



  static String  domainName='http://192.168.1.103:8000/';

  //------------Auth-------------------
  static String login='api/auth/login';
static String logout='api/logout';


//--------------User-----------------------------

static String addUser='api/admin/user/add';
  static String editUser='api/admin/user/update/';
static String deleteUser='api/admin/user/delete/';
static String showUsers='api/admin/user/show/users';

//------------------Task----------------------
static String addTask='api/admin/task/add';
static String editTask='api/admin/task/update/';
static String deleteTask='api/admin/task/delete/';
static String showTasks='api/show/MyTask';

static String showOneTask='api/show/details/';
static String showCompletedTasks='api/show/completed/tasks';
static String showMissedTasks='api/show/missed/tasks';
static String  showOnProgressTasks='api/show/progress/tasks';
static String showToDoTasks='api/show/todo/tasks';
static String SearchOfTask='api/search/task';

//-------------------Team----------------------
  static String showReports='api/show/report/';
  static String addTeam='api/admin/department/add';
  static String editTeam='api/admin/department/update/';
  static String deleteTeam='api/admin/department/delete/';
  static String addMeeting='api/admin/meeting/add';
  static String teamName='api/admin/department/show/team/name/';


  static String showTeams='api/admin/department/show/team';
  static String editMeeting='api/admin/meeting/update/';
  static String meetingStates='api/show1';
  static String showAteam='api/admin/department/show/team/';
  static String showMeetings='api/show/MyMeeting';
  static String stateName='api/show1/name/';
  static String deleteMeeting='api/admin/meeting/delete/';
  static String showMeeting='api/show/OneMeeting/';
  static String myTeam='api/show/MyTeam';
  static String acheivers='api/achiever/show/';
  static String showSubtask='api/show/one/subtask/';
//-------------------Calendar-------------------
static String addEvent='api/add/event';
static String editEvent='api/edit/event/';
static String deleteEvent='api/delete/event/';
static String showMyEvents='api/show/events';
static String showOneEvent='api/show/event/';

//------------------Priorityy-------------

static String showOnePriority='api/show3/name/1';
static String ShowAllPriority='api/show3';

//--------------------Status-------------------
static String showOneStatus='api/show2/name/2';

static String showAllStatus='api/show2';

//-----------------------Role--------------
  static String showOneRole='api/show4/name/1';
  static String showAllRole='api/show4';

//---------------------Attachement----------------

static String showAllAttachement='api/task/show/my/attachment';
static String fAddAttachement='api/task/';
static String sAddAttachement='/attachment/add';




  // static String addSubtask='api/leader/task/1/subtask/create';
  //status for subatsk
  static String showSubStatuses='api/show2';
  //priority for subatsk
  static String showSubPriorites='api/show3';


















}