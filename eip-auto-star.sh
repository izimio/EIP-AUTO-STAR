#!/bin/bash

read -p "🔑 Please enter your JWT token: " TOKEN
STAR_ROUTE="https://eip-tek3.epitest.eu/api/projects"
FETCH_ROUTE="https://eip-tek3.epitest.eu/api/projects?scholar_year=2023&include_rejected=false&offset=0&limit=1000"

if ! command -v jq &> /dev/null; then
    echo -e "\e[31m❌ jq is required\e[0m"
    exit 1
fi

if [ -z "$TOKEN" ]; then
    echo -e "\e[31m❌ Token is required\e[0m"
    exit 1
fi


fetch_projects() {
    curl -s -H "Authorization: Bearer $TOKEN" "$FETCH_ROUTE"
}

star_project() {
    local id=$1
    local response
    response=$(curl -s -X POST -H "Authorization: Bearer $TOKEN" "$STAR_ROUTE/$id/star")
    if [ $? -eq 0 ]; then
        echo -e "\e[32m✅ OK\n\e[0m"
        return 0
    else
        echo -e "\e[31m❌ Failed\n\e[0m"
        return 1
    fi
}

auto_star() {
    local projects
    local starsCount=0
    local starsNames=()

    projects=$(fetch_projects)
    if [ -z "$projects" ]; then
        echo -e "\e[31m❌ Failed to fetch projects\e[0m"
        exit 1
    fi
    if [ "$(echo "$projects" | jq -r '.results | length')" -eq 0 ]; then
        echo "❌ Invalid token! Please check your JWT."
        exit 0
    fi

    echo "📦 Fetched all projects"

    local project_ids
    project_ids=$(echo "$projects" | jq -r '.results[] | select(.ownerCity.name == "Lyon" ) | select(.starred | not) | .id')

    for id in $project_ids; do
        name=$(echo "$projects" | jq -r --arg id "$id" '.results[] | select(.id == ($id | tonumber)) | .name')
        echo "🌟 Starring project $name"
        if star_project "$id"; then
            starsCount=$((starsCount + 1))
            starsNames+=("$name")
        else
            echo "❌ Failed to star project $name"
        fi
    done

    echo "⭐️ Starred $starsCount projects:"
    printf "\t-%s\n" "${starsNames[@]}"
}

auto_star
