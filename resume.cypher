// Create Nodes

CREATE 
// Personal Information
(bisrat:PERSON {name: "Bisrat Kebere Derebe", email: "kiyyakebere@gmail.com", phone: "+251925698349", location: "Addis Ababa, Ethiopia", linkedIn: "https://www.linkedin.com/in/bisry/", github: "https://github.com/bisryy"}),

// Education
(aastu:UNIVERSITY {name: "Addis Ababa Science and Technology University", type: "University for Industry", location: "Addis Ababa, Ethiopia"}),
(alx:INSTITUTION {name: "Africa Leadership Group", type: "Technology Training Provider", location: "Africa"}),
(a2sv:INSTITUTION {name: "Africa To Silicon Valley (A2SV) Coding Academy", type: "Non-Profit", location: "Africa"}),

(bachelor:DEGREE {name: "Bachelor of Science in Software Engineering", gpa: 3.64, duration: "Jul 2021 - Jun 2025"}),
(cert_frontend:CERTIFICATION {name: "Certified Software Engineer with Specialization in Frontend Development", duration: "Mar 2022 - May 2023"}),
(cert_algo:CERTIFICATION {name: "Data Structures, Algorithms, and Problem Solving", duration: "Dec 2023 - present"}),

// Experience
(eskelate:COMPANY {name: "Eskelate, LLC", location: "Addis Ababa, Ethiopia"}),
(intern:POSITION {title: "Frontend Developer Intern", duration: "Jul 2023 - Sep 2023", description: "Led a team of 7 web developers to develop a starter project using Next.JS along with RTK Query and Tailwind CSS, achieving a 20% reduction in project delivery through effective utilization of Agile methodologies. Reviewed code for quality assurance, ensuring adherence to best practices and high standards."}),

// Projects
(architect_ai:PROJECT {name: "The Architect AI", award: "Best Technical Implementation Award", description: "An AI-powered platform that assists in the architectural development from idea generation to final design product.", tech: "NextJS, FastAPI, Stable diffusion, ChatGPT, DALL-E", prize: "€2500"}),
(savannah:PROJECT {name: "Savannah - Career Compass", award: "Winner project of 2023 A2SV Internal Hackaton", description: "A comprehensive online platform with AI assistant that provides easy access to career resources, internships, extracurricular activities, certifications, and other relevant information for African university students.", tech: "NextJS, Material UI"}),
(bete_liq:PROJECT {name: "Bete Liq - Ethiopian Orthodox Tewahdo Church Education Platform", award: "Second place in Mahbere Kidusan (EOTCMK) ICT Competition 2023", description: "A comprehensive web application designed to provide spiritual education and resources to members of the Ethiopian Orthodox Tewahdo Church.", prize: "5000 ETB"}),

// Skills
(cpp:SKILL {name: "C++"}),
(java:SKILL {name: "Java"}),
(python:SKILL {name: "Python"}),
(php:SKILL {name: "PHP"}),
(rust:SKILL {name: "Rust"}),
(go:SKILL {name: "Go"}),
(assembly:SKILL {name: "Assembly"}),
(js_ts:SKILL {name: "Javascript/Typescript"}),
(reactjs:SKILL {name: "ReactJS"}),
(nextjs:SKILL {name: "NextJS"}),
(redux:SKILL {name: "Redux"}),
(mongodb:SKILL {name: "MongoDB"}),
(mysql:SKILL {name: "MySQL"}),
(git:SKILL {name: "Git"}),
(github:SKILL {name: "Github"}),
(nodejs:SKILL {name: "NodeJS"}),
(leadership:SKILL {name: "Leadership"}),
(communication:SKILL {name: "Effective Communication"}),
(time_management:SKILL {name: "Time Management"}),
(team_work:SKILL {name: "Team Work"}),

