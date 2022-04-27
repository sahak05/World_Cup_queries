package com.example.coupe_projet;

import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;

public class JavaPostgreSql {

    public static String fetchToDatabse(int number){

        String url = "jdbc:postgresql://localhost:5432/Projet3";
        String user = "postgres";
        String password = "A0j5a0o5";
       String query="";

        if(number ==1){
            query = "with r1 as (select * from  Match   where rang='Finale'),\n" +
                    "arbitre1 as (select nom_a,prenom_a,arbitre_id from Arbitre),\n" +
                    "sanction1 as (select sanction_id, arbitre_id, dateM from Sanction),\n" +
                    "r2 as (select * from r1 natural join Gerer_par ),\n" +
                    "r3 as (select * from r2 NATURAL JOIN sanction1 ),\n" +
                    "r4 as (select * from r3 NATURAL JOIN arbitre1 ),\n" +
                    "r5 as (select nom_a,prenom_a, count(sanction_id) as nombre_sanctions from r4 \n" +
                    " GROUP BY  nom_a,prenom_a )\n" +
                    "select * from r5  where\n" +
                    "nombre_sanctions >= all (select nombre_sanctions from r5);";
        }
        else if (number ==2){
            query = "With rjoueur as (select * from Joueur where nom ='Messi' AND prenom='Lionel'),\n" +
                    "  joueur_1 as(select joueur_id from rjoueur),\n" +
                    "  rEdition as (select * from Appartient where edition in (2014,2018)),\n" +
                    "  appartient_1 as (select joueur_id, nation from rEdition),\n" +
                    "  stade_1 as (select nom_stade, ville from Stade),\n" +
                    "  match_1 as (select nation1, nation2, edition,nom_stade from Match),\n" +
                    "  r1 as (select * from joueur_1 natural join appartient_1),\n" +
                    "r2 as (select * from r1 natural join match_1 where nation=nation1),\n" +
                    "  r3 as (select * from r1 natural join match_1 where nation=nation2),\n" +
                    "  r4 as (select * from r2 union select * from r3),\n" +
                    "  r5 as (select  nom_stade, ville from r4 natural join stade_1)\n" +
                    "  select * from r5;\n" +
                    "  "
            ;


        }else if(number ==3){
            query = "with r1 as(select collaborateur_id, nom_C, prenom_C, expertise from Collaborateur),\n" +
                    "r2 as(select nation1,nation2, edition from Match where edition=2018 AND rang='Finale'),\n" +
                    "r3 as (select * from r1 natural join Collabore),\n" +
                    "r4 as (select * from r2 natural join r3),\n" +
                    "r5 as (select * from r4 natural join r2 where nation= nation1),\n" +
                    "r6 as (select nation,nom_C, prenom_C, expertise  from r5 UNION (select nation, nom_C, prenom_C, expertise  from r4 natural join r2 where nation= nation2))\n" +
                    "select * from r6;"
            ;


        } else if (number ==4){
            query = "With r1 as (select * from Joueur where \n" +
                    " ( date_de_naissance BETWEEN '1985-01-01' AND '1995-01-01' )\n" +
                    "Order by date_de_naissance ),\n" +
                    "r2 as (select * from Appartient where (numero between 10 and 19) and position != 'Attaquant' AND edition=2014),\n" +
                    "r3 as (select * FROM r1 NATURAL JOIN r2),\n" +
                    "r4 as (select * from r3 NATURAL JOIN Sanction WHERE couleur= 'Jaune')\n" +
                    "select nom, prenom, nation from r4 \n" +
                    "GROUP BY nom,prenom,nation\n" +
                    "HAVING Count(couleur) >=2 ; "
            ;
        }

        try(Connection con = DriverManager.getConnection(url, user, password);

                //TODO : HERE SQL avec if else pour chaque question 1 2 3 4
            //TODO: on peut creer des views dans le sql et en faire l'appel


        ) {

            PreparedStatement preparedStatement = con.prepareStatement(query);

            ResultSet resultSet = preparedStatement.executeQuery();
            String result= "";
            while(resultSet.next()){
                if(number==2){
                    result+=resultSet.getString("nom_stade")+"------------- "+resultSet.getString("ville")+"\n";
                }
                else if (number == 1){
                    result+=resultSet.getString("nom_a")+"------------- "+resultSet.getString("prenom_a")+
                           "------------------"+ resultSet.getInt("nombre_sanctions") + "\n";
                }else if (number == 3){
                    result+=resultSet.getString("nation")+"-------"+resultSet.getString("nom_C")+
                            "-------"+resultSet.getString("prenom_C")+
                            "-----------"+ resultSet.getString("expertise") + "\n";
                } else if (number == 4){
                    result+=resultSet.getString("nom")+"-------"+resultSet.getString("prenom")+
                            "-------"+resultSet.getString("nation")+ "\n";
                }

            }


            resultSet.close();
            preparedStatement.close();

            return result;
        } catch (SQLException ex) {
            Logger lgr = Logger.getLogger(JavaPostgreSql.class.getName());
            lgr.log(Level.SEVERE, ex.getMessage(), ex);

            return "ERROR";
        }
    }
}
