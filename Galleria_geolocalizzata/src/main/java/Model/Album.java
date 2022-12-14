package Model;


import java.util.ArrayList;

public class Album {
    private String codAlbum;
    private String nomeAlbum;
    private ArrayList<Foto> photos;
    public Album (String a, String b){
        this.codAlbum=a;
        this.nomeAlbum=b;
    }

}
