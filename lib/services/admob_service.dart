import 'dart:io';


class AdMobService
{
    String getAdMobAppId()
    {
      if(Platform.isIOS)
        {
          return 'ca-app-pub-8819622948893103~2690618036';
        }
      else if(Platform.isAndroid)
      {
        return 'ca-app-pub-8819622948893103~8457309401';
      }
      return null;
    }

    String getBannerAdId()
    {
      if(Platform.isIOS)
      {
        return 'ca-app-pub-3940256099942544/2934735716';
      }
      else if(Platform.isAndroid){
        return 'ca-app-pub-3940256099942544/2934735716';
      }
      return null;
    }
}