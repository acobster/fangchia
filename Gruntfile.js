/*global module:false*/
module.exports = function(grunt) {

  // Project configuration.
  grunt.initConfig({
    // Metadata.
    pkg: grunt.file.readJSON('package.json'),
    banner: '/*! <%= pkg.title || pkg.name %>\n' +
      '* Copyright (c) <%= grunt.template.today("yyyy") %> <%= pkg.author.name %>;' +
      ' Licensed <%= _.pluck(pkg.licenses, "type").join(", ") %> */\n',
    // Task configuration.
    bower: {
      install: {
        options: {
          install: true,
          copy: false,
          cleanBowerDir: true
        }
      }
    },
    concat: {
      options: {
        banner: '<%= banner %>',
        stripBanners: true,
      },
      js: {
        nonull: true,
        src: '<%= jshint.js.src %>',
        dest: 'public/js/app.js'
      }
    },
    uglify: {
      options: {
        banner: '<%= banner %>'
      },
      js: {
        src: 'public/js/app.js',
        dest: 'public/js/app.min.js'
      },
      map_js: {
        src: 'app/assets/js/map.js',
        dest: 'public/js/map.min.js'
      }
    },
    jshint: {
      options: {
        curly: true,
        eqeqeq: true,
        immed: true,
        latedef: true,
        newcap: true,
        noarg: true,
        sub: true,
        undef: true,
        unused: true,
        boss: true,
        eqnull: true,
        browser: true,
        reporterOutput: '',
        globals: {
          'console': true,
          'require': true,
          'google': true,
          'fetch': true,
          'Router': true,
          'Nav': true,
        }
      },
      gruntfile: {
        src: 'Gruntfile.js'
      },
      js: {
        src: [
          'app/assets/js/router.js',
          'app/assets/js/nav.js',
          'app/assets/js/project.js'
        ]
      },
      map_js: {
        src: 'app/assets/js/map.js'
      }
    },
    less: {
      development: {
        options: {
          paths: ['less'],
          compress: true
        },
        files: {
          'public/css/style.css': ['app/assets/less/style.less']
        }
      }
    },
    watch: {
      gruntfile: {
        files: '<%= jshint.gruntfile.src %>',
        tasks: ['jshint:gruntfile']
      },
      js: {
        files: '<%= jshint.js.src %>',
        tasks: ['jshint:js', 'concat:js', 'uglify:js']
      },
      map_js: {
        files: 'app/assets/js/map.js',
        tasks: ['jshint:map_js', 'uglify:map_js']
      },
      less: {
        files: ['app/assets/less/*.less'],
        tasks: ['less']
      }
    }
  });

  // These plugins provide necessary tasks.
  grunt.loadNpmTasks('grunt-contrib-concat');
  grunt.loadNpmTasks('grunt-contrib-uglify');
  grunt.loadNpmTasks('grunt-contrib-jshint');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-less');

  // Default task.
  grunt.registerTask('default', ['jshint', 'concat', 'uglify', 'less', 'watch']);

};
