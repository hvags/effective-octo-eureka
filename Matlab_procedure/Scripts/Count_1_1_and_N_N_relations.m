function [] = Count_1_1_and_N_N_relations(asymtrainfb15k237, asymtestfb15k237, asymvalidfb15k237, ...
      symtrainfb15k237, symtestfb15k237, symvalidfb15k237, ...
      asymtrainwn18rr, asymtestwn18rr, asymvalidwn18rr, ...
      symtrainwn18rr, symtestwn18rr, symvalidwn18rr, ...
      trainfb15k237, testfb15k237, validfb15k237, ...
      trainwn18rr, testwn18rr, validwn18rr)

Left_1_1_Right_N_N = zeros(18,2);    
for iterate = 1:18
    if iterate == 1
        which_data = asymtrainfb15k237;
    end
    if iterate == 2
        which_data = asymtestfb15k237;
    end
    if iterate == 3
        which_data = asymvalidfb15k237;
    end
    if iterate == 4
        which_data = symtrainfb15k237;
    end
    if iterate == 5
        which_data = symtestfb15k237;
    end
    if iterate == 6
        which_data = symvalidfb15k237;
    end
    if iterate == 7
        which_data = asymtrainwn18rr;
    end
    if iterate == 8
        which_data = asymtestwn18rr;
    end
    if iterate == 9
        which_data = asymvalidwn18rr;
    end
    if iterate == 10
        which_data = symtrainwn18rr;
    end
    if iterate == 11
        which_data = symtestwn18rr;
    end
    if iterate == 12
        which_data = symvalidwn18rr;
    end
    if iterate == 13
        which_data = trainfb15k237;
    end
    if iterate == 14
        which_data = testfb15k237;
    end
    if iterate == 15
        which_data = validfb15k237;
    end
    if iterate == 16
        which_data = trainwn18rr;
    end
    if iterate == 17
        which_data = testwn18rr;
    end
    if iterate == 18
        which_data = validwn18rr;
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
    
    count_predicates = zeros(length(predicates(:,1)),1);
    for n = 1:length(which_data(:,1))
        for q = 1:length(predicates(:,1))
            if strcmp(predicates(q,1),which_data(n,2))
                count_predicates(q,1) = count_predicates(q,1) + 1;
            end
        end
    end
    
    %for each (h,r,t), look for (t,r,h). If found, write 2 symmetric triples
    %corresponding to r. If not found, write 1 anti-sym triple corresponding to r
    for n = 1:length(which_data(:,1))
        start_loop_again = 0;
        
        entity_head = which_data(n,1);
        relation = which_data(n,2);
        entity_tail = which_data(n,3);
        
        %Want to find if triple is a part of in 1-1, or 1-N, N-1, N-N
        index_array_head = find(strcmp(which_data(:,1),entity_head)); % This indexes all occurences of the head entity as the tail entity
        for number_index = 1:length(index_array_head)
            index_of_former_head_entity = index_array_head(number_index);
            if strcmp(which_data(index_of_former_head_entity,2),relation)
                if ~strcmp(which_data(index_of_former_head_entity,3),entity_tail) %If it is not the same triple
                    Left_1_1_Right_N_N(iterate,2) = Left_1_1_Right_N_N(iterate,2) + 1;
                    start_loop_again = 1;
                    break
                end
            end
        end
        if start_loop_again == 1
            continue
        end
        index_array_tail = find(strcmp(which_data(:,3),entity_tail)); % This indexes all occurences of the head entity as the tail entity
        for number_index = 1:length(index_array_tail)
            index_of_former_tail_entity = index_array_tail(number_index);
            if strcmp(which_data(index_of_former_tail_entity,2),relation)
                if ~strcmp(which_data(index_of_former_tail_entity,1),entity_head) %If it is not the same triple
                    Left_1_1_Right_N_N(iterate,2) = Left_1_1_Right_N_N(iterate,2) + 1;
                    start_loop_again = 1;
                    break
                end
            end
        end
        if start_loop_again == 1
            continue
        end
        %This means there was no 1-N, N-1 or N-N, so the relationship have to
        %triple have to be a part of 1-1.
        Left_1_1_Right_N_N(iterate,1) = Left_1_1_Right_N_N(iterate,1) + 1;
    end
end

