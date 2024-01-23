package BDDRunner;


import org.junit.runner.RunWith;
import cucumber.api.CucumberOptions;
import org.junit.jupiter.api.Test;

//	@RunWith(Cucumber.class)
	@CucumberOptions(
	features = "classpath:BDDFeatures/tableInKarate.feature"
	,glue={"BDDStepDef"})
	@org.testng.annotations.Test
	public class TestRunner {
	}