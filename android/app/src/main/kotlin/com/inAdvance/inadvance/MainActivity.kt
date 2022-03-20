package com.inAdvance.inadvance
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import com.yandex.mapkit.MapKitFactory

class MainActivity: FlutterActivity() {
  override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
    MapKitFactory.setApiKey("2c0e7a02-a90c-45f4-9df3-21d992f21d15") // Your generated API key
    super.configureFlutterEngine(flutterEngine)
  }
}
