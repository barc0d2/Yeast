package com.kh.yeast.globalException;

import com.kh.yeast.customException.PaymentTransactionException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class GlobalException {
    @ExceptionHandler(Exception.class)
    public String handleException(Exception e, Model model) {
        model.addAttribute("errorMsg", "서버에 문제가 생겼습니다.");
        return "errorPage";
    }

    @ExceptionHandler(NullPointerException.class)
    public String NullPointerException(Exception e, Model model) {
        model.addAttribute("errorMsg", "처리되지 못한 데이터가 존재합니다.");
        return "errorPage";
    }

    @ExceptionHandler(PaymentTransactionException.class)
    public String PaymentTransactionException(Exception e, Model model) {
        model.addAttribute("errorMsg", e.getMessage());
        return "errorPage";
    }

}
