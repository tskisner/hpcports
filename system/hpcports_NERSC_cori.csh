
alias hpcports 'set planck=`planckcheck` ; set polar=`polarcheck` ; set soft=/global/cscratch1/sd/kisner/software ; module unuse $soft/hpcports_gnu/env/modulefiles ; module unuse $soft/planck_gnu/modulefiles ; module unuse $soft/pbear_gnu/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
    module use $soft/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use $soft/planck_gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use $soft/pbear_gnu/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR intel \]" \\
    breaksw \\
  endsw"'

