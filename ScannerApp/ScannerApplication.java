package com.example.scannerapp;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.HashMap;
import java.util.Map;

@SpringBootApplication
@RestController
@RequestMapping("/api")
public class ScannerApplication {

    public static void main(String[] args) {
        SpringApplication.run(ScannerAppApplication.class, args);
    }

    @PostMapping("/scan")
    public Map<String, Object> handleScan(@RequestParam String data, @RequestParam String type) {
        Map<String, Object> response = new HashMap<>();
        response.put("timestamp", Instant.now().toString());
        response.put("location", type.equals("IN") ? "specific location" : "IN TRANSIT");
        response.put("data", data);
        return response;
    }
}
