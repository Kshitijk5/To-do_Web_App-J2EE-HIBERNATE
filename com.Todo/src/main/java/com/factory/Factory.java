package com.factory;


import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import com.entity.NoteEntity;

public class Factory {
  public static SessionFactory sf;
  
 
  public static  SessionFactory getInstance() {
	  if(sf!=null)
	     return sf;
	  
	 sf= new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(NoteEntity.class).buildSessionFactory();
	 return sf;
	  
  }
  
}
