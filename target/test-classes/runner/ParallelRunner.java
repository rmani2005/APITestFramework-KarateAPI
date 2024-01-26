package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class ParallelRunner {

    @Test
    void testParallel() {
        Results results = Runner.path("classpath:features/")
                .outputCucumberJson(true)
                //.tags("@rock")
                .parallel(1);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }

}
