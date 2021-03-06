function [] = Count_entities_and_relations(asymtrainfb15k237,...
      symtrainfb15k237, ...
      asymtrainwn18rr, ...
      symtrainwn18rr, ...
      trainfb15k237, ...
      trainwn18rr, ...
      asymtestfb15k237, asymvalidfb15k237, ...
      symtestfb15k237, symvalidfb15k237, ...
      asymtestwn18rr, asymvalidwn18rr, ...
      symtestwn18rr, symvalidwn18rr, ...
      testfb15k237, validfb15k237, ...
      testwn18rr, validwn18rr)
  

  
for iterate = 1:6
    if iterate == 4
        which_data = asymtrainfb15k237;
    end
    if iterate == 3
        which_data = symtrainfb15k237;
    end
    if iterate == 6
        which_data = asymtrainwn18rr;
    end
    if iterate == 5
        which_data = symtrainwn18rr;
    end
    if iterate == 1
        which_data = trainfb15k237;
    end
    if iterate == 2
        which_data = trainwn18rr;
    end
    
    predicates = strings;
    predicates(1,1) = which_data(1,2);
    i = 2;
    for n = 2:length(which_data(:,1))
        if ~any(strcmp(predicates(:,1),which_data(n,2)))
            predicates(i,1) = which_data(n,2);
            i = i + 1;
        end
    end

    %Make entities into a single 'list'
    entity_data = string([]);
    entity_data(:,1) = which_data(:,1);
    entity_data(end+1:end+length(which_data(:,3)),1) = which_data(:,3);


    entities = strings;
    entities(1,1) = entity_data(1,1);
    i = 2;
    for q = 2:length(entity_data(:,1))
        if ~any(strcmp(entities(:,1),entity_data(q,1)))
            entities(i,1) = entity_data(q,1);
            i = i + 1;
        end
    end

Number_of_entities(iterate,1) = length(entities(:,1));
Number_of_relations(iterate,1) = length(predicates(:,1));
end

Output_entities_and_relations = strings;

Output_entities_and_relations(1,1) = 'Original data sets';
Output_entities_and_relations(1,2) = 'Entities';
Output_entities_and_relations(1,3) = 'Relations';
Output_entities_and_relations(1,4) = 'Training';
Output_entities_and_relations(1,5) = 'Validation';
Output_entities_and_relations(1,6) = 'Test';

Output_entities_and_relations(2,1) = 'FB15k-237';
Output_entities_and_relations(2,2) = Number_of_entities(1,1);
Output_entities_and_relations(2,3) = Number_of_relations(1,1);
Output_entities_and_relations(2,4) = length(trainfb15k237(:,1));
Output_entities_and_relations(2,5) = length(validfb15k237(:,1));
Output_entities_and_relations(2,6) = length(testfb15k237(:,1));


Output_entities_and_relations(3,1) = 'WN18RR';
Output_entities_and_relations(3,2) = Number_of_entities(2,1);
Output_entities_and_relations(3,3) = Number_of_relations(2,1);
Output_entities_and_relations(3,4) = length(trainwn18rr(:,1));
Output_entities_and_relations(3,5) = length(validwn18rr(:,1));
Output_entities_and_relations(3,6) = length(testwn18rr(:,1));

Output_entities_and_relations(4,1) = 'New data sets';

Output_entities_and_relations(5,1) = 'Sym-FB15k-237';
Output_entities_and_relations(5,2) = Number_of_entities(3,1);
Output_entities_and_relations(5,3) = Number_of_relations(3,1);
Output_entities_and_relations(5,4) = length(symtrainfb15k237(:,1));
Output_entities_and_relations(5,5) = length(symvalidfb15k237(:,1));
Output_entities_and_relations(5,6) = length(symtestfb15k237(:,1));

Output_entities_and_relations(6,1) = 'Asym-FB15k-237';
Output_entities_and_relations(6,2) = Number_of_entities(4,1);
Output_entities_and_relations(6,3) = Number_of_relations(4,1);
Output_entities_and_relations(6,4) = length(asymtrainfb15k237(:,1));
Output_entities_and_relations(6,5) = length(asymvalidfb15k237(:,1));
Output_entities_and_relations(6,6) = length(asymtestfb15k237(:,1));

Output_entities_and_relations(7,1) = 'Sym-WN18RR';
Output_entities_and_relations(7,2) = Number_of_entities(5,1);
Output_entities_and_relations(7,3) = Number_of_relations(5,1);
Output_entities_and_relations(7,4) = length(symtrainwn18rr(:,1));
Output_entities_and_relations(7,5) = length(symvalidwn18rr(:,1));
Output_entities_and_relations(7,6) = length(symtestwn18rr(:,1));

Output_entities_and_relations(8,1) = 'Asym-WN18RR';
Output_entities_and_relations(8,2) = Number_of_entities(6,1);
Output_entities_and_relations(8,3) = Number_of_relations(6,1);
Output_entities_and_relations(8,4) = length(asymtrainwn18rr(:,1));
Output_entities_and_relations(8,5) = length(asymvalidwn18rr(:,1));
Output_entities_and_relations(8,6) = length(asymtestwn18rr(:,1));

assignin('base','Output_Table_entities_and_relations',Output_entities_and_relations)

end
