abstract class NewsStates{}
class NewsInitialStates extends NewsStates{
}
class NewsBottomNavStates extends NewsStates{}

class ChangeAge extends NewsStates{}
class SufiuxIcon extends NewsStates{}
class PasswordStates extends NewsStates{}
class ChangeFloatPlus extends NewsStates{}
class ChangeFloatMin extends NewsStates{}



class NewsBusinessErrorStates extends NewsStates{
  final String error;
  NewsBusinessErrorStates(this.error);
}