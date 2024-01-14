/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ervan.mahasiswa.controller;

import com.ervan.mahasiswa.entity.Mahasiswa;
import com.ervan.mahasiswa.service.MahasiswaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author LABP2COMDOSEN
 */
@RestController
@RequestMapping("api/v1/mahasiswa")
public class MahasiswaController {
    
    @Autowired
    private MahasiswaService mahasiswaService;
    
    @GetMapping
    public List<Mahasiswa> getAll(){
        return mahasiswaService.getAll();
    }
    
    @GetMapping(path = "{id}")
    public Mahasiswa getMahasiswa(@PathVariable("id") Long id){
        return mahasiswaService.getMahasiswa(id); 
    }
    
    @PostMapping
    public void insert(@RequestBody Mahasiswa mahasiswa){
        mahasiswaService.insert(mahasiswa); 
    }
    
    @DeleteMapping(path = "{mahasiswaId}")
    public void delete(@PathVariable("mahasiswaId") Long id) {
        mahasiswaService.delete(id); 
    }
    
    @PutMapping(path = "{mahasiswaId}")
    public void update(@PathVariable("mahasiswaId") Long MahasiswaId,
            @RequestParam(required = false) String nama,
            @RequestParam(required = false) String email){
        mahasiswaService.update(MahasiswaId, nama, email); 
    }
}
