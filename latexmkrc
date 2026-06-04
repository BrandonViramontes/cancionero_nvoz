# # Regla de dependencia para archivos .sxd (songs data) a .sbx (songs index)
# add_cus_dep('sxd', 'sbx', 0, 'makesongsindex');

# sub makesongsindex {
#     my $scriptPath = "C:/texlive/2025/texmf-dist/doc/latex/songs/songidx/songidx.lua";
    
#     # Mensaje de depuración
#     print "=== Ejecutando makesongsindex ===\n";
#     print "Script: $scriptPath\n";
#     print "Argumentos: songs_index.sxd songs_index.sbx\n";
    
#     my $result = system("texlua \"$scriptPath\" build/songs_index.sxd build/songs_index.sbx");
    
#     print "Código de retorno: $result\n";
#     print "=================================\n";
    
#     return $result;
# }


use File::Basename;

add_cus_dep('sxd', 'sbx', 0, 'makesongsindex');

sub makesongsindex {
    my $full_path = $_[0];
    my $base = basename($full_path);  # Extrae solo el nombre
    my $scriptPath = "C:/texlive/2025/texmf-dist/doc/latex/songs/songidx/songidx.lua";
    
    print "=== Ejecutando makesongsindex ===\n";
    print "Ruta completa: $full_path\n";
    print "Base: $base\n";
    
    my $result = system("texlua \"$scriptPath\" build/$base.sxd build/$base.sbx");
    
    print "Código de retorno: $result\n";
    print "=================================\n";
    
    return $result;
}
$success_cmd = 'copy build\\Cancionero_CEC.pdf C:\\Users\\abeln\\Documentos\\SyncBoox\\Coro\\Cancioneros\\Cancionero_CEC.pdf && copy build\\Cancionero_CEC.pdf D:\\"vida espiritual"\\Coro\\repertorio\\cancioneros\\Cancionero_CEC.pdf && copy build\\nvoz.pdf C:\\Users\\abeln\\Documentos\\SyncBoox\\Coro\\Cancioneros\\nvoz.pdf && copy build\\nvoz.pdf D:\\"vida espiritual"\\Coro\\repertorio\\cancioneros\\nvoz.pdf';