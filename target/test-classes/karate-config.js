function fn() {
  var env = karate.env; // get system property 'karate.env'
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'test'; 
  }
  var config = {
    env: env,
    baseurlConfig: 'http://192.168.0.55:3002/api/',
    baseurlConfig1: 'https://jsonplaceholder.typicode.com'
  }
  if (env == 'dev') {
    // customize
    // e.g. config.foo = 'bar';
  } else if (env == 'e2e') {
    // customize
  }
karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}
