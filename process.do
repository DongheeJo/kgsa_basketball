cd "C:\Users\dongh\Dropbox\Non-Research_Projects\2020 KGSA League"
//cd "C:\Users\mitadm\Dropbox (Personal)\Non-Research_Projects\2020 KGSA League"	

// Parameters
local maxgame = 5

// Load and merge data
tempfile main
forv g = 1/`maxgame' {
	forv t = 1/2 {
		local pre: word `t' of "home" "visitor"
		local team: word `t' of "JJ" "DK"
		import delimited "`pre'`g'.csv", clear encoding("utf-8")
		ren pm pm2
		ren pa pa2
		ren v12 pm3
		ren v13 pa3
		ren ftm mj_bonus
		ren v28 plus_minus
		drop if g == "-"
		drop if mi(v1)
		replace name = trim(name)
		keep name pts fgm fga pm? pa? mj_bonus oreb dreb reb ast stl dfl blk to plus_minus
		destring pts-plus_minus, force replace
		gen series = `g'
		gen team = "`team'"
		if `g'*`t' == 1 save `main'
		else {
			append using `main'
			save `main', replace
		}
	}
}

order series team name
sort series team name
foreach v of varlist pts-plus_minus {
	replace `v' = 0 if mi(`v')
}

// Manual input (games played / win)
local roster_s1_g1 "토마스리 원유 민주 덕용 상수 승호 재성 제임스 세훈 제프"
local roster_s1_g2 "토마스리 원유 동일 상수 종우 민재 재성 정종 세훈 제프"
local roster_s1_g3 "토마스리 원유 민주 덕용 상수 승호 재성 제임스 정종 택용"
local roster_s1_g4 "원유 민주 동일 상수 종우 민재 정종 택용 세훈 제프"
local roster_s1_g5 "토마스리 원유 덕용 상수 동현 민재 승호 재성 제임스 제프"
local roster_s1_g6 "원유 민주 동일 상수 종우 승호 제임스 정종 택용 세훈"
local roster_s1_g7 "토마스리 원유 동일 덕용 동현 민재 승호 재성 세훈 제프"
local roster_s1_g8 "원유 민주 상수 동현 종우 재성 제임스 정종 택용 제프"
local roster_s1_g9 "토마스리 민주 동일 덕용 동현 민재 승호 제임스 택용 세훈"
local win_s1 "JJ JJ JJ JJ DK JJ DK JJ DK"
local games_s1 = 9
local roster_s2_g1 "동희 민주 종우 동길 지용 제프 제임스 태훈 상백 승호"
local roster_s2_g2 "동현 민주 원유 토마스리 종우 재성 민재 현빈 토마스초 정종"
local roster_s2_g3 "동희 덕용 토마스리 동길 지용 제프 제임스 태훈 상백 승호"
local roster_s2_g4 "동현 민주 원유 종우 지용 제프 재성 제임스 토마스초 정종"
local roster_s2_g5 "동현 동희 덕용 토마스리 동길 민재 태훈 현빈 상백 승호"
local roster_s2_g6 "덕용 민주 원유 종우 동길 제프 재성 제임스 토마스초 정종"
local roster_s2_g7 "동현 동희 원유 토마스리 종우 제임스 태훈 현빈 상백 승호"
local roster_s2_g8 "동현 덕용 민주 토마스리 동길 제프 재성 토마스초 정종 승호"
local win_s2 "DK DK DK JJ DK JJ DK DK"
local games_s2 = 8
local roster_s3_g1 "동희 덕용 민주 동길 현호 제프 제임스 태훈 정종 상백"
local roster_s3_g2 "동현 동희 민주 원유 토마스리 민재 태훈 정종 승호 길현"
local roster_s3_g3 "동현 덕용 원유 동길 현호 제프 제임스 승호 상백 길현"
local roster_s3_g4 "동희 민주 토마스리 동길 현호 민재 제임스 태훈 정종 상백"
local roster_s3_g5 "동현 동희 덕용 민주 원유 제프 제임스 정종 승호 길현"
local roster_s3_g6 "덕용 원유 동길 현호 토마스리 민재 태훈 승호 상백 길현"
local win_s3 "DK DK JJ DK DK JJ"
local games_s3 = 6
local roster_s4_g1 "민주 원유 토마스리 현호 병주 재성 민재 제임스 정종 현빈"
local roster_s4_g2 "덕용 민주 원유 토마스리 현호 제프 택용 태훈 상백 승호"
local roster_s4_g3 "덕용 민주 원유 토마스리 병주 재성 민재 제임스 정종 토마스초"
local roster_s4_g4 "덕용 원유 토마스리 병주 현호 제프 택용 태훈 현빈 상백"
local win_s4 "JJ JJ JJ DK"
local games_s4 = 4
local roster_s5_g1 "동희 덕용 민주 원유 현호 재성 신예찬 상백 길현 승호"
local roster_s5_g2 "동현 상수 토마스리 병주 동일 제프 승호 정성우 길현 토마스초"
local roster_s5_g3 "동희 덕용 민주 원유 현호 제프 재성 신예찬 상백 정성우"
local roster_s5_g4 "동현 상수 토마스리 병주 동일 제프 승호 정성우 길현 토마스초"
local roster_s5_g5 "동희 덕용 민주 원유 현호 재성 신예찬 승호 상백 토마스초 상수 제프"
local roster_s5_g6 "동현 상수 토마스리 병주 동일 제프 승호 정성우 길현 토마스초"
local roster_s5_g7 "덕용 민주 원유 현호 동일 재성 신예찬 상백 정성우 길현"
local roster_s5_g8 "동현 덕용 상수 토마스리 병주 제프 재성 승호 길현 토마스초"
local roster_s5_g9 "동현 민주 원유 현호 동일 재성 신예찬 승호 상백 정성우"
local win_s5 "JJ DK JJ DK DK DK JJ JJ DK"
local games_s5 = 9

