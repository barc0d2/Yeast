package com.kh.yeast.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer{

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        // static 폴더 내의 모든 리소스에 대한 매핑
        registry.addResourceHandler("/static/**")
                .addResourceLocations("classpath:/static/");
        
        // css 파일에 대한 명시적 매핑
        registry.addResourceHandler("/css/**")
                .addResourceLocations("classpath:/static/css/");
    }

}