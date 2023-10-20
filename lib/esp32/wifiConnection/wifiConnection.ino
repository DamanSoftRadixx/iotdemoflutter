#include <WiFi.h>
#include <ESPAsyncWebServer.h>

const char* ssid = "esp32";
const char* password = "12345678";
AsyncWebServer server(80);
const int relayPin = 2; // GPIO pin connected to the relay

void setup() {
  Serial.begin(115200);

  pinMode(relayPin, OUTPUT);
  digitalWrite(relayPin, LOW);

  // Set ESP32 as an access point
  WiFi.softAP(ssid, password);

  Serial.print("Access Point SSID: ");
  Serial.println(ssid);
  Serial.print("Access Point Password: ");
  Serial.println(password);
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
  // Your main loop code
}