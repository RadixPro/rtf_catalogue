package org.readthisfirst.cat;

import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class ReadThisFirstApplication implements CommandLineRunner {

    public static void main(String[] args) {

        SpringApplication.run(ReadThisFirstApplication.class, args);
    }

    @Override
    public void run(String... strings) throws Exception {
        System.out.println("Started...");
    }
}
