package GUI;
import Controller.Controller;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

public class Login {

    private static JFrame frame1;
    private  JButton loginButton;
    private JButton registerButton;
    private JTextField userIDField;
    private JPasswordField userPassField;
    private JLabel userIDLabel;
    private JLabel userPassLabel;
    private JPanel rootPanel;
    private JLabel loginLabel;

    private Controller controller;

    public Login(){
        controller = new Controller();

        registerButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {


            }
        });

        loginButton.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {

            }
        });



    }

    public static void main (String[] args){

        frame1 = new JFrame("Login");
        frame1.setContentPane(new Login().rootPanel);
        frame1.pack();
        frame1.setVisible(true);
    }

}
