# effective-octo-eureka
inf367 final project

This is the https://github.com/hvags/effective-octo-eureka repository, which contains the implementation of our final project. The code pertaining to the execution of the embedding pipelines is presented in three sequential notebooks. The notebooks are set up to be possible to run end-to-end in sequence.

**Note: Particularly notebooks *2_hpo* and *3_reporting* will trigger the training of all models on all datasets if left untouched before running.**

The notebooks can be run locally or in a hosted service, but are currently configured to use local data.
To change this refer to instructions in the notebooks themselves.

Go to https://colab.research.google.com/github/hvags/effective-octo-eureka/blob/main/ to access the notebooks directly from Google Colab

The PyKeen pipelines are run on a GPU by default, change the appropriate parameter in the notebook to
run on cpu instead.

All data and notebooks are available in the github repository. 

## Pragmatic adaptations to the hpo optimization
Due to GPU capacity constraints, the following adaptations were made in the production of the pre-computed hpo trials:

- RotatE models were trained with an sLCWA training loop, loss function dependent on the base dataset.
- ComplEx and RESCAL models were trained with Margin Ranking Loss and an sLCWA training loop.

## Data preprocessing
*1_triple_data_manipulation.ipynb*

The notebook contains a number of utility methods for processing triple data sets. It also contains
code that splits the fb15k-237 and wn18rr datasets into subsets, based on the predicates of the triples
and whether each predicate is mostly symmetric or mostly anti symmetric. The datasets are expected to
be found in a 'data' directory, which should have subdirectories 'fb15k-237' and 'wn18rr'. Output will
be written to the same directories for further processing in the next step.

## Hyper parameter optimalization
*2_hpo.ipynb*

The notebook retrieves data from the directories populated by the previous one. It also allows
retrieving the preprocessed datasets from a project github repository  to allow the notebook to run
in runtime environments such as Google Colab without needing to handle the dataset files manually. Note
that if running the notebook locally the first cell with instructions should be skipped, but the user
must bring their own working environment.

The HPO pipeline writes the opitimization results to a local 'hpo_results/{dataset}/{model}' directory
particular to each dataset and model, from which it can be read by the next step. 

## Pipeline evaulation
*3_reporting.ipynb*

This notebook retrieves the best pipeline configuration produced by the HPO notebook, and runs a standard PyKeen
pipeline on the same dataset. Note that the model is retrained using the training data and evaluated using the
test data, unlike the HPO which evaluates using the validation data during trials.

If ran in its entirety, this notebook will train and evaluate all the specified models on all available data sets,
and output a metrics table for each dataset showing how each model performs on that data.

## Data set analysis

To calculate the number of entities and number of relations for each of the new data sets (12 data sets), as well as the distribution of 1-1 and 1-N/N-1/N-N 
triples in the new and the original FB15k-237 and WN18RR data sets (12 + 6 original data sets), a Matlab routine is used.

One can either load all of the data 
sets in the folders /data/fb15k-237 (9 files) and /data/wn18rr (9 files), or open the worksheet file Including_New_Datasets_project.mat inside
the folder \Matlab_procedure\Workspace which cointains all of the mentioned files as appropriate matrices.

One must also open the script 
Count_entities_and_relations.py and Count_1_1_and_N_N_relations.py which are found in the folder \Matlab_procedure\Scripts. These scripts should then be run.

This will output and save to the worksheet 2 matrices/list (Output_Table_entities_and_relations and Output_Table_1_1_N_N_relations) which gives the information
that is summarized in Table 2 and Table 3 in the report, respectively.
