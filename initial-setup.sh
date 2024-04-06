#!/bin/bash
# Get GitHub username
echo -n "What's your GitHub username?: "
read -r github_username

# Get DockerHub username
echo -n "What's your DockerHub username?: "
read -r dockerhub_username

# Function that looks for strings AATT_GITHUB_USERNAME and AATT_DOCKERHUB_USERNAME in a files /backstage/my-backstage/app-config.yaml and /k8s-manifests/my-app/backend/deployment and replaces them with the value of github_username and dockerhub_username
replace_string_in_file() {
    file_path=$1
    github_username=$2
    dockerhub_username=$3
    sed -i "s/AATT_GITHUB_USERNAME/$github_username/g" "$file_path"
    sed -i "s/AATT_DOCKERHUB_USERNAME/$dockerhub_username/g" "$file_path"
}

# Call function to replace the strings
replace_string_in_file "application-code/my-app/backend/catalog-info.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "application-code/my-app/frontend/catalog-info.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "application-code/my-app/redis/catalog-info.yaml" "$github_username" "$dockerhub_username"

replace_string_in_file "argo-cd/applications/infra/backstage-application.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/infra/grafana-application.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/infra/prometheus-application.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/backend/application-dev.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/backend/application-prod.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/backend/application-stage.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/frontend/application-dev.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/frontend/application-prod.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/frontend/application-stage.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/redis/application-dev.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/redis/application-prod.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/applications/systems/my-app/redis/application-stage.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/self-manage/argocd-app-of-apps-application.yaml" "$github_username" "$dockerhub_username"
replace_string_in_file "argo-cd/self-manage/argocd-application.yaml" "$github_username" "$dockerhub_username"

replace_string_in_file "backstage/my-backstage/app-config.yaml" "$github_username" "$dockerhub_username"

replace_string_in_file "helm-charts/infra/backstage/values-custom.yaml" "$github_username" "$dockerhub_username"


echo -n "That's it! All necessary files were updated with the info you provided. You can go back to the README and carry on with the guide."
