package runner;

import com.intuit.karate.junit5.Karate;

class SingleRunner {
    
    @Karate.Test
    Karate testUsers() {
        return Karate.run("users").relativeTo(getClass());
    }    

}
