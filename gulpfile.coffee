gulp = require('gulp')
$ = require('gulp-load-plugins')()

gulp.task 'typescript',  () ->
  gulp.src(['./src/*.ts'])
  .pipe($.typescript({target: "ES5",  noExternalResolve: true,  removeComments: true}))
  .js
  .pipe(gulp.dest('./build'))

gulp.task 'start',  ['typescript'],  () ->
  gulp.watch('./src/*.ts',  ['typescript'])