// Certificates and Achievements
(huawei_competition:ACHIEVEMENT {name: "Huawei ICT Competition 2023-24 Global Finalist"}),
(icpc:ACHIEVEMENT {name: "Top 15 - The 2023 ICPC Ethiopian Collegiate Programming Contest", description: "From 60+ teams across the country"}),
(leetcode:ACHIEVEMENT {name: "Solved 500+ Leetcode problems", description: "Topics like linked lists, stacks, monotonic stack, DP, graph, etc"}),
(alx_cert:ACHIEVEMENT {name: "Africa Leadership x Software Engineering Certification", specialization: "Frontend Development"}),
(ninja_program:ACHIEVEMENT {name: "NINJA University Startup Development Program in Ethiopia 2023", description: "Competition by Japan International Cooperation Agency (JICA)"})
;

// Create Relationships

// Relationships for Education
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"}),
(aastu:UNIVERSITY {name: "Addis Ababa Science and Technology University"}),
(alx:INSTITUTION {name: "Africa Leadership Group"}),
(a2sv:INSTITUTION {name: "Africa To Silicon Valley (A2SV) Coding Academy"}),
(bachelor:DEGREE {name: "Bachelor of Science in Software Engineering"}),
(cert_frontend:CERTIFICATION {name: "Certified Software Engineer with Specialization in Frontend Development"}),
(cert_algo:CERTIFICATION {name: "Data Structures, Algorithms, and Problem Solving"})
CREATE 
(bisrat)-[:STUDIED_AT]->(aastu),
(bisrat)-[:CERTIFIED_BY]->(alx),
(bisrat)-[:ATTENDED]->(a2sv),
(bisrat)-[:HAS_DEGREE]->(bachelor),
(bisrat)-[:HAS_CERTIFICATION]->(cert_frontend),
(bisrat)-[:HAS_CERTIFICATION]->(cert_algo)
;

// Relationships for Experience
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"}),
(eskelate:COMPANY {name: "Eskelate, LLC"}),
(intern:POSITION {title: "Frontend Developer Intern"})
CREATE 
(bisrat)-[:WORKED_AT]->(eskelate),
(bisrat)-[:HELD_POSITION]->(intern)
;

// Relationships for Projects
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"}),
(architect_ai:PROJECT {name: "The Architect AI"}),
(savannah:PROJECT {name: "Savannah - Career Compass"}),
(bete_liq:PROJECT {name: "Bete Liq - Ethiopian Orthodox Tewahdo Church Education Platform"})
CREATE 
(bisrat)-[:WORKED_ON]->(architect_ai),
(bisrat)-[:WORKED_ON]->(savannah),
(bisrat)-[:WORKED_ON]->(bete_liq)
;

// Relationships for Skills
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"}),
(cpp:SKILL {name: "C++"}),
(java:SKILL {name: "Java"}),
(python:SKILL {name: "Python"}),
(php:SKILL {name: "PHP"}),
(rust:SKILL {name: "Rust"}),
(go:SKILL {name: "Go"}),
(assembly:SKILL {name: "Assembly"}),
(js_ts:SKILL {name: "Javascript/Typescript"}),
(reactjs:SKILL {name: "ReactJS"}),
(nextjs:SKILL {name: "NextJS"}),
(redux:SKILL {name: "Redux"}),
(mongodb:SKILL {name: "MongoDB"}),
(mysql:SKILL {name: "MySQL"}),
(git:SKILL {name: "Git"}),
(github:SKILL {name: "Github"}),
(nodejs:SKILL {name: "NodeJS"}),
(leadership:SKILL {name: "Leadership"}),
(communication:SKILL {name: "Effective Communication"}),
(time_management:SKILL {name: "Time Management"}),
(team_work:SKILL {name: "Team Work"})
CREATE 
(bisrat)-[:HAS_SKILL]->(cpp),
(bisrat)-[:HAS_SKILL]->(java),
(bisrat)-[:HAS_SKILL]->(python),
(bisrat)-[:HAS_SKILL]->(php),
(bisrat)-[:HAS_SKILL]->(rust),
(bisrat)-[:HAS_SKILL]->(go),
(bisrat)-[:HAS_SKILL]->(assembly),
(bisrat)-[:HAS_SKILL]->(js_ts),
(bisrat)-[:HAS_SKILL]->(reactjs),
(bisrat)-[:HAS_SKILL]->(nextjs),
(bisrat)-[:HAS_SKILL]->(redux),
(bisrat)-[:HAS_SKILL]->(mongodb),
(bisrat)-[:HAS_SKILL]->(mysql),
(bisrat)-[:HAS_SKILL]->(git),
(bisrat)-[:HAS_SKILL]->(github),
(bisrat)-[:HAS_SKILL]->(nodejs),
(bisrat)-[:HAS_SOFT_SKILL]->(leadership),
(bisrat)-[:HAS_SOFT_SKILL]->(communication),
(bisrat)-[:HAS_SOFT_SKILL]->(time_management),
(bisrat)-[:HAS_SOFT_SKILL]->(team_work)
;

