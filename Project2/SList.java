//Do not change the EmptyListException class. It is complete.
import java.util.*;
class EmptySListException  extends RuntimeException
{
    public EmptySListException( String s)
    {
        super(s);
    }
}


public class SList<E>
{
   //add private data members and methods as needed
   private List<E> elements;
   int count;

   public SList ()
   {
      elements = new ArrayList<E>();
   }

   public int length()
   { 
       return (elements.size()); 
   }
   
   public boolean isEmpty()
   { 
       return (elements.size() == 0); 
   }
   
   public E head()
   {    
       if(elements.isEmpty())
            throw new EmptySListException("Slist is empty, cannot perfrom function");
       else 
            return (elements.get(0));
   }

    public SList<E> tail()
    {   
        if(elements.isEmpty())
            throw new EmptySListException("Slist is empty, cannot perfrom function");
        else {
            SList<E> subelements = new SList<E>();
            subelements.elements = elements.subList(1,elements.size());
            return (subelements);
        }
    }

    public SList<E> cons( E item)
    { 
        SList<E> newslist = new SList<E>();
        newslist.elements = elements;
        newslist.elements.add(0, item);
        return (newslist);
    }

   public String toString()
   {  
       return (elements.toString());
   }

}
