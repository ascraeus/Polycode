/*
 *  PolyUITree.h
 *  Poly
 *
 *  Created by Ivan Safrin on 7/28/08.
 *  Copyright 2008 __MyCompanyName__. All rights reserved.
 *
 */

// @package UI

#pragma once
#include "PolyGlobals.h"
#include "PolyScreenLabel.h"
#include "PolyScreenImage.h"
#include "PolyScreenShape.h"
#include "PolyScreenEntity.h"
#include "PolyUITreeEvent.h"
#include "PolyUIBox.h"
#include <vector>

using std::vector;

namespace Polycode {

	class _PolyExport UITree : public ScreenEntity {
		public:
			UITree(String icon, String text, Number treeWidth, Number treeOffset=0);
			~UITree();
			
			void handleEvent(Event *event);
			void toggleCollapsed();
			UITree *addTreeChild(String icon, String text, void *userData = NULL);
			void Update();
			void refreshTree();
			Number getTreeHeight();
			void setParent(UITree *parent);
			void clearSelection(UITree *selectedNode);
			bool isCollapsed();
			void *getUserData();
			void setUserData(void *data);
			UITree *getSelectedNode();
			void setIcon(String iconFile);
			void setSelected();
		
			int getNumTreeChildren() { return treeChildren.size(); }
			UITree *getTreeChild(int index) { return treeChildren[index]; }
			void removeTreeChild(UITree *child);
		
			Number handleRotation;
		
		private:
		
			void *userData;
			Number treeWidth;
			Number treeOffset;
			UITree *selectedNode;
			UITree *parent;
			UIBox *selection;
		//	UIBox *bgBox;
			ScreenShape *bgBox;
			ScreenLabel *textLabel;
			ScreenImage *iconImage;
			bool selected;
			Number treeHeight;
			vector<UITree*> treeChildren;
			bool collapsed;
			bool collapsing;
			ScreenImage *arrowIconImage;
			String arrowIcon;
			String fontName;
			int size;
			Number cellHeight;
			Number cellPadding;
	};
}