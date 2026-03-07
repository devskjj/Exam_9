package kg.attractor.exam_9.exception;

import java.util.NoSuchElementException;

public class AccountNotFoundException extends NoSuchElementException {
    public AccountNotFoundException(String message) {
        super(message);
    }
}
