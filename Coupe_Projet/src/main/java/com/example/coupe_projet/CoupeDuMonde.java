package com.example.coupe_projet;

import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.Label;

import java.io.IOException;

public class CoupeDuMonde {


    public CoupeDuMonde(){

    }

    @FXML
    private Button question1;
    @FXML
    private Button question2;
    @FXML
    private Button question3;
    @FXML
    private Button question4;
    //label pour lancer les questions
    @FXML
    private Label questionL;
    //celle pour lancer les reponses
    @FXML
    private Label reponseL;

    //Afficher la question et la reponse 1
    public void showQuestion1(ActionEvent event) throws IOException {
    questionL.setText("Donnez le nom et prénom de l’arbitre qui a donné le plus\n " +
            "de sanctions pendant les matchs de finale.");
    }

    //Afficher la question et la reponse 2
    public void showQuestion2(ActionEvent event) throws IOException {
        questionL.setText("Donnez le nom et la ville des stades dans lesquels \n a joué le joueur " +
                "Lionel Messi aux éditions 2014 et 2018.");
    }

    //Afficher la question et la reponse 3
    public void showQuestion3(ActionEvent event) throws IOException {
        questionL.setText("Nom, prénom et expertise des collaborateurs \n des équipes en finale de l’édition 2018.");
    }

    //Afficher la question et la reponse 4
    public void showQuestion4(ActionEvent event) throws IOException {
        questionL.setText("Donnez le nom, le prenom et l’equipe des joueurs\n par ordre  du plus jeune étant " +
                "née entre 1985 et 1995\n portant un  numero  supérieur ou  égale \n à 10" +
                " et inferieur a 20 et n’étant  pas attaquant \n et qui  ont reçue au moins " +
                "deux sanctions \n jaune a l'édition 2014.");
    }

}
