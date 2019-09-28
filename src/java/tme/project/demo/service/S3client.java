/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tme.project.demo.service;

import com.amazonaws.AmazonClientException;
import com.amazonaws.AmazonServiceException;
import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;
import java.io.InputStream;

/**
 *
 * @author Sumatinnn
 */
public class S3client {
    private static String bucketName = "tellmeemergency";
    private final static AWSCredentials awsCreds = new BasicAWSCredentials("AKIAZ5HT7LDXN3YI256R", "UghhbHTQB3FGHxSSUuJluUmvE820QuDCCi8hQPnN");
    
    public String upload(String keyname, InputStream in, ObjectMetadata om){
        AmazonS3 s3Client = AmazonS3ClientBuilder
                .standard()
                .withCredentials(new AWSStaticCredentialsProvider(awsCreds))
                .withRegion(Regions.AP_SOUTHEAST_1)
                .build();
        try {
            s3Client.putObject(new PutObjectRequest(bucketName, "images/"+ keyname, in, om).withCannedAcl(CannedAccessControlList.PublicRead));
            return "https://" + bucketName + ".s3.amazonaws.com/images/" + keyname;
        } catch(AmazonServiceException ase){
            System.out.println("Amazon Service Exception!!!");
            System.out.println("Error massage: "+ase.getMessage());
            return null;
        } catch(AmazonClientException ace){
            System.out.println("Error Massage: "+ace.getMessage());
            return null;
        }
    }
}
