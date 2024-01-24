package runner;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import java.io.File;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TestRunnerCucumberReport {
	
	@Test
	public void testParallel() {
		
		String currentDir=System.getProperty("user.dir") + "/reports/";
		File file = new File(currentDir + "/cucumber-html-reports");
		String[] myFiles;
		if (file.isDirectory()) {
			myFiles = file.list();
			for (int i = 0; i < myFiles.length; i++) {
				File myFile = new File(file, myFiles[i]);
				System.out.println("Deleteing files: " + myFile);
				myFile.delete();
			}
		}
		
		String karateOutputPath = "target/surefire-reports/";
		//long starttime = System.nanoTime();
		
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