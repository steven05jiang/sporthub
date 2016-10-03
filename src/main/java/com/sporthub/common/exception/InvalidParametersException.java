package com.sporthub.common.exception;

@SuppressWarnings("serial")
public class InvalidParametersException extends SporthubException {
    public InvalidParametersException(String message) {
        super(message);
    }

    public InvalidParametersException(String specificErrorcode, String message) {
        super(specificErrorcode, message);
    }
}
