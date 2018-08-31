$(document).ready(function(){
    $("input[name=searchbox]").keyup(function(e) {
        //console.log(e.target.value);
        let query = e.target.value.split(' ');
        console.log(query);
        //each game has it's own row
        $("tr:has(label)").each(function(){
            let that = this;
            //show by default
            let display = '';
            //this should be just one one element
            $(this).find('label').each(function(){
                for(let i = 0;  i < query.length; ++i){
                    //compare strings case insensitive
                    if($(this).text().toLowerCase().indexOf(query[i].toLowerCase()) == -1){
                        //hide if at least one mismatch
                        display = 'none';
                    }
                }
            });
            $(this).css('display', display);
        })
    });
});