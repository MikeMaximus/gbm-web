function search(q){
    //console.log(e.target.value);
    let shown = 0;
    let query = q.split(' ');
    console.log(query);
    //each game has it's own row
    $("tr:has(label)").each(function(){
        let tr = this;
        //show by default
        let display = '';
        //this should be just one one element
        $(this).find('label').each(function(){
            for(let i = 0;  i < query.length; ++i){
                //special treatmeant for tags
                if(query[i].startsWith('tag:')){
                    let tag = query[i].substring(4);
                    let found = false;
                    $(tr).find('a.tag').each(function(){
                        //strip #
                        let tagName = this.innerText.substring(1);
                        if(tagName.toLowerCase() == tag.toLowerCase()){
                            found = true;
                        }
                    });
                    //hide when no matching tag
                    if(!found){
                        display = 'none';
                    }
                }else{
                    //compare strings case insensitive
                    if($(this).text().toLowerCase().indexOf(query[i].toLowerCase()) == -1){
                        //hide if at least one mismatch
                        display = 'none';
                    }
                }
            }
        });
        $(this).css('display', display);
        if(display == ''){
            shown++;
        }
    })
    $("#shown").text(shown);
}

function getQuery(){
    if(jHash.val('q')){
        return decodeURI(jHash.val('q'))
    }else{
        return '';
    }
}

$(document).ready(function(){
    //search when hash changes
    jHash.change(function() {
        let q = getQuery();
        $("input#searchbox").val(q);
        search(q);
    });

    //initially search with given query
    let q = getQuery();
    $("input#searchbox").val(q);
    search(q);

    $("input#searchbox").keyup(function(e){
        search(e.target.value)
    });

    //change hash when input field loses focus
    $("input#searchbox").blur(function(e){
        jHash.val('q', $("input#searchbox").val());
    });

    //modify search when tag gets clicked
    $("a.tag").click(function(e){
        //strip #
        let tagName = e.target.innerText.substring(1);
        jHash.val('q', getQuery() + ' tag:' + tagName);
        return false;
    });
});