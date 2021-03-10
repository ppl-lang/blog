package monadtests.test_03;

public class ResultOrError {
    
    private final String result;
    private final SimpleError error;
    
    public ResultOrError ( String result ) {
        this.result = result;
        this.error = null;
    }

    public ResultOrError ( SimpleError error ) {
        this.result = null;
        this.error = error;
    }
    
    public String getResult() { return result; }
    
    public SimpleError getError() { return error; }
    
    public boolean isResult() { return error == null; }
    
    public boolean isError() { return error != null; }
    
    public String toString() {
        if ( isResult() ) {
            return "Result: " + result; 
        } else {
            return "Error: " + error.getInfo(); 
        }
    }
}
