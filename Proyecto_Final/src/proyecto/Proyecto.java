/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package proyecto;

import controlador.Controlador;
import modelo.Modelo;
import vista.Vista;


/**
 *
 * @author Mario Alexis Guzman Mosco
 */
public class Proyecto {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Modelo m = new Modelo();
        Vista v = new Vista();
        Controlador c = new Controlador(v,m);
        c.iniciar();
        v.setVisible(true);
    }
    
}
