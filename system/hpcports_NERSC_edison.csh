
alias hpcports 'set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /scratch1/scratchdirs/kisner/software/hpcports_gnu/env/modulefiles ; module unuse /scratch1/scratchdirs/kisner/software/hpcports_shared_gnu/env/modulefiles ; module unuse /scratch1/scratchdirs/kisner/software/planck_gnu/modulefiles ; module unuse /scratch1/scratchdirs/kisner/software/planck_shared_gnu/modulefiles ; module unuse /scratch1/scratchdirs/kisner/software/pbear_shared_gnu/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
    module use /scratch1/scratchdirs/kisner/software/hpcports_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /scratch1/scratchdirs/kisner/software/planck_gnu/modulefiles \\
        endif \\
    breaksw \\
    case "shared_gnu": \\
    module use /scratch1/scratchdirs/kisner/software/hpcports_shared_gnu/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /scratch1/scratchdirs/kisner/software/planck_shared_gnu/modulefiles \\
        endif \\
        if (x$polar == x"yes") then \\
            module use /scratch1/scratchdirs/kisner/software/pbear_shared_gnu/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR shared_gnu \]" \\
    breaksw \\
  endsw"'

