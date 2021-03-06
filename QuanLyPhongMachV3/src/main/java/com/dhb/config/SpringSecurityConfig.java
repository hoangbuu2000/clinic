package com.dhb.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@EnableWebSecurity
@EnableTransactionManagement
@ComponentScan(basePackages = {"com.dhb.springapp"})
public class SpringSecurityConfig extends WebSecurityConfigurerAdapter {
    @Autowired
    private UserDetailsService userDetailsService;

    @Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.formLogin().loginPage("/login")
                .usernameParameter("username")
                .passwordParameter("password");
        http.formLogin().defaultSuccessUrl("/admin")
                .failureUrl("/login?error");
        http.logout().logoutSuccessUrl("/login");
        http.exceptionHandling()
                .accessDeniedPage("/login?accessDenied");
        http.authorizeRequests().antMatchers("/").permitAll()
                .antMatchers("/admin")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR', 'ROLE_EMPLOYEE')")
        .antMatchers("/**/admin-management/**").access("hasRole('ROLE_ADMIN')")
        .antMatchers("/**/doctor/**").access("hasAnyRole('ROLE_ADMIN')")
                .antMatchers("/**/patient/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR', 'ROLE_EMPLOYEE')")
                .antMatchers("/**/employee/**").access("hasAnyRole('ROLE_ADMIN')")
                .antMatchers("/**/appointment/**").access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR', 'ROLE_EMPLOYEE')")
        .antMatchers("/**/schedule/**")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR')")
        .antMatchers("/**/disease/**")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR')")
        .antMatchers("**/medicine/**")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR')")
        .antMatchers("/**/prescription/**")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR')")
        .antMatchers("/**/invoice/**")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_EMPLOYEE')")
        .antMatchers("/**/chart/**")
                .access("hasAnyRole('ROLE_ADMIN', 'ROLE_DOCTOR')");
        http.csrf().disable();
    }
}
