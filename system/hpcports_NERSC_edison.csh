
alias hpcports 'set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_ccm_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/edison/hpcports_shared_gnu/env/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/intel/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/ccm_gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/edison/shared_gnu/modulefiles ; module unuse /project/projectdirs/polar/modules/edison/ccm_gnu/modulefiles ; module unuse /project/projectdirs/polar/modules/edison/shared_gnu/modulefiles ; eval "switch (\!:1) \\
    case "intel": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_intel/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/intel/modulefiles \\
        endif \\
    breaksw \\
    case "gnu": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/gnu/modulefiles \\
        endif \\
    breaksw \\
    case "ccm_gnu": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_ccm_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/ccm_gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /project/projectdirs/polar/modules/edison/ccm_gnu/modulefiles \\
        endif \\
    breaksw \\
    case "shared_gnu": \\
    module use /project/projectdirs/cmb/modules/edison/hpcports_shared_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/edison/shared_gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /project/projectdirs/polar/modules/edison/shared_gnu/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR intel OR ccm_gnu OR shared_gnu \]" \\
    breaksw \\
  endsw"'

