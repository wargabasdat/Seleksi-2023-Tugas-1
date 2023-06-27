from bs4 import BeautifulSoup
import requests

class Resource:
    def __init__(self, name, fType, url, cid, semester, year, type) -> None:
        self.name = name
        self.fType = fType
        self.url = url
        self.cid = cid
        self.semester = semester
        self.year = year
        self.type = type

def GetResource(url, cid, semester, year) -> list:
    headers = {'User-Agent': "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/42.0.2311.135 Safari/537.36 Edge/12.246"}
    request = requests.get(url = url, headers= headers)
    soup = BeautifulSoup(request.content, "html.parser")

    par = soup.find_all("p")

    exists = any(p.text == "No Resources Found." for p in par)
    listResource = []
    if(not exists):
        types = soup.findAll("div", class_ = "resource-list")

        for t in types:
            type = t.find("h4", class_="my-4")
            if(type != None):
                resources = t.find_all("div", class_="resource-list-item container")

                for resource in resources:
                    downloadResource = "https://ocw.mit.edu" + resource.find("a", download="")["href"]
                    typeResource = resource.find("img", class_="resource-thumbnail")["aria-label"]
                    titleResource = resource.find("a", class_="resource-list-title").text

                    r = Resource(name = titleResource, fType = typeResource, type = type.text, url = downloadResource, cid = cid, semester = semester, year = year)
                    listResource.append(r)
            

    return listResource

