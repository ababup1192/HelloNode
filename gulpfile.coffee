gulp = require('gulp')
$ = require('gulp-load-plugins')()
livereload = require('gulp-livereload')

gulp.task 'typescript',  () ->
  gulp.src(['./src/*.ts'])
  .pipe($.typescript({
    target: "ES5",
    noExternalResolve: true,
    removeComments: true,
    module: 'commonjs'
  }))
  .js
  .pipe(gulp.dest('./build'))

gulp.task 'start',  ['typescript'],  () ->
  gulp.watch('./src/*.ts',  ['typescript'])