Output_1_1_and_N_N_relations = string;
Output_1_1_and_N_N_relations(1,1) = 'Data sets';
Output_1_1_and_N_N_relations(1,2) = 'Triples';
Output_1_1_and_N_N_relations(1,3) = '(1-1)';
Output_1_1_and_N_N_relations(1,4) = '(1-N/N-1/N-N)';

Output_1_1_and_N_N_relations(2,1) = 'Asym-FB15k-237 Training';
Output_1_1_and_N_N_relations(2,2) = Left_1_1_Right_N_N(1,1) + Left_1_1_Right_N_N(1,2);
Output_1_1_and_N_N_relations(2,3) = Left_1_1_Right_N_N(1,1);
Output_1_1_and_N_N_relations(2,4) = Left_1_1_Right_N_N(1,2);

Output_1_1_and_N_N_relations(3,1) = 'Asym-FB15k-237 Test';
Output_1_1_and_N_N_relations(3,2) = Left_1_1_Right_N_N(2,1) + Left_1_1_Right_N_N(2,2);
Output_1_1_and_N_N_relations(3,3) = Left_1_1_Right_N_N(2,1);
Output_1_1_and_N_N_relations(3,4) = Left_1_1_Right_N_N(2,2);

Output_1_1_and_N_N_relations(4,1) = 'Asym-FB15k-237 Validation';
Output_1_1_and_N_N_relations(4,2) = Left_1_1_Right_N_N(3,1) + Left_1_1_Right_N_N(3,2);
Output_1_1_and_N_N_relations(4,3) = Left_1_1_Right_N_N(3,1);
Output_1_1_and_N_N_relations(4,4) = Left_1_1_Right_N_N(3,2);

Output_1_1_and_N_N_relations(5,1) = 'Sym-FB15k-237 Training';
Output_1_1_and_N_N_relations(5,2) = Left_1_1_Right_N_N(4,1) + Left_1_1_Right_N_N(4,2);
Output_1_1_and_N_N_relations(5,3) = Left_1_1_Right_N_N(4,1);
Output_1_1_and_N_N_relations(5,4) = Left_1_1_Right_N_N(4,2);

Output_1_1_and_N_N_relations(6,1) = 'Sym-FB15k-237 Test';
Output_1_1_and_N_N_relations(6,2) = Left_1_1_Right_N_N(5,1) + Left_1_1_Right_N_N(5,2);
Output_1_1_and_N_N_relations(6,3) = Left_1_1_Right_N_N(5,1);
Output_1_1_and_N_N_relations(6,4) = Left_1_1_Right_N_N(5,2);

Output_1_1_and_N_N_relations(7,1) = 'Sym-FB15k-237 Validation';
Output_1_1_and_N_N_relations(7,2) = Left_1_1_Right_N_N(6,1) + Left_1_1_Right_N_N(6,2);
Output_1_1_and_N_N_relations(7,3) = Left_1_1_Right_N_N(6,1);
Output_1_1_and_N_N_relations(7,4) = Left_1_1_Right_N_N(6,2);

Output_1_1_and_N_N_relations(8,1) = 'Asym-WN18RR Training';
Output_1_1_and_N_N_relations(8,2) = Left_1_1_Right_N_N(7,1) + Left_1_1_Right_N_N(7,2);
Output_1_1_and_N_N_relations(8,3) = Left_1_1_Right_N_N(7,1);
Output_1_1_and_N_N_relations(8,4) = Left_1_1_Right_N_N(7,2);

Output_1_1_and_N_N_relations(9,1) = 'Asym-WN18RR Test';
Output_1_1_and_N_N_relations(9,2) = Left_1_1_Right_N_N(8,1) + Left_1_1_Right_N_N(8,2);
Output_1_1_and_N_N_relations(9,3) = Left_1_1_Right_N_N(8,1);
Output_1_1_and_N_N_relations(9,4) = Left_1_1_Right_N_N(8,2);

Output_1_1_and_N_N_relations(10,1) = 'Asym-WN18RR Validation';
Output_1_1_and_N_N_relations(10,2) = Left_1_1_Right_N_N(9,1) + Left_1_1_Right_N_N(9,2);
Output_1_1_and_N_N_relations(10,3) = Left_1_1_Right_N_N(9,1);
Output_1_1_and_N_N_relations(10,4) = Left_1_1_Right_N_N(9,2);

