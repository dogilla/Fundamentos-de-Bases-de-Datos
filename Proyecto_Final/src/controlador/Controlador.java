/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import modelo.Modelo;
import vista.Vista;
import vista.VistaChofer;
import vista.VistaUsuario;
import vista.VistaViaje;

/**
 *
 * @author mario
 */
public class Controlador implements  ActionListener {
    private Vista view;
    private Modelo model;
    private VistaChofer vc;
    private VistaUsuario vu;
    private VistaViaje vv;
    
    public Controlador(Vista view, Modelo model){
    this.view = view;
    this.model = model;
    this.view.rchofer.addActionListener(this);
    this.view.rusuario.addActionListener(this);
    this.view.rviaje.addActionListener(this);
    this.view.rsalir.addActionListener(this);
    }
    
    public void iniciar(){
    view.setTitle("Base de Taxis");
    view.setLocationRelativeTo(null);
    }
    
    @Override
    public void actionPerformed(ActionEvent e){
    //accion que se realiza cada que pushas un boton en el primer frame
    if(view.rchofer.equals(e.getSource())){
        this.vc = new VistaChofer();
        vc.setVisible(true);
        vc.setModelo(this.model);
    }
    if(view.rusuario.equals(e.getSource())){
        this.vu = new VistaUsuario();
        vu.setVisible(true);
        vu.setModelo(this.model);
    }
    if(view.rviaje.equals(e.getSource())){
        this.vv = new VistaViaje();
        vv.setVisible(true);
        vv.setModelo(this.model);
    }
    if(view.rsalir.equals(e.getSource())){System.exit(0);}
    view.dispose();
    }

    
}
