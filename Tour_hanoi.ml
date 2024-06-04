(*Question 1*)
let rec hanoi dep aux dest n =
     if n > 0 then begin
         hanoi dep dest aux (n - 1);
        Printf.printf "%s -> %s\n" dep dest;
        hanoi aux dep dest (n - 1)
       end
    
    let () =
      hanoi "A" "B" "C" 5;;  
      
(*Question 2*)  
      
let rec hanoi_aux from to_ aux n =
  if n = 0 then ()
  else
    begin
      hanoi_aux from aux to_ (n-1);
      Printf.printf "Déplacer le disque %d de %c vers %c\n" n from to_;
      hanoi_aux aux from to_ (n-1);
    end

let hanoi n =
  hanoi_aux 'A' 'B' 'C' n

let () =
  let n = 5 in
  hanoi n ;;


(*Question 3*)

let rec hanoi n src dst aux =
  if n = 0 then ()
  else
    begin
      hanoi (n-1) src aux dst;
      Printf.printf "Déplacer le disque %d de %s vers %s\n" n src dst;
      hanoi (n-1) aux dst src
    end

let rec time_hanoi n =
  let start = Sys.time() in
  hanoi n "A" "B" "C";
  let end_time = Sys.time() in
  Printf.printf "Temps d'exécution de la fonction hanoi avec %d disques : %.6f secondes\n" n (end_time -. start);
  if (end_time -. start) > 10.0 then
    Printf.printf "Le temps d'exécution a dépassé 10 secondes pour %d disques.\n" n
  else
    Printf.printf "Le temps d'exécution est inférieur à 10 secondes pour %d disques.\n" n

let () =
  time_hanoi 5;;
