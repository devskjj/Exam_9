package kg.attractor.exam_9.service;

import kg.attractor.exam_9.error.CustomErrorResponse;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class ErrorService {

    public CustomErrorResponse makeErrorResponse(Exception e) {
        String message = e.getMessage();
        CustomErrorResponse errorResponse = new CustomErrorResponse();
        errorResponse.setErrorMessage(message);
        errorResponse.setReasons(Map.of("errors", List.of(message)));
        return errorResponse;
    }

    public CustomErrorResponse makeErrorResponse(BindingResult bindingResult) {
        Map<String, List<String>> reasons = new HashMap<>();
        bindingResult.getFieldErrors().stream().
                filter(err -> err.getDefaultMessage() != null).
                forEach(e -> {
                    List<String> errors = new ArrayList<>();
                    errors.add(e.getDefaultMessage());
                    if (!reasons.containsKey(e.getField())) {
                        reasons.put(e.getField(), errors);
                    }
                });

        CustomErrorResponse errorResponse = new CustomErrorResponse();
        errorResponse.setErrorMessage("Validation error");
        errorResponse.setReasons(reasons);
        return errorResponse;
    }
}
