package com.example.antidrugs;
import androidx.annotation.NonNull;
import com.yandex.mapkit.MapKitFactory;
import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;

public class MainActivity extends FlutterActivity {
    @Override
    public void configureFlutterEngine(@NonNull FlutterEngine flutterEngine) {
        MapKitFactory.setApiKey("e144373a-d035-4a90-b8bc-74defaf038f2"); // Your generated API key
        super.configureFlutterEngine(flutterEngine);
    }
}
