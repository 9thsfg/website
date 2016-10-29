var gulp = require('gulp');
var sass = require('gulp-sass');
var gutil = require('gulp-util');
var browserSync = require('browser-sync').create('EHS Server');
var useref = require('gulp-useref');
var uglify = require('gulp-uglify');
var gulpIf = require('gulp-if');
var cssnano = require('gulp-cssnano');
var imagemin = require('gulp-imagemin');
var cache = require('gulp-cache');
var del = require('del');
var runSequence = require('run-sequence');
var prompt = require('gulp-prompt');
var autoprefixer = require('gulp-autoprefixer');
var connect = require('gulp-connect-php');

devDir = 'dev';
buildDir = 'build';

gulp.task('default', function(callback) {
	runSequence(['sass', 'browserSync', 'watch'],
		callback);
});

gulp.task('build', function(callback) {
	gutil.log('--------------> Yup build');
	runSequence('clean:dist',
		['css', 'useref', 'images', 'fonts'],
		callback);
	gutil.beep();
});

gulp.task('watch', ['browserSync', 'sass'], function() {
	gulp.watch(devDir + '/scss/**/*.scss', ['sass'])
	gulp.watch(devDir + '/**/*.html', browserSync.reload)
	gulp.watch(devDir + '/js/**/*.js', browserSync.reload)
	gulp.watch(devDir + '/**/*.php', browserSync.reload)
});

gulp.task('sass', function() {
	sassProcess();
});

gulp.task('css', function() {
	sassProcess();
	autoprefix();
});

gulp.task('browserSync', ['php'], function() {
	browserSync.init({
		// server: { baseDir: devDir},
		proxy: "http://9thsfg.dev",
		tunnel: "9thsfg",
		reloadOnRestart: true,
		port: 8010,
		open: true,
		notify: false
	})
});

gulp.task('php', function() {
	connect.server({ base: devDir, port: 8010, keepalive: true});
});

gulp.task('useref', function(){
	return gulp.src(devDir + '/*.html')
		.pipe(useref())
		// Minifies only if it's a JavaScript file
		.pipe(gulpIf('*.js', uglify()))
		// Minifies only if it's a CSS file
		.pipe(gulpIf('*.css', cssnano()))
		.pipe(gulp.dest(buildDir))
});

gulp.task('images', function(){
	return gulp.src(devDir + '/images/**/*.+(png|jpg|jpeg|gif|svg)')
		.pipe(cache(imagemin({
			// Setting interlaced to true
			interlaced: true
		})))
		.pipe(gulp.dest(buildDir + '/images'))
});

gulp.task('fonts', function() {
	return gulp.src(devDir + '/fonts/**/*')
		.pipe(gulp.dest(buildDir + '/fonts'))
});

gulp.task('clean:dist', function() {
	return del.sync(buildDir);
});

gulp.task('cache:clear', function (callback) {
	return cache.clearAll(callback);
});

function sassProcess() {
	return gulp.src(devDir + '/scss/**/*.scss')
		.pipe(sass().on('error', sass.logError)) // Using gulp-sass
		.pipe(gulp.dest(devDir + '/css'))
		.pipe(browserSync.reload({
			stream: true
	}));
}

function autoprefix() {
	gutil.log('--------------> Autoprefixing');
	return gulp.src([devDir + '/css/**/*.css', '!' + devDir + '/css/**/*-OLD*.css'])
		.pipe(autoprefixer())
		.pipe(gulp.dest(buildDir + '/css'));
}