// Games and wins
gen games = 0
gen wins = 0
forv s = 1/`maxgame' {
	forv g = 1/`games_s`s'' {
		local winner: word `g' of `win_s`s''
		dis "`s'`g'"
		if "roster_s`s'_g`g'" != "roster_s5_g5" assert wordcount("`roster_s`s'_g`g''") == 10
		foreach player in `roster_s`s'_g`g'' {
			replace games = games+1 if series == `s' & name == "`player'"
			replace wins = wins+1 if series == `s' & name == "`player'" & team == "`winner'"
		}
	}
}
save `main', replace
export delimited using "individual_per_series.csv", replace

// total and ratio stats
collapse (sum) pts-wins, by(team name)
gen fg_pct = fgm/fga
gen fg2_pct = pm2/pa2
gen fg3_pct = pm3/pa3
gen win_pct = wins/games*100

// advanced stats
gen efg = (pm2+pm3*1.5+mj_bonus*0.5)/fga
gen gamescore = pts+0.4*fgm+0.7*oreb+0.3*dreb+stl+0.7*ast+0.7*blk-0.7*fga-to

// per-game stats
foreach v of varlist pts-plus_minus gamescore {
	gen `v'_p6g = `v'/games*6
}
export delimited using "individual_total.csv", replace

// team-series stats - by series
use `main', clear
collapse (sum) pts fgm fga pm3 pa3 oreb dreb reb ast stl to, by(series team)
gen wins = 0
forv s = 1/`maxgame' {
	forv g = 1/`games_s`s'' {
		local winner: word `g' of `win_s`s''
		replace wins = wins+1 if series == `s' & team == "`winner'"
	}
}
bys series: egen tempmax = max(wins)
bys series: egen tempmin = min(wins)
gen series_win = 0
replace series_win = 0.5 if tempmax == tempmin
replace series_win = 1 if series_win == 0 & tempmax == wins
save `main', replace
gen fg_pct = fgm/fga
gen fg3_pct = fgm/fga
export delimited using "team_series.csv", replace

use `main', clear
collapse (sum) pts fgm fga pm3 pa3 oreb dreb reb ast stl to wins series_win, by(team)
gen fg_pct = fgm/fga
gen fg3_pct = pm3/pa3
export delimited using "team_total.csv", replace
