package monadtests.test_05;

import monadtests.test_03.SimpleError;

import java.util.function.Function;

public class ResultOrErrorMona<R> {
    
    private final R result;
    private final SimpleError error;
    
    public ResultOrErrorMona ( R result ) {
        this.result = result;
        this.error = null;
    }

    public ResultOrErrorMona ( SimpleError error ) {
        this.result = null;
        this.error = error;
    }
    
    public R getResult() { return result; }
    
    public SimpleError getError() { return error; }
    
    public boolean isResult() { return error == null; }
    
    public boolean isError() { return error != null; }
    
    static <R> ResultOrErrorMona<R> bind ( ResultOrErrorMona<R> value, Function<R, ResultOrErrorMona<R>> function ) {
        
        if ( value.isResult() ) {
            return function.apply ( value.getResult() );
        } else {
            return value;
        }
    }

    public String toString() {

        if ( isResult() ) {
            return "Result: " + result; 
        } else {
            return "Error: " + error.getInfo(); 
        }
    }
}
