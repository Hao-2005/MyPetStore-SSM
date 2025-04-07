package org.csu.petstore.security;

import org.springframework.stereotype.Component;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.security.Keys;

import java.security.Key;
import java.util.Date;

@Component
public class JwtUtil {
    private final String SECRET_KEY = "mysecretkeymysecretkeymysecretkey";
    private final long EXPIRATION_TIME = 1000 * 60 * 60;
    private final Key key = Keys.hmacShaKeyFor(SECRET_KEY.getBytes());

    //生成token
    public String generateToken(String username) {
        return Jwts.builder()
                .setSubject(username)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXPIRATION_TIME))
                .signWith(key, SignatureAlgorithm.HS256)
                .compact();
    }

    //解析token
    public String extractUsername(String token) {
        return Jwts.parserBuilder()
                .setSigningKey(key)
                .build()
                .parseClaimsJws(token)
                .getBody()
                .getSubject();
    }

    //验证token是否有效
    public boolean validateToken(String token) {
        try {
            Jwts.parserBuilder().setSigningKey(key).build();
            return true;
        }catch (Exception e) {
            return false;
        }
    }
}
