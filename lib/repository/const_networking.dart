// ignore_for_file: unused_field

class ConsentNetworking {
  // url api
  final String _urlApi = "bacend-fshi.onrender.com";
  //auth endpoint
  final String _registration = '/auth/registration';
  final String _login = '/auth/login';
  final String _verification = '/auth/verification';

//upload image endpoint
  final String _upload = '/user/upload';
//About endpoint
  final String _getAbout = '/user/about';
  final String _editAbout = '/user/edit/about';
  final String _deleteAbout = '/user/delete_account';
  //Projects endpoint
  final String _getProjects = '/user/projects';
  final String _editProject = '/user/add/project';
  final String _deleteProject = '/user/delete/project';
  //Skills endpoint
  final String _getSkills = '/user/skills';
  final String _editSkills = '/user/add/skills';
  final String _deleteSkills = '/user/delete/skills';
  //SocialMedia  endpoint
  final String _getSocialMedia = '/user/social_media';
  final String _editSocialMedia = '/user/add/social_media';
  final String _deleteSocialMedia = '/user/delete/social_media';
  //Education endpoint
  final String _getEducation = '/user/education';
  final String _editEducation = '/user/add/education';
  final String _deleteEducation = '/user/delete/education';
  //Projects endpoint
  final String _getAllUsers = '/user/get_users';
}
