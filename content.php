<?php 
    require "config/database.php";

    if(empty($_SESSION['username']) && empty($_SESSION['password'])){
        echo "<meta http-equiv='refresh' content='0; url=index.php?alert=3'>";
    }
    else{
        if($_GET['module'] =='start'){
            include "modules/start/view.php";
        }

        elseif($_GET['module']=='password'){
            include "modules/password/view.php";
        }

        elseif($_GET['module']=='user'){
            include "modules/user/view.php";
        }
        elseif($_GET['module']=='form_user'){
            include "modules/user/form.php";
        }
        
        elseif($_GET['module']=='perfil'){
            include "modules/perfil/view.php";
        }
        elseif($_GET['module']=='form_perfil'){
            include "modules/perfil/form.php";
        } 

        elseif($_GET['module']=='departamento'){
            include "modules/departamento/view.php";
        }
        elseif($_GET['module']=='form_departamento'){
            include "modules/departamento/form.php";
        } 

        elseif($_GET['module']=='ciudad'){
            include "modules/ciudad/view.php";
        }
        elseif($_GET['module']=='form_ciudad'){
            include "modules/ciudad/form.php";
        } 

        elseif($_GET['module']=='deposito'){
            include "modules/deposito/view.php";
        }
        elseif($_GET['module']=='form_deposito'){
            include "modules/deposito/form.php";
        } 

        elseif($_GET['module']=='seccion'){
            include "modules/seccion/view.php";
        }
        elseif($_GET['module']=='form_seccion'){
            include "modules/seccion/form.php";
        } 
        elseif($_GET['module']=='estante'){
            include "modules/estante/view.php";
        }
        elseif($_GET['module']=='form_estante'){
            include "modules/estante/form.php";
        } 

        elseif($_GET['module']=='clientes'){
            include "modules/clientes/view.php";
        }
        elseif($_GET['module']=='form_clientes'){
            include "modules/clientes/form.php";
        } 
        elseif($_GET['module']=='proveedor'){
            include "modules/proveedor/view.php";
        }
        elseif($_GET['module']=='form_proveedor'){
            include "modules/proveedor/form.php";
        } 
        elseif($_GET['module']=='productos'){
            include "modules/productos/view.php";
        }
        elseif($_GET['module']=='form_productos'){
            include "modules/productos/form.php";
        } 

        elseif($_GET['module']=='u_medida'){
            include "modules/u_medida/view.php";
        }
        elseif($_GET['module']=='form_u_medida'){
            include "modules/u_medida/form.php";
        } 

        elseif($_GET['module']=='compras'){
            include "modules/compras/view.php";
        }
        elseif($_GET['module']=='form_compras'){
            include "modules/compras/form.php";
        }

        elseif($_GET['module']=='ventas'){
            include "modules/ventas/view.php";
        }
        elseif($_GET['module']=='form_ventas'){
            include "modules/ventas/form.php";
        }
        elseif($_GET['module']=='movimientos'){
            include "modules/movimientos/view.php";
        }
        elseif($_GET['module']=='form_movimientos'){
            include "modules/movimientos/form.php";
        }

        elseif($_GET['module']=='stock'){
            include "modules/stock/view.php";
        }

        elseif($_GET['module']=='informes'){
            include "modules/informes/view.php";
        }

    	
    }

?>