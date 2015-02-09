
new object $mime_lib: $libraries;

var $dmi_data descriptions = #[];
var $mime_lib mime_types = #[["csm", "application/cu-seeme"], ["cu", "application/cu-seeme"], ["tsp", "application/dsptype"], ["xls", "application/excel"], ["doc", "application/msword"], ["dot", "application/msword"], ["wrd", "application/msword"], ["bin", "application/octet-stream"], ["oda", "application/oda"], ["pdf", "application/pdf"], ["pgp", "application/pgp-signature"], ["ps", "application/postscript"], ["ai", "application/postscript"], ["eps", "application/postscript"], ["ppt", "application/powerpoint"], ["rtf", "application/rtf"], ["wp5", "application/wordperfect5.1"], ["wk", "application/x-123"], ["wz", "application/x-Wingz"], ["bcpio", "application/x-bcpio"], ["z", "application/x-compress"], ["cpio", "application/x-cpio"], ["csh", "application/x-csh"], ["cdc", "application/x-coldc"], ["deb", "application/x-debian-package"], ["com", "application/x-msdos-program"], ["exe", "application/x-msdos-program"], ["bat", "application/x-msdos-program"], ["dvi", "application/x-dvi"], ["gtar", "application/x-gtar"], ["tgz", "application/x-gtar"], ["gz", "application/x-gzip"], ["hdf", "application/x-hdf"], ["phtml", "application/x-httpd-php"], ["pht", "application/x-httpd-php"], ["php", "application/x-httpd-php"], ["latex", "application/x-latex"], ["frm", "application/x-maker"], ["maker", "application/x-maker"], ["frame", "application/x-maker"], ["fm", "application/x-maker"], ["fb", "application/x-maker"], ["book", "application/x-maker"], ["fbdoc", "application/x-maker"], ["mif", "application/x-mif"], ["nc", "application/x-netcdf"], ["cdf", "application/x-netcdf"], ["pl", "application/x-perl"], ["pm", "application/x-perl"], ["sh", "application/x-sh"], ["shar", "application/x-shar"], ["sv4cpio", "application/x-sv4cpio"], ["sv4crc", "application/x-sv4crc"], ["tar", "application/x-tar"], ["tcl", "application/x-tcl"], ["tex", "application/x-tex"], ["texinfo", "application/x-texinfo"], ["texi", "application/x-texinfo"], ["t", "application/x-troff"], ["tr", "application/x-troff"], ["roff", "application/x-troff"], ["man", "application/x-troff-man"], ["me", "application/x-troff-me"], ["ms", "application/x-troff-ms"], ["ustar", "application/x-ustar"], ["src", "application/x-wais-source"], ["zip", "application/zip"], ["au", "audio/basic"], ["snd", "audio/basic"], ["mid", "audio/midi"], ["midi", "audio/midi"], ["aif", "audio/x-aiff"], ["aiff", "audio/x-aiff"], ["aifc", "audio/x-aiff"], ["ra", "audio/x-pn-realaudio"], ["ram", "audio/x-pn-realaudio"], ["wav", "audio/x-wav"], ["gif", "image/gif"], ["ief", "image/ief"], ["jpeg", "image/jpeg"], ["jpg", "image/jpeg"], ["jpe", "image/jpeg"], ["png", "image/png"], ["tiff", "image/tiff"], ["tif", "image/tiff"], ["ras", "image/x-cmu-raster"], ["pnm", "image/x-portable-anymap"], ["pbm", "image/x-portable-bitmap"], ["pgm", "image/x-portable-graymap"], ["ppm", "image/x-portable-pixmap"], ["rgb", "image/x-rgb"], ["xbm", "image/x-xbitmap"], ["xpm", "image/x-xpixmap"], ["xwd", "image/x-xwindowdump"], ["html", "text/html"], ["htm", "text/html"], ["txt", "text/plain"], ["c", "text/plain"], ["h", "text/plain"], ["cc", "text/plain"], ["hh", "text/plain"], ["cpp", "text/plain"], ["hpp", "text/plain"], ["rtx", "text/richtext"], ["tsv", "text/tab-separated-values"], ["etx", "text/x-setext"], ["vcs", "text/x-vCalendar"], ["vcf", "text/x-vCard"], ["dl", "video/dl"], ["fli", "video/fli"], ["gl", "video/gl"], ["mpeg", "video/mpeg"], ["mpg", "video/mpeg"], ["mpe", "video/mpeg"], ["qt", "video/quicktime"], ["mov", "video/quicktime"], ["avi", "video/x-msvideo"], ["movie", "video/x-sgi-movie"], ["vrm", "x-world/x-vrml"], ["vrml", "x-world/x-vrml"], ["wrl", "x-world/x-vrml"], ["py", "application/x-python"], ["pyc", "application/x-python"]];
var $root created_on = 885275032;
var $root flags = ['variables, 'methods, 'code, 'core];
var $root inited = 1;
var $root managed = [$mime_lib];
var $root manager = $mime_lib;
var $root trusted_by = [$file];

public method .mime_type() {
    arg filename;
    var ext;
    
    ext = substr(filename, stridx(filename, ".", -1) + 1);
    catch ~keynf
        return mime_types[ext];
    with
        return "text/plain";
};

public method .rehash() {
    var line, i, f;
    
    (> .perms(sender(), 'system) <);
    f = $file.fopen("/mime.types");
    mime_types = #[];
    catch ~eof {
        while (1) {
            line = f.fread();
            if (line && ((line[1]) != "#")) {
                line = line.explode();
                for i in (line.subrange(2))
                    mime_types = mime_types.add(i, line[1]);
            }
        }
    }
    f.fclose();
};


