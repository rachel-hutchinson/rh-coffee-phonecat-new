
var gulp = require('gulp');
    coffee = require('gulp-coffee');
    concat = require('gulp-concat');
    gulpif = require('gulp-if');
    gutil = require('gulp-util');
    del = require('del');
    connect = require('gulp-connect');
    mainBowerFiles = require('main-bower-files');

gulp.task('clean', function(cb) {
  del.sync(['release']);
  cb();
});

gulp.task('json', function() {
  return gulp.src(['app/phones/*'])
  .pipe(gulp.dest('release/phones'));
});

gulp.task('img', function() {
  return gulp.src(['app/img/**/*'])
  .pipe(gulp.dest('release/img'));
});

gulp.task('partials', function() {
  return gulp.src(['app/partials/**/*'])
  .pipe(gulp.dest('release/partials'));
});

gulp.task('javascripts', function() {
  src = mainBowerFiles({filter: new RegExp('.js$')});

  src.push('app/js/*');

  return gulp.src(src)
    .pipe(gulpif(/.*coffee$/, coffee().on('error', function(e) {
      gutil.log(e);
      this.emit('end');
    })))

    .pipe(concat('app.js'))
    .pipe(gulp.dest('release'));
});

gulp.task('html', function() {
  return gulp.src('app/*.html')
    .pipe(gulp.dest('release'));
});

gulp.task('watch', [], function() {
  gulp.watch(['./app/js/*', '!./app/js/*~'], ['javascripts']);
  gulp.watch(['./app/*.html', '!./app/*.html~'], ['html'])
});

gulp.task('webserver', [], function() {
  return connect.server({
    root: [
      'release'
    ],
    port: 8000
  });
});

gulp.task('assets', ['clean', 'json', 'img', 'partials', 'javascripts', 'html']);

gulp.task('default', ['assets'], function(){
  gulp.start('watch');
  gulp.start('webserver');
});
