package com.mycompany.app;

/**
 * Hello world!
 */
public class App
{

    private final String message = "*************\nIf you are seeing this then you have successfully build my-app\n- Into a docker container\n- via a Jenkins pipeline\nHello World!\n*************";

    public App() {}

    public static void main(String[] args) {
        System.out.println(new App().getMessage());
    }

    private final String getMessage() {
        return message;
    }

}
