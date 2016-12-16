package tk.app;

import org.apache.avro.file.DataFileReader;
import org.apache.avro.file.DataFileWriter;
import org.apache.avro.io.DatumReader;
import org.apache.avro.io.DatumWriter;
import org.apache.avro.specific.SpecificDatumReader;
import org.apache.avro.specific.SpecificDatumWriter;
import tk.avro.User;

import java.io.File;
import java.io.IOException;

/**
 * Created by tarun.walia on 12/16/2016.
 */
public class CodeGen {

    public static void main(String[] args) throws IOException {


        User user1 = new User();
        user1.setName("Alyssa");
        user1.setFavoriteNumber(256);

        serialize(user1);


        deserialize(new File("users.avro"));
        // Leave favorite color null

        // Alternate constructor
        User user2 = new User("Ben", 7, "red");

        // Construct via builder
        User user3 = User.newBuilder()
                .setName("Charlie")
                .setFavoriteColor("blue")
                .setFavoriteNumber(null)
                .build();
    }

    public static void serialize(User user1) throws IOException {
        DatumWriter<User> userDatumWriter = new SpecificDatumWriter<User>(User.class);
        DataFileWriter<User> dataFileWriter = new DataFileWriter<User>(userDatumWriter);
        dataFileWriter.create(user1.getSchema(), new File("users.avro"));
        dataFileWriter.append(user1);
        //dataFileWriter.append(user2);
        //dataFileWriter.append(user3);
        dataFileWriter.close();
    }

    public static void deserialize(File file) throws IOException {
        // Deserialize Users from disk
        DatumReader<User> userDatumReader = new SpecificDatumReader<>(User.class);
        DataFileReader<User> dataFileReader = new DataFileReader<>(file, userDatumReader);
        User user = null;
        while (dataFileReader.hasNext()) {
        // Reuse user object by passing it to next(). This saves us from
        // allocating and garbage collecting many objects for files with
        // many items.
            user = dataFileReader.next(user);
            System.out.println(user);
        }
    }
}