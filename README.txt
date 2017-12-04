Q: What is this variable ${BI_Ass1_Dir} which you use in some KJBs?

A: We did not find a way to have PDI use relative paths for the SQL files in "OLTP create.kjb" (and other Integration Jobs)
    -> thus, we have introduced the variable ${BI_Ass1_Dir} (in: %homepath%/.kettle/kettle.properties):
        BI_Ass1_Dir = F:\\git\\Business_Intelligence_2017W_Ass1
        which contains an absolute path to the root folder of the project, and which is used when scripts were referenced
        from within an Integration Job (does not apply for referencing the Transformation Files (.ktr), as they worked
        with the internal variable ${Internal.Entry.Current.Directory})



Q: Why are there two copies of each KJB files, one in the root folder and one in the task subfolder?

A: When the KJB files are moved to their related task subfolders (e.g. "OLTP create.kjb" moved to "task1/OLTP create.kjb"),
    PDI would bring up an error saying that "OLTP create.kjb" is not a file and therefore cannot be run
    -> thus, we just simply copied the file to both root folder and their task subfolders
        (which is why there are two copies for each KJB file)