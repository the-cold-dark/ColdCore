
new object $mime_lib: $libraries;

var $dmi_data descriptions = #[];
var $mime_lib mime_types = #[["ez", "application/andrew-inset"], ["hqx", "application/mac-binhex40"], ["cpt", "application/mac-compactpro"], ["doc", "application/msword"], ["bin", "application/octet-stream"], ["dms", "application/octet-stream"], ["lha", "application/octet-stream"], ["lzh", "application/octet-stream"], ["exe", "application/octet-stream"], ["class", "application/octet-stream"], ["so", "application/octet-stream"], ["dll", "application/octet-stream"], ["oda", "application/oda"], ["pdf", "application/pdf"], ["ai", "application/postscript"], ["eps", "application/postscript"], ["ps", "application/postscript"], ["smi", "application/smil"], ["smil", "application/smil"], ["mif", "application/vnd.mif"], ["xls", "application/vnd.ms-excel"], ["ppt", "application/vnd.ms-powerpoint"], ["wbxml", "application/vnd.wap.wbxml"], ["wmlc", "application/vnd.wap.wmlc"], ["wmlsc", "application/vnd.wap.wmlscriptc"], ["bcpio", "application/x-bcpio"], ["vcd", "application/x-cdlink"], ["pgn", "application/x-chess-pgn"], ["cpio", "application/x-cpio"], ["csh", "application/x-csh"], ["dcr", "application/x-director"], ["dir", "application/x-director"], ["dxr", "application/x-director"], ["dvi", "application/x-dvi"], ["spl", "application/x-futuresplash"], ["gtar", "application/x-gtar"], ["hdf", "application/x-hdf"], ["js", "application/x-javascript"], ["skp", "application/x-koan"], ["skd", "application/x-koan"], ["skt", "application/x-koan"], ["skm", "application/x-koan"], ["latex", "application/x-latex"], ["nc", "application/x-netcdf"], ["cdf", "application/x-netcdf"], ["sh", "application/x-sh"], ["shar", "application/x-shar"], ["swf", "application/x-shockwave-flash"], ["sit", "application/x-stuffit"], ["sv4cpio", "application/x-sv4cpio"], ["sv4crc", "application/x-sv4crc"], ["tar", "application/x-tar"], ["tcl", "application/x-tcl"], ["tex", "application/x-tex"], ["texinfo", "application/x-texinfo"], ["texi", "application/x-texinfo"], ["t", "application/x-troff"], ["tr", "application/x-troff"], ["roff", "application/x-troff"], ["man", "application/x-troff-man"], ["me", "application/x-troff-me"], ["ms", "application/x-troff-ms"], ["ustar", "application/x-ustar"], ["src", "application/x-wais-source"], ["zip", "application/zip"], ["au", "audio/basic"], ["snd", "audio/basic"], ["mid", "audio/midi"], ["midi", "audio/midi"], ["kar", "audio/midi"], ["mpga", "audio/mpeg"], ["mp2", "audio/mpeg"], ["mp3", "audio/mpeg"], ["aif", "audio/x-aiff"], ["aiff", "audio/x-aiff"], ["aifc", "audio/x-aiff"], ["ram", "audio/x-pn-realaudio"], ["rm", "audio/x-pn-realaudio"], ["rpm", "audio/x-pn-realaudio-plugin"], ["ra", "audio/x-realaudio"], ["wav", "audio/x-wav"], ["pdb", "chemical/x-pdb"], ["xyz", "chemical/x-xyz"], ["bmp", "image/bmp"], ["gif", "image/gif"], ["ief", "image/ief"], ["jpeg", "image/jpeg"], ["jpg", "image/jpeg"], ["jpe", "image/jpeg"], ["png", "image/png"], ["tiff", "image/tiff"], ["tif", "image/tiff"], ["wbmp", "image/vnd.wap.wbmp"], ["ras", "image/x-cmu-raster"], ["pnm", "image/x-portable-anymap"], ["pbm", "image/x-portable-bitmap"], ["pgm", "image/x-portable-graymap"], ["ppm", "image/x-portable-pixmap"], ["rgb", "image/x-rgb"], ["xbm", "image/x-xbitmap"], ["xpm", "image/x-xpixmap"], ["xwd", "image/x-xwindowdump"], ["igs", "model/iges"], ["iges", "model/iges"], ["msh", "model/mesh"], ["mesh", "model/mesh"], ["silo", "model/mesh"], ["wrl", "model/vrml"], ["vrml", "model/vrml"], ["css", "text/css"], ["html", "text/html"], ["htm", "text/html"], ["asc", "text/plain"], ["txt", "text/plain"], ["rtx", "text/richtext"], ["rtf", "text/rtf"], ["sgml", "text/sgml"], ["sgm", "text/sgml"], ["tsv", "text/tab-separated-values"], ["wml", "text/vnd.wap.wml"], ["wmls", "text/vnd.wap.wmlscript"], ["etx", "text/x-setext"], ["xml", "text/xml"], ["mpeg", "video/mpeg"], ["mpg", "video/mpeg"], ["mpe", "video/mpeg"], ["qt", "video/quicktime"], ["mov", "video/quicktime"], ["avi", "video/x-msvideo"], ["movie", "video/x-sgi-movie"], ["ice", "x-conference/x-cooltalk"]];
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
    $file.open("/mime.types");
    mime_types = #[];
    catch ~eof {
        while (1) {
            line = $file.fread();
            if (line && ((line[1]) != "#")) {
                line = line.explode();
                for i in (line.subrange(2))
                    mime_types = mime_types.add(i, line[1]);
            }
        }
    }
    $file.close();
};


