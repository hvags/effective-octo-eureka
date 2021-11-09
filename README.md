# effective-octo-eureka
inf367 final project

This repository contains the implementation of the project. The code pertaining to the execution of the embedding pipelines is presented in three sequential notebooks.

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
in runtime environments suchas Google Colab without needing to handle the dataset files manually. Note
that if running the notebook locally the first cell with instructions should be skipped, but the user
must bring their own working environment.

## Data set analysis

To calculate the number of entities and number of relations for each of the new data sets (12 data sets), as well as the distribution of 1-1 and 1-N/N-1/N-N 
triples in the new and the original FB15k-237 and WN18RR data sets (12 + 6 original data sets), a Matlab routine is used. One can either load all of the data 
sets in the folders \New_Datasets (12 files), \FB15K-237 (3 files) and \WN18RR (3 files), or open the worksheet file Including_New_Datasets_project.mat inside
the folder \Matlab_procedure\Workspace which cointains all of the mentioned files as appropriate matrices. One also has to open the script 
Count_entities_and_relations.py and Count_1_1_and_N_N_relations.py which are found in the folder \Matlab_procedure\Scripts. These scripts should then be run.
This will output and save to the worksheet 2 matrices/list (Output_Table_entities_and_relations and Output_Table_1_1_N_N_relations) which gives the information
that is summarized in Table 2 and Table 3 in the report, respectively.
