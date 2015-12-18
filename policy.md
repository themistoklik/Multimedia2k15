How to use this branch
======================

### Step 1:
Assign yourself to a task on the [Trello board]

### Step 2:
Create a local branch

    git branch whatevername
    git checkout whatevername

### Step 3:
Work it like you mean it (make changes and commit them to the local branch)

### Step 4:
fetch the remote and merge, then merge your branch, commit changes
and push to the remote

    git checkout master (you were in the whatevername branch)
    git clone origin master
    git merge whatevername
    (here you might need to resolve conflicts, but hopefully not)
    git push origin master

### Step 5:
delete the local branch

    git branch -d whatevername
[Trello board]: https://trello.com/b/uDflfIHI/multimedia-homework
