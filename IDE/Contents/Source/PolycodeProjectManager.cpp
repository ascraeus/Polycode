

#include "PolycodeProjectManager.h"

PolycodeProjectManager::PolycodeProjectManager() {
	activeProject = NULL;
}

PolycodeProjectManager::~PolycodeProjectManager() {
	
}


PolycodeProject* PolycodeProjectManager::openProject(String path) {
	printf("Opening project  %s\n", path.c_str());
	
	vector<String> bits = path.split("/.");
	
	String projectPath = "";
	for(int i=0; i < bits.size() - 2; i++) {
		projectPath += "/"+bits[i];
	}
	
	String projectName = bits[bits.size()-2];
	
	PolycodeProject* newProject = new PolycodeProject(projectName, projectPath, path);
	projects.push_back(newProject);
	
	projectBrowser->addProject(newProject);
	return newProject;
}

int PolycodeProjectManager::removeProject(PolycodeProject *project) {		
	for(int i=0;i<projects.size();i++) {
		if(projects[i] == project) {
			projects.erase(projects.begin()+i);
		}
	}	
	
	if(activeProject == project) {
		activeProject = NULL;
	}
	
	delete project;
	
	return 1;
}


void PolycodeProjectManager::createNewProject(String templateFolder, String projectName, String projectLocation) {	
	CoreServices::getInstance()->getCore()->createFolder(projectLocation);		
	CoreServices::getInstance()->getCore()->copyDiskItem(templateFolder, projectLocation+"/"+projectName);
	CoreServices::getInstance()->getCore()->moveDiskItem(projectLocation+"/"+projectName+"/template.polyproject",  projectLocation+"/"+projectName+"/"+projectName+".polyproject");
	openProject(projectLocation+"/"+projectName+"/"+projectName+".polyproject");	
}