Output_1_1_and_N_N_relations(11,1) = 'Sym-WN18RR Training';
Output_1_1_and_N_N_relations(11,2) = Left_1_1_Right_N_N(10,1) + Left_1_1_Right_N_N(10,2);
Output_1_1_and_N_N_relations(11,3) = Left_1_1_Right_N_N(10,1);
Output_1_1_and_N_N_relations(11,4) = Left_1_1_Right_N_N(10,2);

Output_1_1_and_N_N_relations(12,1) = 'Sym-WN18RR Test';
Output_1_1_and_N_N_relations(12,2) = Left_1_1_Right_N_N(11,1) + Left_1_1_Right_N_N(11,2);
Output_1_1_and_N_N_relations(12,3) = Left_1_1_Right_N_N(11,1);
Output_1_1_and_N_N_relations(12,4) = Left_1_1_Right_N_N(11,2);

Output_1_1_and_N_N_relations(13,1) = 'Sym-WN18RR Validation';
Output_1_1_and_N_N_relations(13,2) = Left_1_1_Right_N_N(12,1) + Left_1_1_Right_N_N(12,2);
Output_1_1_and_N_N_relations(13,3) = Left_1_1_Right_N_N(12,1);
Output_1_1_and_N_N_relations(13,4) = Left_1_1_Right_N_N(12,2);

Output_1_1_and_N_N_relations(14,1) = 'Original data sets';
Output_1_1_and_N_N_relations(14,2) = ' ';
Output_1_1_and_N_N_relations(14,3) = ' ';
Output_1_1_and_N_N_relations(14,4) = ' ';

Output_1_1_and_N_N_relations(15,1) = 'FB15k-237 Training';
Output_1_1_and_N_N_relations(15,2) = Left_1_1_Right_N_N(13,1) + Left_1_1_Right_N_N(13,2);
Output_1_1_and_N_N_relations(15,3) = Left_1_1_Right_N_N(13,1);
Output_1_1_and_N_N_relations(15,4) = Left_1_1_Right_N_N(13,2);

Output_1_1_and_N_N_relations(16,1) = 'FB15k-237 Test';
Output_1_1_and_N_N_relations(16,2) = Left_1_1_Right_N_N(14,1) + Left_1_1_Right_N_N(14,2);
Output_1_1_and_N_N_relations(16,3) = Left_1_1_Right_N_N(14,1);
Output_1_1_and_N_N_relations(16,4) = Left_1_1_Right_N_N(14,2);

Output_1_1_and_N_N_relations(17,1) = 'FB15k-237 Validation';
Output_1_1_and_N_N_relations(17,2) = Left_1_1_Right_N_N(15,1) + Left_1_1_Right_N_N(15,2);
Output_1_1_and_N_N_relations(17,3) = Left_1_1_Right_N_N(15,1);
Output_1_1_and_N_N_relations(17,4) = Left_1_1_Right_N_N(15,2);

Output_1_1_and_N_N_relations(18,1) = 'WN18RR Training';
Output_1_1_and_N_N_relations(18,2) = Left_1_1_Right_N_N(16,1) + Left_1_1_Right_N_N(16,2);
Output_1_1_and_N_N_relations(18,3) = Left_1_1_Right_N_N(16,1);
Output_1_1_and_N_N_relations(18,4) = Left_1_1_Right_N_N(16,2);

Output_1_1_and_N_N_relations(19,1) = 'WN18RR Test';
Output_1_1_and_N_N_relations(19,2) = Left_1_1_Right_N_N(17,1) + Left_1_1_Right_N_N(17,2);
Output_1_1_and_N_N_relations(19,3) = Left_1_1_Right_N_N(17,1);
Output_1_1_and_N_N_relations(19,4) = Left_1_1_Right_N_N(17,2);

Output_1_1_and_N_N_relations(20,1) = 'WN18RR Validation';
Output_1_1_and_N_N_relations(20,2) = Left_1_1_Right_N_N(18,1) + Left_1_1_Right_N_N(18,2);
Output_1_1_and_N_N_relations(20,3) = Left_1_1_Right_N_N(18,1);
Output_1_1_and_N_N_relations(20,4) = Left_1_1_Right_N_N(18,2);



assignin('base','Output_Table_1_1_N_N_relations',Output_1_1_and_N_N_relations)

