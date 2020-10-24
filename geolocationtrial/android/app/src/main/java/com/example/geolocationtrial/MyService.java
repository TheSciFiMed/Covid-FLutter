package com.example.geolocationtrial;

import android.app.NotificationManager;
import android.app.Service;
import android.content.Intent;
import android.os.Build;
import android.os.IBinder;

import androidx.annotation.Nullable;
import androidx.core.app.NotificationCompat;

public class MyService extends Service {

    @Override
    public void onCreate() {
        super.onCreate();
        if(Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            NotificationManager manager=getSystemService(NotificationManager.class);
            NotificationCompat.Builder builder=new NotificationCompat.Builder(this,"messages").setContentText("This is running in BackGround")
                    .setContentTitle("Flutter Background").setSmallIcon()
                    ;

        }

    }

    @Nullable
    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}
