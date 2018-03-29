<script runat="server" language="javascript">

(function(){

function load_text_file(filespec) {
	var fso = new ActiveXObject("Scripting.FileSystemObject");
	if( !fso.fileExists(filespec) ) return "`" + filespec + "` NOT_FOUND";

	var stream = new ActiveXObject("ADODB.Stream");
	stream.type = adTypeText;
	stream.mode = adModeReadWrite;
	stream.charset = "UTF-8";
	stream.open();
	stream.loadFromFile(filespec);
	var txt = stream.readText();
	stream.close();
	return txt;
}

// Defining `packages_document` as a global object is required to avoid too early GC.
packages_document = new ActiveXObject("HTMLFile");
with(packages_document) {
	write('<meta http-equiv="X-UA-Compatible" content="IE=EDGE" />');
	write('<'+'script charset="utf-8">');
	write( load_text_file( Server.mapPath("/lib/packages.js") ) );
	write('</'+'script>');
}
packages_document.close();

var window = packages_document.parentWindow;
window.addEventListener("beforeunload", function(){
	packages_document = null;
	CollectGarbage();
});

eval( window.Object.keys( window.npm2asp ).map( function(lib) {
	return lib + " = window.npm2asp." + lib + ";"
} ).join("") );

}());

</script>