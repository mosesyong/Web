/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author moses
 */
public class Properties {
    public static String url; 
    public static int port;
    
    public Properties(){
        String osName = System.getProperty("os.name");
        if (osName.equals("Linux")) {
            url = "18.136.212.226";
            port = 80;
        } else {
            url = "localhost";
            port = 8080;                    
        }
    }
}
