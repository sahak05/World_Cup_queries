package com.example.coupe_projet;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JavaPostgreSql {

    public static void fetchToDatabse(int number){

        String url = "jdbc:postgresql://localhost:5432/Projet3";
        String user = "postgres"; //TODO: verifiez si bon user
        String password = "postgres"; //TODO: verifiez si bon password

        try(Connection con = DriverManager.getConnection(url, user, password);
                //TODO : HERE SQL avec if else pour chaque question 1 2 3 4
            //TODO: on peut creer des views dans le sql et en faire l'appel
        ) {
        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(JavaPostgreSql.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);
        }
    }
}
