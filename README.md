# BLCM-COVID19
Code and technical details on BLCM for the diagnostic accuracy estimation

# Introduction
In this project further details about a Bayesian latent class model analysis (BLCM) using the data from
Cassaniti et al. 2020 (DOI: 10.1002/jmv.25800) are presented, allowing to reproduce the analysis.

# Procedure
Install actual versions of R, Rstudio and the package 'runjags'. Download or clone the repository. Run the code in the 'run.jags.R' file.

# Backgound
The code provided allows to fit a BLCM model in JAGS for three COVID-19 tests (RT-PCR, IgG and IgM) to the data from Cassaniti et al. (2020). JAGS (Just Another Gibbs Sampler) is a program for the analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation. JAGS contains an algorithm to sample from the posterior distribution, which in a Bayesian framework, results from the combination of prior information and the data. 
Whereas - according to the Hui-Walter paradigm - a model with three tests and one population is identifiable, non-identifiabiliy becomes an issue when potential conditional test dependencies are also included in the model. Since IgG and IgM rely on the same biological principle, at least a conditional dependency between these two tests should be included. 
The choice of the priors was based on a previous analysis (preprint: DOI:
10.21203/rs.3.rs-33243/v1) and beta priors were obtained using the software Betabuster (https://betabuster.software.informer.com/1.0/). 
In brief we assumed, that the specificity of RT-PCR has a median of 99%, with the 5th percentile being at 98%. This leads to a prior beta (426.36,4.64). For the specificities of IgG and Igm, we assumed that they have a median of 95%, with a 5th percentile at 95%.
To assess convergence, three different chains starting from different points were run after an adaptation phase of 1000 iterations and a burnin of 10000. The sample comprises 1000000 iterations from each chain. The trace plots were checked visually for good mixing. To monitor convergence by the Gelman-Rubin approach, the potential scale reduction factor (psrf), was assessed. Psrf for each posterior parameter is assumed to decline to 1 as the number of iterations approaches infinity.

# Results and limitations
According to the trace plots and the Gelman-Rubin psrf (always below 1.1) the model converged, thus apparently allowing for the robust estimation of sensitivities, specificities, prevalence and one conditional dependency. Since the 95% probability interval of the conditional dependency between the sensitivities of IgG and IgM did include 0, there is no strong evidence of this conditional dependency. On the other hand, here a conditional dependency is biologically plausible, the posterior estimates decrease when including it in the model. Furthermore, the sample size is relatively small, thus possibly leading to wider probability intervals. Including also a conditional dependency between the specificities of IgG and IgM still allows for convergence. Since the specificities of both test are close to 1, we omitted the conditional dependncy here.

The aim of this analysis was to showcase a BLCM analysis with one available data set. Somehow artificially the IgG and IgG test were split and considered as two separate tests. This was done to comply with the Hui-Walter paradigm, as a 2T1P model would not have been identifiable. Adding more RT-PCRs or antibody tests would be a remedy.
The specific characteristics of this data set preclude a generalisability to a larger population. First the data set was not collected for a BLCM diagnostic test accuracy study, but was compiled of three different groups of patients (healthy volunteers, confirmed COVID-19 cases and patients from an emergency room with clinical symptoms). This study design fixes for example the prevalence and thus precludes its sensible estimation. Including definitively healthy and definitively diseased patients may lead to an overestimation of sensitivities and specificities. For a meaningful BLCM analysis, the population in which the test(s) are applied needs to be carefully chosen. This should be the population in which the test is intended to be used, for example patients in the emergency room with specific clinical symptoms. Including definitive positive and negative, should be done in eraly pahses of diagnostic test evaluatuion studies and provide biological insights, but provide very limited information about test accuracy in the field with suspected patients.
Furthermore, the patients have not been sampled at the same time point COVID-19 post symptom onset. For a BLCM analysis allowing for generalising the results beyong the study population, analysing test result data for separate days post symptom onset would be an alternative.



