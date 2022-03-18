#!/usr/bin/env nextflow
/*
========================================================================================
    nf-core/mycosnp
========================================================================================
    Github : https://github.com/CDCgov/mycosnp-nf
    Wiki   : https://github.com/CDCgov/mycosnp-nf/wiki
----------------------------------------------------------------------------------------
*/

nextflow.enable.dsl = 2

/*
========================================================================================
    GENOME PARAMETER VALUES
========================================================================================
*/

params.fasta = WorkflowMain.getGenomeAttribute(params, 'fasta')

/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    NAMED WORKFLOW FOR PIPELINE
========================================================================================
*/

include { MYCOSNP } from './workflows/mycosnp'
include { MYCOSNPTREE } from './workflows/mycosnptree'

//
// WORKFLOW: Run main nf-core/mycosnp analysis pipeline
//
workflow NFCORE_MYCOSNP {
    MYCOSNP ()
}

workflow NFCORE_MYCOSNPTREE {
    MYCOSNPTREE ()
}


/*
========================================================================================
    RUN ALL WORKFLOWS
========================================================================================
*/

//
// WORKFLOW: Execute a single named workflow for the pipeline
//
workflow {
    NFCORE_MYCOSNP ()
}

/*
========================================================================================
    THE END
========================================================================================
*/
