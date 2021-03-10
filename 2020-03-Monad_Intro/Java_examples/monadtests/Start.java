package monadtests;

import monadtests.test_01.MonadTest_01;
import monadtests.test_02.MonadTest_02;
import monadtests.test_03.MonadTest_03;
import monadtests.test_04.MonadTest_04;
import monadtests.test_05.MonadTest_05;
import monadtests.test_06.MonadTest_06;
import monadtests.test_07.MonadTest_07;

public class Start {

    public static void main ( String[] args ) {
        
        System.out.println ( "test 1:" );
        MonadTest_01.main (null);
        
        System.out.println();
        System.out.println ( "test 2:" );
        MonadTest_02.test();

        System.out.println();
        System.out.println ( "test 3:" );
        MonadTest_03.tests();

        System.out.println();
        System.out.println ( "test 4:" );
        MonadTest_04.tests();

        System.out.println();
        System.out.println ( "test 5:" );
        MonadTest_05.tests();

        System.out.println();
        System.out.println ( "test 6:" );
        MonadTest_06.tests();

        System.out.println();
        System.out.println ( "test 7:" );
        MonadTest_07.tests();
    }
}
