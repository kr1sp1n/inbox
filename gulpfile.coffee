gulp = require 'gulp'
coffee = require 'gulp-coffee'
notify = require 'gulp-notify'
browserify = require 'gulp-browserify'
rename = require 'gulp-rename'

source =
  vendor: './app/lib/**/*.min.js'
  coffee: './app/coffee/**/*.coffee'
  main: './app/coffee/main.coffee'
  index: './app/coffee/index.coffee'
  app: './app/'

dest =
  build: './build/'
  js: './build/js/'

handleError = (err) ->
  this.emit 'end'

gulp.task 'main', ->
  gulp.src(source.main)
    .pipe(coffee({bare: true}).on('error', handleError).on('error', notify.onError('<%= error.message %>')))
    .pipe gulp.dest(dest.js)

gulp.task 'bundle', ->
  gulp.src(source.index, read: false)
    .pipe(browserify(
      transform: ['coffeeify']
      extensions: ['.coffee']
    ))
    .pipe(rename 'index.js')
    .pipe gulp.dest(dest.js)

gulp.task 'html', ->
  gulp.src([source.app+'index.html'])
    .pipe gulp.dest(dest.build)

gulp.task 'vendor', ->
  gulp.src(source.vendor)
    .pipe gulp.dest(dest.js)

gulp.task 'build', ['bundle', 'main', 'html', 'vendor']

