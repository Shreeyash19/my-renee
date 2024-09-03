### README for SAP Renee - Lessons Learned Navigator ###

## Description: Renee is a collaboration tool for senior business software implementation consultants sharing their project experiences and content curators. Renee captures these experiences as 'Lessons Learned'. Curators may publish content for rendering on demand as an MS Powerpoint deck. New and aspiring implementation consultants may benefit from downloading Lessons Learned on demand and studying them with their customers ##   

Installation: For development clone this repository from here. Install dependencies [see 'pythonic' folder]. Deploy [as mta?] with  environment settings [tbd...].


Usage: [Examples or instructions on how to use the project. For software, this could be code snippets, screenshots, or demo videos.]

#### Web Apps / OData 

1. Author, app '/author.html', contains single tile to author and edit lessons.  
    OData service at /odata/v4/blog: Author's app to create new lessons
2. Curate, app '/curate.html', contains two apps, one to curate, the other 
    to self-assign categories of expertise.
    OData service at /odata/v4/curate: Curators' app to curate apps 
3. Administer app '/administer.html' 
    OData service at /odata/v4/admin:
    * Categories, app categories + 
    * Classifications, app classifications +
    * Configurations for PowerPoint deck generation, app configurations +
    * Source Types, for information sources, app sourcetypes + 
    * Target audience, app personas +
    * Teams, to identify curators or authors and give them and ther team credit, app teams +
    * Versions, app versions +
    * Workflow Status, app status +

Contribution: [Guidelines for collaborators who want to contribute to your project. This may include code style prefrences, branching strategy, or how to submit a pull request.]


License: [If the project is open source, mentioning the License clause is required so that others are aware of their rights and limitations before using or contributing to your project.]


Contact Information: Shreeyash Lakhe, SAP, shreeyash.lakhe@sap.com; Andreas Muno, SAP, andreas.muno@sap.com  


Credits and Acknowledgments: [Give credit where it’s due. If you’ve used parts of other projects or if someone gave you a nudge when you were stuck, acknowledge their work.]
