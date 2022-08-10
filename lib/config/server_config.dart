


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
static String showOneTask='api/show/details/1';
static String showCompletedTasks='api/show/completed/tasks';
static String showMissedTasks='api/show/missed/tasks';
static String  showOnProgressTasks='api/show/progress/tasks';

//-------------------Team----------------------
  static String addTeam='api/admin/department/add';

}