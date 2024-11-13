
export PROJECT_ID=someapp-dev-dfa74

init:
	firebase init --project=${PROJECT_ID}

deploy:
	firebase deploy --only functions --project=${PROJECT_ID}

deploy-prod:
	firebase deploy

start:
	firebase emulators:start --project=${PROJECT_ID} 

start-debug:
	-pkill -f firebase || true
	firebase emulators:start  --inspect-functions --project=${PROJECT_ID}
# --import=.seed
# 

exportdata:
	firebase emulators:export .seed