package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
//import com.intuit.karate.Results;
//import com.intuit.karate.Runner;
//import static org.junit.jupiter.api.Assertions.*;
//import org.junit.jupiter.api.Test;
//import com.intuit.karate.junit5.Karate.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import org.junit.Test;

import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunnerCucumberReport {
	
	@Test
	public void testParallel() {
		

	//	System.setProperty("karate.env", System.getProperty("karate.env"));
		 Results results = Runner.path("classpath:features/")
	                .outputCucumberJson(true)
	                //.tags("@rock")
	                .parallel(1);
		
		TestRunnerCucumberReport.generateReport(results.getReportDir());
	   // TestRunnerCucumberReport.generateReport(currentDir);
	}

	public static void generateReport(String karateOutputPath) {

		Collection<File> jsonFiles = FileUtils.listFiles(new File(karateOutputPath), new String[] { "json" }, true);
		List<String> jsonPaths = new ArrayList<String>(jsonFiles.size());
		jsonFiles.forEach(file -> jsonPaths.add(file.getAbsolutePath()));
		Configuration config = new Configuration(new File("target"), "Report-Name");
		ReportBuilder reportBuilder = new ReportBuilder(jsonPaths, config);
		reportBuilder.generateReports();
	}
}