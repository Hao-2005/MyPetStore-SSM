package org.csu.petstore.rest.restcontroller;


import org.apache.coyote.Response;
import org.csu.petstore.rest.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/admin")
public class AdminController {

    @Autowired
    private AdminService adminService;

    @GetMapping("/login")
    public ResponseEntity<Map<String, Boolean>> login(
            @RequestParam(name="username") String username,
            @RequestParam(name="password") String password) {

        Map<String, Boolean> res = new HashMap<>();
        if (adminService.findByUsernameAndPassword(username, password)) {
            res.put("status", true);
            return ResponseEntity.ok(res);
        } else {
            res.put("status", false);
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(res);
        }
    }

    @GetMapping("/register")
    public ResponseEntity<Map<String, Boolean>> register(
            @RequestParam(name="username") String username,
            @RequestParam(name="password") String password,
            @RequestParam(name="confirmPassword") String confirmPassword) {
        Map<String, Boolean> res = new HashMap<>();
        if (adminService.findByUsername(username) || !password.equals(confirmPassword)) {
            res.put("status", false);
            return ResponseEntity.status(HttpStatus.CONFLICT).body(res);
        }
        int line = adminService.insert(username, password);
        if (line == 1) {
            res.put("status", true);
            return ResponseEntity.ok(res);
        } else {
            res.put("status", false);
            return ResponseEntity.status(HttpStatus.CONFLICT).body(res);
        }
    }
}
