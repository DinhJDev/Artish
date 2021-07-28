package com.artish.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;

import com.artish.models.Login;
@Component
public class LoginValidator implements Validator {
    
    //    1
    @Override
    public boolean supports(Class<?> clazz) {
        return Login.class.equals(clazz);
    }
    
    // 2
    @Override
    public void validate(Object object, Errors errors) {
        Login user = (Login) object;
        
        if (!user.getPasswordConfirmation().equals(user.getPassword())) {
            // 3
            errors.rejectValue("passwordConfirmation", "Match");
        }         
    }
}