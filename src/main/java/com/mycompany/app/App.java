package com.mycompany.app;

/**
 * Hello world!
 */
public class App
{

    private final String message = "*************\nIf you are seeing this then you have successfully build my-app\n- Into a docker container\n- via a Jenkins pipeline\nHello World!\n*************";

    public App() {}

    public static void main(String[] args) {
        App myapp = new App();
        System.out.println(myapp.getAppVersion());
        System.out.println(myapp.getMessage());
    }

    private final String getMessage() {
        return message;
    }

    public final String getAppVersion() {
        java.util.Properties p = new java.util.Properties();
        java.io.InputStream sreader;
        String AppName = "Application Name: ";
        String AppVersion = "Application Version: ";

        // Get Maven XML app information can be updated in the POM.XML
        try {
            Package mainPackage = this.getClass().getPackage();
            AppVersion += mainPackage.getImplementationVersion();
            AppName += mainPackage.getImplementationTitle();
        } catch (Exception e) { 
            // return empty 
            System.out.println(e.toString());
        }

        // Build Version output from Jenkins
        AppVersion += " build ";
        try {
            sreader = getClass().getResourceAsStream("/build.properties");
            p.load(sreader);
            AppVersion += p.getProperty("build") != null ? p.getProperty("build") : "";
        } catch (Exception e) { 
            // return empty 
            System.out.println(e.toString());
        }

        return AppName + "\n" + AppVersion;
    }

}
