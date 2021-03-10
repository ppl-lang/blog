package monadtests.test_01;

public class MonadTest_01 {
    
    static String enthuse ( String sentence ) {
        return sentence.trim().toUpperCase().concat ( "!" );
    }
    
    public static void main ( String[] args ) {
        System.out.println ( enthuse ( "  Hello bob  " ) );
    }
}
