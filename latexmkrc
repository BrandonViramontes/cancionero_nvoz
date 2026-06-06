use File::Basename;

add_cus_dep('sxd', 'sbx', 0, 'makesongsindex');

sub makesongsindex {
    my $full_path = $_[0];
    my $base = basename($full_path);

    # Ruta absoluta del directorio donde vive este latexmkrc
    my $projectRoot = dirname(abs_path(__FILE__));
    
    # DEFINICIÓN DE RUTAS AUTOMÁTICA SEGÚN EL SISTEMA OPERATIVO
    my $scriptPath;
    my $result;

    if ($^O eq 'MSWin32') {
        # Si estás en tu computadora (Windows)
        $scriptPath = "C:/texlive/2025/texmf-dist/doc/latex/songs/songidx/songidx.lua";
        $result = system("texlua \"$scriptPath\" build/$base.sxd build/$base.sbx");

    } else {
        # Linux/Mac: rutas absolutas para evitar problemas de directorio de trabajo
        my $projectRoot = dirname(abs_path(__FILE__));
        $scriptPath = "$projectRoot/scripts/songidx.lua";
        my $sxdFile  = "$projectRoot/build/$base.sxd";
        my $sbxFile  = "$projectRoot/build/$base.sbx";

        print "Project root: $projectRoot\n";
        print "Script: $scriptPath\n";
        print "SXD: $sxdFile\n";
        print "SBX: $sbxFile\n";

        $result = system("texlua \"$scriptPath\" \"$sxdFile\" \"$sbxFile\"");
        }
    
    print "Código de retorno: $result\n";
    print "=================================\n";
    
    return $result;
}

# SOLO EJECUTAR LAS COPIAS LOCALES SI ESTAMOS EN WINDOWS
if ($^O eq 'MSWin32') {
    $success_cmd = 'copy build\\nvoz.pdf C:\\Users\\abeln\\Documentos\\SyncBoox\\Coro\\Cancioneros\\nvoz.pdf && copy build\\nvoz.pdf D:\\"vida espiritual"\\Coro\\repertorio\\cancioneros\\nvoz.pdf';
}
