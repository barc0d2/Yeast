package com.kh.yeast.config;


import com.kh.yeast.interceptor.CompanySpecificationInterceptor;
import com.kh.yeast.interceptor.LoginBranchInterceptor;
import com.kh.yeast.interceptor.LoginCompanyInterceptor;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new LoginCompanyInterceptor())
                .addPathPatterns("/company/**")
                .excludePathPatterns("/static/", "/error/**",
                        "/company/mypage/updatePwdForm",
                        "/company/updatePwd",
                        "/company/mypage/myPage",
                        "/branch/mypage/updatePwdForm",
                        "/branch/updatePwd",
                        "/branch/mypage/myPage"
                        );
        registry.addInterceptor(new LoginBranchInterceptor())
                .addPathPatterns("/branch/**")
                .excludePathPatterns("/static/", "/error/**");
/*        registry.addInterceptor(new CompanySpecificationInterceptor())
                .addPathPatterns("/company/specification/**")
                .excludePathPatterns("/static/", "/error/**");*/
    }
}