module.exports = function(grunt) {
  "use strict";

  grunt.initConfig({



    // file locations

    srcFiles: [
      "src/**/*.purs",
      "bower_components/purescript-*/src/**/*.purs",
    ],

    testFiles: [
      "test/**/*.purs",
      "<%=srcFiles%>"
    ],

    testOutput: "output/test.js",



    // tasks

    clean:   ["output"],
    dotPsci: ["<%=srcFiles%>"],
    pscMake: ["<%=srcFiles%>"],

    psc: {
      options: {
        modules: 'Test.Main',
        main: 'Test.Main'
      },

      test: {
        src:  ["<%=testFiles%>"],
        dest: "<%=testOutput%>"
      }
    },

    pscDocs: {
      readme: {
        src: "src/**/*.purs",
        dest: "README.md"
      }
    },

    shell: {
      target: {
        command: 'node "<%=testOutput%>"'
      }
    }

  });



  grunt.loadNpmTasks("grunt-contrib-clean");
  grunt.loadNpmTasks("grunt-purescript");
  grunt.loadNpmTasks("grunt-shell");

  grunt.registerTask("make", ["pscMake", "dotPsci", "pscDocs"]);
  grunt.registerTask("default", ["make"]);
  grunt.registerTask("test", ["psc:test", "shell"]);
};
