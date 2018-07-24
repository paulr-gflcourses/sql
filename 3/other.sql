select t1.point, t1.date, inc, out from INCOME_O t1 
left join OUTCOME_O t2 on t1.point = t2.point and t1.date = t2.date 
union 
select t2.point, t2.date, inc, out from INCOME_O t1 
right join OUTCOME_O t2 ON t1.point = t2.point and t1.date = t2.date




29. Under the assumption that receipts of money (inc) and payouts (out) are registered not more than once a day for each collection point [i.e. the primary key consists of (point, date)], write a query displaying cash flow data (point, date, income, expense).
    Use Income_o and Outcome_o tables.
29. select t1.point, t1.date, inc, out from INCOME_O t1 left join OUTCOME_O t2 on t1.point = t2.point and t1.date = t2.date union select t2.point, t2.date, inc, out from INCOME_O t1 right join OUTCOME_O t2 ON t1.point = t2.point and t1.date = t2.date

30. Under the assumption that receipts of money (inc) and payouts (out) can be registered any number of times a day for each collection point [i.e. the code column is the primary key], display a table with one corresponding row for each operating date of each collection point.
    Result set: point, date, total payout per day (out), total money intake per day (inc).
    Missing values are considered to be NULL.
30. select point, date, sum(sum_out), sum(sum_inc) from( select point, date, sum(inc) as sum_inc, null as sum_out from INCOME group by point, date union select point, date, null as sum_inc, sum(out)
    as sum_out from OUTCOME group by point, date ) as t group by point, date order by point

	
	
	
	
	
	
	.git config
	
https://github.com/MindTwisted/perl_course


https://github.com/NaPrikole/PHP_all_task.git
https://github.com/koss89/php.git
https://github.com/mk-maxxx1387/php-tasks.git
https://github.com/wwwmail/php.git
https://github.com/MindTwisted/php_course.git
-https://github.com/Yaradovhan/GFL-php.git
-https://github.com/mysteryc/gfl_php.git
-
-
https://github.com/ucfirst-ruslan/php.git
-
-
-
-
https://github.com/cah9hk/PHP.git
-
https://github.com/maksshapovalov/php.git
-
-





[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/ucfirst-ruslan/php.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[branch "master"]
[remote "origin"]
        url = https://paulr-gflcourses@github.com/paulr-gflcourses/php.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/cah9hk/PHP.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/maksshapovalov/php.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/NaPrikole/PHP_all_task.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/koss89/php.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[remote "gitlab"]
        url = https://gitlab.com/koss89/php.git
        fetch = +refs/heads/*:refs/remotes/gitlab/*
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/mk-maxxx1387/php-tasks.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/wwwmail/php.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
[remote "origin"]
        url = https://github.com/MindTwisted/php_course.git
        fetch = +refs/heads/*:refs/remotes/origin/*
[branch "master"]
        remote = origin
        merge = refs/heads/master
[core]
        repositoryformatversion = 0
        filemode = true
        bare = false
        logallrefupdates = true
