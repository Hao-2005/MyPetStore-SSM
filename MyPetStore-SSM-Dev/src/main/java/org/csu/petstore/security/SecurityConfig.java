package org.csu.petstore.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;

@Configuration
public class SecurityConfig {
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, JwtAuthFilter jwtAuthFilter) throws Exception {
        http.csrf(csrf -> csrf.disable())
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/api/v1/auth/login","/api/v1/account","/api/v1/auth/login/forget"
                        ,"/api/v1/account/me","/api/v1/account/me/myOrders", "/api/v1/account/me/myJournal"
                        ,"/api/v1/account/me/info","api/v1/auth/resetPsw","api/v1/account/myOrders/cancel"
                        ,"/carts","/carts/{itemId}","/favouriteList","/orders","/orders/{orderId}"
                        ,"/addresses/{addressId}","/orders/addresses", "/catalog/**", "/images/**")
                        .permitAll()
                        .anyRequest().authenticated()
                ).addFilterBefore(jwtAuthFilter, UsernamePasswordAuthenticationFilter.class);

        return http.build();
    }
}
