module com.example.coupe_projet {
    requires javafx.controls;
    requires javafx.fxml;
    requires java.sql;


    opens com.example.coupe_projet to javafx.fxml;
    exports com.example.coupe_projet;
}