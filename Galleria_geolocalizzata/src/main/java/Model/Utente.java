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

}