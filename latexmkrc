use File::Basename;

# LA VERSIÓN DEL REPOSITORIO TIENE SU PROPIA FORMA DE GENERAR EL ÍNDICE A PARTIR DEL ARCHIVO DE COMPIPLAR_PDF.YML
# ESTA VERSIÓN SOLO ESTÁ PENSADA PARA LA GENERACIÓN LOCAL EN WINDOWS

add_cus_dep('sxd', 'sbx', 0, 'makesongsindex');

sub makesongsindex {
    my $full_path = $_[0];
    my $base = basename($full_path);

    my $scriptPath = "C:/texlive/2025/texmf-dist/doc/latex/songs/songidx/songidx.lua";
    my $result = system("texlua \"$scriptPath\" build/$base.sxd build/$base.sbx");

    print "Código de retorno: $result\n";
    return $result;
}

# SOLO EJECUTAR LAS COPIAS LOCALES SI ESTAMOS EN WINDOWS
if ($^O eq 'MSWin32') {
    $success_cmd = 'copy build\\nvoz.pdf C:\\Users\\abeln\\Documentos\\SyncBoox\\Coro\\Cancioneros\\nvoz.pdf && copy build\\nvoz.pdf D:\\"vida espiritual"\\Coro\\repertorio\\cancioneros\\nvoz.pdf';
}