# BLCM-COVID19
Code and technical details on BLCM for the diagnostic accuracy estimation

# Introduction
In this project further details about a Bayesian latent class model analysis (BLCM) using the data from
Cassaniti et al. 2020 (DOI: 10.1002/jmv.25800) are presented, allowing to reproduce the analysis.

# Procedure
Install actual versions of R, Rstudio and the package 'runjags'. Save the files 'model.bug' and 'runjags.R' in the same folder and set the working directory. Run the code in the 'run.jags.R' file.

# Backgound
The code provided allows to fit a BLCM model in JAGS for three COVID-19 tests (RT-PCR, IgG and IgM) to the data from Cassaniti et al. (2020). JAGS (Just Another Gibbs Sampler) is a program for the analysis of Bayesian hierarchical models using Markov Chain Monte Carlo (MCMC) simulation. JAGS contains an algorithm to sample from the posterior distribution, which in a Bayesian framework, results from the combination of prior information and the data. 
The choice of the priors was based on the information provided in the paper and beta priors were obtained using the software Betabuster (https://betabuster.software.informer.com/1.0/). For the sensitivity of the RT-PCR we assumed that we are 95% sure that it is higher than 30%, with a mode at 80%. The rationale for a sensitivity higher than 30% is due 
to the findings of a low sensitivity from Liu et al. (2020) and the assumed mode due to the study data from Cassaniti et al. (2020) with 30 confirmed COVID-19 patients. These patients were included as a group of confirmed COVID-19 cases, and including a group of patients known to have the disease and a group of people definitely known not to have it, rather than patients merely suspected to have it, may lead to an overestimation of test accuracies. In line with this and based on prevaling knowldege we assumed the specificity of Rt-PCR to be close to 100%. The choice for the beta priors for the sensitivity assumed that the samples in the infected patients were taking rather early during the infection, so that the IgG and IgM might not yet have been presnet at a detectable level. Therefore we assumed that we are 95% sure that the sensitivities will be at least 30%, with a mode at 60%. As no information was available we included un-informative prior for the specificities of IgG and IgM.

Whereas according to the Hui-Walter paradigm a model with three tests and one population is identifiable, non-identifiabiliy becomes an issue when potential conditional test dependencies are also included in the model. Since IgG and IgM rely on the same biological principle, at least a conditional dependency between these two tests should be included. 


# Limitations

