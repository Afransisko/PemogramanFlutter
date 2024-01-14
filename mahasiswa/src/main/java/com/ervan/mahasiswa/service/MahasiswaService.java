/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ervan.mahasiswa.service;

import com.ervan.mahasiswa.entity.Mahasiswa;
import com.ervan.mahasiswa.repository.MahasiswaRepository;
import jakarta.transaction.Transactional;
import java.util.List;
import java.util.Objects;
import java.util.Optional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author LABP2COMDOSEN
 */
@Service
public class MahasiswaService {
    
    private final MahasiswaRepository mahasiswaRepository;
    
    @Autowired
    public MahasiswaService(MahasiswaRepository mahasiswaRepository) {
        this.mahasiswaRepository = mahasiswaRepository;
    }
    
    public List<Mahasiswa> getAll(){
        return mahasiswaRepository.findAll();
    }
    
    public Mahasiswa getMahasiswa(Long idmahasiswa){
        return mahasiswaRepository.findById(idmahasiswa).get();
    }
    
    public void insert(Mahasiswa mahasiswa){
        Optional<Mahasiswa> mahasiswaOptional = 
                mahasiswaRepository.findMahasiswaByEmail(mahasiswa.getEmail());
        if(mahasiswaOptional.isPresent()){
            throw new IllegalStateException("Email sudah ada");
        }
        mahasiswaRepository.save(mahasiswa);
    }
    
    public void delete(Long mahasiswaId){
        boolean ada = mahasiswaRepository.existsById(mahasiswaId);
        if(!ada){
            throw new IllegalStateException("Mahasiswa ini tidak ada");
        }
        mahasiswaRepository.deleteById(mahasiswaId); 
    }
    
    @Transactional
    public void update(Long mahasiswaId, String nama, String email) {
        Mahasiswa mahasiswa = mahasiswaRepository.findById(mahasiswaId)
                .orElseThrow(()->new IllegalStateException("Mahasiswa tidak ada"));
        if(nama!=null && nama.length()>0 && !Objects.equals(mahasiswa.getNama(), nama)) {
            mahasiswa.setNama(nama); 
        }
        
        if(email != null && email.length() > 0 && !Objects.equals(mahasiswa.getEmail(), email)) {
            Optional<Mahasiswa> mahasiswaOptional = mahasiswaRepository.findMahasiswaByEmail(email);
            if(mahasiswaOptional.isPresent()){
                throw new IllegalStateException("Email sudah ada");
            }
            mahasiswa.setEmail(email);
        }
    }
}
