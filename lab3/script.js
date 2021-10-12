function dfs(currentNode, currentDepth, result) {
    let indent = ""
    console.log(currentNode, currentDepth);
    for(i = 0; i < currentDepth; i++) {
        indent += "....";
    }
    result.innerHTML += indent + "&lt;" + currentNode.nodeName.toLowerCase() + "&gt;<br>";
    currentNode.childNodes.forEach(e => {
        dfs(e, currentDepth + 1, result);
    });
    result.innerHTML += indent + "&lt;/" + currentNode.nodeName.toLowerCase() + "&gt;<br>";
}

function search() {
    init = document.getElementById('tree');
    result = document.getElementById('result');
    result.innerHTML = "<hr>"
    dfs(init, 0, result);
    result.innerHTML += "<hr>"
}