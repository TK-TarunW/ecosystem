package tk.app;

import org.apache.avro.Schema;
import org.apache.avro.file.DataFileReader;
import org.apache.avro.file.DataFileWriter;
import org.apache.avro.generic.GenericData;
import org.apache.avro.generic.GenericDatumReader;
import org.apache.avro.generic.GenericDatumWriter;
import org.apache.avro.generic.GenericRecord;
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
public class NoCodeGen {

    static Schema schema;

    public static void main(String[] args) throws IOException {

        schema = new Schema.Parser().parse(new File("user.avsc"));

        GenericRecord user1 = new GenericData.Record(schema);
        user1.put("name", "Alyssa");
        user1.put("favorite_number", 256);
// Leave favorite color null

        serialize(user1);


        deserialize(new File("users-n.avro"));



    }

    public static void serialize(GenericRecord user1) throws IOException {
        DatumWriter<GenericRecord> userDatumWriter = new GenericDatumWriter<>(schema);
        DataFileWriter<GenericRecord> dataFileWriter = new DataFileWriter<>(userDatumWriter);
        dataFileWriter.create(schema, new File("users-n.avro"));
        dataFileWriter.append(user1);
        //dataFileWriter.append(user2);
        //dataFileWriter.append(user3);
        dataFileWriter.close();
    }

    public static void deserialize(File file) throws IOException {
        // Deserialize Users from disk
        DatumReader<GenericRecord> userDatumReader = new GenericDatumReader(schema);
        DataFileReader<GenericRecord> dataFileReader = new DataFileReader<>(file, userDatumReader);
        GenericRecord user = null;
        while (dataFileReader.hasNext()) {
            // Reuse user object by passing it to next(). This saves us from
            // allocating and garbage collecting many objects for files with
            // many items.
            user = dataFileReader.next(user);
            System.out.println(user);
        }
    }


}
