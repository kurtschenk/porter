porter() {
    if [ -x "./bin/porter" ]; then
        ./bin/porter "$@"
    else
        echo "Error: ./bin/porter not found or not executable."
        return 1
    fi
}

cp ~/src/One/MCIGET-ISV-UnifiedDeployment/kurtsc/porter_driver/bash/cnab-ksdebug ~/.porter/drivers/
cp ~/src/One/MCIGET-ISV-UnifiedDeployment/kurtsc/porter_driver/bash/cnab-ksdocker ~/.porter/drivers/
chmod +x ~/.porter/drivers/cnab-ksdebug
chmod +x ~/.porter/drivers/cnab-ksdocker

PATH=$PATH:~/.porter/drivers/

# For porter-test-bundle
./bin/porter params apply params.yaml 
./bin/porter creds apply creds.yaml 

# Works
# porter param apply parameter-set.yaml
# porter install test1 -r getporter/hello-llama:v0.1.1 -d ksdocker -p hello-llama --verbosity debug --force

# Works
# porter install hello -r getporter/porter-hello:v0.1.1 -d ksdocker --verbosity debug --force
# porter show hello
# porter upgrade hello -r getporter/porter-hello:v0.1.1 -d ksdocker --verbosity debug --force
# porter show hello
# porter uninstall hello -r getporter/porter-hello:v0.1.1 -d ksdocker --verbosity debug --force
# porter show hello

# porter param apply whalesay_params.yaml
# Not working. Why? But fails with released docker driver, so that is not the issue
# porter install whalesay -r getporter/whalesay:v0.1.2 --verbosity debug --force
# porter install whalesay -r getporter/whalesay:v0.1.0 -d ksdocker -p whalesay --verbosity debug --force
# porter install whalesay -r getporter/whalesay:v0.1.0 -d ksdocker --param msg="hi" --verbosity debug --force
# porter install whalesay -r getporter/whalesay:v0.1.0 -d ksdocker --verbosity debug --force
