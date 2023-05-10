package com.spring.ecomspring.util;


import java.util.ArrayList;
import java.util.List;

public class StringUtil {

    /**
     * Elimina los espacios vacíos al principio y al final de una cadena de texto
     *
     * @param str cadena de texto a limpiar
     * @return String cadena de texto sin espacios al principio y al final
     */
    public static String trim(String str){
        return str == null ? null : str.trim();
    }

    /**
     * Elimina los espacios vacios al principio y al final de una lista de String
     *
     * @param list lista de cadena de texto a limpiar
     * @return List<String> lista de cadena de texto sin espacios vacíos al principio y al final
     */
    public static List<String> trim(List<String> list){
        List<String> trimmedList = new ArrayList<>();
        for( String str: list ){
            trimmedList.add(trim(str));
        }
        return trimmedList;
    }


}
