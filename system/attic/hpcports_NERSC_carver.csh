

alias hpcports 'setenv PATH "/usr/common/usg/tcsh/6.18.01/bin:$PATH" ; setenv SHELL /usr/common/usg/tcsh/6.18.01/bin/tcsh ; set planck=`planckcheck` ; set polar=`polarcheck` ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles ; module unuse /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/gnu/modulefiles ; module unuse /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles ; module unuse /project/projectdirs/polar/modules/carver/gnu/modulefiles ; eval "switch (\!:1) \\
    case "gnu": \\
        if (x$CHOS == x"sl6carver") then \\
	    module use /project/projectdirs/cmb/modules/carver/hpcports_sl6/env/modulefiles \\
	    if (x$planck == x"yes") then \\
		module use /project/projectdirs/planck/modules/carver/sl6/modulefiles \\
	    endif \\
	    if (x$polar == x"yes") then \\
		module use /project/projectdirs/polar/modules/carver/sl6/modulefiles \\
	    endif \\
	else \\
	    module use /project/projectdirs/cmb/modules/carver/hpcports_gnu/env/modulefiles \\
	    if (x$planck == x"yes") then \\
		module use /project/projectdirs/planck/modules/carver/gnu/modulefiles \\
	    endif \\
	    if (x$polar == x"yes") then \\
		module use /project/projectdirs/polar/modules/carver/gnu/modulefiles \\
	    endif \\
	endif \\
    breaksw \\
    case "dx9": \\
    module use /project/projectdirs/cmb/modules/carver/hpcports_gnu_dx9/env/modulefiles \\
        if (x$planck == x"yes") then \\
            module use /project/projectdirs/planck/modules/carver/gnu_dx9/modulefiles \\
        endif \\
    breaksw \\
    default: \\
    echo "usage:  hpcports \[ gnu OR dx9 \]" \\
    breaksw \\
  endsw" ; tcsh'


