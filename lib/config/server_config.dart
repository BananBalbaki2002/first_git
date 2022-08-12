


class ServerConfig{



  static String  domainName='http://192.168.43.44:8000/';

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
static String showToDoTasks='api/show/progress/tasks';
static String SearchOfTask='api/search/task';

//-------------------Team----------------------
  static String addTeam='api/admin/department/add';

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



}