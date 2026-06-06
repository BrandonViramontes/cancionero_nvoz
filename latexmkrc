use File::Basename;

add_cus_dep('sxd', 'sbx', 0, 'makesongsindex');

sub makesongsindex {
    my $full_path = $_[0];
    my $base = basename($full_path);
    
    # DEFINICIÓN DE RUTAS AUTOMÁTICA SEGÚN EL SISTEMA OPERATIVO
    my $scriptPath;
    if ($^O eq 'MSWin32') {
        # Si estás en tu computadora (Windows)
        $scriptPath = "C:/texlive/2025/texmf-dist/doc/latex/songs/songidx/songidx.lua";
    } else {
        $scriptPath ||= "./scripts/songidx.lua";    
        }
    
    print "=== Ejecutando makesongsindex ===\n";
    print "Sistema Operativo detectado: $^O\n";
    print "Ruta completa: $full_path\n";
    print "Base: $base\n";
    
    my $result = system("texlua \"$scriptPath\" build/$base.sxd build/$base.sbx");
    
    print "Código de retorno: $result\n";
    print "=================================\n";
    
    return $result;
}

# SOLO EJECUTAR LAS COPIAS LOCALES SI ESTAMOS EN WINDOWS
if ($^O eq 'MSWin32') {
    $success_cmd = 'copy build\\nvoz.pdf C:\\Users\\abeln\\Documentos\\SyncBoox\\Coro\\Cancioneros\\nvoz.pdf && copy build\\nvoz.pdf D:\\"vida espiritual"\\Coro\\repertorio\\cancioneros\\nvoz.pdf';
}
