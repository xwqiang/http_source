#! /usr/bin/awk -f
{variance=0;sumCount+=$1;sumCost+=($2*$1);count[NR]=$1;cost[NR]=$2}  
END {  
    staticTotal[0]=50;  
    staticTotal[1]=66;  
    staticTotal[2]=80;  
    staticTotal[3]=85;  
    staticTotal[4]=90;  
    staticTotal[5]=95;  
    staticTotal[6]=98;  
    staticTotal[7]=99;  
    staticTotal[8]=99.9;  
    staticFlag[0]=1;  
    staticFlag[1]=1;  
    staticFlag[2]=1;  
    staticFlag[3]=1;  
    staticFlag[4]=1;  
    staticFlag[5]=1;  
    staticFlag[6]=1;  
    staticFlag[7]=1;  
    staticFlag[8]=1;  
    printf "%3s  %10s  %15s %15s\n", "static", "costt", "count", "diffPre";  
    averageCost = sumCost/sumCount;  
    for(i=1; i <=length(count); i++) {  
        diff = (cost[i] - averageCost);  
        variance += (diff*diff*count[i]/(sumCount-1));  
        #printf("diff %s, variance %s, count[%s]: %s, cost[%s]: %s \n", diff, variance, i, count[i], i, cost[i]);  
        countTotal += count[i];  
        for (j=0; j <length(staticTotal); j++) {  
            if (countTotal >= sumCount*staticTotal[j]/100) if (staticFlag[j]==1) {  
                staticFlag[j]=sprintf("P%-3s  %10s %15s %15s", staticTotal[j],cost[i],countTotal, countTotal - countTotalPre);             countTotalPre = countTotal;  
            }  
        }  
    };  
  
    for( i=0;i<length(staticFlag);i++) print staticFlag[i];  
    printf "count total: %s\n", sumCount, countTotal;  
    printf "average cost: %s \n", averageCost;  
    printf "variance cost: %s \n", variance;  
}
