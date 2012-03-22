/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.ids.util;

import java.io.UnsupportedEncodingException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author bankiiee
 */
public class Utility {
    public String convertThai(String text){
        try {
            return new String(text.getBytes("ISO8859_1"),"TIS-620");
        } catch (UnsupportedEncodingException ex) {
           ex.printStackTrace();
            return null;
        }
        }
    
}
