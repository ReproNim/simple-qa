ReproNim Simple QA
==================

This is a sample end-user script for testing ReproNim.  It is in fact 
fairly not-simple in that a complete run requires:

- AFNI (https://afni.nimh.nih.gov/, NeuroDebian)
- BXH/XCEDE Tools (https://www.nitrc.org/projects/bxh_xcede_tools)
- FreeSurfer (http://surfer.nmr.mgh.harvard.edu/)
- fsutils (PyPi)
- ImageMagick (http://www.imagemagick.org/script/index.php, MacPorts, 
  Debian)
- Jinja2 (Debian, PyPi)
- nibabel (NeuroDebian, PyPi)
- R (https://www.r-project.org/, Debian)

Install the script by putting the contents of this repository in a 
directory and setting RN_QA_DIR to this directory.

Run the script with a structural volume, a time-series volume, and an 
output directory that doesn't exist yet:

::

    $RN_QA_DIR/rn_qa anat.nii.gz time_series.nii.gz /path/to/output/directory

The results and intermediate data from the analysis are placed in the 
output directory.  The ostensible final result is in ``html/index.html``.

The actual purpose of this analysis is as a test of ReproNim 
and being able to reproduce an analysis with several component parts, 
so the real output of interest is the file ``meta`` in the output 
directory, which tells which software (including versions) was available 
to be used in the analysis.
