$(document).ready(function(){
    $("input[name=searchbox]").val('');
    $("input[name=searchbox]").keyup(function(e) {
        //console.log(e.target.value);
        let shown = 0;
        let query = e.target.value.split(' ');
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
    });
});