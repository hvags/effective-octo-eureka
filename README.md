# effective-octo-eureka
inf367 final project

This repository contains the implementation of the project. The code is presented in three sequential
notebooks.

## 1_triple_data_manipulation.ipynb

The notebook contains a number of utility methods for processing triple data sets. It also contains
code that splits the fb15k-237 and wn18rr datasets into subsets, based on the predicates of the triples
and whether each predicate is mostly symmetric or mostly anti symmetric. The datasets are expected to
be found in a 'data' directory, which should have subdirectories 'fb15k-237' and 'wn18rr'. Output will
be written to the same directories for further processing in the next step.
