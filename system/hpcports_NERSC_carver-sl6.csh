

alias hpcports 'set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_sl6/env/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/sl6/modulefiles ; module unuse /project/projectdirs/polar/modules/carver/sl6/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
	module use /project/projectdirs/cmb/modules/carver/hpcports_sl6/env/modulefiles \\
	if (x$planck == x"yes") then \\
	    module use /project/projectdirs/planck/modules/carver/sl6/modulefiles \\
	endif \\
	if (x$polar == x"yes") then \\
	    module use /project/projectdirs/polar/modules/carver/sl6/modulefiles \\
	endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu \]" \\
    breaksw \\
  endsw"'


