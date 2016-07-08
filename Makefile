

input:
	pachctl delete-repo filter || true
	pachctl delete-pipeline filter
	pachctl delete-repo repodata
	pachctl create-repo repodata
	pachctl start-commit repodata > commitID
	cat repodata.csv | pachctl put-file repodata `cat commitID` repodata.csv
	pachctl finish-commit repodata `cat commitID`
	rm commitID

run-filter: input
	cd repofilter && make
	pachctl create-pipeline -f pipelines/justfilter.json


