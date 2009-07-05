#! /usr/bin/env python
"""
License: Public Domain

This script aggregates icons onto one canvas. It is supposed to facilitate the
conversion of icon themes to the one canvas workflow.

The copyright on the template.svg belongs to Jacub Steiner. 
"""

import os
from find_icons import find_icons
import sys
import xml.dom.minidom

icons = find_icons(sys.argv[1])


def nodes_differ(node1, node2):
    collision = False


    if node1.attributes is None and node2.attributes is None:
        return False
    if node1.attributes is None or node2.attributes is None:
        return True

    if dict(node1.attributes).keys() != dict(node2.attributes).keys():
        for key in dict(node1.attributes).keys():
            if node1.getAttribute(key) != node2.getAttribute(node2):
                return True
    
    child1 = node1.firstChild
    child2 = node2.firstChild
    while child1 and child2:
        if child1.nodeType != node1.ELEMENT_NODE:
            child1.nextSibling
        if child2.nodeType != node1.ELEMENT_NODE:
            child2.nextSibling
    
        if nodes_differ(child1, child2):
            return True

        return False
    
    return False

def parse_defs(node, defs):
    collision = False
    child = node.firstChild
    while child:
        if child.nodeType == node.ELEMENT_NODE:
            id = child.getAttribute('id')
            
            next_child = child.nextSibling
            node.removeChild(child)
            found = False
            for def_id, definition in defs:
                if def_id == id:
                    found = True
                    break
            if not found:
                defs.append((id, child))
            else:
                if nodes_differ(child, definition):
                    collision = True
            child = next_child

            continue

        child = child.nextSibling
    return collision

def build_icon_data(icon, size, data):
    collision = False
    dom = xml.dom.minidom.parse(icon)
    child = dom.firstChild
    while child:
        if child.nodeType == dom.ELEMENT_NODE and child.tagName == "svg":
            node = child
            break
        child = child.nextSibling

    objects = []

    pxsize = float(size.split('x')[0])
    data["scales"][size] = (pxsize / float(node.getAttribute("width").strip('px')), \
                            pxsize / float(node.getAttribute("height").strip('px')))
    
    child = node.firstChild
    while child:
        if child.nodeType == dom.ELEMENT_NODE and child.tagName == "metadata":
            sfw = child.firstChild
            while sfw:
                if sfw.nodeType != dom.ELEMENT_NODE or sfw.tagName != "ns:sfw":
                    sfw = sfw.nextSibling
                    continue
                
                sliceSourceBounds = sfw.firstChild
                while sliceSourceBounds:
                    if sliceSourceBounds.nodeType != dom.ELEMENT_NODE or sliceSourceBounds.tagName != "ns:sliceSourceBounds":
                        sliceSourceBounds = sliceSourceBounds.nextSibling
                        continue
                    
                    if sliceSourceBounds.hasAttribute("y"):
                        y = float(sliceSourceBounds.getAttribute("y").strip("px"))
                    else:
                        y = 0
                    if sliceSourceBounds.hasAttribute("x"):
                        x = float(sliceSourceBounds.getAttribute("x").strip("px"))
                    else:
                        x = 0

                    if y != 0 or x != 0:
                        data["translates"][size] = (x, y)

                    sliceSourceBounds = sliceSourceBounds.nextSibling
                
                sfw = sfw.nextSibling

        if child.nodeType == dom.ELEMENT_NODE and child.tagName == "defs":
            ret = parse_defs(child, data["defs"])
            collision = ret or collision

        if child.nodeType == dom.ELEMENT_NODE and child.tagName.find(':') == -1 \
           and not child.tagName in ["metadata", "defs"]:

            include = True
            if child.tagName == "g":
                group_child = child.firstChild
                include = False
                while group_child:
                    if group_child.nodeType == dom.ELEMENT_NODE:
                        include = True
                        break
                    group_child = group_child.nextSibling

            if include:
                next_child = child.nextSibling
                node.removeChild(child)
                objects.append(child)
                child = next_child

                continue
        
        child = child.nextSibling

    data["icons"][size] = objects
    return collision


import base64

