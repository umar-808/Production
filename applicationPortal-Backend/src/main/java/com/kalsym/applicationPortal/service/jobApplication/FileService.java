/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.service.jobApplication;

import com.kalsym.applicationPortal.dao.jobApplication.FileRepository;
import com.kalsym.applicationPortal.model.jobApplication.File;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kalsym
 */
@Service
public class FileService {

    @Autowired
    private FileRepository repository;

    public File saveFile(MultipartFile file) throws IOException {
        String fileName = file.getOriginalFilename();
        try {
            File file1 = new File(fileName, file.getContentType(), file.getBytes());
            return repository.save(file1);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public File getFile(Long id) {
        return repository.findById(id).get();
    }

    public List<File> getAllFiles() {
        return repository.findAll();
    }
}

