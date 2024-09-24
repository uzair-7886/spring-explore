package com.example.demo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Uzair {

    @Autowired
    private Alien alien;
    public void exampleFn(){
        // System.out.println(" My name is uzair khan");
        alien.show();
    }
}
