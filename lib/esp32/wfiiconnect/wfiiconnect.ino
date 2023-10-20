#include <WiFi.h>
#include <ESPAsyncWebServer.h>

const char* ssid = "vivo Y20T";
const char* password = "123456799";
const int relayPin = 2; // GPIO pin connected to the relay

AsyncWebServer server(80);

void setup() {
  Serial.begin(115200);
  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, LOW);
  // Connect to Wi-Fi
  WiFi.begin(ssid, password);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");

  // Serve a simple web page
  server.on("/", HTTP_GET, [](AsyncWebServerRequest *request){
    request->send(200, "text/html", "<button onclick=\"fetch('/toggle?state=on')\">Turn On Light</button><button onclick=\"fetch('/toggle?state=off')\">Turn Off Light</button>");
  });

  // Handle light control requests
  server.on("/toggle", HTTP_GET, [](AsyncWebServerRequest *request){
    String state = request->arg("state");
    if (state == "on") {
      digitalWrite(relayPin, HIGH);
    } else if (state == "off") {
      digitalWrite(relayPin, LOW);
    }
    request->send(200, "text/plain", "Light is " + state);
  });
  
  server.begin();
}

void loop() {
  // Your code to control the light goes here
}
