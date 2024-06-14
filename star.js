const axios = require('axios')

const STAR_ROUTE = (id) => `https://eip-tek3.epitest.eu/api/projects/${id}/star`
const FETCH_ROUTE = "https://eip-tek3.epitest.eu/api/projects?scholar_year=2023&include_rejected=false&offset=0&limit=1000"

const TOKEN = "your-jwt-token-here"


const autoStar = async () => {

    let projects = []
    let starsCount = 0
    const starsNames = []
    try {
        projects = await axios.get(FETCH_ROUTE, {
            headers: {
                Authorization: `Bearer ${TOKEN}`
            }
        })
    } catch (e) {
        console.error(e)
    }
    console.log(`Fetched ${projects.data.length} projects`)
    const lyonProjects = projects.data.results.filter(project => project.ownerCity.name === "Lyon")

    for (let i = 0; i < lyonProjects.length; i++) {
        const id = lyonProjects[i].id
        const name = lyonProjects[i].name

        if (lyonProjects[i].starred) {
            continue
        }
        try {
            console.log(`Starring project ${name}`)
            await axios.post(STAR_ROUTE(id), {}, {
                headers: {
                    Authorization: `Bearer ${TOKEN}`
                }
            })
            starsCount++
            starsNames.push(name)
            console.log(`OK`)
        } catch (e) {
            console.error("Failed")
        }

    }

    console.log(`Starred ${starsCount} projects:\n${starsNames.join("\n")}`)
}

autoStar()