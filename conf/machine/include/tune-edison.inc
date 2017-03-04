DEFAULTTUNE ?= "edison"

TUNEVALID[edison] = "Enable Edison specific processor optimizations"
TUNE_CCARGS .= "${@bb.utils.contains('TUNE_FEATURES', 'edison', ' -march=atom -msse3 -mfpmath=sse', '', d)}"

AVAILTUNES += "edison"
TUNE_PKGARCH_tune-edison = "edison"
TUNE_FEATURES_tune-edison = "${TUNE_FEATURES_tune-x86} edison"
BASE_LIB_tune-edison = "lib"
#PACKAGE_EXTRA_ARCHS_tune-edison = "${PACKAGE_EXTRA_ARCHS_tune-x86} edison"
