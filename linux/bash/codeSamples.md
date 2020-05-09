## Various Code Samples

* Samle array and loops
    ```bash
    #Arrary and loop
    list="A,B"
    IFS=', ' read -r -a arrayTeam <<< "${list}"
    arrayTeamLength=${#arrayTeam[@]}
    for((vRec=0;vRec<arrayTeamLength;vRec++))
    do
    #{
        #Get record X
        vParam=${arrayMembers[vRec]}
        #Do Something
    #}
    done
    ```

* Run modules of code based on config file
    ```bash
    #Funtion to update the status in vConfigFile
    fn_updateStatus()
    {
        vStage=$1
        vStatus=$2

        if [ ${vStatus} -ne 0 ] ; then
        #{
            echo "ERROR : Section $vStage has failed"
            sed -i 's/'${vStage}'.*/'${vStage}'|1|-1/' ${vConfigFile}
            exit 1
        #}
        else
        #{
            echo "INFO : Section $vStage is sucessfull"
            sed -i 's/'${vStage}'.*/'${vStage}'|1|1/' ${vConfigFile}
        #}
        fi
    }

    #Call the module passed
    fn_callModule()
    {
        vModule=$1
        echo "INFO : Running module $vModule"

        #Calling the module
        $vModule
        #Pass the return value of the above to the updateStatus command
        fn_updateStatus $vModule $?
    }

    #Run for all the modules in config file which are not commented
    for vModule in $(grep -v "^#" ${vConfigFile} | cut -d"|" -f1)
    do
    #{
        #Check if module is enabled
        if [ $(grep $vModule ${vConfigFile} | grep -v "^#" | cut -d"|" -f2) -eq 1 ]; then
        #{
            echo "INFO : Module $vModule is enabled"

            #Ignore if module has already been run, plea
            moduleRunStatus=$(grep $vModule ${vConfigFile} | grep -v "^#" | cut -d"|" -f3)
            case ${moduleRunStatus} in 
            #{
                0) 	fn_callModule $vModule;;
                1)	echo "INFO : Module $vModule has already been run";;
                -1)	echo "ERROR : Module $vModule has failed in previous execution. Please check ${vConfigFile}" ;
                exit 1;;
            #}
            esac
        #}
        else
        #{
            echo "INFO : Module $vModule is disabled"
        #}
        fi
    #}
    done
    ```

    The sample config file.
    ```
    ### Sample vConfigFile
    #Module|Enabled|Status
    ModuleX|1|1
    ModuleY|1|0
    ```