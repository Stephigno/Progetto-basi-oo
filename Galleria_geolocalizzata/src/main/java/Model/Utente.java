package Model;
import java.util.Date;

public class Utente {
    private String username;
    private String password;
    Date dataReg;

    public Utente (String user, String pass, Date d){
        this.username=user;
        this.password=pass;
        this.dataReg=d;
    }


    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



}