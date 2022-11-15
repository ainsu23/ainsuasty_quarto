set Clients;
set Commercials;

param capacity {Commercials} > 0;
param benefit {Clients, Commercials} > 0;

var assign {Clients, Commercials} binary;

maximize Profit:
  sum {i in Clients, j in Commercials} benefit[i,j] * assign[i,j];
  
subject to Supply {i in Clients}:
  sum {j in Commercials} assign[i,j] <= 1;
subject to capacity_constrain {j in Commercials}:
  sum {i in Clients} assign[i,j] <= capacity[j];