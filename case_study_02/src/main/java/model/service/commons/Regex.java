package model.service.commons;

public class Regex {
    String CUSTOMER_CODE = "^KH-\\d{4}$";
    String SERVICE_CODE = "^DV-\\d{4}$";
    String PHONE_NUMBER = "^(09[0-1]\\d{7})|(\\(84\\)\\+9[01]\\d{7})$";
    String ID_CARD = "^(\\d{9}|\\d{10})";
    String EMAIL = "^[(a-z|A-Z)0-9._%+-]+@[a-z0-9.-]+\\.[a-z]{2,6}$";
    String NUMBER_POSITIVE = "^[+]?([.]\\d+|\\d+[.]?\\d*)$";
    String REGEX_NAME = "^[A-Z][a-z]+([ ][A-Z][a-z]+)+$";
}
