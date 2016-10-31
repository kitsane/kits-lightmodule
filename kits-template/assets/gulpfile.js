var gulp = require("gulp"),
    autoprefixer = require("gulp-autoprefixer"),
    babel = require("gulp-babel"),
    concat = require("gulp-concat"),
    sass = require("gulp-sass");

var config = {
    nodeDir: "./node_modules",
    inputDir: "./",
    imagesDir: "/images",
    fontsDir: "/fonts",
    outputDir: "../webresources"
};

gulp.task("sass", () => {
    return gulp.src([
        config.nodeDir + "/sanitize.css/sanitize.css",
        config.nodeDir + "/swiper/dist/css/swiper.min.css",
        config.inputDir + "/scss/**/*.scss"
    ]).pipe(sass().on("error", sass.logError)).pipe(autoprefixer({
        browsers: ["last 2 versions"]
    })).pipe(concat("main.css")).pipe(gulp.dest(config.outputDir + "/css"));
});
gulp.task('js', () => {
    return gulp.src([config.nodeDir + "/jquery/dist/jquery.slim.min.js", config.nodeDir +
            "/swiper/dist/js/swiper.jquery.min.js", config.inputDir + "/js/main.js"]).pipe(babel({
        presets: ['es2015']
    })).pipe(concat("main.js")).pipe(gulp.dest(config.outputDir + '/js'));
});

gulp.task('copy-fonts', () => {
    gulp
      .src( [ `${ config.inputDir }${ config.fontsDir }/**/*` ] )
      .pipe(gulp.dest( `${ config.outputDir }${ config.fontsDir }` ));
});

gulp.task('copy-images', () => {
    gulp
      .src( [ `${ config.inputDir }${ config.imagesDir }/**/*` ] )
      .pipe(gulp.dest( `${ config.outputDir }${ config.imagesDir }` ));
});

gulp.task("build", ["sass", "js", "copy-fonts", "copy-images"]);

gulp.task("watch", () => {
    gulp.watch(config.inputDir + "/scss/**/*.scss", ["sass"]);
    gulp.watch(config.inputDir + "/js/**/*.js", ["js"]);
    gulp.watch(`${ config.inputDir }${ config.fontsDir }/**/*`, [ "copy-fonts" ]);
    gulp.watch(`${ config.inputDir }${ config.imagesDir }/**/*`, [ "copy-images" ]);
});
gulp.task("default", ["build", "watch"]);
