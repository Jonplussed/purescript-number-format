module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({

    srcFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs",
    ],

    clean:   ["output"],
    pscMake: ["<%=srcFiles%>"],
    dotPsci: ["<%=srcFiles%>"],

    pscDocs: {
      readme: {
        src: "src/**/*.purs",
        dest: "README.md"
      }
    }

  });

  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-purescript");

  grunt.registerTask("make", ["pscMake", "dotPsci", "pscDocs"]);
  grunt.registerTask("default", ["make"]);
};
