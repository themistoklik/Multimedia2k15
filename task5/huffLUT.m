function s = huffLUT(p)
    % function huffLUT produces huffman prefix codes in s for characters with
    % absolute frequencies in p

    [p, ord] = sort(p); %ord is the permutation vector for p to be sorted

    %create leaf nodes
    nodes = cell(1, length(p));
    for i=1:length(p),
        nodes{i}.freq = p(i);
        nodes{i}.order = ord(i);
        nodes{i}.code = '';
        nodes{i}.leaf = true;

    end

    %create huffman tree
    while length(nodes) > 2, %end of while => only 2 nodes in array
        %new node as sum of rarest nodes
        newnode.freq = nodes{1}.freq + nodes{2}.freq;
        newnode.code = '';
        newnode.left = nodes{1};
        newnode.right = nodes{2};
        newnode.leaf = false;
        nodes = nodes(3:end); %remove rarest symbol nodes
        %nodes = [nodes(1:end) {newnode}];

        i=1;
        %insert new node at right place, so we don't have to sort each time we join nodes
        while nodes{i}.freq < newnode.freq,
            if i >= length(nodes),
                break
            end
            i = i+1;
        end
        %actual insertion
        nodes = [nodes(1:i) {newnode} nodes(i+1:end)];
    end

    
    Tree.left = nodes{1};
    Tree.right = nodes{2};
    Tree.code = '';
    Tree.leaf = false;

    %assign codes, preorder traversal
    s = assignCodes(Tree, cell(size(p)));

end

%Function to perform the assignment of codes to the produced huffman Tree.
%returns s, which is essentialy the LUT of this huffman implementation, as it's the array of symbols.
function s = assignCodes(Tree, s)
%start with the convention that right gets '1' and left '0'
%check if this node isn't a leaf and assign codes
    if ~Tree.leaf,
        Tree.left.code = [Tree.code '0']; % childcode = parentcode + 0 or 1
        Tree.right.code = [Tree.code '1'];
        
        s = assignCodes(Tree.left, s);
        s = assignCodes(Tree.right, s);
    else
        s{Tree.order} = Tree.code;
        return
    end
    
end

