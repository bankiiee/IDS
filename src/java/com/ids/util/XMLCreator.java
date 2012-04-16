package com.ids.util;

import com.ids.model.Book;
import com.ids.model.News;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

//For jdk1.5 with built in xerces parser
import com.sun.org.apache.xml.internal.serialize.OutputFormat;
import com.sun.org.apache.xml.internal.serialize.XMLSerializer;

//For JDK 1.3 or JDK 1.4  with xerces 2.7.1
//import org.apache.xml.serialize.XMLSerializer;
//import org.apache.xml.serialize.OutputFormat;
public class XMLCreator {

    //No generics
    private List myData;
    private Document dom;
    private String SavedLocation;
    public XMLCreator(List data) {
        //create a list to hold the data
        myData = new ArrayList();
        myData = data;

        //initialize the list
        loadData();

        //Get a DOM object
        createDocument();
    }

    public void runExample() {
        System.out.println("Started .. ");
        createDOMTree();
        System.out.println("Created DOM");
        printToFile();
        System.out.println("Saved to file");

        System.out.println("Generated file successfully.");
    }

    /**
     * Add a list of books to the list In a production system you might populate
     * the list from a DB
     */
    private void loadData() {
//        getMyData().add(new Book("", "Kathy Sierra .. etc", "ข่าวทดสอบที่ ๑"));
//        getMyData().add(new Book("Head First Design Patterns", "Kathy Sierra .. etc", "ข่าวทดสอบที่ ๒"));
//        getMyData().add(new Book("Head First Design Patterns", "Kathy Sierra .. etc", "ข่าวทดสอบที่ 3"));
        System.out.println("Data loaded, Successfull");
    }

    /**
     * Using JAXP in implementation independent manner create a document object
     * using which we create a xml tree in memory
     */
    private void createDocument() {

        //get an instance of factory
        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
        try {
            //get an instance of builder
            DocumentBuilder db = dbf.newDocumentBuilder();

            //create an instance of DOM
            setDom(db.newDocument());

        } catch (ParserConfigurationException pce) {
            //dump it
            System.out.println("Error while trying to instantiate DocumentBuilder " + pce);
            System.exit(1);
        }

    }

    /**
     * The real workhorse which creates the XML structure
     */
    private void createDOMTree() {

        //create the root element <Books>
        Element rootEle = getDom().createElement("rss");
        rootEle.setAttribute("version", "2.0");
        Element channelEle = getDom().createElement("channel");
        getDom().appendChild(rootEle);
        rootEle.appendChild(channelEle);
        System.out.println("Created Root DOM Successfull");

        Element titleEle = getDom().createElement("title");
        titleEle.setTextContent("IDS Communication Feed Channel");
        channelEle.appendChild(titleEle);
        Element descEle = getDom().createElement("description");
        descEle.setTextContent("IDS System");
        channelEle.appendChild(descEle);
        Element linkEle = getDom().createElement("link");
       // linkEle.setTextContent("");
        channelEle.appendChild(linkEle);
        Element lbdEle = getDom().createElement("lastBuildDate");
        lbdEle.setTextContent("Mon, 06 Sep 2010 00:01:00 +0000 ");
        channelEle.appendChild(lbdEle);
        Element pubEle = getDom().createElement("pubDate");
        pubEle.setTextContent("Mon, 06 Sep 2010 00:01:00 +0000 ");
        channelEle.appendChild(pubEle);
        System.out.println("Created Root Title DOM Successfull");



        //No enhanced for
//        Iterator it = getMyData().iterator();
//        while (it.hasNext()) {
//            Book b = (Book) it.next();
//            //For each Book object  create <Book> element and attach it to root
//            Element bookEle = createBookElement(b);
//            channelEle.appendChild(bookEle);
//
//        }
        
        //Traverse though myData List to get News Objects
        for (int i = 0; i < myData.size(); i++) {
           News n = (News) myData.get(i);
            Element bookEle = createBookElement(n);
            channelEle.appendChild(bookEle);
        }
        System.out.println("Finish Traversal of myData List");
    }

    /**
     * Helper method which creates a XML element <Book>
     *
     * @param b The book for which we need to create an xml representation
     * @return XML element snippet representing a book
     */
    private Element createBookElement(News n) {


        Element itemEle = getDom().createElement("item");
        Element titleEle = getDom().createElement("title");
        titleEle.setTextContent(n.getTopic());
        itemEle.appendChild(titleEle);
        //create author element and author text node and attach it to bookElement
        
       Element desc = getDom().createElement("description");
       desc.setTextContent(""+n.getStory()+"");
        itemEle.appendChild(desc);
        
        Element linkEle = getDom().createElement("attachment");
        linkEle.setTextContent(n.getPath());
        System.out.println();
        itemEle.appendChild(linkEle);
        Element guidEle = getDom().createElement("newsid");
        guidEle.setTextContent(""+n.getId());
        itemEle.appendChild(guidEle);
        Element pubEle = getDom().createElement("pubDate");
        pubEle.setTextContent(n.getSenddate());
        itemEle.appendChild(pubEle);
//        //create title element and title text node and attach it to bookElement
//        Element titleEle = dom.createElement("Date");
//        Text titleText = dom.createTextNode(b.getTitle());
//        titleEle.appendChild(titleText);


        return itemEle;

    }

    /**
     * This method uses Xerces specific classes prints the XML document to file.
     */
    private void printToFile() {

        try {
            //print
            OutputFormat format = new OutputFormat(getDom());
            format.setIndenting(true);

            //to generate output to console use this serializer
            //XMLSerializer serializer = new XMLSerializer(System.out, format);


            //to generate a file output use fileoutputstream instead of system.out
            File file = new File(getSavedLocation()+"/idsFeed.xml");
            
            XMLSerializer serializer = new XMLSerializer(
                    new FileOutputStream(file), format);
            
            serializer.serialize(getDom());
            System.out.println("Where is the file :   "+file.getAbsolutePath());
            
             File file2 = new File(getSavedLocation()+"/lecturer/idsFeed.xml");
            
            XMLSerializer serializer2 = new XMLSerializer(
                    new FileOutputStream(file2), format);
            
            serializer2.serialize(getDom());
            System.out.println("Where is the file :   "+file2.getAbsolutePath());
            
             File file3 = new File(getSavedLocation()+"/management/idsFeed.xml");
            
            XMLSerializer serializer3 = new XMLSerializer(
                    new FileOutputStream(file3), format);
            
            serializer3.serialize(getDom());
            System.out.println("Where is the file :   "+file3.getAbsolutePath());
         
            
        } catch (IOException ie) {
            System.out.println(ie.getMessage());
            ie.printStackTrace();
        }
    }

    public static void main(String args[]) {
        //create an instance
        //XMLCreator xce = new XMLCreator();
        //run the example
        // xce.runExample();
    }

    /**
     * @return the myData
     */
    public List getMyData() {
        return myData;
    }

    /**
     * @param myData the myData to set
     */
    public void setMyData(List myData) {
        this.myData = myData;
    }

    /**
     * @return the dom
     */
    public Document getDom() {
        return dom;
    }

    /**
     * @param dom the dom to set
     */
    public void setDom(Document dom) {
        this.dom = dom;
    }

    /**
     * @return the SavedLocation
     */
    public String getSavedLocation() {
        return SavedLocation;
    }

    /**
     * @param SavedLocation the SavedLocation to set
     */
    public void setSavedLocation(String SavedLocation) {
        this.SavedLocation = SavedLocation;
    }
}