def build_size_objects(doc, node, scales, translates, icon_objects):
    child = node.firstChild
    
    while child:
        if child.nodeType == node.ELEMENT_NODE and child.tagName == "g":
            id = child.getAttribute("id")
            size = id[1:]+"x"+id[1:]

            if size in scales:
                transform = child.getAttribute("transform")
                transform += " scale(%f,%f)" % scales[size]
                child.setAttribute("transform", transform)

            if size in translates:
                transform = child.getAttribute("transform")
                transform += " translate(%f,%f)" % translates[size]
                child.setAttribute("transform", transform)

            if size in icon_objects:
                data = icon_objects[size]
                if isinstance(data, type("")):
                    # embed an image
                    
                    image = open(data)
                    image_data = base64.b64encode(image.read())

                    image_node = doc.createElement("svg:image")
                    image_node.setAttribute("id", "image"+id[1:])
                    image_node.setAttribute("x", "0")
                    image_node.setAttribute("y", "0")
                    image_node.setAttribute("width", id[1:])
                    image_node.setAttribute("height", id[1:])
                    image_node.setAttribute("xlink:href", "data:image/png;base64,"+image_data)

                    child.appendChild(image_node)
                else:
                    objects = data
                    for obj in objects:
                        if obj.tagName.startswith('i:'):
                            # Ignore anything from the illustrator namespace ...
                            continue

                        if obj.tagName != "g" and obj.hasAttribute("style") or obj.hasAttribute("transform"):
                            clone = obj.cloneNode(True)
                            child.appendChild(clone)
                            
                            continue
                    
                        group_child = obj.firstChild
                        while group_child:
                            clone = group_child.cloneNode(True)
                            child.appendChild(clone)

                            group_child = group_child.nextSibling
        
        child = child.nextSibling

def build_icon(name, context, data):
    
    dom = xml.dom.minidom.parse(os.path.join(os.path.dirname(__file__), "template.svg"))
    
    child = dom.firstChild
    while child:
        if child.nodeType == dom.ELEMENT_NODE and child.tagName == "svg":
            node = child
            break
        child = child.nextSibling

    child = node.firstChild
    while child:
        if child.nodeType == dom.ELEMENT_NODE and child.tagName == "defs":
            for def_id, definition in data["defs"]:
                child.appendChild(definition)

        if child.nodeType == dom.ELEMENT_NODE and child.tagName == "g":
            id = child.getAttribute("id")
            if id == "layer6":
                rect = child.firstChild
                while rect:
                    if rect.nodeType != dom.ELEMENT_NODE or rect.tagName != "rect":
                        rect = rect.nextSibling
                        continue
                    size = rect.getAttribute("inkscape:label")
                    if not data["icons"].has_key(size):
                        next = rect.nextSibling
                        
                        child.removeChild(rect)
                        
                        rect = next
                        continue
                    rect = rect.nextSibling
            else:
                #child.setAttribute("inkscape:label", "artwork:"+ name)
                build_size_objects(dom, child, data["scales"], data["translates"], data["icons"])
                
        
        child = child.nextSibling


    # Replace the strings
    for in_node in node.getElementsByTagName("text"):
        if in_node.getAttribute("inkscape:label") == "icon-name":
            span = in_node.getElementsByTagName("tspan")[0]
            text = span.firstChild
            assert text.nodeType == dom.TEXT_NODE
            
            text.data = name
                

        if in_node.getAttribute("inkscape:label") == "context":
            span = in_node.getElementsByTagName("tspan")[0]
            text = span.firstChild
            assert text.nodeType == dom.TEXT_NODE
            
            text.data = context

    if not os.path.exists(os.path.join('.', 'svgs', context)):
        os.mkdir(os.path.join('.', 'svgs', context))
    file = open(os.path.join('.', 'svgs', context, name+".svg"), "w")
    file.write(dom.toxml(encoding="utf-8"))
    file.close()

for icon_info, sizes in icons.iteritems():
    data = {}
    data["defs"] = []
    data["icons"] = {}
    data["scales"] = {}
    data["translates"] = {}
    
    if True:
        collision = False
        for size, file in sizes.iteritems():
            if file[-4:] == ".svg":
                collision = build_icon_data(file, size, data) or collision
            else:
                data["icons"][size] = file

        if collision:
            print "Possible def collision in icon %s" % icon_info[0]

        build_icon(icon_info[0], icon_info[1], data)
    else:
        print "Failed for icon %s" % icon_info[0]
        sys.exit(1)

