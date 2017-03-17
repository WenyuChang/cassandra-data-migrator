package CSVHandler;

import org.supercsv.io.CsvListReader;
import org.supercsv.prefs.CsvPreference;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

/**
 * Created by zznate on 3/23/15.
 */
public class CsvFileIterator implements Iterator<CsvFileLine>, Iterable<CsvFileLine>
{

    private final File file;
    private CsvListReader csvReader;
    private List<String> line;
    private int lineNumber = 0;

    private CsvFileIterator(File file)
    {
        this.file = file;
    }

    private CsvFileIterator init()
    {

        CsvPreference csvPreference = new CsvPreference.Builder('"', '|', "\r\n").build();
        try
        {
            BufferedReader reader = new BufferedReader(new FileReader(file));
            csvReader = new CsvListReader(reader, csvPreference);

        } catch (Exception ex)
        {
            ex.printStackTrace();
        }
        return this;
    }

    public int getLineNumber()
    {
        return lineNumber;
    }

    public static CsvFileIterator instance(File file)
    {
        return new CsvFileIterator(file).init();
    }

    @Override
    public boolean hasNext()
    {
        try
        {
            line = csvReader.read();
        } catch (IOException ioe)
        {
            ioe.printStackTrace();
        }

        return line != null;
    }

    @Override
    public CsvFileLine next()
    {
        lineNumber++;
        return CsvFileLine.instance(line);
    }

    @Override
    public Iterator<CsvFileLine> iterator()
    {
        return this;
    }

	public void remove() {
		// TODO Auto-generated method stub
		
	}
};


