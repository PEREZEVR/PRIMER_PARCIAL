package com.emergentes.modelo;

import java.util.ArrayList;
import java.util.Iterator;

public class Gestorvacunas {
    private ArrayList<Vacunas> lista;
    
    public Gestorvacunas()
    {
        lista=new ArrayList<Vacunas>();
    }

    public ArrayList<Vacunas> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Vacunas> lista) {
        this.lista = lista;
    }
    public void insertar(Vacunas item){
        lista.add(item);
    }
    public void modificar(int pos, Vacunas item){
        lista.set(pos, item);
    }
    public void eleiminar(int pos){
        lista.remove(pos);
    }
    public int obtenerID()
    {
        int idaux=0;
        for (Vacunas item : lista) {
            idaux=item.getId();
        }
        return idaux+1;
    }
    public int ubicar(int id){
        int pos=-1;
        Iterator<Vacunas> it=lista.iterator();
        while(it.hasNext()){
            ++pos;
            Vacunas aux=it.next();
            if(aux.getId()==id){
                break;
            }
        }
        return pos;
    }
}
