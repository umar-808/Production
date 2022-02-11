/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.kalsym.applicationPortal.controller.jobApplication;

import com.kalsym.applicationPortal.model.jobApplication.File;
import com.kalsym.applicationPortal.service.jobApplication.FileService;
import java.io.IOException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author kalsym
 */
@RestController
@CrossOrigin("*")
public class FileController {

    @Autowired
    private FileService fileService;

    @GetMapping("/files")
    public List<File> get() {
        return fileService.getAllFiles();
    }

    @PostMapping("/files")
    public File saveFile(@RequestParam("file") MultipartFile file) throws IOException {
        if (!file.isEmpty()) {
            return fileService.saveFile(file);
        } else {
            return null;
        }
    }
}