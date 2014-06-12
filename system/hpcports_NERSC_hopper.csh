
alias hpcports 'set planck=`planckcheck` ; module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles ; module unuse /project/projectdirs/planck/modules/hopper/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
    module use /project/projectdirs/cmb/modules/hopper/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/hopper/gnu/modulefiles \\
        endif \\
    breaksw \\
    case "dx9": \\
    module use /project/projectdirs/cmb/modules/hopper/hpcports_gnu_dx9/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/hopper/gnu_dx9/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR dx9 \]" \\
    breaksw \\
  endsw"'

