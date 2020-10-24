package com.example.geolocationtrial;

import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.os.Build;

import io.flutter.app.FlutterApplication;

public class MyApplication extends FlutterApplication {

    @Override
    public void onCreate() {
        super.onCreate();
if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
    NotificationChannel channel =new NotificationChannel("messages","Messages", NotificationManager.IMPORTANCE_LOW);
    NotificationManager manager=getSystemService(NotificationManager.class);
    manager.createNotificationChannel(channel);


}
    }

}