// Relationships for Certificates and Achievements
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"}),
(huawei_competition:ACHIEVEMENT {name: "Huawei ICT Competition 2023-24 Global Finalist"}),
(icpc:ACHIEVEMENT {name: "Top 15 - The 2023 ICPC Ethiopian Collegiate Programming Contest"}),
(leetcode:ACHIEVEMENT {name: "Solved 500+ Leetcode problems"}),
(alx_cert:ACHIEVEMENT {name: "Africa Leadership x Software Engineering Certification"}),
(ninja_program:ACHIEVEMENT {name: "NINJA University Startup Development Program in Ethiopia 2023"})
CREATE 
(bisrat)-[:ACHIEVED]->(huawei_competition),
(bisrat)-[:ACHIEVED]->(icpc),
(bisrat)-[:ACHIEVED]->(leetcode),
(bisrat)-[:ACHIEVED]->(alx_cert),
(bisrat)-[:ACHIEVED]->(ninja_program)
;

// Create Relationships between Positions and Skills
MATCH (pos:POSITION {title: "Frontend Developer Intern"}),
(nextjs:SKILL {name: "NextJS"})
CREATE (pos)-[:USED_TECHNOLOGY]->(nextjs);

// Query to retrieve all the projects worked on by Bisrat Kebere Derebe
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:WORKED_ON]->(project:PROJECT)
RETURN project.name AS projectName, project.description AS projectDescription;

// Query to retrieve all the skills possessed by Bisrat Kebere Derebe
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:HAS_SKILL]->(skill:SKILL)
RETURN skill.name AS skillName;

// Query to retrieve all the achievements of Bisrat Kebere Derebe
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:ACHIEVED]->(achievement:ACHIEVEMENT)
RETURN achievement.name AS achievementName, achievement.description AS achievementDescription;

// Query to retrieve all the positions held by Bisrat Kebere Derebe
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:HELD_POSITION]->(position:POSITION)
RETURN position.title AS positionTitle, position.duration AS positionDuration;

// Add Technologies Used to a Project
MATCH (project:PROJECT {name: "The Architect AI"})
SET project.tech = "NextJS, FastAPI, Stable diffusion, ChatGPT, DALL-E"
RETURN project;

// Query to retrieve personal information
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})
RETURN bisrat.name AS name, bisrat.email AS email, bisrat.phone AS phone, bisrat.location AS location, bisrat.linkedIn AS linkedIn, bisrat.github AS github;

// Query to retrieve education information
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:STUDIED_AT]->(university:UNIVERSITY)
RETURN university.name AS universityName, university.type AS universityType, university.location AS universityLocation;

// Query to retrieve experience information
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:WORKED_AT]->(company:COMPANY)
MATCH (bisrat)-[:HELD_POSITION]->(position:POSITION)
RETURN company.name AS companyName, company.location AS companyLocation, position.title AS positionTitle, position.duration AS positionDuration, position.description AS positionDescription;

// Query to retrieve certification and achievement information
MATCH (bisrat:PERSON {name: "Bisrat Kebere Derebe"})-[:HAS_CERTIFICATION|ACHIEVED]->(cert: CERTIFICATION|ACHIEVEMENT)
RETURN cert.name AS certName, cert.duration AS certDuration, cert.specialization AS certSpecialization, cert.description AS certDescription;