function search(q = ""){
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
                    $(tr).find('img.logo_tiny').each(function(){
                        if(this.title.toLowerCase() == tag.toLowerCase()){
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

$(document).ready(function(){
    //search when hash changes
    jHash.change(function() {
        let q = jHash.val('q');
        $("input#searchbox").val(q);
        search(q);
    });

    //initially search with given query
    let q = jHash.val('q');
    $("input#searchbox").val(q);
    search(q);

    $("input#searchbox").keyup(function(e){
        search(e.target.value)
    });

    //change hash when input field loses focus
    $("input#searchbox").blur(function(e){
        jHash.val('q', $("input#searchbox").val());
    });
});