function [] = Finding_Symmetric_Predicates(trainwn18rr,trainfb15k237)

%Find all individual predicates
predicates_CHECK = strings;
predicates_CHECK(1,1) = trainwn18rr(1,2);
i = 2;
for n = 2:length(trainwn18rr(:,1))
    if ~any(strcmp(predicates_CHECK(:,1),trainwn18rr(n,2)))
        predicates_CHECK(i,1) = trainwn18rr(n,2);
        i = i + 1;
    end
end
%Count the occurence of each of the individual predicates
count_predicates_CHECK = zeros(length(predicates_CHECK(:,1)),1);
for n = 1:length(trainwn18rr(:,1))
    for q = 1:length(predicates_CHECK(:,1))
        if strcmp(predicates_CHECK(q,1),trainwn18rr(n,2))
            count_predicates_CHECK(q,1) = count_predicates_CHECK(q,1) + 1;
        end
    end
end
%For each (h,r,t), look for (t,r,h). If found, write 2 symmetric triples
%corresponding to r. If not found, write 1 anti-sym triple corresponding to r
Left_Sym_Right_CHECK = zeros(length(predicates_CHECK(:,1)),1);
for n = 1:length(trainwn18rr(:,1))
    
    entity_head = trainwn18rr(n,1);
    relation = trainwn18rr(n,2);
    entity_tail = trainwn18rr(n,3);
    
    index_array = find(strcmp(trainwn18rr(:,3),entity_head)); % This indexes all occurences of the head entity as the tail entity
    
    if ~isempty(index_array)
        for number_index = 1:length(index_array)
            index_of_former_head_entity = index_array(number_index);        
            %If the tail entity can be found as head, and the same relation
            %occurs, we have a symmetric triple for that relation
            if strcmp(trainwn18rr(index_of_former_head_entity,1),entity_tail) & strcmp(trainwn18rr(index_of_former_head_entity,2),relation)
                index_of_predicate = find(strcmp(predicates_CHECK(:,1),relation));
                Left_Sym_Right_CHECK(index_of_predicate,1) = Left_Sym_Right_CHECK(index_of_predicate,1) + 1;
            end
        end
    end
end
Left_Sym_Right_CHECK(:,3) = count_predicates_CHECK(:,1);
Left_Sym_Right_CHECK(:,2) = Left_Sym_Right_CHECK(:,3) - Left_Sym_Right_CHECK(:,1);
predicates_CHECK(:,2) = Left_Sym_Right_CHECK(:,1);
predicates_CHECK(:,3) = Left_Sym_Right_CHECK(:,2);
predicates_CHECK(:,4) = count_predicates_CHECK;

%FIRST COLUMN represents the predicates.
%SECOND COLUMN represents the count of how many times this predicate is
%involved in a symmetric triple (h1,pred,t1) and (t1,pred,h1) exists.
%THIRD COLUMN represents the count of how many times this predicate is NOT
%involved in a symmetric triple (thereby anti-symmetric)
%FOURTH COLUMN represents the total count of triples with this predicate
predicates_CHECK
%}

%Our criteria for a symmetric triple is simply that the predicates in the
%training set have more symmetric counterparts than not (Symmetric >
%Anti-Sym)
Symmetric_predicates = strings;
i = 1;
for n = 1:length(predicates_CHECK(:,1))
    if str2num(predicates_CHECK(n,2)) > str2num(predicates_CHECK(n,3))
        Symmetric_predicates(i,1) = predicates_CHECK(n,1);
        i = i + 1;
    end
end

assignin('base','Symmetric_Predicates_WN18RR',Symmetric_predicates)

%The same process is repeated for the FB15k-237 data set

%Find all individual predicates
predicates_CHECK = strings;
predicates_CHECK(1,1) = trainfb15k237(1,2);
i = 2;
for n = 2:length(trainfb15k237(:,1))
    if ~any(strcmp(predicates_CHECK(:,1),trainfb15k237(n,2)))
        predicates_CHECK(i,1) = trainfb15k237(n,2);
        i = i + 1;
    end
end
%Count the occurence of each of the individual predicates
count_predicates_CHECK = zeros(length(predicates_CHECK(:,1)),1);
for n = 1:length(trainfb15k237(:,1))
    for q = 1:length(predicates_CHECK(:,1))
        if strcmp(predicates_CHECK(q,1),trainfb15k237(n,2))
            count_predicates_CHECK(q,1) = count_predicates_CHECK(q,1) + 1;
        end
    end
end
%For each (h,r,t), look for (t,r,h). If found, write 2 symmetric triples
%corresponding to r. If not found, write 1 anti-sym triple corresponding to r
Left_Sym_Right_CHECK = zeros(length(predicates_CHECK(:,1)),1);
for n = 1:length(trainfb15k237(:,1))
    
    entity_head = trainfb15k237(n,1);
    relation = trainfb15k237(n,2);
    entity_tail = trainfb15k237(n,3);
    
    index_array = find(strcmp(trainfb15k237(:,3),entity_head)); % This indexes all occurences of the head entity as the tail entity
    
    if ~isempty(index_array)
        for number_index = 1:length(index_array)
            index_of_former_head_entity = index_array(number_index);        
            %If the tail entity can be found as head, and the same relation
            %occurs, we have a symmetric triple for that relation
            if strcmp(trainfb15k237(index_of_former_head_entity,1),entity_tail) & strcmp(trainfb15k237(index_of_former_head_entity,2),relation)
                index_of_predicate = find(strcmp(predicates_CHECK(:,1),relation));
                Left_Sym_Right_CHECK(index_of_predicate,1) = Left_Sym_Right_CHECK(index_of_predicate,1) + 1;
            end
        end
    end
end
Left_Sym_Right_CHECK(:,3) = count_predicates_CHECK(:,1);
Left_Sym_Right_CHECK(:,2) = Left_Sym_Right_CHECK(:,3) - Left_Sym_Right_CHECK(:,1);
predicates_CHECK(:,2) = Left_Sym_Right_CHECK(:,1);
predicates_CHECK(:,3) = Left_Sym_Right_CHECK(:,2);
predicates_CHECK(:,4) = count_predicates_CHECK;

%FIRST COLUMN represents the predicates.
%SECOND COLUMN represents the count of how many times this predicate is
%involved in a symmetric triple (h1,pred,t1) and (t1,pred,h1) exists.
%THIRD COLUMN represents the count of how many times this predicate is NOT
%involved in a symmetric triple (thereby anti-symmetric)
%FOURTH COLUMN represents the total count of triples with this predicate
predicates_CHECK
%}

%Our criteria for a symmetric triple is simply that the predicates in the
%training set have more symmetric counterparts than not (Symmetric >
%Anti-Sym)
Symmetric_predicates = strings;
i = 1;
for n = 1:length(predicates_CHECK(:,1))
    if str2num(predicates_CHECK(n,2)) > str2num(predicates_CHECK(n,3))
        Symmetric_predicates(i,1) = predicates_CHECK(n,1);
        i = i + 1;
    end
end

assignin('base','Symmetric_Predicates_FB15k237',Symmetric_predicates)
