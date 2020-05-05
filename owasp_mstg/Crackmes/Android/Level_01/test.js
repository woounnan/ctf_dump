Java.perform(function () {
	/*
    var nx = Java.use('nx');
    nx.b.implementation = function(x) {
      console.log(x);
      var tmp = this.b.call(this, x);
      console.log(JSON.stringify(tmp));
      return tmp;
    }
    */
        console.log("[*] Hooking calls to System.exit");
        exitClass = Java.use("java.lang.System");
        exitClass.exit.implementation = function() {
            console.log("[*] System.exit called");
});

