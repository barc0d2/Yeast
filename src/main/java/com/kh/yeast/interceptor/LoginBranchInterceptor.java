package com.kh.yeast.interceptor;

import com.kh.yeast.domain.vo.Member;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginBranchInterceptor implements HandlerInterceptor {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        if(session.getAttribute("loginUser") != null) {
            Member member = (Member) session.getAttribute("loginUser");
            String positionName = member.getPositionName();
            if(positionName.startsWith("B")){
                return true; // 계속 실행
            }else{
                session.setAttribute("alertMsg", "가맹점 관리자만 이용할 수 있는 서비스입니다.");
                response.sendRedirect("/");
            }
        } else {
            session.setAttribute("alertMsg", "로그인 후 이용 가능한 서비스입니다.");
            response.sendRedirect("/");
        }
        return false;
    }
}
